;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_1_6_0024A010 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE Patch_1_6_Script
Quest __temp = self as Quest
Patch_1_6_Script kmyQuest = __temp as Patch_1_6_Script
;END AUTOCAST
;BEGIN CODE
; 82928: make Marcy and Jun unessential if Min01 is done
if Min01.GetStageDone(1500)
	kmyQuest.JunMarcyUnessential()
endif

; 98587: make sure build areas are enabled
JamaicaPlainBuildableArea02.Enable()
StarlightDriveInBuildableArea01.Enable()

; ADD MORE FIXES HERE:



; THIS IS THE END:
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property Min01 Auto Const Mandatory

ReferenceAlias Property Alias_MarcyLong Auto Const Mandatory

ReferenceAlias Property Alias_JunLong Auto Const Mandatory

ObjectReference Property JamaicaPlainBuildableArea02 Auto Const Mandatory

ObjectReference Property StarlightDriveInBuildableArea01 Auto Const Mandatory
