;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN121_00026340 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " starting")
kmyQuest.Startup()

SaugusReserveLocation.Clear()

DN121_SaugusBossRoomFaction.setAlly(TheForgedFaction, 1, 1)
DN121_SaugusBossRoomFaction.setAlly(DN121_JakeFaction, 1, 1)
DN121_SaugusBossRoomFaction.setAlly(PlayerFaction, 0, 0)

DN121_JakeFaction.setAlly(TheForgedFaction, 1, 1)
DN121_JakeFaction.setAlly(PlayerFaction, 0, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(DN121_SaugusTestMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(100)
Game.GetPlayer().MoveTo(DN121_SaugusTestMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
MS02.SetStage(600)
Game.GetPlayer().MoveTo(DN121_SaugusTestMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
MS02.SetStage(600)
SetStage(100)
Game.GetPlayer().MoveTo(DN121_SaugusTestMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetStage(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SetStage(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
Debug.Trace(self + ": Has hit Quest Fail state - Stage 8")

if IsObjectiveDisplayed(1) && !IsObjectiveCompleted(1)
	SetObjectiveFailed(1)
endif
if IsObjectiveDisplayed(3) && !IsObjectiveCompleted(3)
	SetObjectiveFailed(3)
endif
if IsObjectiveDisplayed(5) && !IsObjectiveCompleted(5)
	SetObjectiveFailed(5)
endif
if IsObjectiveDisplayed(7) && !IsObjectiveCompleted(7)
	SetObjectiveFailed(7)
endif
if IsObjectiveDisplayed(10) && !IsObjectiveCompleted(10)
	SetObjectiveFailed(10)
endif
if IsObjectiveDisplayed(20) && !IsObjectiveCompleted(20)
	SetObjectiveFailed(20)
endif
if GetStageDone(10) || GetStageDone(15)
	Debug.Trace(self + ": Stage 10 or 15 has been done so send the player to Preston")
	SetStage(950)
else
	;FailAllObjectives()
	Debug.Trace(self + ": Should be setting Stage 970")
	SetStage(970)
Endif

kmyQuest.FinishQuest(false)
kmyQuest.AddNPCsToFailureFaction(Alias_SettlementNPCs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MinutemenCentralQuest.AddRecruitmentQuest(self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
; for now, just the same as if Preston gave it
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1)
setStage(10)
Alias_SettlementMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
MS02.SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
if MS02.GetStage() == 500
	MS02.SetStage(600)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; complete pointer objective
SetObjectiveCompleted(1)
;Fine, I'll get your gun
SetObjectiveDisplayed(5)

If !SaugusIronworksMapMarker.IsMapMarkerVisible()
	SaugusIronworksMapMarker.AddToMap()
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0102_Item_00
Function Fragment_Stage_0102_Item_00()
;BEGIN CODE
if !isObjectiveDisplayed(7) && !Alias_Jake.GetActorRef().IsDead()
	SetObjectiveDisplayed(7)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
DN121_ForgeHold.Stop()
DN121_ForgeScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0301_Item_00
Function Fragment_Stage_0301_Item_00()
;BEGIN CODE
Alias_ForgeCrowd.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
Alias_Slag.GetReference().GetCurrentScene().Stop()
DN121_ForgeScenePlayerLeaves.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
DN121_ForgeScenePrisonerKillPlayer.Start()
DN121CollisionBlockerEnableParent.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Set Jake enemy to others
DN121_JakeFaction.setEnemy(TheForgedFaction, 0, 0)
DN121_JakeFaction.setAlly(PlayerFaction, 1, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
if !GetStageDone(450)
SetStage(450)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
DN121CollisionBlockerEnableParent.Disable()
DN121_SaugusBossRoomFaction.setEnemy(PlayerFaction)
DN121_SaugusBossRoomFaction.setAlly(TheForgedFaction, 1, 1)
Alias_ForgeCrowd.SetValue(Aggression, 2)
Alias_Slag.GetActorRef().SetValue(Aggression, 2)
Alias_Jake.GetActorRef().SetValue(Aggression, 1)

if GetStageDone(8)					
	;If the quest is already failed, jake becomes irreversibly hostile
	DN121_JakeFaction.SetEnemy(PlayerFaction, 1, 1)
	Alias_Jake.GetActorRef().SetValue(Confidence, 4)
	Alias_Jake.GetActorRef().StartCombat(game.getPlayer())
	Alias_Jake.GetActorRef().SetValue(Aggression, 2)
elseif !getStageDone(400) 			
	;If jake did not change is mind, change his faction relation to the player to neutral
	DN121_JakeFaction.SetEnemy(PlayerFaction, 1, 1)
	Alias_Jake.GetActorRef().SetValue(Confidence, 1)
	Alias_Jake.GetActorRef().StartCombat(game.getPlayer())
else									
	;If Jake DID change his mind, he is now enemy to the boss room faction and the forged
	DN121_SaugusBossRoomFaction.setEnemy(DN121_JakeFaction)
	TheForgedFaction.SetEnemy(DN121_JakeFaction)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0452_Item_00
Function Fragment_Stage_0452_Item_00()
;BEGIN CODE
;Combat has ended
DN121CollisionBlockerEnableParent.Disable()

;If jake is still alive and has changed sides enable triggers
if GetStageDone(500) == False && GetStageDone(400)

	;Enable Reconciliation triggers
	DN121_StartReconcileSceneTrigger1.Enable()
	DN121_StartReconcileSceneTrigger2.Enable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0453_Item_00
Function Fragment_Stage_0453_Item_00()
;BEGIN CODE
;If I have not already returned the sword to abraham
If GetStage() < 700
	;If I have not taken the sword, pop that objective
	if !IsObjectiveDisplayed(5) && !IsObjectiveCompleted(5) && !GetStageDone(455)
		SetObjectiveDisplayed(5)

	;If I have taken the sword, but don't know about abraham pop that objective
	Elseif GetStageDone(455) && !IsObjectiveDisplayed(20)
		SetObjectiveDisplayed(20)
	Endif
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0454_Item_00
Function Fragment_Stage_0454_Item_00()
;BEGIN CODE
;If jake is the last one alive, have him try to surrender
;Jake will not surrender if Abraham or Abigail have been killed
DN121CollisionBlockerEnableParent.Disable()
if !getStageDone(400) && !GetStageDone(8)
	DN121_JakeFaction.SetEnemy(PlayerFaction, 1, 1)
	DN121_JakeFaction.SetEnemy(DN121_SaugusBossRoomFaction, 0, 0)
	Alias_Jake.GetActorRef().SetValue(Aggression, 1)
	utility.wait(1)
	Alias_Jake.GetActorRef().StopCombat()
	Game.GetPlayer().StopCombat()
	Alias_Jake.GetActorRef().EvaluatePackage()
	if !Alias_Prisoner1.GetActorRef().IsDead()
		DN121_JakeFreePrisoner.Start()
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0455_Item_00
Function Fragment_Stage_0455_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(5)
	SetObjectiveCompleted(5)
	SetObjectiveDisplayed(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0457_Item_00
Function Fragment_Stage_0457_Item_00()
;BEGIN CODE
;If jake is the last one alive, have him try to surrender
if !getStageDone(400) && !GetStageDone(8)
	DN121_JakeFaction.SetEnemy(PlayerFaction, 0, 0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0470_Item_00
Function Fragment_Stage_0470_Item_00()
;BEGIN AUTOCAST TYPE dn121questscript
Quest __temp = self as Quest
dn121questscript kmyQuest = __temp as dn121questscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

if GetStageDone(500) == False && GetStageDone(400)
	SaugusIronworks01ToExtUpper.Unlock()
	;Enable Reconciliation triggers
	DN121_StartReconcileSceneTrigger1.Enable()
	DN121_StartReconcileSceneTrigger2.Enable()
	GunnerFaction.SetEnemy(DN121_JakeFaction, 1, 1)
endif
Alias_Jake.GetActorRef().EvaluatePackage()
kmyQuest.ReadyToTeleportJake()
Alias_Jake.GetActorRef().SetValue(Confidence, 3)
Alias_Jake.GetActorRef().AddKeyword(AnimArchetypeNervous)
Alias_Jake.GetActorRef().RemoveKeyword(AnimArchetypeScared)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
DN121_StartReconcileSceneTrigger1.Disable()
DN121_StartReconcileSceneTrigger2.Disable()
DN121_AbrahamJakeReconcile.Start()
Alias_Jake.GetActorRef().EvaluatePackage()
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0491_Item_00
Function Fragment_Stage_0491_Item_00()
;BEGIN CODE
if !game.GetPlayer().HasDetectionLOS(Alias_Jake.GetReference())
	if Alias_Jake.GetReference().GetDistance(alias_Abraham.getReference()) >= 1500
		Alias_Jake.GetReference().MoveTo(DN121TeleportJakeMarker)	
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0495_Item_00
Function Fragment_Stage_0495_Item_00()
;BEGIN CODE
Alias_Abraham.GetActorRef().EvaluatePackage()

if isObjectiveDisplayed(7)
	SetObjectiveCompleted(7)
Endif
Alias_Jake.GetActorRef().RemoveKeyword(AnimArchetypeNervous)
; add Jake to Finch as workshop NPC
WorkshopScript workshopRef = Alias_Workshop.GetRef() as WorkshopScript
WorkshopParent.AddPermanentActorToWorkshopPUBLIC(Alias_Jake.GetActorRef(), workshopRef.GetWorkshopID())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0498_Item_00
Function Fragment_Stage_0498_Item_00()
;BEGIN CODE
;Check if it is time to shut down
if GetStageDone(750);Abraham has already paid
	SetStage(900)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE dn121questscript
Quest __temp = self as Quest
dn121questscript kmyQuest = __temp as dn121questscript
;END AUTOCAST
;BEGIN CODE
DN121_StartReconcileSceneTrigger1.Disable()
DN121_StartReconcileSceneTrigger2.Disable()
DN121CollisionBlockerEnableParent.Disable()

;if Save jake objective is displayed
if isObjectiveDisplayed(7)
	SetObjectiveFailed(7)
Endif

;If you were supposed to meet jake, well he's dead now so you are a failure
;At least you can still bring that gun back
if IsObjectiveDisplayed(10)
	SetObjectiveFailed(10)
	SetObjectiveDisplayed(5,1,1)
endif

Actor Player = Game.GetPlayer()
Actor Jake = Alias_Jake.GetActorRef()
Actor Prisoner = Alias_Prisoner1.GetActorRef()

if Jake.getKiller() == Player 
	if !getStageDone(450) && GetStageDone(320)
		;Jake was going to kill the prisoner
		SetStage(501)
	elseif getStageDone(400)		;Jake changed his mind
		;Player killed jake after he changed his mind
		SetStage(502)
	elseif GetStageDone(456)	;Jake has tried to surrender
		if Prisoner.GetKiller() == Jake
			;Jake killed the prisoner
			SetStage(503)
		else
			SetStage(504)
		endif
	elseif GetStageDone(450) && !GetStageDone(452)
		;Jake killed by the player while in the fight, could be an accident
	else
		;Any other time he his considered friendly and this is murder
		SetStage(505)
	endif
endif


kmyQuest.JakeKilledForgetTheTeleport()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0690_Item_00
Function Fragment_Stage_0690_Item_00()
;BEGIN CODE
If !IsObjectiveDisplayed(20) && !IsObjectiveCompleted(20)
	SetObjectiveDisplayed(20)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20, 1)
SetStage(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN AUTOCAST TYPE dn121questscript
Quest __temp = self as Quest
dn121questscript kmyQuest = __temp as dn121questscript
;END AUTOCAST
;BEGIN CODE
;Base amount
int CapsToGive
CapsToGive = 150

;Bonus from haggling
if kMyQuest.RewardHaggle  == 1
	CapsToGive = 200
elseif kMyQuest.RewardHaggle == 2
	CapsToGive = 250
elseif kMyQuest.RewardHaggle == 3
	CapsToGive = 400
endif

;Extra for saving Jake
if GetStageDone(499)
	CapsToGive += 100
endif

;Oh how he'll pay
Game.GetPlayer().AddItem(Caps001, CapsToGive)

SetObjectiveCompleted(20, 1)
;game.RewardPlayerXP(XPMiscQuest.GetValueInt())

;Check if it is time to shut down
;if GetStageDone(495);Jake was saved, reunion happened
	;If the player took the gun OR refused, left the area and has come back
;	if (GetStageDone(497) || GetStageDone(498))
;		SetStage(900)
;	endif
;Or if Jake wasn't saved
;else
	SetStage(900)
;endif

if IsObjectiveDisplayed(1)
	SetObjectiveCompleted(1)
Endif

if IsObjectiveDisplayed(3)
	SetObjectiveCompleted(3)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FinishQuest(true)
; complete quest
setstage(950)
if !alias_Daniel.GetActorRef().isDead()
;alias_Daniel.GetActorRef().AddToFaction(FarmDiscountFaction)
endif
Alias_TheSword.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
setObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_01
Function Fragment_Stage_0950_Item_01()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
setObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_02
Function Fragment_Stage_0950_Item_02()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0970_Item_00
Function Fragment_Stage_0970_Item_00()
;BEGIN CODE
Alias_TheSword.Clear()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE minrecruitquestscript
Quest __temp = self as Quest
minrecruitquestscript kmyQuest = __temp as minrecruitquestscript
;END AUTOCAST
;BEGIN CODE
;Wrap up the quest.
CompleteAllObjectives()
CompleteQuest()
kmyQuest.EndQuest()
SaugusLocationReservation.Clear()
DN121_DisableConditionalController.Disable()

;;;;;;This is where we will trigger the remote reset registration
(DN121_DisableConditionalParent as defaultDisableOnResetOtherCondition).RegisterForReset()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MS02 Auto Const

Scene Property DN121_JakeChangesMind Auto Const

Faction Property PlayerFaction Auto Const

Faction Property DN121_SaugusBossRoomFaction Auto Const

Faction Property TheForgedFaction Auto Const

Faction Property DN121_JakeFaction Auto Const

ObjectReference Property DN121_SaugusTestMarker Auto Const

ObjectReference Property DN121_StartReconcileSceneTrigger1 Auto Const

ObjectReference Property DN121_StartReconcileSceneTrigger2 Auto Const

Scene Property DN121_AbrahamJakeReconcile Auto Const

MiscObject Property Caps001 Auto Const

ReferenceAlias Property Alias_SettlementMapMarker Auto Const

RefCollectionAlias Property Alias_ForgeCrowd Auto Const

ActorValue Property Aggression Auto Const

GlobalVariable Property DN121_RewardHaggle Auto Const

Scene Property DN121_ForgeHold Auto Const

Scene Property DN121_ForgeScene Auto Const

ReferenceAlias Property Alias_Slag Auto Const

ReferenceAlias Property Alias_Jake Auto Const

ReferenceAlias Property Alias_Daniel Auto Const

LocationAlias Property SaugusReserveLocation Auto Const

ReferenceAlias Property Alias_Abraham Auto Const

ObjectReference Property SaugusIronworks01ToExtUpper Auto Const

Faction Property GunnerFaction Auto Const

ObjectReference Property DN121CollisionBlockerEnableParent Auto Const

Scene Property DN121_JakeFreePrisoner Auto Const

ActorValue Property Confidence Auto Const

Keyword Property AnimArchetypeScared Auto Const

Keyword Property AnimArchetypeNervous Auto Const

GlobalVariable Property XPMiscQuest Auto Const

ObjectReference Property DN121TeleportJakeMarker Auto Const

Scene Property DN121_ForgeScenePrisonerKillPlayer Auto Const

Scene Property DN121_ForgeScenePlayerLeaves Auto Const

RefCollectionAlias Property Alias_SettlementNPCs Auto Const

ReferenceAlias Property Alias_Prisoner1 Auto Const

ReferenceAlias Property Alias_TheSword Auto Const

LocationAlias Property SaugusLocationReservation Auto Const

ObjectReference Property DN121_DisableConditionalController Auto Const Mandatory

ReferenceAlias Property Alias_Workshop Auto Const Mandatory

workshopparentscript Property WorkshopParent Auto Const Mandatory

ObjectReference Property SaugusIronWorksMapMarker Auto Const Mandatory

ObjectReference Property DN121_DisableConditionalParent Auto Const Mandatory
