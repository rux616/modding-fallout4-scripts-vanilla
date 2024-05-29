;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS13MarowskiRevenge_00084E40 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE MS13MarowskiRevengeScript
Quest __temp = self as Quest
MS13MarowskiRevengeScript kmyQuest = __temp as MS13MarowskiRevengeScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MS13MarowskiRevengeScript
Quest __temp = self as Quest
MS13MarowskiRevengeScript kmyQuest = __temp as MS13MarowskiRevengeScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartupComplete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE MS13MarowskiRevengeScript
Quest __temp = self as Quest
MS13MarowskiRevengeScript kmyQuest = __temp as MS13MarowskiRevengeScript
;END AUTOCAST
;BEGIN CODE
setObjectiveDisplayed(10)
kmyQuest.StartWaitingForPlayer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE MS13MarowskiRevengeScript
Quest __temp = self as Quest
MS13MarowskiRevengeScript kmyQuest = __temp as MS13MarowskiRevengeScript
;END AUTOCAST
;BEGIN CODE
; Marowski tired of waiting (or player attacks messengers)
kmyquest.SendThugs = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN AUTOCAST TYPE MS13MarowskiRevengeScript
Quest __temp = self as Quest
MS13MarowskiRevengeScript kmyQuest = __temp as MS13MarowskiRevengeScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MarowskiState = 2
setStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN AUTOCAST TYPE MS13MarowskiRevengeScript
Quest __temp = self as Quest
MS13MarowskiRevengeScript kmyQuest = __temp as MS13MarowskiRevengeScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartWaitingForPayment()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN AUTOCAST TYPE MS13MarowskiRevengeScript
Quest __temp = self as Quest
MS13MarowskiRevengeScript kmyQuest = __temp as MS13MarowskiRevengeScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SendThugs = true
kmyQuest.SendMessage = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
setstage(320)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN AUTOCAST TYPE MS13MarowskiRevengeScript
Quest __temp = self as Quest
MS13MarowskiRevengeScript kmyQuest = __temp as MS13MarowskiRevengeScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartWaitingForPayment()
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN AUTOCAST TYPE MS13MarowskiRevengeScript
Quest __temp = self as Quest
MS13MarowskiRevengeScript kmyQuest = __temp as MS13MarowskiRevengeScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartWaitingForPayment()
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
MS13FindPhoto.SetStage(380)
setStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE MS13MarowskiRevengeScript
Quest __temp = self as Quest
MS13MarowskiRevengeScript kmyQuest = __temp as MS13MarowskiRevengeScript
;END AUTOCAST
;BEGIN CODE
; don't pay at all if you showed him the photo
if !GetStageDone(380)
	int payment = 2000
	if GetStageDone(370) && !GetStageDone(330)
		payment = 1000
	endif
	Game.GetPlayer().RemoveItem(Caps001, payment)
endif
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
; call off thugs
setStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE MS13MarowskiRevengeScript
Quest __temp = self as Quest
MS13MarowskiRevengeScript kmyQuest = __temp as MS13MarowskiRevengeScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SendThugs = false
kmyQuest.SendMessage = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE MS13MarowskiRevengeScript
Quest __temp = self as Quest
MS13MarowskiRevengeScript kmyQuest = __temp as MS13MarowskiRevengeScript
;END AUTOCAST
;BEGIN CODE
; clear variables
kmyQuest.SendThugs = false
kmyQuest.SendMessage = false
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property REChokepointMS13Marowski Auto Const

MiscObject Property Caps001 Auto Const

Quest Property MS13FindPhoto Auto Const
