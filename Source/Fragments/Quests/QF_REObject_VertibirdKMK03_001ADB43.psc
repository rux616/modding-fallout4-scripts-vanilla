;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REObject_VertibirdKMK03_001ADB43 Extends Quest Hidden Const

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
; damage engine
Alias_Vertibird.GetActorRef().DamageValue(AvailableCondition2, 20)
alias_pilot.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
; damage engine
Alias_Vertibird.GetActorRef().DamageValue(AvailableCondition2, 20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
; damage engine
Alias_Vertibird.GetActorRef().DamageValue(AvailableCondition2, 40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; vertibird can fly
actor vertibird = Alias_Vertibird.GetActorRef()
vertibird.SetAllowFlying(true)
; very aggressive like Gunners
vertibird.SetValue(Aggression, 2)
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
; Get the vertibird doing its thing
Alias_Vertibird.GetActorRef().PlayIdle(VertibirdUntrainedFlightIdleStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; damage engine
actor vertibird = Alias_Vertibird.GetActorRef()
;vertibird.DamageValue(AvailableCondition1, 20)
;vertibird.DamageValue(AvailableCondition1, 20)
;vertibird.DamageValue(AvailableCondition1, 20)
;vertibird.DamageValue(AvailableCondition1, 20)
vertibird.DamageValue(AvailableCondition1, 150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; damage vertibird
actor vertibird = Alias_Vertibird.GetActorRef()
vertibird.DamageValue(Health, 9999)
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

Idle Property VertibirdUntrainedFlightIdleStart Auto Const

ActorValue Property Aggression Auto Const

ActorValue Property AvailableCondition2 Auto Const

Idle Property VertibirdPropellersOn Auto Const Mandatory
