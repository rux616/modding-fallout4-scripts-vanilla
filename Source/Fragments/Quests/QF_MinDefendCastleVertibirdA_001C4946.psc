;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinDefendCastleVertibirdA_001C4946 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE MinDefendCastleVertibirdQuestScript
Quest __temp = self as Quest
MinDefendCastleVertibirdQuestScript kmyQuest = __temp as MinDefendCastleVertibirdQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.GetMySquad(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE MinDefendCastleVertibirdQuestScript
Quest __temp = self as Quest
MinDefendCastleVertibirdQuestScript kmyQuest = __temp as MinDefendCastleVertibirdQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.GetMySquad(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN AUTOCAST TYPE MinDefendCastleVertibirdQuestScript
Quest __temp = self as Quest
MinDefendCastleVertibirdQuestScript kmyQuest = __temp as MinDefendCastleVertibirdQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.GetMySquad(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN AUTOCAST TYPE MinDefendCastleVertibirdQuestScript
Quest __temp = self as Quest
MinDefendCastleVertibirdQuestScript kmyQuest = __temp as MinDefendCastleVertibirdQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.GetMySquad(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN AUTOCAST TYPE MinDefendCastleVertibirdQuestScript
Quest __temp = self as Quest
MinDefendCastleVertibirdQuestScript kmyQuest = __temp as MinDefendCastleVertibirdQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.GetMySquad(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE MinDefendCastleVertibirdQuestScript
Quest __temp = self as Quest
MinDefendCastleVertibirdQuestScript kmyQuest = __temp as MinDefendCastleVertibirdQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.GetMySquad(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN AUTOCAST TYPE MinDefendCastleVertibirdQuestScript
Quest __temp = self as Quest
MinDefendCastleVertibirdQuestScript kmyQuest = __temp as MinDefendCastleVertibirdQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.GetMySquad(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN AUTOCAST TYPE MinDefendCastleVertibirdQuestScript
Quest __temp = self as Quest
MinDefendCastleVertibirdQuestScript kmyQuest = __temp as MinDefendCastleVertibirdQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.GetMySquad(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN AUTOCAST TYPE MinDefendCastleVertibirdQuestScript
Quest __temp = self as Quest
MinDefendCastleVertibirdQuestScript kmyQuest = __temp as MinDefendCastleVertibirdQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.GetMySquad(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN AUTOCAST TYPE MinDefendCastleVertibirdQuestScript
Quest __temp = self as Quest
MinDefendCastleVertibirdQuestScript kmyQuest = __temp as MinDefendCastleVertibirdQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.GetMySquad(9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;This quest should be started from stages 0 - 9, this then kicks of whatever is next
;This get started from the script
debug.trace(self + " phase 10: starting main scene")
MinDefendCastleVertibirdAirDropScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
; enable passengers
debug.trace(self + " phase 20: enabling passengers")
Alias_Pilot.TryToEnable()
Alias_Gunner.TryToEnable()
Alias_Passenger1.TryToEnable()
Alias_Passenger2.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
debug.trace(self + " phase 30: advance MinDestBOS scene")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;We are shutting down, do whatever clean up needed
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MinDefendCastleVertibirdAirDropScene Auto Const

ReferenceAlias Property Alias_Pilot Auto Const

ReferenceAlias Property Alias_Vertibird Auto Const

ReferenceAlias Property Alias_Gunner Auto Const

ReferenceAlias Property Alias_Passenger1 Auto Const

ReferenceAlias Property Alias_Passenger2 Auto Const

ReferenceAlias Property Alias_Pilot01 Auto Const
