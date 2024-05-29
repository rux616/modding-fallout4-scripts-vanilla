;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03MQ05_01001B43 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; DEBUG - End "Walk in the Park"
pDLC03MQ02.Stop()
pDLC03DialogueDiMA.SetStage(200)
pDLC03AcadiaDialogue.SetStage(100)

; Queue up the quest
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; As soon as the quest starts - kill the Children of Atom execution scene, it just gets too messy
pDLC03ConvFarHarborChildrenExecution.SetStage(300)

; Make sure Avery isn't talking with Pearl from now on
pDLC03_V118_MiscObjectives.SetStage(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN AUTOCAST TYPE dlc03:dlc03mq05script
Quest __temp = self as Quest
dlc03:dlc03mq05script kmyQuest = __temp as dlc03:dlc03mq05script
;END AUTOCAST
;BEGIN CODE
; This is high enough that you'll win the argument no matter what
kmyQuest.nFightAllenCounter = 20
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Objectives
;SetObjectiveDisplayed(50)
pDLC03MQ04.SetStage(160)

; Enable the grave trigger activator
Alias_GraveActivator.GetRef().Enable()

;startup companion quest to handle Acadia staging
DLC03MQ05AcadiaStaging.SetStage(10)

; If Andre hasn't been dealt with, disable him
if ( !pDLC03DialogueFarHarbor.GetStageDone(175) )
  pDLC03DialogueFarHarbor.GetStageDone(140)
  Alias_AndreMichaud.GetActorRef().Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
; Objectives
pDLC03MQ04.SetStage(165)  ; Closes off MQ04 pointer here
SetObjectiveDisplayed(50)

; Make this quest active
SetActive()

; MQ04 is no longer active
pDLC03MQ04.SetActive(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
; Make sure that DiMA's main dialogue knows this conversation happened
pDLC03DialogueDiMA.SetStage(980)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
; Objectives
if ( !IsObjectiveCompleted(300) )
  SetObjectiveDisplayed(300, FALSE)    ; You didn't alert Far Harbor
endif
if ( !IsObjectiveCompleted(150) )
  SetObjectiveDisplayed(150, FALSE)    ; You didn't talk with Kasumi
endif
CompleteAllObjectives()
SetObjectiveDisplayed(700)

;update companion staging quest
DLC03MQ05AcadiaStaging.SetStage(100)

; The crowd now gathers - package looks at this global
pDLC03FarHarborCrowdGathers.SetValue(1)
pDLC03FarHarborAbnormalState.SetValue(1)

; Point of no return for the BoS and Institute attacking Acadia
pDLC03Acadia_Institute.SetStage(1000)
pDLC03Acadia_BoS.SetStage(1000)

; If Avery is talking with Pearl, kill that scene
pDLC03_V118_PearlAvery_LoopScene.Stop()

;Set global that DiMA is no longer available for quest conversations, fail MQ06a if it's running and 
;kill appropriate objs in MQ06 if active
if DLC03MQ06a.IsRunning()
  DLC03MQ06a.SetStage(765)
endif

if DLC03MQ06.IsRunning()
  DLC03MQ06.SetStage(765)
endif

DLC03MQ06_DiMAUnavailable.SetValue(1)

; Make DiMA ignore being shot now (because it gets goofy with what happens)
Actor aDiMA = Alias_DiMA.GetActorRef()
aDiMA.IgnoreFriendlyHits()
aDiMA.AddToFaction(pPlayerFriendFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0122_Item_00
Function Fragment_Stage_0122_Item_00()
;BEGIN CODE
; DiMA heads to Far Harbor
Alias_DiMA.GetActorRef().MoveTo(pMQ05AccusedMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0123_Item_00
Function Fragment_Stage_0123_Item_00()
;BEGIN CODE
; From trigger around the trial area
pDLC03MQ05_0700_JusticeForDiMA.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
; Reward
pDLC03_CustomItemQuest.SetStage(60)   ; Give custom armor
Game.GivePlayerCaps(500)

Game.AddAchievement(61)

; Hand over the evidence
Game.GetPlayer().RemoveItem(pDLC03MQ04Memory01Holotape)
Game.GetPlayer().RemoveItem(Alias_AveryLocket.GetRef())
Game.GetPlayer().RemoveItem(Alias_AverySkull.GetRef())
Game.GetPlayer().RemoveItem(Alias_AveryHolotape.GetRef())

;Start up DLC03MQ06a if other paths haven't shut down
if DLC03MQ06_NucleusDestroyed.GetValue() <= 0 && DLC03MQ06_WindFarmDestroyed.GetValue() <=0 && DLC03CoA_PlayerKickedOutofCoA.GetValue() <= 0 && DLC03MQ06_TektusConvincedofDivision.GetValue() <= 0
  DLC03MQ06a.SetStage(10)
  DLC03MQ06a.SetActive()
endif

; End the quest
if ( !IsObjectiveCompleted(300) )
  SetObjectiveDisplayed(300, FALSE)    ; You didn't alert Far Harbor
endif
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE dlc03:dlc03mq05script
Quest __temp = self as Quest
dlc03:dlc03mq05script kmyQuest = __temp as dlc03:dlc03mq05script
;END AUTOCAST
;BEGIN CODE
;Disable grave trigger
Alias_GraveActivator.GetRef().Disable()

;Disable player controls
kmyquest.BlockPlayerControls()

;Begin fade out
Game.FadeOutGame(True, True, 0.0, 2.0, True)

;Play digging sound
Utility.Wait(0.5)
pQSTMS07BPlayerGraveExhume2D.Play(Game.GetPlayer())

Utility.Wait(2.5)

;Disable mound and trigger, enable grave
pMQ05GraveClosedREF.Disable()
;Game.GetPlayer().MoveTo(MS07bDigMarker)

Game.FadeOutGame(False, True, 0.0, 2.5)
Utility.Wait(2.5)

;Reenable player controls
kmyquest.UnblockPlayerControls()

; Signal that the grave has been unearthed
SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
; If both items have been picked up then progress the quest
if ( GetStageDone(230) && GetStageDone(240) )
  SetStage(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
; If both items have been picked up then progress the quest
if ( GetStageDone(220) && GetStageDone(240) )
  SetStage(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
; If both items have been picked up then progress the quest
if ( GetStageDone(220) && GetStageDone(230) )
  SetStage(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
; Objectives


SetObjectiveCompleted(50)
pDLC03MQ04.SetStage(180)
SetObjectiveDisplayed(100)
SetObjectiveDisplayed(300)
if ( !pDLC03MQPostQuest.GetStageDone(150) )
  SetObjectiveDisplayed(150)
endif

;update or start Commonwealth faction quests


Debug.Trace("MQ05 Stage 250, Global value=" + DLC03CommonwealthFactionOnIsland.GetValue() as int)

if DLC03CommonwealthFactionOnIsland.GetValue() as int==2
	Debug.Trace("MQ05 Stage 250 - global is 2 passed")
	if DLC03Acadia_BoS.GetStageDone(50) && DLC03Acadia_BoS.GetStageDone(100) == 0 
		Debug.Trace("MQ05 stage 250 - updating BoS")
		DLC03Acadia_BoS.SetStage(100)
	elseif DLC03Acadia_Institute.GetStage()==50 && DLC03Acadia_Institute.GetStageDone(100)==0
		Debug.Trace("MQ05 stage 250 - updating Inst")
		DLC03Acadia_Institute.SetStage(100)
	endif
elseif DLC03CommonwealthFactionOnIsland.GetValue() as int==1
	if DLC03Acadia_BoS.GetStage()==40
		DLC03Acadia_BoS.SetStage(50)
	elseif DLC03Acadia_Institute.GetStage()==40
		DLC03Acadia_Institute.SetStage(50)
	endif
else


	if (BoSJoined.GetValue() ==1) && (PlayerBoS_KickedOut.GetValue()== 0)
		if DLC03Acadia_BoS.IsRunning()==0
			DLC03Acadia_BOS.SetStage(10)
			DLC03Acadia_BoS_Misc.Start()
		else
			if DLC03Acadia_BoS.GetStageDone(10)==0
				DLC03Acadia_BOS.SetStage(10)
			endif

			if DLC03Acadia_BoS_Misc.IsObjectiveCompleted(10)
				DLC03Acadia_BoS_Misc.SetObjectiveDisplayed(20)
			endif
		endif	
	endif
	if (PlayerInstitute_Joined.GetValue()==1) && (PlayerInstitute_KickedOut.GetValue() == 0)
		if DLC03Acadia_Institute.IsRunning()==0
			DLC03Acadia_Institute.SetStage(10)
			DLC03Acadia_Institute_Misc.Start()
		else
			if DLC03Acadia_Institute.GetStageDone(10)==0
				DLC03Acadia_Institute.SetStage(10)
			endif
			if DLC03Acadia_Institute_Misc.IsObjectiveCompleted(10)
				DLC03Acadia_Institute_Misc.SetObjectiveDisplayed(20)
			endif
		endif
	endif
	if (PlayerRailroad_JoinedFaction.GetValue()==1) && (PlayerRailroad_KickedOut.GetValue() == 0)
		If (DLC03Acadia_RR.IsRunning()==False)
			DLC03Acadia_RR.Start()
		ElseIf DLC03Acadia_RR.IsRunning() && DLC03Acadia_RR.GetStageDone(300) == 0
			If DLC03Acadia_RR.IsObjectiveCompleted(10)
				DLC03Acadia_RR.SetObjectiveDisplayed(10, abForce=True)
			EndIf
		ElseIf DLC03Acadia_RR.IsRunning() && DLC03Acadia_RR.GetStageDone(300) == 1
			DLC03Acadia_RR.SetStage(500)
		EndIf
	endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Set the global
pDLC03AveryKnowsShesASynth.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
; If the player has negotiated for caps, get them
if ( GetStageDone(320) )
  Game.GivePlayerCaps(1300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(400)

; Allen now likes the PC
pDLC03FarHarborAllenLikesPC.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(300)
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Set up Captain Avery
Actor aTarg = Alias_CaptainAvery.GetActorRef()
aTarg.GetActorBase().SetProtected(FALSE)
aTarg.GetActorBase().SetEssential(FALSE)
aTarg.SetValue(pHealth, 1)

; Hand over the evidence
Game.GetPlayer().RemoveItem(pDLC03MQ04Memory01Holotape)
Game.GetPlayer().RemoveItem(Alias_AveryLocket.GetRef())
Game.GetPlayer().RemoveItem(Alias_AverySkull.GetRef())
Game.GetPlayer().RemoveItem(Alias_AveryHolotape.GetRef())

; The crowd now gathers - package looks at this global
pDLC03FarHarborCrowdGathers.SetValue(1)
pDLC03FarHarborAbnormalState.SetValue(1)

; If Avery is talking with Pearl, kill that scene
pDLC03_V118_PearlAvery_LoopScene.Stop()

; End the M03 quest (and Avery's part of M02)
pDLC03FarHarborM02.SetStage(390)
pDLC03FarHarborM03.SetStage(9000)

; End FF02
pDLC03FarHarborFF02.SetStage(500)

pDLC03AveryDeposedOrDead.SetValue(1)   ; No matter what, Avery is out

; Point of no return for the BoS and Institute attacking Acadia
pDLC03Acadia_Institute.SetStage(1000)
pDLC03Acadia_BoS.SetStage(1000)

;Set global that DiMA is no longer available for quest conversations, fail MQ06a if it's running and 
;kill appropriate objs in MQ06 if active
if DLC03MQ06a.IsRunning()
  DLC03MQ06a.SetStage(765)
endif

if DLC03MQ06.IsRunning()
  DLC03MQ06.SetStage(765)
endif

DLC03MQ06_DiMAUnavailable.SetValue(1)

; Confrontation scene plays
pDLC03MQ05_0500a_AllenConfrontsAvery.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0505_Item_00
Function Fragment_Stage_0505_Item_00()
;BEGIN AUTOCAST TYPE dlc03:dlc03mq05script
Quest __temp = self as Quest
dlc03:dlc03mq05script kmyQuest = __temp as dlc03:dlc03mq05script
;END AUTOCAST
;BEGIN CODE
; Make everyone angry
kmyQuest.MakeAngry(Alias_FarHarborAggressors)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
; Avery is no longer the leader
pDLC03AveryDeposedOrDead.SetValue(1)

; Avery brings PC into it
pDLC03MQ05_0500b_AveryAsksPC.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
; When she's exiled and unloads (via her alias script) she leaves forever
Alias_CaptainAvery.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
; End the scene
pDLC03MQ05_0500b_AveryAsksPC.Stop()

; Crowd reactions
;SetStage(696)

; Play the storm Acadia scene
pDLC03MQ05_0500d_AllenSaysStormAcadia.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0695_Item_00
Function Fragment_Stage_0695_Item_00()
;BEGIN CODE
; End the scenes that could be playing
pDLC03MQ05_0700a1_JusticeForAvery.Stop()
pDLC03MQ05_0700b1_JusticeForAllen.Stop()

; Crowd reactions
SetStage(696)

; Check to see what execution was done and play the appropriate end scene
if ( GetStageDone(697) )
  pDLC03MQ05_0700a2_AveryEnd.Start()
elseif ( GetStageDone(698) )
  pDLC03MQ05_0700b2_AllenEndExecute.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0696_Item_00
Function Fragment_Stage_0696_Item_00()
;BEGIN CODE
; Play some crowd reactions
Actor aTemp
aTemp = Alias_F04.GetActorRef()
aTemp.PlayIdle(pCowerSinglePlay)
aTemp.PlayIdle(pCowerSinglePlay)
aTemp = Alias_M07.GetActorRef()
aTemp.PlayIdle(pCowerSinglePlay)
aTemp.PlayIdle(pCowerSinglePlay)
aTemp = Alias_SmallBertha.GetActorRef()
aTemp.PlayIdle(pCowerSinglePlay)
aTemp.PlayIdle(pCowerSinglePlay)
aTemp = Alias_CassieDalton.GetActorRef()
aTemp.PlayIdle(pCowerSinglePlay)
aTemp.PlayIdle(pCowerSinglePlay)
aTemp = Alias_Brooks.GetActorRef()
aTemp.PlayIdle(pCowerSinglePlay)
aTemp.PlayIdle(pCowerSinglePlay)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0697_Item_00
Function Fragment_Stage_0697_Item_00()
;BEGIN CODE
SetStage(699)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0698_Item_00
Function Fragment_Stage_0698_Item_00()
;BEGIN CODE
SetStage(699)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0699_Item_00
Function Fragment_Stage_0699_Item_00()
;BEGIN CODE
; Set up DiMA
Actor aTarg = Alias_DiMA.GetActorRef()
aTarg.GetActorBase().SetProtected(FALSE)
aTarg.GetActorBase().SetEssential(FALSE)
aTarg.SetValue(pHealth, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
; CALLED BY DLC03Acadia_Institute or DLC03Acadia_BoS
Alias_DiMA.GetActorRef().MoveTo(pMQ05AccusedMarker)
Alias_DiMA.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0725_Item_00
Function Fragment_Stage_0725_Item_00()
;BEGIN CODE
; Reward
Game.GivePlayerCaps(1500)

; The crowd will no longer will gather - package checks this
pDLC03FarHarborCrowdGathers.SetValue(0)

Game.AddAchievement(61)

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE dlc03:dlc03mq05script
Quest __temp = self as Quest
dlc03:dlc03mq05script kmyQuest = __temp as dlc03:dlc03mq05script
;END AUTOCAST
;BEGIN CODE
; Objectives
CompleteAllObjectives()
SetObjectiveDisplayed(800)

; Allen now likes the PC
pDLC03FarHarborAllenLikesPC.SetValue(1)

; Indicate that Far Harbor residents aren't home
pDLC03FarHarborAttackingAcadia.SetValue(1)

; Remove Brooks from all factions and make him hostile
Actor aBrooks  = Alias_Brooks.GetActorRef()
aBrooks.RemoveFromAllFactions()
aBrooks.AddToFaction(pPlayerEnemyFaction)
aBrooks.AddToFaction(pDLC03SettlementFarHarborEnemyFaction)
aBrooks.GetActorBase().SetProtected(FALSE)
aBrooks.GetActorBase().SetEssential(FALSE)
aBrooks.SetValue(pHealth, 1)
aBrooks.EvaluatePackage()

; Add Mitch to the aggressors
Alias_FarHarborAggressors.AddRef(Alias_Mitch.GetActorRef())

; Register for location changes (watching for arriving at Acadia)
kmyQuest.RegisterLocationChange()

; The crowd will no longer will gather - package checks this
pDLC03FarHarborCrowdGathers.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
; Iterate over all of the Far Harbor attacks and move them to their spot
int i = 0
while i < Alias_FarHarborAggressors.GetCount()
  ObjectReference theRef = Alias_FarHarborAggressors.GetAt(i)
  ; Make sure the actor is VALID, STILL ALIVE, and NOT LOADED
  if theRef && !(theRef as Actor).IsDead() && !theRef.Is3DLoaded()
   theRef.MoveTo(theRef.GetLinkedRef(pDLC03MQ05FarHarborStagingAttack))
  endif
  i += 1		
endWhile

; Clean up any bodies in Far Harbor
if ( GetStageDone(550) )
  Alias_CaptainAvery.GetActorRef().Disable()
endif
if ( GetStageDone(699) )
  Alias_DiMA.GetActorRef().Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0830_Item_00
Function Fragment_Stage_0830_Item_00()
;BEGIN CODE
; And... now Allen doesn't like the PC again
pDLC03FarHarborAllenLikesPC.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
; Now everyone can die inside Acadia
pDLC03AcadiaDefense.SetStage(100)

; Make Acadia and Far Harbor enemies
pDLC03SettlementFarHarborFaction.SetEnemy(pDLC03AcadiaFaction)

; Make Kasumi an enemy
Alias_Kasumi.GetActorRef().AddToFaction(pDLC03AcadiaFaction)

; Make everyone spring into action
Alias_FarHarborAggressors.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE dlc03:dlc03mq05script
Quest __temp = self as Quest
dlc03:dlc03mq05script kmyQuest = __temp as dlc03:dlc03mq05script
;END AUTOCAST
;BEGIN CODE
; Objectives
SetObjectiveCompleted(800)
SetObjectiveDisplayed(900)

; Indicate Acadia has been destroyed
pDLC03PlayerAcadiaDestroyed.SetValue(1)

; Calm everyone
kmyQuest.CalmAnger(Alias_FarHarborAggressors)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
; Reward
pDLC03_CustomItemQuest.SetStage(50)   ; Give a custom gun
Game.GivePlayerCaps(2200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; Get a perk (and notification)
Game.GetPlayer().AddPerk(pDLC03_DestroyerArcadiaPerk)
pDLC03MQ05_DestroyerofAcadiaMsg.Show()

Game.AddAchievement(61)

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8900_Item_00
Function Fragment_Stage_8900_Item_00()
;BEGIN CODE
; Flag this so that everyone acts normally
pDLC03FarHarborAbnormalState.SetValue(0)

; Indicate that Far Harbor residents are heading back
pDLC03FarHarborAttackingAcadia.SetValue(0)

if (DLC03MQ06A.GetStageDone(10) == 0) && (GetStageDone(8990) == 0)
   if (DLC03KasumiNakano.GetDeadCount() != 0)
      Debug.Trace("Kasumi is dead")
      DLC03MQPostQuest.SetStage(200)
  elseif (DLC03KasumiNakano.GetDeadCount() == 0)
     Debug.Trace("Kasumi is alive")
     DLC03MQPostQuest.SetStage(100)
  endIf
endif

; The crowd will no longer will gather - package checks this
pDLC03FarHarborCrowdGathers.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8980_Item_00
Function Fragment_Stage_8980_Item_00()
;BEGIN CODE
; If DiMA is going to confess and hasn't been killed yet
if ( GetStageDone(120) && !GetStageDone(695) )
  SetStage(699)  ; Make it so DiMA can be killed
  SetStage(710)  ; Then clean up that case
endif

SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8990_Item_00
Function Fragment_Stage_8990_Item_00()
;BEGIN CODE
; If DiMA is going to confess and hasn't been killed yet
if ( GetStageDone(120) && !GetStageDone(695) )
  SetStage(699)  ; Make it so DiMA can be killed
  SetStage(710)  ; Then clean up that case
endif

SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_GraveActivator Auto Const Mandatory

Sound Property pQSTMS07BPlayerGraveExhume2D Auto Const Mandatory

ObjectReference Property pMQ05GraveClosedREF Auto Const Mandatory

ObjectReference Property pMQ05AccusedMarker Auto Const Mandatory

ReferenceAlias Property Alias_DiMA Auto Const Mandatory

ActorValue Property pHealth Auto Const Mandatory

Scene Property pDLC03MQ05_0700a2_AveryEnd Auto Const Mandatory

Scene Property pDLC03MQ05_0700b2_AllenEndExecute Auto Const Mandatory

Scene Property pDLC03MQ05_0700a1_JusticeForAvery Auto Const Mandatory

Scene Property pDLC03MQ05_0700b1_JusticeForAllen Auto Const Mandatory

ReferenceAlias Property Alias_AveryLocket Auto Const Mandatory

ReferenceAlias Property Alias_AverySkull Auto Const Mandatory

Scene Property pDLC03MQ05_0500a_AllenConfrontsAvery Auto Const Mandatory

Scene Property pDLC03MQ05_0500b_AveryAsksPC Auto Const Mandatory

ReferenceAlias Property Alias_CaptainAvery Auto Const Mandatory

Scene Property pDLC03MQ05_0500d_AllenSaysStormAcadia Auto Const Mandatory

Holotape Property pDLC03MQ04Memory01Holotape Auto Const Mandatory

GlobalVariable Property pDLC03AveryKnowsShesASynth Auto Const Mandatory

Quest Property DLC03MQ06a Auto Const Mandatory

GlobalVariable Property DLC03MQ06_WindFarmDestroyed Auto Const Mandatory

GlobalVariable Property DLC03MQ06_NucleusDestroyed Auto Const Mandatory

GlobalVariable Property DLC03CoA_PlayerKickedOutofCoA Auto Const Mandatory

GlobalVariable Property pDLC03FarHarborAttackingAcadia Auto Const Mandatory

GlobalVariable Property pDLC03PlayerAcadiaDestroyed Auto Const Mandatory

RefCollectionAlias Property Alias_FarHarborAggressors Auto Const Mandatory

Keyword Property pDLC03MQ05FarHarborStagingAttack Auto Const Mandatory

ReferenceAlias Property Alias_Mitch Auto Const Mandatory

Quest Property pDLC03AcadiaDefense Auto Const Mandatory

Quest Property pDLC03MQ02 Auto Const Mandatory

Potion Property StealthBoy Auto Const Mandatory

Potion Property GrapeMentats Auto Const Mandatory

Faction Property pDLC03SettlementFarHarborFaction Auto Const Mandatory

Faction Property pDLC03AcadiaFaction Auto Const Mandatory

ActorBase Property DLC03KasumiNakano Auto Const Mandatory

Quest Property DLC03MQPostQuest Auto Const Mandatory

ReferenceAlias Property Alias_AveryHolotape Auto Const Mandatory

ReferenceAlias Property Alias_Kasumi Auto Const Mandatory

ReferenceAlias Property Alias_Brooks Auto Const Mandatory

Faction Property pRaiderFaction Auto Const Mandatory

GlobalVariable Property pDLC03FarHarborCrowdGathers Auto Const Mandatory

Faction Property pPlayerEnemyFaction Auto Const Mandatory

Quest Property pDLC03Acadia_Institute Auto Const Mandatory

Quest Property pDLC03Acadia_BoS Auto Const Mandatory

Quest Property pDLC03DialogueDiMA Auto Const Mandatory

Scene Property pDLC03MQ05_0700_JusticeForDiMA Auto Const Mandatory

GlobalVariable Property pDLC03FarHarborAbnormalState Auto Const Mandatory

Perk Property pDLC03_DestroyerArcadiaPerk Auto Const Mandatory

GlobalVariable Property pDLC03AveryDeposedOrDead Auto Const Mandatory

Scene Property pDLC03_V118_PearlAvery_LoopScene Auto Const Mandatory

Quest Property DLC03MQ06 Auto Const Mandatory

GlobalVariable Property DLC03MQ06_DiMAUnavailable Auto Const Mandatory

GlobalVariable Property pDLC03FarHarborAllenLikesPC Auto Const Mandatory

Quest Property pDLC03MQ04 Auto Const Mandatory

Quest Property pDLC03_CustomItemQuest Auto Const Mandatory

Quest Property pDLC03AcadiaDialogue Auto Const Mandatory

Quest Property DLC03MQ05AcadiaStaging Auto Const Mandatory

Quest Property pDLC03ConvFarHarborChildrenExecution Auto Const Mandatory

ReferenceAlias Property Alias_AndreMichaud Auto Const Mandatory

Quest Property pDLC03DialogueFarHarbor Auto Const Mandatory

Quest Property pDLC03FarHarborM03 Auto Const Mandatory

Message Property pDLC03MQ05_DestroyerofAcadiaMsg Auto Const Mandatory

Quest Property pDLC03_V118_MiscObjectives Auto Const Mandatory

Quest Property pDLC03FarHarborFF02 Auto Const Mandatory

Quest Property pDLC03FarHarborM01 Auto Const Mandatory

Quest Property pDLC03FarHarborM02 Auto Const Mandatory

GlobalVariable Property BoSJoined Auto Const Mandatory

GlobalVariable Property PlayerBoS_KickedOut Auto Const Mandatory

Quest Property DLC03Acadia_BoS Auto Const Mandatory

Quest Property DLC03Acadia_BoS_Misc Auto Const Mandatory

GlobalVariable Property PlayerInstitute_Joined Auto Const Mandatory

GlobalVariable Property PlayerInstitute_KickedOut Auto Const Mandatory

Quest Property DLC03Acadia_Institute Auto Const Mandatory

Quest Property DLC03Acadia_Institute_Misc Auto Const Mandatory

GlobalVariable Property PlayerRailroad_JoinedFaction Auto Const Mandatory

GlobalVariable Property PlayerRailroad_KickedOut Auto Const Mandatory

Quest Property DLC03Acadia_RR Auto Const Mandatory

GlobalVariable Property DLC03CommonwealthFactionOnIsland Auto Const Mandatory

Quest Property pDLC03MQPostQuest Auto Const Mandatory

ReferenceAlias Property Alias_F04 Auto Const Mandatory

ReferenceAlias Property Alias_M07 Auto Const Mandatory

Idle Property pCowerSinglePlay Auto Const Mandatory

ReferenceAlias Property Alias_SmallBertha Auto Const Mandatory

ReferenceAlias Property Alias_CassieDalton Auto Const Mandatory

Faction Property pPlayerFaction Auto Const Mandatory

Faction Property pDLC03SettlementFarHarborEnemyFaction Auto Const Mandatory

GlobalVariable Property DLC03MQ06_TektusConvincedofDivision Auto Const Mandatory

Faction Property pPlayerFriendFaction Auto Const Mandatory
