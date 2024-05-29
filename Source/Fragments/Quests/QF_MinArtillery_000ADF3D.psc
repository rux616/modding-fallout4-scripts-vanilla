;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinArtillery_000ADF3D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MinArtilleryScript
Quest __temp = self as Quest
MinArtilleryScript kmyQuest = __temp as MinArtilleryScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Initialize()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE MinArtilleryScript
Quest __temp = self as Quest
MinArtilleryScript kmyQuest = __temp as MinArtilleryScript
;END AUTOCAST
;BEGIN CODE
; radio message
kmyQuest.MinArtilleryRadioChatter.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE MinArtilleryScript
Quest __temp = self as Quest
MinArtilleryScript kmyQuest = __temp as MinArtilleryScript
;END AUTOCAST
;BEGIN CODE
; start timer for artillery strikes
kmyQuest.BeginArtilleryStrikes()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Min03.SetStage(920)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE MinArtilleryScript
Quest __temp = self as Quest
MinArtilleryScript kmyQuest = __temp as MinArtilleryScript
;END AUTOCAST
;BEGIN CODE
; make sure to restart normal radio
kmyQuest.MinutemenCentralQuest.UpdateRadioStationStatus()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_01
Function Fragment_Stage_1000_Item_01()
;BEGIN AUTOCAST TYPE MinArtilleryScript
Quest __temp = self as Quest
MinArtilleryScript kmyQuest = __temp as MinArtilleryScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stopping")
; make sure to restart normal radio
kmyQuest.MinutemenCentralQuest.UpdateRadioStationStatus()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property Min03 Auto Const
