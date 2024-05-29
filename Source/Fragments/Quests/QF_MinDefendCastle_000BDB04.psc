;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinDefendCastle_000BDB04 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE mindefendcastlescript
Quest __temp = self as Quest
mindefendcastlescript kmyQuest = __temp as mindefendcastlescript
;END AUTOCAST
;BEGIN CODE
;Do all the quickstart stuff
Min03.SetStage(0)
Min03.SetStage(600)
Min03.SetStage(920)
Min03.SetStage(1000)
Alias_ArmoryDoor.getReference().setOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE mindefendcastlescript
Quest __temp = self as Quest
mindefendcastlescript kmyQuest = __temp as mindefendcastlescript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Startup()
alias_Attackers.LinkCollectionTo(alias_AttackMarkers01, LinkCustom03, true)
alias_Attackers.LinkCollectionTo(alias_AttackMarkers02, LinkCustom04, true)

Debug.Trace(Self + ": Reseting HoldPosition Attacker Numbers")
MinDefendCastleHoldPosN.ResetAttackerNumber()
MinDefendCastleHoldPosS.ResetAttackerNumber()

MinDefendCastleExternalEncParent.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN AUTOCAST TYPE mindefendcastleattackscript
Quest __temp = self as Quest
mindefendcastleattackscript kmyQuest = __temp as mindefendcastleattackscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetCastleAttacker()
kmyQuest.SetUpInitialReinforcements()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN AUTOCAST TYPE mindefendcastlescript
Quest __temp = self as Quest
mindefendcastlescript kmyQuest = __temp as mindefendcastlescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PrestonIntroOn = true
; turn on Institute radio broadcast
RadioDCInstBroadcast.SetValueInt(1)
; make sure Institute kickout is complete so no teleporting after this
; but not if the player is actually in the Institute - in that case InstKickout handles shutting itself down
if InstKickout.IsRunning() && Game.GetPlayer().IsInLocation(InstituteLocation) == false
	InstKickout.SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0016_Item_00
