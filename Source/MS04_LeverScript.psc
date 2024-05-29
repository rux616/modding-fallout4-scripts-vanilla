Scriptname MS04_LeverScript extends ObjectReference
{ This script allows a lever to do nothing under certain conditions}

import game
import debug


Sound property FailureFX auto
{ the failure VFX that plays if things go wrong}

quest property myQuest auto	
{ quest to call SetStage on}

int property primaryOverride = 0 auto
{ Is this the primary override}

int property stage auto
{ stage to set}

bool property doOnce = True auto
{Set the stage only once.}

int property prereqStageOPT = -1 auto
{ OPTIONAL: stage that must be set for this trigger to fire }

float property delay = 0.0 auto
{ OPTIONAL: Amount of time to wait until setting the stage.  Defaults to 0 }

bool property requirePlayerActivation = True auto
{ Whether or not the player needs to be the one to activate this: Defaults to True}

Message Property FailMessage Auto Const
{ The message that plays if the object is activated when the conditions are FALSE}

auto STATE waitingForPlayer
	EVENT onActivate(objectReference triggerRef)
		if (triggerRef == getPlayer() as actor || !requirePlayerActivation)
			if prereqStageOPT == -1 || MyQuest.getStageDone(prereqStageOPT) == 1

				; Check to see if the Auxiliary Override will work properly if flipped
				; Or if this is the Primary Override it will work once regardless
				int nOverrideAvailable = (myQuest as MS04_Script).nOverrideAvailable
				if ( nOverrideAvailable || primaryOverride )
					; The button will work
					utility.Wait(delay)
					myQuest.setStage(stage)
					if (doOnce)
						GoToState("hasBeenTriggered")
					endif
				else
					; The button doesn't work
					FailureFX.Play(Self)
				endif
			elseif prereqStageOPT != -1
				; This fires if the conditions aren't met
				FailMessage.Show()
			endif
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE
