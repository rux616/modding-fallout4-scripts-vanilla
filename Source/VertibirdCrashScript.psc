Scriptname VertibirdCrashScript extends Actor
{Unghosts passengers on vertibird death}

Keyword Property UseFurnitureDeath Auto Const

Keyword[] Property SeatsToKeepOnBirdOnDeath Auto Const

Keyword Property PilotSeatKeyword Auto Const

Actor[] passengerArray
Actor[] diesOnBirdArray

Actor Pilot

Auto State VertibirdAlive
	Event OnLoad()
		if ( !IsDisabled() && Pilot != None )
			debug.trace( self + " registering for death of pilot on loading 3d")
			RegisterForRemoteEvent( Pilot, "OnDeath" )
		endIf
	EndEvent
	
	Event OnUnload()
		if ( Pilot != None )
			debug.trace( self + " UNREGISTERING for death of pilot on UNLOADING 3d")
			UnregisterForRemoteEvent( Pilot, "OnDeath" )
			; note we are not clearing the pilot variable here.
			; Its quite concievable for the bird to leave the loaded area with a pilot on it
			; and come back into the loaded area without that pilot ever getting on or off
			; so we must maintain this pointer or we wouldn't know who our pilot was
		endIf
	EndEvent
	
	; anytime an actor activates the vertibird, check to see if they are already on; if not, record them so we know who is on the vertibird
	Event OnActivate( ObjectReference akActionRef )
		Actor activatingActor = akActionRef as Actor
		if( activatingActor != None )
			; create the passeneger array if it doesn't already exist
			if( passengerArray == None )
				passengerArray = new Actor[0]
			endif
				
			int indexInPassengers = passengerArray.Find( activatingActor )
			if( indexInPassengers < 0 )
				; we haven't seen this actor yet, assume they are getting on
				debug.trace( "Actor " + activatingActor + " got onto vertibird " + Self )
				passengerArray.Add( activatingActor )
				
				; now give "stay in seat on death" to any actors we are supposed to - but never to the player,
				; so we don't have to worry about whether this vertibird is activation blocked or not
				if( activatingActor != Game.GetPlayer() )
					int i = 0
					while( i < SeatsToKeepOnBirdOnDeath.Length )
						if( activatingActor.HasKeyword( SeatsToKeepOnBirdOnDeath[i] ) )
							debug.trace( "  Actor " + activatingActor + " was given dies-in-furniture keyword" )
							activatingActor.AddKeyword( UseFurnitureDeath )
						endIf
						i += 1
					endWhile
				endIf
				
				; now, if this person sits in the pilot seat, listen for them dying, so we know when to crash
				if( activatingActor.HasKeyword( PilotSeatKeyword ) )
					debug.trace( "  Recording " + activatingActor + " as the pilot, will crash " + Self + " if they die" )
					Pilot = activatingActor
					RegisterForRemoteEvent( activatingActor, "OnDeath" )
				endIf
			endif
		endif
	EndEvent
	
	Event OnExitFurniture( ObjectReference akActionRef )
		Actor activatingActor = akActionRef as Actor
		if( activatingActor != None )
			int indexInPassengers = passengerArray.Find( activatingActor )
			if( indexInPassengers >= 0 )
				debug.trace( "Actor " + activatingActor + " got off of vertibird " + Self )
				activatingActor.ResetKeyword( UseFurnitureDeath )
				passengerArray.Remove( indexInPassengers )
			endif
			
			if( activatingActor == Pilot )
				debug.trace( "Pilot " + activatingActor + " got off vertbird " + Self + ", no longer in danger of crashing when they die" )
				UnregisterForRemoteEvent( activatingActor, "OnDeath" )
				Pilot = None
			endIf
		endif
	EndEvent
	
	Event OnDeferredKill( Actor akKiller )
		; un-ghost all passengers
		debug.trace("got deferred kill event for " + Self)
		int i = 0
		while( i < passengerArray.Length )
			if( passengerArray[i] != None )
				debug.trace("UnGhosting " + passengerArray[i] + " because vertibird " + Self + " has begun dying")
				passengerArray[i].SetGhost( false )
				
				; make sure we take furnitureDeath off everyone immediately so when the bird crashes everyone ragdolls properly
				; there is some danger the gunner is killed after the bird starts crashing and falls through it, but
				; I think the risk of that looking bad is extremely low since the bird will be spinning like crazy anyway
				passengerArray[i].ResetKeyword( UseFurnitureDeath )
			endif
			i += 1
		endWhile
		
		passengerArray.Clear()
		
		if( Pilot != None )
			debug.trace( self + " UNREGISTERING for death of pilot because it DIED")
			UnregisterForRemoteEvent( Pilot, "OnDeath" )
			Pilot = None
		endIf
		
		; go to a state where we don't care about anything anymore
		GoToState("VertibirdDead")
	EndEvent
	
	;we can't kill the passengers in OnKill because they get kicked off before that event gets sent
EndState

State VertibirdDead
EndState

;Handle an actor dying (specifically the pilot)
Event Actor.OnDeath( Actor akSender, Actor akKiller )
	if( Pilot == akSender )
		debug.trace( self + " UNREGISTERING for death of pilot because THEY DIED")
		UnregisterForRemoteEvent( Pilot, "OnDeath" )
		; 0 = not flying, 5 = perching
		if( GetFlyingState() != 0 && GetFlyingState() != 5 )
			debug.trace(" Vertibird Pilot " + Pilot + " died, crashing vertibird " + Self )
			Kill( akKiller )
		else
			debug.trace( "vertibird pilot " + Pilot + " died, but their vertibird " + Self + " wasn't in the air so it has ignored their demise" )
		endIf
		
		Pilot = None
	endif
EndEvent
