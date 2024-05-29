Scriptname MirelurkHypnosisTowerTrigScript extends ObjectReference Hidden

Faction Property MirelurkFaction Auto Const
Faction Property DN138MirelurkFaction Auto Const
ActorValue Property Aggression Auto Const

auto STATE MakeFriendly
	Event OnTriggerEnter(ObjectReference akActionRef)
		if (akActionRef as Actor).IsInFaction(MirelurkFaction)
			(akActionRef as Actor).AddtoFaction(DN138MirelurkFaction)
			(akActionRef as Actor).EvaluatePackage()
			(akActionRef as Actor).StopCombat()
			akActionRef.IgnoreFriendlyHits()
			;(akActionRef as Actor).SetValue("Confidence", 0)
			(akActionRef as Actor).SetValue(Aggression, 0)
		endif
	EndEvent
EndSTATE


STATE MakeAngry
	Event OnTriggerEnter(ObjectReference akActionRef)
		if (akActionRef as Actor).IsInFaction(MirelurkFaction)
			(akActionRef as Actor).RemoveFromFaction(DN138MirelurkFaction)
			akActionRef.IgnoreFriendlyHits(FALSE)
			;(akActionRef as Actor).SetValue("Confidence", 4)
			(akActionRef as Actor).SetValue(Aggression, 2)
			(akActionRef as Actor).StopCombat()
			(akActionRef as Actor).EvaluatePackage()
		endif
	EndEvent
EndSTATE

STATE MakeSleepy
	Event OnTriggerEnter(ObjectReference akActionRef)
		if (akActionRef as Actor).IsInFaction(MirelurkFaction) || (akActionRef as Actor).IsInFaction(DN138MirelurkFaction)
			(akActionRef as Actor).Kill()
			self.DisableNoWait()
		endif
	EndEvent
EndSTATE



Event OnTriggerLeave(ObjectReference akActionRef)
	if (akActionRef as Actor).IsInFaction(MirelurkFaction)
		(akActionRef as Actor).RemoveFromFaction(DN138MirelurkFaction)
		akActionRef.IgnoreFriendlyHits(FALSE)
		;(akActionRef as Actor).SetValue("Confidence", 4)
		(akActionRef as Actor).SetValue(Aggression, 2)
		(akActionRef as Actor).StopCombat()
		(akActionRef as Actor).EvaluatePackage()
	endif
EndEvent