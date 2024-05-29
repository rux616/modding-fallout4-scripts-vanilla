;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueRailroadGenericNP_00061B72 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Set up the Railroad's version of the Vertibird fast travel
pRRSellsVertibirdGrenade.SetValue(0)   ; Used for Tinker's store - chance none 0
pBoSFastTravelCanUse.SetValue(1)      ; Fast travel available
pBoSFastTravelPilot.SetValue(2)            ; 2 = Railroad

; Give the player some grenades
Game.GetPlayer().AddItem(pBoSVertibirdGrenade, 3)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pRRSellsVertibirdGrenade Auto Const

GlobalVariable Property pBoSFastTravelCanUse Auto Const

GlobalVariable Property pBoSFastTravelPilot Auto Const

Weapon Property pBoSVertibirdGrenade Auto Const
