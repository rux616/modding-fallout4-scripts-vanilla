;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Min02_0003A457 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Min01.SetStage(0)
MQ102.SetStage(61)
MQ102.SetStage(90)
MQ102.SetStage(130)
MQ102.SetStage(140)
MQ102.SetStage(150)
MQ102.SetStage(200)
Min01.SetStage(50)
Min01.SetStage(100)
Min01.SetStage(200)
Min01.SetStage(250)
Min01.SetStage(2000)
Min01.SetStage(2100)
DialogueConcordArea.SetStage(200)
Alias_PrestonGarvey.GetReference().Moveto(game.getPlayer())
Alias_PrestonGarvey.GetActorRef().EvaluatePackage()
utility.wait(1.0)
setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE min02script
Quest __temp = self as Quest
min02script kmyQuest = __temp as min02script
;END AUTOCAST
;BEGIN CODE
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; set active
SetActive()

SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)
Alias_PrestonGarvey.GetActorRef().DisallowCompanion(SuppressDismissMessage = true) 

alias_Minuteman01.TryToEnable()
alias_Minuteman02.TryToEnable()
alias_Minuteman03.TryToEnable()

alias_Minuteman01.getRef().Moveto(alias_MeetingFurniture01.GetRef())
alias_Minuteman02.getRef().Moveto(alias_MeetingFurniture02.GetRef())
alias_Minuteman03.getRef().Moveto(alias_MeetingFurniture03.GetRef())

;Enable our supplies
Min02AttackSupplies.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN CODE
actor preston = Alias_PrestonGarvey.GetActorRef()
if preston.Is3DLoaded() == false
	preston.Moveto(alias_MeetingMarker.GetRef())
endif
preston.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
actor preston = Alias_PrestonGarvey.GetActorRef()
if preston.Is3DLoaded() == false
	preston.Moveto(alias_MeetingMarker.GetRef())
endif
preston.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_01
Function Fragment_Stage_0070_Item_01()
;BEGIN CODE
SetObjectiveCompleted(10)
SetStage(500)
alias_PrestonGarvey.getActorRef().EvaluatePackage()
alias_Minuteman01.getActorRef().EvaluatePackage()
alias_Minuteman02.getActorRef().EvaluatePackage()
alias_Minuteman03.getActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveDisplayed(50)

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_Min02AttackCastleAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
alias_PrestonGarvey.getActorRef().EvaluatePackage()
alias_Minuteman01.getActorRef().EvaluatePackage()
alias_Minuteman02.getActorRef().EvaluatePackage()
alias_Minuteman03.getActorRef().EvaluatePackage()

if Min02BattlePlan.GetValue() == 1
	Min02BattleSetupAllOut.Start()
elseif Min02BattlePlan.GetValue() == 2
	Min02BattleSetupPincer.Start()
elseif Min02BattlePlan.GetValue() == 3
	Min02BattleSetupLine.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
if isObjectiveDisplayed(50)
	SetObjectiveDisplayed(50, false)
endif
if !isObjectiveDisplayed(100)
	SetObjectiveDisplayed(100)
endif
alias_PrestonGarvey.getActorRef().EvaluatePackage()
alias_Minuteman01.getActorRef().EvaluatePackage()
alias_Minuteman02.getActorRef().EvaluatePackage()
alias_Minuteman03.getActorRef().EvaluatePackage()

Min02_MirelurkFaction.SetEnemy(Min02_MinutemenFaction, false, true)

; 87169 - advance if courtyard already cleared
;Replaced with the 81288  failsafe below
;if DN133.GetStageDone(100)
;	SetStage(250)
;endif


; 87169: failsafe - make sure all previous scenes are stopped
; 81288 - moved from stage 250 to stage 200
Min02PrestonCastlePrebattle1.Stop()
Min02PrestonCastlePrebattle2.Stop()
Min02BattleSetupAllOut.Stop()
Min02BattleSetupLine.Stop()
Min02BattleSetupPincer.Stop()


; 81288 this alters the fix for 87169
if DN133.GetStageDone(500)                  ;Queen Dead 
       ;Start the Queen killed scene 
       SetStage(400) 
