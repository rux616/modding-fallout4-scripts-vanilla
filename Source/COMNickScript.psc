Scriptname COMNickScript extends Quest Conditional

Int Property iInfatuationResponse Auto Conditional

Int Property iPlayerApologized Auto Conditional

Bool Property bPlayerKnowsNicksPast Auto Conditional

ReferenceAlias Property NickValentine Auto Const
Keyword Property COMNickMysteriousStrangerTopic Auto Const
Int Property CompanionDistance = 1000 Auto Const
GlobalVariable Property COMNickStrangerThresholdMax Auto Const

Event OnInit()
	RegisterForTrackedStatsEvent("Mysterious Stranger Visits", 1)
EndEvent

;Nick's Mysterious Stranger comments
EVENT OnTrackedStatsEvent(string asStat, int aiStatValue)
	Debug.Trace(asStat + " is " + aiStatValue)

	;If we've gotten our Mysterious Stranger event...
	if asStat == "Mysterious Stranger Visits"
		;debug.trace(self + "Stranger's arrived.")
		ObjectReference CompanionObjREF = NickValentine.GetRef()

		;Make sure Nick's loaded and nearby...
		if CompanionObjREF.Is3dLoaded()
			;debug.trace(self + "Nick is 3D loaded.")
			if CompanionObjREF.GetDistance(Game.GetPlayer()) < CompanionDistance
				;debug.trace(self + "Nick is close enough. Have hime say his line.")

				;If so, have him say his line.
				CompanionObjREF.SayCustom(COMNickMysteriousStrangerTopic)
			endif
		endif
	endif

	;If the stat value is less than the threshold max, then reregister for the next visit from the Stranger
	if aiStatValue < COMNickStrangerThresholdMax.GetValue()
		RegisterForTrackedStatsEvent("Mysterious Stranger Visits", aiStatValue + 1)
	else
		UnregisterForTrackedStatsEvent("Mysterious Stranger Visits")
	endif
endEvent
