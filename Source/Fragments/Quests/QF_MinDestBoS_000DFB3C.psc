;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinDestBoS_000DFB3C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Min301.SetStage(1)
Min301.SetStage(100) ; complete
Min301.Stop()
MinutemenCentralQuest.SetProgress(6)
MQ302.SetStage(1000) ; complete
MQ00.MQFactionKickoutPlayer(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MinDestBOSScript
Quest __temp = self as Quest
MinDestBOSScript kmyQuest = __temp as MinDestBOSScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE MinDestBOSScript
Quest __temp = self as Quest
MinDestBOSScript kmyQuest = __temp as MinDestBOSScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(100)
;SetObjectiveDisplayed(200)
kmyQuest.UpdateArtilleryObjective()
; start receiving workshop build events
kmyQuest.RegisterForWorkshopEvents()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE MinDestBOSScript
Quest __temp = self as Quest
MinDestBOSScript kmyQuest = __temp as MinDestBOSScript
;END AUTOCAST
;BEGIN CODE
; get Prydwen ready for crash sequence
kmyQuest.InitializeAttackSequence()

; failsafe:
SetObjectiveCompleted(200)
SetObjectiveCompleted(300)
; destroy Prydwen
SetObjectiveDisplayed(400)
; stop receiving workshop build events
kmyQuest.RegisterForWorkshopEvents(false)
MinutemenCentralQuest.StopRadioScenes()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN AUTOCAST TYPE MinDestBOSScript
Quest __temp = self as Quest
MinDestBOSScript kmyQuest = __temp as MinDestBOSScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AimArtillery()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN AUTOCAST TYPE MinDestBOSScript
Quest __temp = self as Quest
MinDestBOSScript kmyQuest = __temp as MinDestBOSScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartDestructionCountdown(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE MinDestBOSScript
Quest __temp = self as Quest
MinDestBOSScript kmyQuest = __temp as MinDestBOSScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartFiringArtillery()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE MinDestBOSScript
Quest __temp = self as Quest
MinDestBOSScript kmyQuest = __temp as MinDestBOSScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.DestroyBOS()
; set timer for post-quest hellos to expire
MinDestBOSPostQuestTimer.SetValue(Utility.GetCurrentGameTime() + 14.0); hellos last 2 weeks

; flag companion as witness
actor companion = Alias_Companion.GetActorRef()
if companion
	companion.SetValue(DestroyBOSCompanion, 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; start BOS attack
MinCastleAttacker.SetValue(7) ; BOS
MinDefendCastle.SetStage(16)

; flag Minutemen as the faction that destroyed the BOS
PlayerBOS_DestroyedFaction.SetValue(2)

; set global
PlayerBOS_Destroyed.SetValueInt(1)

; talk to Preston
SetObjectiveCompleted(400)

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_PrydwenDestroyedByMMAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
; restart main loop
MinutemenCentralQuest.UpdateRadioStationStatus()

;Update Global for Radio News
RadioDCMinDestBoSReady.SetValue((GameDaysPassed.GetValue() + 1))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN AUTOCAST TYPE MinDestBOSScript
Quest __temp = self as Quest
MinDestBOSScript kmyQuest = __temp as MinDestBOSScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(450)
kmyQuest.StartDestructionCountdown(false)
MUSSpecialDefendTheCastle.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0580_Item_00
Function Fragment_Stage_0580_Item_00()
;BEGIN CODE
; talk to Preston
SetObjectiveCompleted(450)
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE MinDestBOSScript
Quest __temp = self as Quest
MinDestBOSScript kmyQuest = __temp as MinDestBOSScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
; trigger timer for getting vertibird
kmyQuest.StartTimerGameTime(24.0, kmyQuest.triggerVertibirdAccessTimerID)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
BoSFastTravelCanUse.SetValue(1)
BoSFastTravelPilot.SetValue(1) ; minutemen pilot
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; give flares
Game.GetPlayer().AddItem(BoSVertibirdGrenade, 6)
; enable vendor container in armory
Alias_VertibirdSmokeGrenadeContainer.TryToEnable()
setStage(1000) ; ?
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property Min301 Auto Const

MinutemenCentralScript Property MinutemenCentralQuest Auto Const

MQ00Script Property MQ00 Auto Const

Quest Property MQ302 Auto Const

Quest Property MQ301 Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCMinDestBoSReady Auto Const

GlobalVariable Property XPFactionFinal Auto Const

RefCollectionAlias Property Alias_CastleNPCs Auto Const

GlobalVariable Property MinDestBOSPostQuestTimer Auto Const

GlobalVariable Property BoSFastTravelCanUse Auto Const

GlobalVariable Property BoSFastTravelPilot Auto Const

Weapon Property BoSVertibirdGrenade Auto Const

Quest Property MinDefendCastle Auto Const

GlobalVariable Property MinCastleAttacker Auto Const

ReferenceAlias Property Alias_VertibirdSmokeGrenadeContainer Auto Const

MusicType Property MUSStinger04x Auto Const

MusicType Property MUSSpecialDefendTheCastle Auto Const

GlobalVariable Property PlayerBOS_DestroyedFaction Auto Const Mandatory

ActorValue Property DestroyBOSCompanion Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

ActorValue Property COMQC_PrydwenDestroyedByMMAV Auto Const

GlobalVariable Property PlayerBOS_Destroyed Auto Const Mandatory
