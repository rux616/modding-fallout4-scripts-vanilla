;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueDiamondCityPiperN_001A00A6 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
(pCOMPiper as COMPiperScript).iPlayerAdmirationChoice = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
(pCOMPiper as COMPiperScript).iPlayerAdmirationChoice = 2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
if (pCOMPiper as COMPiperScript).iPlayerAdmirationChoice == 1 || (pCOMPiper as COMPiperScript).iPlayerAdmirationChoice == 3
  pGoodScene.Start()
elseif (pCOMPiper as COMPiperScript).iPlayerAdmirationChoice == 2
  pBadScene.Start()
endif
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

Quest Property pCOMPiper Auto Const

Scene Property pGoodScene Auto Const

Scene Property pBadScene Auto Const
