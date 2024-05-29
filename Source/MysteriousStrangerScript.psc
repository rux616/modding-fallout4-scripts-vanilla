Scriptname MysteriousStrangerScript extends Actor Const

ReferenceAlias Property Companion Auto Const
Keyword Property COMNickMysteriousStrangerTopic Auto Const
Int Property CompanionDistance = 600 Auto Const

;Mysterious Stranger loaded in. If Companion is loaded and within an appropriate distance, 
;register for exiting VATS
Event OnLoad()
	ObjectReference CompanionObjREF = Companion.GetRef()
	if CompanionObjREF.Is3dLoaded()
		if CompanionObjREF.GetDistance(Game.GetPlayer()) < CompanionDistance ;&& CompanionObjREF.HasDirectLOS(self)
			RegisterforMenuOpenCloseEvent("VATSMenu")
		endif
	endif

	; Increment the stat
	Game.IncrementStat("Mysterious Stranger Visits")
EndEvent


Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
	;Once VATS has been exited, if Companion is the current companion, fire off a comment from him, 
	;then unregister event
	if asMenuName == "VATSMenu" && !abOpening
		Actor CompanionREF = Companion.GetActorRef()
		CompanionREF.SayCustom(COMNickMysteriousStrangerTopic)
	endif
	UnregisterforMenuOpenCloseEvent("VATSMenu")
EndEvent