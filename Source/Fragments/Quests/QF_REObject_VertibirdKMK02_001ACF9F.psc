;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REObject_VertibirdKMK02_001ACF9F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
; vertibird can't fly
actor vertibird = Alias_Vertibird.GetActorRef()
vertibird.SetAllowFlying(false)
; turn on engines
vertibird.PlayIdle(VertibirdPropellersOn)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
; enable pilot to snap into vertibird
Alias_Pilot.TryToEnable()
; start main scene
REObject_VertibirdKMK02Scene.Start()
actor vertibird = Alias_Vertibird.GetActorRef()
; damage engine
vertibird.DamageValue(AvailableCondition1, 50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
; damage engines
alias_vertibird.getactorref().DamageValue(AvailableCondition1, 20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; vertibird can fly
Alias_Vertibird.GetActorRef().SetAllowFlying(true)
; damage engine
alias_vertibird.getactorref().DamageValue(AvailableCondition1, 100)
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
; set vertibird flag to return to airport
Alias_Vertibird.TryToSetValue(REVertibirdLandAirport, 1)
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

ActorValue Property AvailableCondition1 Auto Const

ReferenceAlias Property Alias_Gunner01 Auto Const

ActorValue Property Health Auto Const

Scene Property REObject_VertibirdKMK02Scene Auto Const

Idle Property VertibirdPropellersOn Auto Const Mandatory
