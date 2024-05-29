;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueMS11_0009BD11 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Start the cheering scene
pIronsidesCheerScene.Start()

; Give the player a cool hat
Game.GetPlayer().AddItem(pClothesHistoricNavyHat)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pIronsidesCheerScene Auto Const

Armor Property pClothesHistoricNavyHat Auto Const
