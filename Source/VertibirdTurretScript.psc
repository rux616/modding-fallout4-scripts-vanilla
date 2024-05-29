Scriptname VertibirdTurretScript extends Actor
{Script that handles giving the turret gunner the weapon and stuff}

Weapon Property turretWeapon Auto Mandatory
Weapon Property Minigun_Vertibird_Player Auto Mandatory const
Weapon Property Minigun_Vertibird Auto Mandatory const
CombatStyle Property csVertibirdMinigun Auto Mandatory const
ActorValue Property crRangedDmg Auto Mandatory const
Perk Property crRangedDmgPerk Auto Mandatory const
Keyword Property disallowManualLandingKeyword Auto const
Keyword Property turretSeatKeyword Auto Mandatory const
Keyword Property powerArmorArmorKeyword Auto Mandatory const
ActorValue Property ignoreCrippleValue Auto Mandatory const 
SoundCategorySnapshot Property VertibirdSCS Auto Mandatory const
bool Property CanPlayerActivate Auto

; Local Variables
Actor activatingActor
Ammo turretAmmo
Weapon priorEquippedWeapon
bool landing
bool blockOnActivateAndWait
bool sitHandled
int BlockActivateTimerID = 1234
float BlockActivateTimeout = 20.0

Function BlockPlayerActivation(bool aBlock = true, bool aBlockOnActivateAndWait = false)
	debug.trace( Self + " received BlockPlayerActivation(" + aBlock + ", " + aBlockOnActivateAndWait + ")")
	CanPlayerActivate = !aBlock
	if(aBlock)
		BlockActivation(true,true)
	else
		BlockActivation(false)
		blockOnActivateAndWait = aBlockOnActivateAndWait
	endif
EndFunction

Event OnInit()
	debug.trace("GunTurret OnInit")
	activatingActor = None
	turretAmmo = None
	priorEquippedWeapon = None	  
	landing = false
	blockOnActivateAndWait = false
	sitHandled = false
	
	;Block activation on all vertibirds unless the quest/designer enables it.
	if(CanPlayerActivate == false)
		BlockPlayerActivation()
	endif

	if( turretWeapon != None )
		turretAmmo = turretWeapon.GetAmmo()
	endif
EndEvent

Function EquipTurret()
	activatingActor.EquipItem( turretWeapon, true, true )
	
	; we have to listen for the anim event instead of OnSit because the vertibird is an actor, not furniture, so OnSit won't work
	RegisterForAnimationEvent( activatingActor, "idleChairSitting" )
	
	; make sure the actor ignores being crippled until they get off the vertibird
	debug.trace("setting value " + ignoreCrippleValue + " to 1 for " + activatingActor)
	activatingActor.SetValue( ignoreCrippleValue, 1)
EndFunction

; Function to enter the turret
Function EnterTurret()
	debug.trace("GunTurret EnterTurret")
	
	; Store the previously equipped weapon & ammo count.
	priorEquippedWeapon = activatingActor.GetEquippedWeapon()

	turretWeapon = Minigun_Vertibird
	
	; Find out how much ammo the container has in it.
	; Do it before we reset turretAmmo below so that it always checks the ammo of the NPC weapon type.
	int iammoCount = 1000

	;Give perk for leveled minigun damage
	activatingActor.AddPerk(crRangedDmgPerk)

	;Store the custom actor value set on leveled vertibird
	float newRangedDmg = self.GetValue(crRangedDmg)
	;Set custom actor value for leveled minigun damage
	activatingActor.SetValue(crRangedDmg, newRangedDmg)

	; If it's the player, use the player version of the minigun
	if (activatingActor == Game.GetPlayer())
		turretWeapon = Minigun_Vertibird_Player
		turretAmmo = turretWeapon.GetAmmo()
	else
		;Set custom combat style for the minigun on actor
		activatingActor.SetCombatStyle(csVertibirdMinigun)
	Endif

	; Add the ammo and weapon to the actor.
	debug.trace("Adding " + iammoCount + " ammo of type " + turretAmmo)
	activatingActor.AddItem( turretAmmo, iammoCount, true )
	activatingActor.AddItem( turretWeapon, 1, true )

	; we don't want to equip the turret until the actor has put away their original weapon, or they could see themselves putting away the turret (minigun)
	; the sit sleep check is to see if they've already started the enter animation - which is quite possible if they were unequipped when they activated it
	; but they can also not have loaded the animation/graph yet in which case we should wait to equip the turret or equipping the turret could prevent the animation from starting
	debug.trace( "boarding actor sit sleep is " + activatingActor.GetSitState() )
	if ( activatingActor.GetSitState() < 2 )
		debug.trace("weapon was drawn before boarding, or actor not sitting. Waiting to equip turret...")
		RegisterForAnimationEvent( activatingActor, "CameraOverrideStart" )
	else
		debug.trace("no weapon was drawn, equipping turret immediately")
		EquipTurret()
	endif
	
