;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_1_4_00249E88 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;89791 - make sure Kellogg's desk is no longer block activated
If MQ105.GetStageDone(320)
  Alias_KelloggDesk.GetRef().BlockActivation(False, False)
EndIf

; 90051 - fix damaged object workshop tutorial
WorkshopTutorial.FixWorkshopTutorial_1_4()

; ADD MORE FIXES HERE:



; THIS IS THE END:
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ105 Auto Const Mandatory

ReferenceAlias Property Alias_KelloggDesk Auto Const Mandatory

WorkshopTutorialScript Property WorkshopTutorial Auto Const Mandatory
