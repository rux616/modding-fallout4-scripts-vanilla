;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03CoA_DialogueNucleusE_02004CCE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
DLC03CoA_DialogueNucleusEntrance_Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_CoAMale.GetActorRef().Kill()

;TO ADD - Failsafe timer to ensure his death
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;TEMP - Give player access to the space
TEMP_DLC03TempEntryMessage.Show()
Game.GetPlayer().AddtoFaction(DLC03ChildrenofAtomFaction)

;TEMP - End the quest
SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CoAMale Auto Const Mandatory

Scene Property DLC03CoA_DialogueNucleusEntrance_Scene Auto Const Mandatory

Faction Property DLC03ChildrenofAtomFaction Auto Const

Message Property TEMP_DLC03TempEntryMessage Auto Const
