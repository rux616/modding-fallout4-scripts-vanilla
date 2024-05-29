;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFDiamondCityEndGame_0017D863 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Turn on dialogue
;FFDiamondCityEndGameDialogue.Start()

;turn off a couple of Market NPCs
EndGameResidentTurnOffMarker.Disable()

;turn on a couple of faction NPCs and statics
If MQWonInst.GetValueInt() == 1
  EndGameSynthEnableMarker.Enable()
  DCFlag_Inst.Enable()
ElseIf MQWonBoS.GetValueInt() == 1
  EndGameBoSEnableMarker.Enable()
  DCFlag_BOS.Enable()
ElseIf MQWonMin.GetValueInt() == 1
  EndGameMinutemenEnableMarker.Enable()
  DCFlag_Minutemen.Enable()
ElseIf MQWonRR.GetValueInt() == 1
  DCFlag_Rail.Enable()
EndIf

;turn on newspapers
If MQWonInst.GetValueInt() == 1
  PublickArticle01EnableMarker.Disable()
  PublickArticle02EnableMarker.Disable()
  PublickArticle03EnableMarker.Enable()
Else
  PublickArticle01EnableMarker.Disable()
  PublickArticle02EnableMarker.Disable()
  PublickArticle04EnableMarker.Enable()
EndIf

;shutdown
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property EndGameResidentTurnOffMarker Auto Const

GlobalVariable Property MQWonInst Auto Const

ObjectReference Property EndGameSynthEnableMarker Auto Const

Quest Property FFDiamondCityEndGameDialogue Auto Const

GlobalVariable Property MQWonBoS Auto Const

ObjectReference Property EndGameBoSEnableMarker Auto Const

ObjectReference Property EndGameMinutemenEnableMarker Auto Const

GlobalVariable Property MQWonMin Auto Const

ObjectReference Property DCFlag_BOS Auto Const

ObjectReference Property DCFlag_Inst Auto Const

ObjectReference Property DCFlag_Rail Auto Const

GlobalVariable Property MQWonRR Auto Const

ObjectReference Property DCFlag_Minutemen Auto Const

ObjectReference Property PublickArticle01EnableMarker Auto Const Mandatory

ObjectReference Property PublickArticle02EnableMarker Auto Const Mandatory

ObjectReference Property PublickArticle03EnableMarker Auto Const Mandatory

ObjectReference Property PublickArticle04EnableMarker Auto Const Mandatory
