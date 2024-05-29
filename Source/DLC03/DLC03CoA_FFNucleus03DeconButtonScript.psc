Scriptname DLC03:DLC03CoA_FFNucleus03DeconButtonScript extends ObjectReference

GlobalVariable Property DLC03_FFNucleus03_PumpState Auto Const Mandatory
{Variable that decides current state of pump. Zero by default, set to 1 or 2 from FFNuc_03 pump handler}

ReferenceAlias Property RadHealHazard Auto Const Mandatory
{Hazard object used to heal rad damage for player. Lives in FFNuc03 Pump handler quest}

ReferenceAlias Property RadDamageHazard Auto Const Mandatory
{Hazard object used to deal rad damage to player. Lives in FFNuc03 Pump handler quest}

ReferenceAlias[] Property Arches Auto Const Mandatory
{Nucleus decom arches}

Sound Property OBJKeyCardActivateFail Auto Const Mandatory
{Sound to play when button isn't working}

float Property iDecomTimerLength = 9.0 Auto Const
{Length decom effect is active}

Message Property DLC03CoA_FFNucleus03_ArchesInactive Auto Const Mandatory
{Message to display before the arches have been repaired}

;Local vars
int iDecomTimerID = 1 Const

Event OnTimer(int aiTimerID)
	if aiTimerID == iDecomTimerID
		;Disable the appropriate hazard
		if DLC03_FFNucleus03_PumpState.GetValue() == 1
			RadHealHazard.GetRef().Disable()
		elseif DLC03_FFNucleus03_PumpState.GetValue() == 2
			RadDamageHazard.GetRef().Disable()
		endif

		;Turn off the arches
		SetArchesState(false)

		;Return to ready state
		GoToState("Ready")
	endif
EndEvent

Auto State Ready
	Event OnActivate(ObjectReference akActivator)
		;When the player activates the decom, trigger appropriate state
		GoToState("Busy")

		float iPumpState = DLC03_FFNucleus03_PumpState.GetValue()

		if iPumpState == 0.0
			;If the pump isn't fixed, play the fail sound and return to the "Ready" state
			Utility.Wait(0.5)
			DLC03CoA_FFNucleus03_ArchesInactive.Show()
			OBJKeyCardActivateFail.PlayAndWait(self)
 			GoToState("Ready")

		elseif iPumpState == 1.0
			;If the player restored the decom functionality, start timer and turn on heal rads hazard
			StartTimer(iDecomTimerLength, iDecomTimerID)
			RadHealHazard.GetRef().Enable()
			SetArchesState(true)

		elseif iPumpState == 2.0
			;Otherwise, turn on the damage hazard
			StartTimer(iDecomTimerLength, iDecomTimerID)
			RadDamageHazard.GetRef().Enable()
			SetArchesState(true)
		endif
	EndEvent
EndState

State Busy
	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState

Function SetArchesState(bool bActivate = false)
	;Loop through all the arches and set them to the appropriate state

	int i = 0
	While (i < arches.Length)
		ObjectReference obj = Arches[i].GetRef()

		(obj as Default2StateActivator).SetOpenNoWait(bActivate)
		i += 1
	EndWhile
	
EndFunction