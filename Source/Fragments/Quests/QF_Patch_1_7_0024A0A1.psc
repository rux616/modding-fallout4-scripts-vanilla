;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_1_7_0024A0A1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Do patch fixes

; 83587: fix Sturges bad state from MQ206
;   Min01(100) = Concord NPCs added as workshop NPCs
;   MQ206(1200) = MQ206 done, Sturges assigned back to normal workshop status (supposed to be)
if MQ206.GetStageDone(1200) && Min01.GetStageDone(100)
	WorkshopNPCScript sturgesRef = Alias_Sturges.GetActorRef() as workshopNPCScript
	if sturgesRef && sturgesRef.IsDead() == false
		if sturgesRef.GetLinkedRef(workshopItemKeyword) == NONE
			debug.trace(self + " Sturges in bad state after MQ206:")
			; get workshopID if any:
			int workshopID = sturgesRef.GetWorkshopID()
			if workshopID <= 0  ; some bad saves end up with workshopID = 0 although that is not actually where he should be assigned
				; failsafe - assign to Sanctuary
				workshopID = (Alias_SanctuaryWorkshop.GetRef() as WorkshopScript).GetWorkshopID()
				debug.trace(self + "    assigning to Sanctuary")
			else
				debug.trace(self + "    assigning back to " + WorkshopParent.GetWorkshop(workshopID))
			endif
			WorkshopParent.AddPermanentActorToWorkshopPUBLIC(actorToAssign = sturgesRef, newWorkshopID = workshopID, bAutoAssign = false)
		endif
		; make sure Sturges commandable/movable
		sturgesRef .SetCommandable(true)
		sturgesRef .SetAllowMove(true)
	endif
endif

; etc.

; stop quest when done
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Sturges Auto Const Mandatory

Quest Property MQ206 Auto Const Mandatory

Quest Property Min01 Auto Const Mandatory

ReferenceAlias Property Alias_SanctuaryWorkshop Auto Const Mandatory

Keyword Property WorkshopItemKeyword Auto Const Mandatory

workshopparentscript Property WorkshopParent Auto Const Mandatory
