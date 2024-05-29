;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03KyeDialogue_010140FC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
DLC03KyeDialogue_000_Intro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;if Nick is available, pop and objective to bring him to Kye
If (MS07NickHateHandler.GetStageDone(10)==0) && (MQ105.GetStageDone(1000)==1)
  SetObjectiveDisplayed(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Alias_DoorActivator.GetRef().Activate(Game.GetPlayer())
Alias_Intercom.GetRef().BlockActivation(True, True)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_DoorActivator Auto Const Mandatory

Scene Property DLC03KyeDialogue_000_Intro Auto Const Mandatory

Faction Property HasBeenCompanionFaction Auto Const Mandatory

Quest Property MS07NickHateHandler Auto Const Mandatory

Quest Property MQ105 Auto Const Mandatory

ReferenceAlias Property Alias_Intercom Auto Const Mandatory
