ScriptName DN102_LabDemo4Script extends ObjectReference
{Script for HalluciGen Lab Demo 4, 'HalluciGen Gas': Just vfx.}

Group LabDemoProperties CollapsedOnRef
	Keyword property LinkCustom01 Auto Const Mandatory
	{Keyword for the linkedref chain between the vfx.}

	ObjectReference property DN102_LabDemo4MistRef Auto Const Mandatory

	Sound property QSTDN102HallucigenFanLPM Auto Const Mandatory

	Explosion property DN102_FrenzyGrenadeExplosion Auto Const Mandatory
EndGroup

int fanSoundID = -1


Event OnCellLoad()
	Self.DisableLinkChain(LinkCustom01, True)
EndEvent

Function StartDemo()
	;Debug.Trace("Playing " + QSTDN102HallucigenFanLPM)
	fanSoundID = QSTDN102HallucigenFanLPM.Play(Self)
	;Utility.Wait(0.5)
	;if (fanSoundID > -1)
		;Debug.Trace("Enabling " + DN102_LabDemo4MistRef)
		;DN102_LabDemo4MistRef.EnableNoWait(True)
		;Utility.Wait(0.25)
		;ObjectReference[] MistFX = DN102_LabDemo4MistRef.GetLinkedRefChain(LinkCustom01)
		;Debug.Trace("Enabling " + MistFX.Length + " more.")
		;int i = 0
		;While ((fanSoundID > -1) && (i < MistFX.Length))
		;	Debug.Trace("Enabling " + MistFX[i])
		;	MistFX[i].EnableNoWait(True)
		;	Utility.Wait(0.25)
		;	i = i + 1
		;EndWhile
	;EndIf
EndFunction

Function StopDemo()
	;Self.DisableLinkChain(LinkCustom01, True)
	if (fanSoundID > -1)
		Sound.StopInstance(fanSoundID)
		fanSoundID = -1
	EndIf
EndFunction