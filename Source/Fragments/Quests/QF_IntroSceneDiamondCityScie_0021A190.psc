;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_IntroSceneDiamondCityScie_0021A190 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;don't start the scene if Professor Scara is gone for BoS301
If (BoS301.GetStageDone(10) == 0) && (PlayerInstitute_Destroyed.GetValueInt() == 0)
  IntroSceneDiamondCityScienceCenterScene.Start()
Else
  SetStage(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
If DialogueDiamondCity.GetStageDone(198) == 0
  DuffGreetScene.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property IntroSceneDiamondCityScienceCenterScene Auto Const

Quest Property BoS301 Auto Const

ReferenceAlias Property Alias_DoctorDuff Auto Const

Scene Property DuffGreetScene Auto Const

Quest Property DialogueDiamondCity Auto Const

GlobalVariable Property PlayerInstitute_Destroyed Auto Const
