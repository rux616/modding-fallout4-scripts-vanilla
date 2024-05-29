ScriptName SpotlightTriggerScript extends ObjectReference
{Let Spotlight know when player enters and leaves trigger}

import debug

Group Required_Properties
	SpotlightScript property mySpotlight auto mandatory

EndGroup

bool property detecting = false auto hidden
Formlist property AggressiveFactions auto

ObjectReference[] property detectedActorArray auto hidden

ObjectReference[] triggerActors

int targetActorIndex = -1
;************************************


;OnLoad create our array and assign the script to the scriptobject property on the SpotlightScript.
Event OnLoad()

	if mySpotlight.detectScript == none
		mySpotlight.detectScript = self
		AggressiveFactions = mySpotlight.AggressiveFactions
		mySpotlight.lightxrot = mySpotlight.mySpotlightLight.getAngleX()
		mySpotlight.lightyrot = mySpotlight.mySpotlightLight.getAngleY()
		mySpotlight.lightzrot = mySpotlight.mySpotlightLight.getAngleZ() 

	endif

	if detectedActorArray == none
		detectedActorArray = new ObjectReference[0]

	endif

	if triggerActors == none
		triggerActors = new ObjectReference[0]

	endif

endEvent

;OnUnload clear the array as the data is no longer needed.
Event OnUnLoad()
	if detectedActorArray.Length > 0
		RemoveActorFromDetect(detectedActorArray[0] as Actor)

	endif
	detecting = false
	detectedActorArray.Clear()
	mySpotlight.GoToState("Active")

endEvent

State Active

	;Used for tracking purposes. Can be commented out.
	Event OnBeginState(string asOldState)
		;debug.trace("Welcome to the Active state.") 

	endEvent

	;When we see one of the actors in our detection array we may call a function on the SpotlightScript to start Warning/Alarming, etc.
	Event OnGainLOS (ObjectReference akViewer, ObjectReference akTarget)
	;debug.trace("LOS gained on " + akTarget)
		int detectedActorIndex = detectedActorArray.Find(akTarget)
		if detectedActorIndex >= 0
			RegisterLOS(akTarget, false)

			if detecting == false
				StartDetect(akTarget as Actor, detectedActorIndex)

			endif

		endif

	endEvent

	Event OnLostLOS(ObjectReference akViewer, ObjectReference akTarget)
	;debug.trace("LOS lost on " + akTarget)

		int detectedActorIndex = detectedActorArray.Find(akTarget)
		if detectedActorIndex >= 0
			;debug.trace("targetActorIndex is " + targetActorIndex + " against " + detectedActorIndex)

			if detectedActorIndex == targetActorIndex && self.HasDirectLOS(akTarget) == false && self.HasDirectLOS(akTarget, asTargetNode = "Pelvis") == false 
				detecting = false
				RegisterLOS(akTarget)

			else
				RegisterLOS(akTarget, false)

			endif
			

		endif

	endEvent

EndState

;************************************

auto State Busy
	;We want to keep track of LOS during the Busy state, just don't want to do anything with it, yet.
	Event OnGainLOS (ObjectReference akViewer, ObjectReference akTarget)
		if detectedActorArray.Find(akTarget) >= 0
			RegisterLOS(akTarget, false)

		endif

	endEvent

	Event OnLostLOS(ObjectReference akViewer, ObjectReference akTarget)
		if detectedActorArray.Find(akTarget) >= 0	
			RegisterLOS(akTarget)

		endif

	endEvent

	Function Active()
		GoToState("Active")

	endFunction
EndState

;************************************

state Shutdown

	Function Active()
		GoToState("Active")

	endFunction

	Event OnBeginState(string asOldState)
		;debug.trace("Welcome to Shutdown state.")
		

	endEvent

	Event OnTriggerEnter(ObjectReference akActionRef)
		;do nothing

	EndEvent

	Event OnTriggerLeave(ObjectReference akActionRef)
		;do nothing

	EndEvent


endState

