;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04NWJunkyard_0201AE4F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Alias_PowerDistributorActivator.GetReference().Disable()
Game.GetPlayer().AddItem(Alias_PowerDistributor.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_PowerDistributor Auto Const Mandatory

ReferenceAlias Property Alias_PowerDistributorActivator Auto Const Mandatory