Function Fragment_Stage_0016_Item_00()
;BEGIN CODE
SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE mindefendcastlescript
Quest __temp = self as Quest
mindefendcastlescript kmyQuest = __temp as mindefendcastlescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MinutemenCentralQuest.AddRecruitmentQuest(self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_01
Function Fragment_Stage_0020_Item_01()
;BEGIN CODE
; Clean up Min301 if on MQ special case
Min301.SetStage(50) ; complete Min301 and shut it down
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
; for now, just the same as if Preston gave it
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
setStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE mindefendcastlescript
Quest __temp = self as Quest
mindefendcastlescript kmyQuest = __temp as mindefendcastlescript
;END AUTOCAST
;BEGIN CODE
; reset update count (for shutdown timer)
;kmyQuest.dailyUpdateCount = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE mindefendcastlescript
Quest __temp = self as Quest
mindefendcastlescript kmyQuest = __temp as mindefendcastlescript
;END AUTOCAST
;BEGIN CODE
setStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN AUTOCAST TYPE mindefendcastlescript
Quest __temp = self as Quest
mindefendcastlescript kmyQuest = __temp as mindefendcastlescript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
;SetObjectiveDisplayed(20) ; don't need this, InitializeObjective handles displaying it
kmyQuest.RegisterForWorkshopEvents()
kmyQuest.InitializeObjective()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
; update to "defend" objective
; for now just go to stage 150
setStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE mindefendcastleattackscript
Quest __temp = self as Quest
mindefendcastleattackscript kmyQuest = __temp as mindefendcastleattackscript
;END AUTOCAST
;BEGIN CODE
if IsObjectiveDisplayed(20)
	SetObjectiveCompleted(20)
endif

if IsObjectiveDisplayed(10) && !IsObjectiveCompleted(10)
	SetObjectiveDisplayed(10, false)
endif

; no initial wait for BOS attack after Prydwen:
; and no initial objective
if GetStageDone(16)
	kmyQuest.StartAttack(0.0)
else
	SetObjectiveDisplayed(30)
	kmyQuest.StartAttack()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
; if not already displayed
if IsObjectiveDisplayed(30) == false
	SetStage(20) ; failsafe
	SetObjectiveDisplayed(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(35)
MinDefendCastlePost.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_01
Function Fragment_Stage_0200_Item_01()
;BEGIN CODE
; start MQ302 with Minutemen
MQ302Min.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_02
Function Fragment_Stage_0200_Item_02()
;BEGIN CODE
MinDestBOS.SetStage(580)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
MinDefendCastleRadioAfterBattle.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE mindefendcastlescript
Quest __temp = self as Quest
mindefendcastlescript kmyQuest = __temp as mindefendcastlescript
;END AUTOCAST
;BEGIN CODE
setObjectiveCompleted(35)
kmyQuest.FinishQuest(true)
; complete quest
setStage(450)
; mod happiness up
kmyQuest.ModifyWorkshopHappiness(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE mindefendcastlescript
Quest __temp = self as Quest
mindefendcastlescript kmyQuest = __temp as mindefendcastlescript
;END AUTOCAST
;BEGIN CODE
if kmyQuest.PrestonIntroOn
	setObjectiveDisplayed(40)
else
	SetStage(480)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN AUTOCAST TYPE mindefendcastlescript
Quest __temp = self as Quest
mindefendcastlescript kmyQuest = __temp as mindefendcastlescript
;END AUTOCAST
;BEGIN CODE
if IsObjectiveDisplayed(40)
  setObjectiveCompleted(40)
endif
kmyQuest.StopQuestWhenAliasesUnloaded = true
kmyQuest.RegisterForCustomEvent(kmyQuest.REParent, "RECheckForCleanup")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE mindefendcastlescript
Quest __temp = self as Quest
mindefendcastlescript kmyQuest = __temp as mindefendcastlescript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stage 500")
; failsafe: make sure to restart normal radio
; (should be started at end of post-battle radio scene)
MinutemenCentralQuest.UpdateRadioStationStatus()
kmyQuest.EndQuest()
; failsafe
CompleteAllObjectives()
Stop()

MinDefendCastleExternalEncParent.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_01
Function Fragment_Stage_0500_Item_01()
;BEGIN AUTOCAST TYPE mindefendcastleattackscript
Quest __temp = self as Quest
mindefendcastleattackscript kmyQuest = __temp as mindefendcastleattackscript
;END AUTOCAST
;BEGIN CODE
kmyquest.DoBackupPostCleanup()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property Min03 Auto Const

RefCollectionAlias Property Alias_Attackers Auto Const

RefCollectionAlias Property Alias_AttackMarkers01 Auto Const

RefCollectionAlias Property Alias_AttackMarkers02 Auto Const

Keyword Property LinkCustom01 Auto Const

Keyword Property LinkCustom02 Auto Const

ReferenceAlias Property Alias_ArmoryDoor Auto Const

Quest Property MQ302 Auto Const

Quest Property MQ302Min Auto Const

GlobalVariable Property RadioDCInstBroadcast Auto Const

Scene Property MinDefendCastlePost Auto Const

Scene Property MinDefendCastleRadioAfterBattle Auto Const

minutemencentralscript Property MinutemenCentralQuest Auto Const

Quest Property Min301 Auto Const

GlobalVariable Property MinCastleAttacker Auto Const

Quest Property MinDestBoS Auto Const

Keyword Property LinkCustom03 Auto Const

Keyword Property LinkCustom04 Auto Const

MinDefendCastleAttackerHoldPOSScript Property MinDefendCastleHoldPosN Auto Const

MinDefendCastleAttackerHoldPOSScript Property MinDefendCastleHoldPosS Auto Const

ObjectReference Property MinDefendCastleExternalEncParent Auto Const Mandatory

Quest Property InstKickOut Auto Const Mandatory

Location Property InstituteLocation Auto Const Mandatory
