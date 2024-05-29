;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueBunkerHillGeneric_0005F76C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0117_Item_00
Function Fragment_Stage_0117_Item_00()
;BEGIN CODE
; Misc objective given for this
if ( pMS02.GetStage() > 199 )
  pMS02MiscObjective.SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pMS02MiscObjective Auto Const

Quest Property pMS02 Auto Const
