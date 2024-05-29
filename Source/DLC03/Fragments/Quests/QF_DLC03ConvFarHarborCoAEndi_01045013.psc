;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03ConvFarHarborCoAEndi_01045013 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03ConvFarHarborCoAEndingScript
Quest __temp = self as Quest
DLC03:DLC03ConvFarHarborCoAEndingScript kmyQuest = __temp as DLC03:DLC03ConvFarHarborCoAEndingScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.OpeningScene()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pDLC03ConvFarHarborCoAEnding_DeadAvery Auto Const Mandatory