state Working

		;When we see one of the actors in our detection array we may call a function on the SpotlightScript to start Warning/Alarming, etc.
	Event OnGainLOS (ObjectReference akViewer, ObjectReference akTarget)
	;debug.trace("working LOS gained on " + akTarget)
		int detectedActorIndex = detectedActorArray.Find(akTarget)
		if detectedActorIndex >= 0
			RegisterLOS(akTarget, false)

			if detecting == false
				StartDetect(akTarget as Actor, detectedActorIndex)

			endif

		endif

	endEvent

	Event OnLostLOS(ObjectReference akViewer, ObjectReference akTarget)
	;debug.trace("working LOS lost on " + akTarget)

		int detectedActorIndex = detectedActorArray.Find(akTarget)
		if detectedActorIndex >= 0

			;debug.trace("targetActorIndex is " + targetActorIndex + " against " + detectedActorIndex)

			if detectedActorIndex == targetActorIndex && self.HasDirectLOS(akTarget) == false && self.HasDirectLOS(akTarget, asTargetNode = "Pelvis") == false
				detecting = false

			endif
			RegisterLOS(akTarget)

		endif

	endEvent

	Event OnTriggerEnter(ObjectReference akActionRef)
		;do nothing

	EndEvent


endState

Event OnTimer(int aiTimerID)

	GoToState("Active")


endEvent

bool Function FactionCheck(Actor Triggerman)
	if (TriggerMan).IsDead() == false 
		if mySpotlight.factionOwner.GetFactionReaction(TriggerMan) == 1
			return true
			;debug.trace("Enemy and not dead, track.")

		endif

		if AggressiveFactions.Find(mySpotlight.factionOwner) >= 0
			if Triggerman.IsInFaction(mySpotlight.factionOwner)
				return false
				;debug.trace("In Aggressive Faction, don't track.")

			else
				return true
				;debug.trace("Not in this Aggressive Faction, track.")

			endif

		endif

		if Triggerman.GetValue(Game.GetAggressionAV()) >= 2 && TriggerMan.IsInFaction(MySpotlight.factionOwner) == false && mySpotlight.factionOwner.GetFactionReaction(TriggerMan) <= 1
			return true
			;debug.trace("Aggressive actor, not in our faction and our reaction to them is neutral or worse, track.")

		endif	

	else
		return false

	endif


	endFunction


Event OnTriggerEnter(ObjectReference akActionRef)
	
;debug.trace(akActionRef + "Entered")
	triggerActors.add(akActionRef)
	if triggerActors.Length >= 2
		;debug.trace("Length is >= 2")
		GoToState("Working")

	else
		if(akActionRef is Actor)
			Actor TriggerMan = akActionRef as Actor
			if(!mySpotlight.factionOwner)
				;means the spotlight will not detect anything, so do nothing
			else
				if FactionCheck(Triggerman) == true
					if detectedActorArray.Length >= 4
						GoToState("Working")

					endif

					AddActorToDetect(TriggerMan)

		    	endif

		   	endif
		endif
	endif

	int actorIndex = triggerActors.Find(akActionRef)
	if actorIndex >= 0
		triggerActors.remove(actorIndex)

	endif

	if triggerActors.Length < 2 && detectedActorArray.Length < 4
			StartTimer(1.0)

	endif

EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	;debug.trace(akActionRef + " left the trigger.")

	if(akActionRef is Actor)
	ObjectReference TriggerMan = akActionRef
		if detectedActorArray.Find(TriggerMan) >= 0
			RemoveActorFromDetect(TriggerMan as Actor)

		endif

	endif

EndEvent

Function StartDetect(Actor DetectActor, int detectedActorIndex)
	detecting = true
	targetActorIndex = detectedActorIndex
;debug.trace("targetActorIndex set to " + targetActorIndex)
;debug.trace("Start Detect.")
	mySpotlight.Warn(detectActor as Actor)

endFunction

