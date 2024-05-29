;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REScene_VertibirdKMK02_00109482 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
; enable passengers
Alias_Pilot.TryToEnable()
Alias_Gunner.TryToEnable()
Alias_PowerArmorPassenger1.TryToEnable()
Alias_PowerArmorPassenger2.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
; now can shut down when everything unloads
kmyQuest.StopQuestWhenAliasesUnloaded = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; tell vertibird to return to airport
Alias_Vertibird.TryToSetValue(REVertibirdLandAirport, 1)
; failsafe
setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
debug.trace(self + " STOPPING")
setStage(100)
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Pilot Auto Const

ReferenceAlias Property Alias_Gunner Auto Const

ReferenceAlias Property Alias_PowerArmorPassenger1 Auto Const

ReferenceAlias Property Alias_PowerArmorPassenger2 Auto Const

ReferenceAlias Property Alias_TRIGGER Auto Const

ActorValue Property REVertibirdLandAirport Auto Const

ReferenceAlias Property Alias_Vertibird Auto Const
