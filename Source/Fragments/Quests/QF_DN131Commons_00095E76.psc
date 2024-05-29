;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN131Commons_00095E76 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Remove all actors from the ref collection.
Alias_RetreatRefCollection.RemoveAll()

;Shut down the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_RetreatRefCollection Auto Const Mandatory