EndFunction

; Function to exit the turret
Function ExitTurret( bool abEquipPrior = true )
	debug.trace("GunTurret ExitTurret")
		
	; Remove the weapon now.
	activatingActor.UnequipItem( turretWeapon, false, true )
	activatingActor.RemoveItem( turretWeapon, 1, true )
			
	; and remove the ammo
	activatingActor.UnequipItem( turretAmmo, false, true )
	int iammoCount = activatingActor.GetItemCount( turretAmmo )		
	debug.trace("Removing " + iammoCount+ " ammo of type: " + turretAmmo)
	if( iammoCount > 0 )
		activatingActor.RemoveItem( turretAmmo, iammoCount, true )
	endif

	if( Game.GetPlayer() == activatingActor )
		VertibirdSCS.Remove()
	else
		; Reset combat style back to actor's original
		activatingActor.SetCombatStyle(None)
	endIf

	; Remove minigun damage perk
	activatingActor.RemovePerk(crRangedDmgPerk)

	if ( priorEquippedWeapon != None && abEquipPrior )
		debug.trace( Self + " re-equipping weapon " + priorEquippedWeapon )
		activatingActor.EquipItem( priorEquippedWeapon, false, true )
	endif
	
	; let the actor be crippled again - UNLESS they are in power armor!
	if( powerArmorArmorKeyword == None || !activatingActor.WornHasKeyword( powerArmorArmorKeyword ) )
		activatingActor.SetValue( ignoreCrippleValue, 0 )
	endif
		
	priorEquippedWeapon = None
	
	landing = false
	UnregisterForAnimationEvent( Self, "FlightLanding" )
EndFunction

;We don't care about the killer, just that the vertibird is activatable once dead (to allow looting).
Event OnDeath(Actor aKiller)
	GoToState("Dead")
	BlockPlayerActivation(false)
	UnregisterForAllEvents()
	; if the actor is still on the turret we need to unequip them now, we won't get another chance
	if( activatingActor != None )
		debug.trace( "vertibird " + Self + " forcing ExitTurret on " + activatingActor + " because it dying!" )
		ExitTurret(false)
		activatingActor = None
	EndIf
EndEvent

Event OnUnload()
	UnregisterForAllEvents()
	; this is a safety net in case someone finds a way to get away with the minigun
	if( activatingActor != None )
		debug.trace( "vertibird " + Self + " forcing ExitTurret on " + activatingActor + " because it is being unloaded" )
		ExitTurret(false)
		activatingActor = None
	EndIf
EndEvent

Event OnTimer(int aiTimerID)
	if(aiTimerID == BlockActivateTimerID)
		debug.trace("BLOCKACTIVATE TIMEOUT : " + Self)
		BlockPlayerActivation(false, blockOnActivateAndWait)
	endif
EndEvent

;Marks the completion of the enter animation, and transitions to the active turret state.
Function DoSitCompletion( ObjectReference ActivatingRef )
	sitHandled = true

	if(ActivatingRef == Game.GetPlayer())
		CancelTimer(BlockActivateTimerID)
		; make it sound like you're in a vertibird
		VertibirdSCS.Push(1.0)
	endif

	UnregisterForAnimationEvent( ActivatingRef, "idleChairSitting" )
	; Register for the weapon unequip so we know when to take it away from him and put it back on the vertibird
	RegisterForAnimationEvent( ActivatingRef, "weaponSheathe" )
	GoToState("TurretActive")
EndFunction

State Dead
;no-op
EndState

