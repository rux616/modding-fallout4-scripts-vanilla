ScriptName SpotlightScript extends ObjectReference conditional
{Master Script for the spotlights. SpotlightTriggerScript talks to this script}

Group Required_Properties
	Faction property factionOwner auto
	{pick a faction who owns the spotlight, anyone hostile to this faction will trigger the spotlight}
	ObjectReference property mySpotlightLight auto const
	{the light for the spotlight}
	Quest property myQuest auto const
	{optional: quest to set a stage on when player is first spotted by light}
	int property myQuestStage auto const
	{the stage to set for myQuest when player is first spotted by light}
	bool property startsOff = false auto const
	{default = false, set to true if you want the spotlight to start inactive}

endGroup

Group Advanced_Properties CollapsedOnRef
	Form property xMarkerForm auto const
	{defaults to an xmarker, used for linger marker and patrol marker}
	Float property LingerOffset = 200.0 auto const
	{defaults to 400, used as offsets for how far to move the linger marker when the light is lingering on last known location}
	Float property PatrolSpeed = 100.0 auto const
	{defaults to 100, used for speed of patrol marker translation}
endGroup

Group Sounds CollapsedOnRef
	Sound property AlarmLP auto const mandatory
	{locked on state where spotlight sees actor, but hasn't sounded alarm yet}
	Sound property Destroy auto const mandatory
	{plays destroy sound effect when destroyed}
	Sound property Reset auto const mandatory
	{a quick one-off that signifies the spotlight reset}
	Sound property SearchMotorLPM auto const mandatory
	{motor loop sound for searching and sweeping back and forth, needs a start and stop event}
	Sound property SearchingLP auto const mandatory
	{searching}
	Sound property SearchingQuick auto const mandatory
	{a quick one-off for when the spotlight is searching}
	Sound property Warning auto const mandatory
	{warning}

endGroup

;Super secret spotlight status properties.
SpotlightTriggerScript property detectScript auto hidden
{dynamically filled script property for the detection cone script}
Formlist property AggressiveFactions auto

bool property destroyed = false auto conditional hidden
bool property shutdown = false auto conditional hidden
bool busy = false conditional

bool SetupDone = false;
bool bAlarming
bool bLingering
bool StillAlarming

ObjectReference myPatrolMarker ;ObjectRef var to store a placed xmarker which is used for directing the spotlight.
int currentTargetMarker = 0
bool panForward = true
ObjectReference[] markerLinkedRefChain ;Array for the linked xmarkers to ping back and forth between while panning.

;Sound IDS
int AlarmLPID = -1
int SearchMotorLPMID = -1
int SearchingLPID = -1
int WarningID = -1

;Timer IDs
int iAlarmSFX = 1
int iAlarmFunc

;Light datars
float property lightxrot auto
float property lightyrot auto
float property lightzrot auto
float property lightx auto
float property lighty auto
float property lightz auto



;bool vars to support old Spotlight script conditionals on anything.
bool myQuestStageSetDone = false

Event OnReset()
	;Clear destruction data on the spotlight object.
	ClearDestruction()

endEvent

;Active state exists to show Terminals that the Spotlights aren't busy shutdowning or turning on.
auto state Active

;Event handles initial Spotlight setup.
	Event OnLoad()
			;debug.trace("loaded spotlight" + self)
			if mySpotlightLight != none && !destroyed

				if mySpotlightLight.IsDisabled() && !detectScript.IsShutdown() && !isDisabled()
					;debug.trace("Enabling spotlight light." + mySpotlightLight)
					mySpotlightLight.Enable()

				endif
				if SetupDone	
					BridgeToPan()


				endif


			endif


	endEvent

	Event OnCellLoad()


		;If the Spotlight is disabled, do nothing.
		if !IsDisabled() && !destroyed
		;debug.trace("setup spotlight " + self)
			markerLinkedRefChain = getLinkedRefChain()
			;if the Spotlight starts off prep it for shutdown state. Otherwise prep it for setup.
			if(startsOff) && !SetupDone
				;spotlight starts off so shut it down.
				SetupDone = true
				detectScript.Shutdown()

			else
				shutdown = false
				SetupDone = true
				SetupDefault()

			endif

		else
			;debug.trace("spotlight disabled " + self)

		endif


	endEvent

;Event handles Spotlight activation, in this case Activation means it's either being turned on or off or it has been destroyed.
	Event OnActivate(ObjectReference akActionRef)

		if(akActionRef == game.getPlayer())
			;do nothing
	    else
	    	;if we still have a Spotlight Light object
		    if mySpotlightLight != none
		    	;if that Light object is enabled it either needs to be handled for destruction or shutdown. Otherwise handle Spotlight setup from shutdown.
		    	if !mySpotlightLight.IsDisabled()
		    		;if the light was enabled but our activation wasn't sent because we were destroyed then simply shutdown the spotlight. Otherwise handle the destruction.
		    		if IsDestroyed() == false
		    			;debug.trace("I'm not destroyed!")
						mySpotlightLight.Disable()

						shutdown = true
						detectScript.Shutdown()
		    			Shutdown()
		    		else
		    			;debug.trace("I'm destroyed!")
		    			mySpotlightLight.Disable()
		    			destroyed = true
		    			ClearSound()
		    			detectScript.Shutdown()
		    			Shutdown()	

		    		endif
		    	else
		    		busy = true
		    		SetupDefault()

		    	endif


		    endif
		endif

	endEvent

;Event handles the destruction of the Spotlight.
	Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	    if(aiCurrentStage == 3)
	    	;I'm destroyed

	    	setDestroyed(self)
	    	self.activate(self)
			Destroy.play(self)
			self.ApplyHavokImpulse(0,0,1, 5)

	    endif
	EndEvent


;Event is used to keep the patrolmarker in motion when necessary.
	Event ObjectReference.OnTranslationAlmostComplete(ObjectReference akSender)
		;debug.trace("Event for almost complete " + self)

		if !detectScript.Detecting && !bLingering && !bAlarming && !detectScript.IsShutdown() && !StillAlarming
			;Manages the Searchmotor SFX
			ClearSound()

			;The light is enabled, therefore we can assume the Spotlight is On AND/OR not destroyed, so lets translate the marker to pan at.
			if !detectScript.IsShutdown() && !IsDestroyed()
				if SearchMotorLPMID != -1
					SearchMotorLPMID = SearchMotorLPM.play(self)

				endif
				;This additional check is support for having one target for the spotlight.
				if markerLinkedRefChain.Length > 1
					;debug.trace("Translating! " + self)
					myPatrolMarker.TranslateToRef(markerLinkedRefChain[currentTargetMarker], PatrolSpeed, 0)

				endif
			int markerChainLength = markerLinkedRefChain.Length
			markerChainLength -= 1
			if panForward == true && currentTargetMarker < markerChainLength
				currentTargetMarker += 1

			elseif panForward && currentTargetMarker >= markerChainLength
				panForward = false
				currentTargetMarker -= 1

			elseif !panForward && currentTargetMarker > 0
				currentTargetMarker -= 1

			elseif !PanForward && currentTargetMarker <= 0
				panForward = true
				currentTargetMarker += 1

			endif
			endif
		endif

	EndEvent

;This timer handles the Alarm sound so that it's less annoying. 
	Event OnTimer(int aiTimerID)
		if aiTimerID == iAlarmSFX && !destroyed
			;debug.trace("Timer Alarm SFX")
			AlarmLPID = AlarmLP.play(self)
			StartTimer(12, iAlarmSFX)


		endif

		if aiTimerID == iAlarmFunc && !destroyed
			;debug.trace("Timer Alarm Func")
			Alarm()

		endif

		if aiTimerID == 99
			;Spotlight restarting
			if !isDisabled() && !IsDestroyed() && !shutdown
					ClearSound()
					detectScript.Shutdown()
					Shutdown()
		    		SetupDefault()

			endif


		endif

	endEvent

	;Handles setup for the Spotlight, whether from OnLoad or via Activation from shutdown.
	Function SetupDefault()
		;debug.trace("Setting up " + self)

			;If there isn't a patrolmarker present then we should create one. This marker is used by the Spotlight to point at for panning of any kind when not directing at an Actor.
			if myPatrolMarker == none
				myPatrolMarker = self.PlaceAtMe(xMarkerForm)

			endif
			;When we enter this function while the detection script is in the shutdown state it means we are starting up from a shutdown. This block handles that setup.
			if detectScript.IsShutdown()
				;debug.trace("Setting up from Shutdown")
				GoToState("Busy")
				shutdown = false
				utility.wait(1.0)
				playAnimation("TurnOn")
				mySpotlightLight.EnableNoWait()
				mySpotlightLight.SetAngle(lightxrot, lightyrot, lightzrot)
				GoToState("Active")
				
			endif
			RegisterForRemoteEvent(myPatrolMarker, "OnTranslationAlmostComplete")

			;Before starting any panning we want to move the marker to the first pan point. We want to do this via translateToRef to catch an TranslationAlmostComplete
			
			SearchMotorLPMID = SearchMotorLPM.play(self)
			myPatrolMarker.WaitFor3DLoad()
			StartPan(myPatrolMarker)
			myPatrolMarker.TranslateToRef(markerLinkedRefChain[0], PatrolSpeed*4)

	endFunction

	;Handles shutting down the Spotlight, either via Terminal or destruction.
	Function Shutdown()
		GoToState("Busy")
		busy = true
		utility.wait(0.1)
		detectScript.Detecting = false
		StillAlarming = false
		bAlarming = false
		bLingering = false
		ClearSound()
		;debug.trace("Shutting down.", 2)
		detectScript.GoToState("Shutdown")
		if !IsDestroyed()
			playAnimationandWait("TurnOff", "Done")

		endif
		SetDirectAtTarget(none)
		myPatrolMarker.moveto(self, 0, 0, -256)
		GoToState("Active")
		busy = false


	endFunction

	;Handles the initial animation setup for the Spotlight.
	Function StartPan(ObjectReference akActionRef)
		;debug.trace("Starting Pan " + self)
		SetDirectAtTarget(akActionRef)
		PlayAnimation("Direct01")
		detectScript.Active()
		busy = false

	endFunction

	Function SetDetectDirect(Actor detectActor = none)
		myPatrolMarker.translateToRef(detectActor, PatrolSpeed*5)
		SetDirectAtTarget(detectActor)

	endFunction

	Function RestartSpotlight()
		busy = true
		StartTimer(0.1, 99)

	endFunction

	;This function handles the Warning phase. Which occurs to allow the player a chance to hide themselves from the spotlight. It's as if the spotlight hasn't identified the actor as a threat.
	Function Warn(actor detectActor = none)

		;Stop the searchmotor sound as we are now warning, rather than searching.
		ClearSound()

		SetDetectDirect(detectActor)

		if detectScript.Detecting
		;debug.trace("Detecting.")
			;If we were Lingering when we detected someone, lets skip the warning and go straight into an Alarm.
			if !bLingering && !StillAlarming
			;debug.trace("Warn!", 1)
				;Playing a Warn SFX to alert the player of the detection.
				WarningID = Warning.play(self)
				int i = 0
				int warnTimer = 4
				;This while loop allows the player a total of 2 seconds to get out of sight before sounding the alarm. It has 4 total checks for the player exiting LOS. (This is not done via Event to prevent out of order script interruptions)
				while i < warnTimer
					if detectScript.Detecting
						utility.wait(0.25)

						i += 1
					else
						i = warnTimer
					;debug.trace("Lost sight of " + detectActor)

					endif

				endwhile

				if !(detectActor).IsDead() && detectScript.Detecting
				;debug.trace("if after the warning period the player is still in sight then we want to Alarm.")
					ClearSound()
					Alarm(detectActor)

				else
				;debug.trace("Actor escaped detection from Warn, send to BridgeToPan", 1)
					ClearSound()
					myPatrolMarker.moveto(detectActor)
					utility.wait(0.75)
					BridgeToPan(detectActor)

				endif

			elseif !StillAlarming
			;debug.trace("Attempted to Warn but we were Lingering so skip to Alarm", 2)
				Alarm(detectActor)

			endif
		elseif !StillAlarming && !bLingering
			myPatrolMarker.moveto(detectActor)
			BridgeToPan(detectActor)

		endif

	endFunction

	;This function handles Alarming. Which fires if the player stays in sight of the Spotlight for 2 seconds during the Warn function.
	Function Alarm(actor detectActor = none)
	;debug.trace("Alarm function " + detectactor)
		SetDetectDirect(detectActor)
		StillAlarming = true

		while StillAlarming && !destroyed
		;debug.trace("Sound Alarm!")
			SoundAlarm(detectActor)

		endWhile

		ObjectReference nextDetect = detectScript.CheckForNextDetect()
		if nextDetect != none
			Alarm(nextDetect as Actor)


		elseif !detectScript.Detecting && !Shutdown && !destroyed && !bLingering && !StillAlarming
			;debug.trace("Actor not detected, to the Linger!", 1)
			ClearSound()
			Linger(detectActor)

		else
			;do nothing

		endif

	endFunction

	Function SoundAlarm(Actor detectActor)
	;debug.trace("Alarm! at " + detectActor, 2)
		ClearSound()
		int detectActorIndex = detectScript.detectedActorArray.Find(DetectActor)
		bAlarming = true

		;If we are coming from the Linger function we should tell the script that we are no longer Lingering.
		if bLingering == true
			bLingering = false

		endif

		;Quest stage setting check.
		if myQuest != none && !myQuestStageSetDone && detectActor == Game.GetPlayer()
			myQuest.SetStage(myQuestStage)
			myQuestStageSetDone = true

		endif

		if AlarmLPID == -1 && !Shutdown && !destroyed
		;debug.trace("function Alarm SFX")
			AlarmLPID = AlarmLP.play(self)
			StartTimer(12, iAlarmSFX)
		endif

		int i = 0
		int iCounter = 0
		;This is a while loop that creates detection events at the player until they break LOS, or something occurs to force the script into a state of no longer Detecting.
		while bAlarming && detectScript.Detecting && detectActorIndex >= 0
			if iCounter == 10
				iCounter = 0

			endif

			if !(detectActor).IsDead()
			;Debug.trace("detectActor was " + detectActor)
				utility.wait(0.1)

				if iCounter == 0
				;debug.trace("Detection at " + detectActor)
					detectActor.CreateDetectionEvent(detectActor, 100)

				endif
			else
			;debug.trace("Actor died in alarm.")
				bAlarming = false

			endif
			iCounter += 1

		endwhile
		bAlarming = false


		int flavor = 0
		while flavor < 5 && !detectScript.Detecting && detectScript.detectedActorArray.Length <= 1
			;A quick flavor pause that will break out if the player is redetected during it.
		;debug.trace("Flavor pause after Alarm LOS loss.", 1)
			if !(detectActor).IsDead()
				utility.wait(0.2)

				flavor += 1
			else
			;debug.trace("Actor death ended flavor.")
				flavor = 5

			endif

		endwhile

		if flavor == 5 || !detectScript.Detecting || detectActorIndex < 0
			StillAlarming = false

		endif

	endFunction

	;This function handles the Linger mechanic. Which occurs when an Alarm has fired but the Spotlight can longer see the actor.
	Function Linger(ObjectReference detectActor = none)


		if !bLingering && !detectScript.Detecting && !StillAlarming && !destroyed && !Shutdown && (myPatrolMarker.GetParentCell() == Game.GetPlayer().GetParentCell())
			;debug.trace("Linger!", 1)
			bLingering = true

			myPatrolMarker.moveto(detectActor)
			SetDirectAtTarget(myPatrolMarker)

			int i = 0

			float xStart = myPatrolMarker.getPositionX()
			float yStart = myPatrolMarker.getPositionY()
			float zStart = myPatrolMarker.getPositionZ()

			if !shutdown 
				SearchingLPID = SearchingLP.play(self)

			endif

			int LingerMovements = 5 ;Total times the spotlight can make a movement to look around for a target.

			;This loop ends after 5 movements regardless of whether or not the player is seen again.
			While !detectScript.Detecting && i < LingerMovements && !StillAlarming && !Shutdown
				float xOffset = utility.RandomFloat(-LingerOffset, LingerOffset)
				float yOffset = utility.RandomFloat(-LingerOffset, LingerOffset)
				float zOffset = utility.RandomFloat(-LingerOffset, LingerOffset)
				SearchingQuick.play(self)
				if !detectScript.Detecting
					myPatrolMarker.TranslateTo(xStart + xOffset, yStart + yOffset, zStart + zOffset, 0, 0, 0, PatrolSpeed*100)
				endif

				int waitCount = 0
				while waitCount < 14 && !detectScript.Detecting && !Shutdown && !StillAlarming
					utility.Wait(0.08)
					waitCount += 1

				endWhile
				
				i += 1
			endWhile
				ClearSound()
			if !detectScript.Detecting && i == LingerMovements && !Shutdown
				;We will set Lingering to false here when it broke out of the while loop via timing out, otherwise set Lingering to False in Alarm function.
				bLingering = False
			;debug.trace("Finished lingering, no detection.", 1)
				BridgeToPan(detectActor)

			endif
		endif


	endFunction

	;This is a function of sound clearing.
	Function ClearSound()


		if(WarningID >= 0)
			Sound.stopInstance(WarningID)
			WarningID = -1

		endif

		if(SearchMotorLPMID >= 0)
			Sound.stopInstance(SearchMotorLPMID)
			SearchMotorLPMID = -1

		endif

		if(SearchingLPID >= 0)
			Sound.stopInstance(SearchingLPID)
			SearchingLPID = -1

		endif

		if !StillAlarming
			;debug.trace("stop timers")
			CancelTimer(iAlarmSFX)
			CancelTimer(iAlarmFunc)

		endif


		if(AlarmLPID >= 0)
			;debug.trace("stop alarm")
			Sound.stopInstance(AlarmLPID)
			AlarmLPID = -1

		endif

	endFunction

	;This function bridges the gap between active detection to moving back to panning.
	Function BridgeToPan(ObjectReference detectActor = none)

		ClearSound()

		;This block resets the spotlight to pan from warn.
		if !detectScript.Detecting
			Reset.play(self)
			myPatrolMarker.TranslateToRef(markerLinkedRefChain[0], PatrolSpeed, 0)
			SetDirectAtTarget(myPatrolMarker)
		;debug.trace("Back to pan.", 1)

		endif

	endFunction

endState

;Busy state exists to show Terminals that the Spotlights are busy shutdowning or turning on.
state Busy 
	;do nothing

endState

Event ObjectReference.OnTranslationAlmostComplete(ObjectReference akSender)
;do nothing	

EndEvent

Function BridgeToPan(ObjectReference detectActor = none)
;do nothing

endFunction

Function StartPan(ObjectReference akActionRef)
;do nothing

endFunction

Function Warn(actor detectActor = none)
;do nothing

endFunction

Function Alarm(actor detectActor = none)
;do nothing

endFunction

Function Linger(ObjectReference detectActor = none)
;do nothing

endFunction

Function ClearSound()
;do nothing

endFunction

Function SetDetectDirect(Actor detectActor = none)
;do nothing

endFunction

Function SetupDefault()
;do nothing

endFunction

Function Shutdown()
;do nothing

endFunction

Function SoundAlarm(Actor detectActor)

endFunction

Function ReadyToSwap()
;do nothing

endFunction

Function RestartSpotlight()
;do nothing

endFunction