elseif DN133.GetStageDone(401)           ;Queen Released 
       ;Move to Kill the queen stage 
       SetStage(305) 
       alias_MirelurkQueen.GetActorRef().StartCombat(alias_PrestonGarvey.getActorRef()) 
elseif DN133.GetStageDone(100)           ;Courtyard Cleared
       ;Move to Clear out eggs 
       SetStage(250) 
elseif !isObjectiveDisplayed(100) 
       SetObjectiveDisplayed(100) 
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Min02BattleSetupLine.Stop() ; failsafe
SetStage(200) ; failsafe
Min02PrestonCourtyard.Start()

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_Min02CourtyardClearedAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(101)

Alias_EggAttackers.AddRef(Alias_PrestonGarvey.GetReference())
Alias_EggAttackers.AddRef(Alias_Minuteman01.GetReference())
Alias_EggAttackers.AddRef(Alias_Minuteman02.GetReference())
Alias_EggAttackers.AddRef(Alias_Minuteman03.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
Min02MirelurkQueenPreReveal.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Alias_EggAttackers.RemoveRef(Alias_PrestonGarvey.GetReference())
Alias_EggAttackers.RemoveRef(Alias_Minuteman03.GetReference())
Min02MirelurkQueenPreReveal.Stop()
Min02MirelurkQueenReveal.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0301_Item_00
Function Fragment_Stage_0301_Item_00()
;BEGIN CODE
DN133.SetStage(401) ;Release Queen
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(105)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(105)
Setstage(500)

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_Min02MirelurkQueenDeadAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE min02script
Quest __temp = self as Quest
min02script kmyQuest = __temp as min02script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(100)

; start receiving workshop build events
kmyQuest.RegisterForWorkshopEvents()
; make sure workshop is player owned
(Alias_Workshop.GetRef() as WorkshopScript).SetOwnedByPlayer(true)
; failsafe
Min02MirelurkQueenReveal.Stop()
if GetStageDone(45)
	; skip to repair scene
	Min02Repair.Start()
	SetStage(520)
else
	; victory scene (not if we bypassed siege)
	; meet troops in courtyard
	SetObjectiveDisplayed(110)
	Min02BattleVictory.Start()
endif
; tell DN133 to clean up later
DN133.SetStage(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0501_Item_00
Function Fragment_Stage_0501_Item_00()
;BEGIN CODE
SetObjectiveCompleted(101)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
;SetObjectiveDisplayed(150)
; NEW: removing "repair" objective
; if already repaired, advance:
;if (Alias_RadioTransmitter.GetRef() as CastleRadioTransmitterScript).bRepaired
  setStage(570)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN AUTOCAST TYPE min02script
Quest __temp = self as Quest
min02script kmyQuest = __temp as min02script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveDisplayed(160)

; first, get workshop
WorkshopScript workshopRef = Alias_Workshop.GetRef() as WorkshopScript

; make sure workshop is player owned
WorkshopRef.SetOwnedByPlayer(true)

; add NPCs to workshop
debug.trace(self + " MIN02: adding Minutemen to workshop:")
WorkshopParent.AddPermanentActorToWorkshopPUBLIC(Alias_Minuteman01.GetActorRef(), workshopRef.GetWorkshopID())
WorkshopParent.AddPermanentActorToWorkshopPUBLIC(Alias_Minuteman02.GetActorRef(), workshopRef.GetWorkshopID())
WorkshopParent.AddPermanentActorToWorkshopPUBLIC(Alias_Minuteman03.GetActorRef(), workshopRef.GetWorkshopID(), false) ; radio announcer - don't auto assign

; assign radio operator
WorkshopNPCScript npc = Alias_Minuteman03.GetRef() as WorkshopNPCScript
debug.trace(self + " radioman=" + npc)
WorkshopObjectScript transmitter =  (Alias_RadioTransmitter.GetRef() as WorkshopObjectScript)
debug.trace(self + " transmitter =" + transmitter )
debug.trace(self + " MIN02: assigning radioman " + npc + " to transmitter " + transmitter)
WorkshopParent.AssignActorToObjectPUBLIC(npc, transmitter)

; if already repaired, advance
kmyQuest.CheckRadioTransmitterStatus()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE min02script
Quest __temp = self as Quest
min02script kmyQuest = __temp as min02script
;END AUTOCAST
;BEGIN CODE
; kill scene if still running
Min02Repair.Stop()

SetObjectiveCompleted(150)
SetObjectiveCompleted(160)
; reward XP
Game.RewardPlayerXP(XPFactionSmall.GetValue() as int)
SetObjectiveDisplayed(200)
; update Minutemen status
MinutemenCentralQuest.SetProgress(4)
; stop receiving workshop build events
kmyQuest.RegisterForWorkshopEvents(false)

;Turn on the speakers in the castle, player can turn them off if they want after
(DN133CastleSpeakerControllerRef as DN133CastleSpeakerControllerScript).SetOn()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
; update recruitment quests
MinutemenCentralQuest.UpdateActiveRecruitmentQuests()

Game.AddAchievement(14)

; start Min03 (silently)
Min03.Start()

;Update Global for Radio News
RadioDCMin02Ready.SetValue((GameDaysPassed.GetValue() + 1))

; 1.3: 86080: in case quest has stopped and Preston's alias is cleared when this stage runs, grab him from MinutemenCentralQuest
actor preston = Alias_PrestonGarvey.GetActorRef()
if preston == NONE
	preston = MinCentral_Preston.GetActorRef()
endif

preston.AllowCompanion(false, false)
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

ReferenceAlias Property Alias_RadioTransmitter Auto Const

MinutemenCentralScript Property MinutemenCentralQuest Auto Const

Quest Property Min01 Auto Const

ReferenceAlias Property Alias_PrestonGarvey Auto Const

ReferenceAlias Property Alias_MeetingMarker Auto Const

ReferenceAlias Property Alias_Workshop Auto Const

Quest Property Min03 Auto Const

ReferenceAlias Property Alias_Minuteman01 Auto Const

ReferenceAlias Property Alias_Minuteman02 Auto Const

ReferenceAlias Property Alias_Minuteman03 Auto Const

Scene Property Min02MirelurkQueenReveal Auto Const

WorkshopParentScript Property WorkshopParent Auto Const

Scene Property Min02BattleVictory Auto Const

ReferenceAlias Property Alias_MeetingFurniture01 Auto Const

ReferenceAlias Property Alias_MeetingFurniture02 Auto Const

ReferenceAlias Property Alias_MeetingFurniture03 Auto Const

Scene Property Min02RepairComplete Auto Const

Quest Property MQ102 Auto Const

GlobalVariable Property XPFactionSmall Auto Const

GlobalVariable Property XPFactionFinal Auto Const

Quest Property DialogueConcordArea Auto Const

Scene Property Min02Repair Auto Const

Scene Property Min02PrestonCourtyard Auto Const

Quest Property DN133 Auto Const

GlobalVariable Property Min02BattlePlan Auto Const

Scene Property Min02BattleSetupAllOut Auto Const

Scene Property Min02BattleSetupLine Auto Const

Scene Property Min02BattleSetupPincer Auto Const

Keyword Property AO_Type_Min02Eggs Auto Const

RefCollectionAlias Property Alias_EggAttackers Auto Const

Scene Property Min02MirelurkQueenPreReveal Auto Const


ObjectReference Property DN133CastleSpeakerControllerRef Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCMin02Ready Auto Const

LocationRefType Property Boss Auto Const

Location Property TheCastleLocation Auto Const

ObjectReference Property Min02AttackSupplies Auto Const

Faction Property Min02_MinutemenFaction Auto Const Mandatory

Faction Property Min02_MirelurkFaction Auto Const Mandatory

ActorValue Property COMQC_Min02AttackCastleAV Auto Const

ActorValue Property COMQC_Min02CourtyardClearedAV Auto Const

ActorValue Property COMQC_Min02MirelurkQueenDeadAV Auto Const

Scene Property Min02PrestonCastlePrebattle1 Auto Const Mandatory

Scene Property Min02PrestonCastlePrebattle2 Auto Const Mandatory

ReferenceAlias Property MinCentral_Preston Auto Const
{alias to Preston from MinutemenCentralQuest - failsafe}

ReferenceAlias Property Alias_MirelurkQueen Auto Const Mandatory