; State where the turret is not active
Auto State TurretInactive
	; Handle the actor activating the turret
	Event OnActivate( ObjectReference akActionRef )
		debug.trace("turret got activate while inactive")
		if ( activatingActor != None && akActionRef != None && akActionRef.HasKeyword(turretSeatKeyword) )
			debug.trace("turret was activated TWICE! First by " + activatingActor + " and now by " + akActionRef + " Ignoring this activation")
		elseIf ( self.IsDead() == false && activatingActor == None && akActionRef != None && akActionRef.HasKeyword(turretSeatKeyword) && turretWeapon != None && turretAmmo != None && (akActionRef != Game.GetPlayer() || CanPlayerActivate == true) )
			activatingActor = akActionRef as Actor
			sitHandled = false

			;Set up a long timer to verify the player entered the vertibird.
			;If the enter wasn't successful, we want to reset the BlockActivation to false
			if(activatingActor == Game.GetPlayer())

				if(blockOnActivateAndWait)
					BlockPlayerActivation()
					StartTimer(BlockActivateTimeout, BlockActivateTimerID)
				endif	

				;Register for OnGetUp as well as OnFurnitureExit since the latter event isn't sent in all exit cases.
				RegisterForRemoteEvent( activatingActor, "OnGetUp" )
			endif

			EnterTurret()
			;don't actually change the turret's state until the actor finishes "sitting" in it.
			;this avoids erroneously detecting their initial weapon-put-away of their previously equipped weapon as the putting away of the turret weapon

			;This is a fallback in case the script isn't updating fast enough and misses its chance to receive a idlechairsitting event.
			if(activatingActor.GetSitState() == 3 && sitHandled == false)
				DoSitCompletion(activatingActor)
				sitHandled = true
			endif
		endif
	EndEvent
	
	Event OnAnimationEvent( ObjectReference akSource, string asEventName )
		if ( akSource == activatingActor && activatingActor != None )
			if ( asEventName == "idleChairSitting" )
				debug.trace("turret got idlechairsitting from " + akSource)
				DoSitCompletion(akSource)
			elseif ( asEventName == "CameraOverrideStart" )
				; now that the actor has put away their original weapon, and the furniture animation has begun, its safe for us to equip the turret
				debug.trace("got cameraOverride while inactive, assuming weapon got sheathed and we should equip turret now")
				EquipTurret()
				UnregisterForAnimationEvent( activatingActor, "CameraOverrideStart" )
			endif
		endif
	EndEvent
EndState

Event Actor.OnGetUp( Actor akSender, ObjectReference akFurniture )
	;No-op for safety
EndEvent

; State where the turret is active
State TurretActive
	Event OnExitFurniture( ObjectReference akActionRef )
		if( akActionRef == activatingActor )
			debug.trace(activatingActor + " exiting vertibird(OnExit). Sit sleep state is " + activatingActor.GetSitState())
			debug.trace("registering for idleChairGetUp")
			RegisterForAnimationEvent( activatingActor, "idleChairGetUp" )
			UnregisterForRemoteEvent( activatingActor, "OnGetUp" )
		endIf
	EndEvent
	
	; Handle the remove turret event
	Event OnAnimationEvent( ObjectReference akSource, string asEventName )
		if ( akSource == activatingActor && activatingActor != None )
			if ( asEventName == "weaponSheathe" )
				debug.trace("actor on turret sheathing " + activatingActor.GetEquippedWeapon())
				ExitTurret();
				UnregisterForAnimationEvent( activatingActor, "weaponSheathe" )
			elseif ( asEventName == "idleChairGetUp" )
				UnregisterForAnimationEvent( activatingActor, "idleChairGetUp" )
				activatingActor = None
				GoToState("TurretInactive")
			endif
		endif
	EndEvent

	;Handle an actor getting up if idlechairgetup is not expected to be received for some reason (instant exit)
	Event Actor.OnGetUp( Actor akSender, ObjectReference akFurniture )
		if( akFurniture == Self && akSender == Game.GetPlayer() )
			UnregisterForRemoteEvent( activatingActor, "OnGetUp" )
			debug.trace(activatingActor + " exiting vertibird(OnGetUp). Sit sleep state is " + activatingActor.GetSitState())
			ExitTurret();
			activatingActor = None
			GoToState("TurretInactive")
		endif
	EndEvent
EndState

; State where the turret is disabled
State TurretDisabled
EndState