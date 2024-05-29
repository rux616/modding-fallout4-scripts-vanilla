;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_IntroSceneDiamondCityDugo_00221028 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
IntroSceneDiamondCityDugoutInnScene.Start()
DialogueDiamondCity.SetStage(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
DialogueDiamondCity.SetStage(200)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DialogueDiamondCity Auto Const Mandatory

Scene Property IntroSceneDiamondCityDugoutInnScene Auto Const Mandatory
