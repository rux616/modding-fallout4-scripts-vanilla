;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueRailroadLiamFuner_00153307 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Set up some good debug stuff
pRR101.SetStage(1100)
pRR102.SetStage(800)
pRR102.SetStage(1000)
pMQWonRR.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; No chit chat in Railroad
pRRDisableHQConversations.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Enable the funeral marker
pRRLiamFuneralEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
; Player gets Liam's suicide note
Game.GetPlayer().AddItem(pRRPatriotSuicideNote)

; Dez moves to give Patriot a send off
Utility.Wait(0.1)
pDialogueRailroadLiamFuneral_DezFinalWords.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; People can talk again
pRRDisableHQConversations.SetValue(0)

; Disable the funeral marker
pRRLiamFuneralEnableMarker.Disable()

; Add in Patriot's sarcophagus
pPatriotGraveMarker.Enable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pRRLiamFuneralState Auto Const

Book Property pRRPatriotSuicideNote Auto Const

ObjectReference Property pRRLiamFuneralEnableMarker Auto Const

ObjectReference Property pPatriotGraveMarker Auto Const

Quest Property pRR101 Auto Const

Quest Property pRR102 Auto Const

GlobalVariable Property pMQWonRR Auto Const

Scene Property pDialogueRailroadLiamFuneral_DezFinalWords Auto Const

GlobalVariable Property pRRDisableHQConversations Auto Const Mandatory