Actor Function CheckForNextDetect()
;debug.trace("Check for next detect")
	if Detecting == false
		int i = 0
		While i < detectedActorArray.Length
			;debug.trace("Checking " + i)
			Actor detectedActor = detectedActorArray[i] as Actor
			if detectedActor == Game.GetPlayer()
				if self.HasDirectLOS(detectedActor, asTargetNode = "Chest") && Detecting == false
					;debug.trace("LOS for next.")
					detecting = true
					targetActorIndex = i
					;Moving Patrol marker to detected actors location and starting DirectAt.
					return detectedActor
					i = detectedActorArray.Length

				endif
			else
				if self.HasDirectLOS(detectedActor, asTargetNode = "Head") && Detecting == false
					;debug.trace("LOS for next.")
					detecting = true
					targetActorIndex = i
					return detectedActor
					i = detectedActorArray.Length

				endif
			endif


			i += 1
		endWhile
	endif

	return none
endFunction

Function AddActorToDetect(Actor DetectActor)
	;Handles Actor array management.
	debug.trace(detectedActorArray.Find(detectActor))
	if detectedActorArray.Find(detectActor) < 0
		detectedActorArray.add(DetectActor)
	;debug.trace(DetectActor + "added at " + detectedActorArray.Find(detectActor) , 1)
	;debug.trace("current detected actors is " + detectedActorArray.Length, 1)
		RegisterForRemoteEvent(DetectActor as Actor, "OnDying")
		RegisterLOS(DetectActor)

	else
		;do nothing

	endif
	int actorIndex = triggerActors.Find(detectActor)
	triggerActors.remove(actorIndex)

	if triggerActors.Length < 2
		StartTimer(1.0)

	endif

endFunction

Function RemoveActorFromDetect(Actor DetectActor)
	;Handles Actor array management.
	int iActorIndex = detectedActorArray.Find(detectActor)
	if iActorIndex >= 0
		;debug.trace("targetActorIndex is " + targetActorIndex + " against " + iActorIndex)
		if iActorIndex == targetActorIndex
			detecting = false
			targetActorIndex = -1
		elseif iActorIndex < targetActorIndex
			targetActorIndex -= 1

		endif
		detectedActorArray.remove(iActorIndex)
		if detectedActorArray.Length < 5
			GoToState("Active")
					
		else

		endif
		;debug.trace(DetectActor + "removed.", 1)
		;debug.trace("current detected actors is " + detectedActorArray.Length, 1)
		;debug.trace("Unregistering LOS for " + DetectActor)
		UnregisterForLOS(self, DetectActor)
		UnregisterForRemoteEvent(detectActor as Actor, "OnDying")


	else
		;do nothing
		
	endif

endFunction

Function RegisterLOS(ObjectReference DetectActor, bool losGain = true)
	ObjectReference Player = Game.GetPlayer()
	;Simple function handle LOS registration.
	if losGain == true
	;debug.trace("Register for LOS gain on " + detectActor)
		if(DetectActor == Player)
			RegisterForDirectLOSGain(self, DetectActor, asTargetNode = "Chest")
		else
			RegisterForDirectLOSGain(self, DetectActor, asTargetNode = "Head")
		endif
	else
	;debug.trace("Register for LOS lost on " + detectActor)
		if(DetectActor == Player)
			RegisterForDirectLOSLost(self, DetectActor, asTargetNode = "Chest")
		else
			RegisterForDirectLOSLost(self, DetectActor, asTargetNode = "Head")
		endif
	endif

endFunction

Function Shutdown()

	GoToState("Shutdown")
	;Clear the present detection array, we don't care what was in it. Only what is there when we turn the Spotlight back on.
	targetActorIndex = -1
	triggerActors.Clear()
;debug.trace("CLEAR THE ARRAY!!!!")
	detectedActorArray.Clear()
	mySpotlight.shutdown = true
	mySpotlight.mySpotlightLight.disable()

	if mySpotlight.startsoff
		mySpotlight.playAnimation("StartOff")

	else
		;mySpotlight.playAnimation("TurnOff")

	endif
	;We are shutdown and therefore should not be receiving any events.
	UnregisterForAllEvents()



endFunction

bool Function isShutdown()

	if GetState() == "Shutdown"
		return true

	else
		return false

	endif

endFunction

Function Active()
	;do nothing

endFunction

Event Actor.OnDying(Actor akSender, Actor akKiller)
	;Handles the case of an actor no longer being important via death.
;debug.trace(akSender + "died")
	RemoveActorFromDetect(akSender)

endEvent