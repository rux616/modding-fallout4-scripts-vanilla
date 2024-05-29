;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS17_00022A08 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Open and unlock the office door (where Brian is at the start)
Alias_OfficeDoor.GetRef().Unlock(TRUE)
Alias_OfficeDoor.GetRef().SetOpen(TRUE)

; Make it so the real broken radio is non-interactive
Alias_ExploreOfficeRadio.GetRef().BlockActivation(TRUE, TRUE)

; Wait a half second - let the bodies fall
Utility.Wait(0.5)

; Then enable the caravan
Alias_InvestigateCaravanSpawner.GetReference().Enable()

; Make it so Penny's key in the shop is not havok enabled
;Alias_ExplorePennysKeyInShop.GetRef().SetMotionType(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
actor aTarg = pDiscountDan.GetActorRef()
aTarg.AddToFaction(pPlayerFaction)    ; Make Dan an ally of the player
aTarg.EvaluatePackage()                       ; EVP to make Dan travels to Covenant HQ
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start Discount Dan's introduction
pMS17_050_IntroDan.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
; If Dan dies and you didn't learn about Synths, kill the objective
if ( !GetStageDone(245) )
  SetObjectiveDisplayed(245, FALSE)
endif

SetObjectiveFailed(210)
SetObjectiveFailed(245)
SetObjectiveFailed(500)

; NOT NECESSARY - but if we turn off essential on Honest Dan around here - then this code block could be useful
; If you've rescued Amelia and haven't completed the quest - then point to Stockton
;if ( !GetStageDone(700) && GetStageDone(470) )
;  SetStage(600)   ; Now you can go to Stockton
;endif

; If the quest hasn't started, then fail it
if ( !GetStageDone(200) )
  SetStage(770)
endif

; PATCH 3 - If you're objective is to talk with Dan and you kill him, fail the quest
if ( GetStageDone(500) )
  SetStage(770)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
; Disable the CV blocking people from using the door
pCovenantMainDoorCV.Disable()

if ( !GetStageDone(175) )
  ; Everyone goes hostile now
  pCovenantHQSecurityFaction.SetEnemy(pPlayerFaction)
  pCovenantFaction.SetEnemy(pPlayerFaction)
  pMS17HonestDanFaction.SetEnemy(pPlayerFaction)

  ; End the quest
  ;SetStage(800)
else
  ; Go ahead and shut the main gate door
  pMS17CovenantMainGate.SetOpen(FALSE)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
; Evaluate Swanson's package to get him to move fast
;Utility.Wait(0.1)
Alias_Swanson.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE ms17questscript
Quest __temp = self as Quest
ms17questscript kmyQuest = __temp as ms17questscript
;END AUTOCAST
;BEGIN CODE
; Make it so the player can't move
kmyQuest.LockPCControls(TRUE)

; End his waiting scene (failsafe)
pMS17_060_SwansonWaiting.Stop()

;Show the new objective
pHumanTest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN AUTOCAST TYPE ms17questscript
Quest __temp = self as Quest
ms17questscript kmyQuest = __temp as ms17questscript
;END AUTOCAST
;BEGIN CODE
; Make it so the player can move again
kmyQuest.LockPCControls(FALSE)

; Enable the trigger for a companion line
pCIS_EnterCovenantTrigger.Enable()

; Play a scene to unlock the gate
pMS17_150b_OpenGate.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0179_Item_00
Function Fragment_Stage_0179_Item_00()
;BEGIN CODE
; Unlock the Covenant Gate
pMS17CovenantMainGate.Unlock()

; Disable the CV blocking people from using the door
pCovenantMainDoorCV.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
; Unlock the Covenant Gate
pMS17CovenantMainGate.Unlock()
pMS17CovenantMainGate.SetOpen()

; Disable the CV blocking people from using the door
pCovenantMainDoorCV.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE ms17questscript
Quest __temp = self as Quest
ms17questscript kmyQuest = __temp as ms17questscript
;END AUTOCAST
;BEGIN CODE
; Objectives
if ( !GetStageDone(300) )  ; If the player DOESN'T know about the HQ's location
  SetObjectiveDisplayed(200, TRUE)
  SetObjectiveDisplayed(205)
else
  SetObjectiveDisplayed(210, true)
  SetObjectiveDisplayed(300, true)
endif

; If the player doesn't know anything about Synths and they've been mentioned before - new objective
if ( GetStageDone(240) && pPlayerKnowsSynths.GetValue() == 0 )
  SetObjectiveDisplayed(245)
endif

;Make Honest Dan essential
pDiscountDan.GetActorRef().GetActorBase().SetEssential()

; Clear the generic settler from the intro package
;Alias_DanIntroPartner.Clear()

; Spawn the caravan
Alias_InvestigateCaravanSpawner.GetReference().Enable()

; Give the player a book with Stockton details
Game.GetPlayer().AddItem(pMS17StocktonBook)

; Give you caps if you negotiated for it
if ( kmyQuest.bDanPromisesCapsUpFront == 1 )
  Game.GivePlayerCaps(50)
endif

; Send the event to enable the investigate markers
kmyQuest.InvestigateStarts()

; Have you previously heard about Synths?
if ( GetStageDone(240) ) 
  if ( pPlayerKnowsSynths.GetValue() == 0 )   ; Have you heard nothing about Synths elsewhere?
     SetObjectiveDisplayed(245)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN CODE
; Play player reaction to blood stains
pMS17_Inv201_BloodStains.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0202_Item_00
Function Fragment_Stage_0202_Item_00()
;BEGIN CODE
; OLD: Show results of Investigation
;pMS17CameraInvestigateMessage.Show()

; Player VO reacts
pMS17_Inv202_Camera.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0203_Item_00
Function Fragment_Stage_0203_Item_00()
;BEGIN CODE
; Play investigate message
pMS17RadioInvestigateMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0204_Item_00
Function Fragment_Stage_0204_Item_00()
;BEGIN CODE
; Play the Fixed message
pMS17RadioLuckMessage.Show()

; Make the radio start playing
Alias_ExploreOfficeRadio.GetRef().BlockActivation(FALSE, FALSE)
Alias_ExploreOfficeRadio.GetRef().Activate(Game.GetPlayer())
Alias_ExploreOfficeRadio.GetRef().BlockActivation(TRUE, TRUE)

; Play the radio station
pMS17_212_Radio.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(205)

; Player VO reaction
pMS17_Inv205_Lemonade.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0207_Item_00
Function Fragment_Stage_0207_Item_00()
;BEGIN CODE
; Indicate that Penny is spooked (changes her attitude a little)
(pDialogueCovenant as DialogueCovenantScript).PennySpooked = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0208_Item_00
Function Fragment_Stage_0208_Item_00()
;BEGIN CODE
; Indicate that Talia is spooked (changes her attitude a little)
(pDialogueCovenant as DialogueCovenantScript).TaliaSpooked = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(210)

actor aTarg = pDiscountDan.GetActorRef()
aTarg.AddToFaction(pPlayerFaction)    ; Make Dan an ally of the player
aTarg.EvaluatePackage()                       ; EVP to make Dan travels to Covenant HQ
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0212_Item_00
Function Fragment_Stage_0212_Item_00()
;BEGIN CODE
; Fire off Brian complaining about the radio
pMS17_212_BrianAboutRadio.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
if ( GetStageDone(200) )   ; Are you on the quest?
  if ( pPlayerKnowsSynths.GetValue() == 0 )   ; Have you heard nothing about Synths?
     SetObjectiveDisplayed(245)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0245_Item_00
Function Fragment_Stage_0245_Item_00()
;BEGIN CODE
; Flip the objective
SetObjectiveCompleted(245)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
; Do different things depending on where you are on the quest
if ( GetStageDone(270) )  ; PC already knows where the compound is
  SetStage(300)
elseif ( GetStageDone(200) )   ; If the PC is investigating
  SetObjectiveCompleted(200)  ; If not, update objectives
  SetObjectiveDisplayed(250)  ; If not, update objectives
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
; Flag that the player KA Compound
SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
; If you know about Compound, too, flag next objective
if ( GetStageDone(250) )
  SetStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Hide old objective
if ( GetStageDone(200) )   ; If the PC is investigating
  SetObjectiveCompleted(200)
  SetObjectiveCompleted(250)

  ; Show next objective
  SetObjectiveDisplayed(210, true)
  SetObjectiveDisplayed(300, true)
endif

; Fail the optional objective if it hasn't been completed
if ( !GetStageDone(205) )
  SetObjectiveDisplayed(205, FALSE)
endif

; Make Jacob Orden move
Alias_JacobOrden.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0306_Item_00
Function Fragment_Stage_0306_Item_00()
;BEGIN CODE
; Give the player 100 caps
Game.GivePlayerCaps(100)

; Jacob has warned the player
SetStage(305)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0307_Item_00
Function Fragment_Stage_0307_Item_00()
;BEGIN CODE
; Flag that Jacob has been talked to
SetStage(305)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0308_Item_00
Function Fragment_Stage_0308_Item_00()
;BEGIN CODE
; Get Dan to the spot he belongs at
pDiscountDan.GetActorRef().MoveTo(pMS17DanToCompoundMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
; If the player found this on his own, close out the open objectives
SetObjectiveCompleted(250)
SetObjectiveCompleted(300)
SetObjectiveDisplayed(320)

; If Dan's a follower, make him follow close
if ( GetStageDone(210) )
  ;Followers.FollowerSetDistanceNear(pDiscountDan.GetActorRef())

   ; If Dan is with the PC he becomes a follower here
   Followers.FollowerFollow(pDiscountDan.GetActorRef())
   pDiscountDan.GetActorRef().EvaluatePackage()
   ;pDiscountDan.GetActorRef().MoveTo(pMS17DanInHQ)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0312_Item_00
Function Fragment_Stage_0312_Item_00()
;BEGIN CODE
; Manny halts the player - gives a warning
if ( GetStageDone(307) )    ; Checks to see if the player made a deal with Jacob to be here
  pMS17_310b_CompoundExpected.Start()
else  
  pMS17_310a_Compound_Intro.Start()  ; If the player is unexpected
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0315_Item_00
Function Fragment_Stage_0315_Item_00()
;BEGIN CODE
; End the conversations
pMS17_310a_Compound_Intro.Stop()
pMS17_310b_CompoundExpected.Stop()

; If the player has got an escort
if ( GetStageDone(350) )
  Alias_DoctorChambers.GetActorRef().AddToFaction(pCovenantHQSecurityFaction)  ; Then Chambers will join in the fight
endif

; Change the faction's hostility
utility.wait(1)
pCovenantHQSecurityFaction.SetEnemy(pPlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
; Disable the Sleeping Bag - not using a workshop beg
pMS17ClueSleepingBagREF.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0331_Item_00
Function Fragment_Stage_0331_Item_00()
;BEGIN CODE
; Fires on Manny's death
if ( GetStageDone(210) )   ; If Dan is an ally
  pMS17_330_DanComment1.Start()
endif

; Make the player hostile
SetStage(315)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0332_Item_00
Function Fragment_Stage_0332_Item_00()
;BEGIN CODE
; Fires when in the first room
if ( Alias_GuardManny.GetActorRef().IsDead() )
  pMS17_330_DanComment2.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0333_Item_00
Function Fragment_Stage_0333_Item_00()
;BEGIN CODE
; First in the first corridor
if ( Alias_GuardManny.GetActorRef().IsDead() )
  pMS17_330_DanComment3.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0334_Item_00
Function Fragment_Stage_0334_Item_00()
;BEGIN CODE
; Dan makes a comment at the bridge
if ( Alias_GuardManny.GetActorRef().IsDead() )
  pMS17_330_DanComment4.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0335_Item_00
Function Fragment_Stage_0335_Item_00()
;BEGIN CODE
; Dan @ Torture Rooms
if ( Alias_GuardManny.GetActorRef().IsDead() )
  pMS17_330_DanComment5.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0336_Item_00
Function Fragment_Stage_0336_Item_00()
;BEGIN CODE
; Comments inside meeting room
if ( Alias_GuardManny.GetActorRef().IsDead() )
  pMS17_330_DanComment6.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0337_Item_00
Function Fragment_Stage_0337_Item_00()
;BEGIN CODE
; Before the final fight
if ( Alias_GuardManny.GetActorRef().IsDead() )
  pMS17_330_DanComment7.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0338_Item_00
Function Fragment_Stage_0338_Item_00()
;BEGIN CODE
; Dan comment near turrets
if ( Alias_GuardManny.GetActorRef().IsDead() )
  pMS17_330_DanComment8.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
; Disable the auto attack trigger
pMS17TooCloseToMannyTrigger.Disable()

; Make the radio start playing the Torture scene loop
pBlytheRadio.BlockActivation(FALSE, FALSE)
pBlytheRadio.Activate(Game.GetPlayer())
pMS17_315b_TortureSounds.Start()
pBlytheRadio.BlockActivation(TRUE, TRUE)

; Play Manny's Escort Scene
pMS17_315_MannyEscort.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objective
SetObjectiveCompleted(300)
SetObjectiveCompleted(320)

; Show next objective
if ( !GetStageDone(740) )
  SetObjectiveDisplayed(400, true)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
; Move Dan nearby if appropriate
if ( GetStageDone(210) && !pDiscountDan.GetActorRef().IsDead() )
   pDiscountDan.GetActorRef().MoveTo(pMS17DanTeleportMarker)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0407_Item_00
Function Fragment_Stage_0407_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(320)
SetObjectiveDisplayed(400)
SetObjectiveDisplayed(407)

; Amelia gets killed scene
pMS17_400c_ChambersKillsAmelia.Start()

; Block picking open the door
pMS11AmeliaJailDoor.BlockActivation(TRUE, TRUE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0408_Item_00
Function Fragment_Stage_0408_Item_00()
;BEGIN CODE
; Unprotect Amelia, reduce her HP
actor aTarg = Alias_AmeliaStockton.GetActorRef()
aTarg.GetActorBase().SetProtected(FALSE)
aTarg.GetActorBase().SetEssential(FALSE)
aTarg.SetValue(Game.GetHealthAV(), 1) 

; Spring the trap
pMS17AmeliaDeathTrap.Activate(pMS17AmeliaDeathTrap)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0409_Item_00
Function Fragment_Stage_0409_Item_00()
;BEGIN AUTOCAST TYPE ms17questscript
Quest __temp = self as Quest
ms17questscript kmyQuest = __temp as ms17questscript
;END AUTOCAST
;BEGIN CODE
; Objectives
SetObjectiveFailed(400)
SetObjectiveCompleted(407)
SetObjectiveDisplayed(740)

; If Chambers already died (can happen) then fail the quest
if ( GetStageDone(450) )
  SetStage(770)
endif

; Open the door
pMS17FinalJailLink.GetNthLinkedRef(1).Unlock()
pMS17FinalJailLink.GetNthLinkedRef(1).SetOpen()

; Close off all the investigates
kmyQuest.InvestigateStarts(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
; Complete old objective
SetObjectiveCompleted(300)

; Dialog mentions the PC will get the same bounty that Stockton would pay (700)
Game.GivePlayerCaps(300)

; Flag that Chambers has been talked to
SetStage(400)

SetStage(740)                                   ; NO - otherwise the quest is over
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
actor aTarg = pDiscountDan.GetActorRef()
aTarg.RemoveFromFaction(pPlayerFaction)    ; Dan no longer an ally of the player
pMS17HonestDanFaction.SetEnemy(pPlayerFaction)   ; Now he's the enemy
aTarg.GetActorBase().SetEssential(FALSE)     ; Dan is no longer essential
aTarg.EvaluatePackage()

; Queue up Chamber's scene
SetStage(407)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
; Chambers killed
SetObjectiveFailed(407)

; Make the compound go hostile
SetStage(315)

; If Amelia has been killed then the quest fails
if ( GetStageDone(409) )
  SetStage(770)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
; Objectives
if ( !GetStageDone(470) )   ; If she hasn't been rescued
  SetObjectiveDisplayed(400)   ; Then say Rescue her
endif
SetObjectiveCompleted(320)

; If you aren't working with Honest Dan update the quest (or he's been killed)
if ( !GetStageDone(210) || GetStageDone(70) )
  SetStage(600)   ; If so talk with Old Man Stockton
endif

; Was she was just rescued?
if ( GetStageDone(470) )
  pMS17_470b_AmeliaFreed.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0465_Item_00
Function Fragment_Stage_0465_Item_00()
;BEGIN CODE
; Now you've rescued the girl
SetStage(470)

; TODO - play a scene of her getting out, unlock her cell door
pMS17FinalJailLink.GetNthLinkedRef(1).Unlock()
pMS17FinalJailLink.GetNthLinkedRef(1).SetOpen()
;pMS17FinalJailLink.GetNthLinkedRef(2).Unlock()
;pMS17FinalJailLink.GetNthLinkedRef(2).SetOpen()
;pMS17FinalJailLink.GetNthLinkedRef(3).Unlock()
;pMS17FinalJailLink.GetNthLinkedRef(3).SetOpen()

Debug.Trace(pMS17FinalJailLink.GetNthLinkedRef(1))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0467_Item_00
Function Fragment_Stage_0467_Item_00()
;BEGIN CODE
; Amelia's cell door is opened by any means

; If Amelia is alive then proceed with the quest - she's rescued
if ( !GetStageDone(760) )
  SetStage(470)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0470_Item_00
Function Fragment_Stage_0470_Item_00()
;BEGIN AUTOCAST TYPE ms17questscript
Quest __temp = self as Quest
ms17questscript kmyQuest = __temp as ms17questscript
;END AUTOCAST
;BEGIN CODE
; Stop all scenes with Doctor Chambers
pMS17_400_Chambers.Stop()
pMS17_400a_ChambersPeaceful.Stop()
pMS17_400b_ChambersPeacefulEnding.Stop()

; If you're working with Dan, then next step is talking with him (and make sure Dan's alive)
if ( GetStageDone(210) && !GetStageDone(70) )
  SetStage(500)
  SetObjectiveCompleted(320)
elseif ( GetStageDone(200) || GetStageDone(460) )  ; If you're looking for her or talked with her proceed
  SetStage(600)   ; Otherwise, talk with Old Man Stockton
  SetObjectiveCompleted(320)
endif

; Make the compound go hostile
SetStage(315)

; Open the quick exit
pCovenantHQFastExitChain.Activate(Game.GetPlayer())

; Open the door, Amelia says something, then runs out
if ( GetStageDone(200) || GetStageDone(460) )  ; If you're looking for her or talked with her proceed
  pMS17_470b_AmeliaFreed.Start()
endif

; Covenant goes hostile now
pCovenantFaction.SetEnemy(pPlayerFaction)

; Close off all the investigates
kmyQuest.InvestigateStarts(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN CODE
; When she gets to the door - make her disappear forever
Alias_AmeliaStockton.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
; Dan goes hostile
actor aTarg = pDiscountDan.GetActorRef()
aTarg.RemoveFromFaction(pPlayerFaction)    ; Dan no longer an ally of the player
aTarg.AddToFaction(pMS17HonestDanFaction)    ; Make sure Dan is in the right faction
pMS17HonestDanFaction.SetEnemy(pPlayerFaction)  ; Now he's the enemy
aTarg.GetActorBase().SetEssential(FALSE)     ; Dan is no longer essential
aTarg.EvaluatePackage()

; Dan reacts to this happening
if ( GetStageDone(210) )
  pMS17_DanReactsToAttackingAmelia.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Hide old objective
SetObjectiveCompleted(320)
SetObjectiveCompleted(400)

; Show next objective
SetObjectiveDisplayed(500, true)

; TODO: Remove this - Discount Dan would be with you in future versions of the plot
pDiscountDan.GetActorRef().Enable()
pDiscountDan.GetActorReference().MoveTo(game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Hide old objective
SetObjectiveCompleted(400)
SetObjectiveCompleted(500)
SetObjectiveDisplayed(210, FALSE)     ; Make the optional objective go away

; Disable Honest Dan
if ( !GetStageDone(210) )
  pDiscountDan.GetActorRef().Disable()
endif

; Show next objective
SetObjectiveDisplayed(600, true)

; TODO: Move Old Man Stockton to the right location
pOldManStockton.GetActorRef().Enable()

; Make Old Man Stockton friendly
;pOldManStockton.GetActorRef()

; Check to see if Old Man Stockton is dead - if so fail the quest
if ( GetStageDone(715) )
  SetStage(770)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; Final XP
;Game.RewardPlayerXP(pXPMiscQuestFinal.GetValue() as int)

;Update Global for Radio News
RadioDCMS17Ready.SetValue((GameDaysPassed.GetValue() + 1))

actor aTarg = pDiscountDan.GetActorRef()
aTarg.RemoveFromFaction(pPlayerFaction)    ; Dan no longer an ally of the player
aTarg.GetActorBase().SetEssential(FALSE)     ; Dan is no longer essential

; This quest closes when Dan disables himself on his package
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0715_Item_00
Function Fragment_Stage_0715_Item_00()
;BEGIN CODE
; If you're on the quest turn in part - fail
if ( GetStageDone(600) )
  SetStage(770)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; PC gets paid
Game.GivePlayerCaps(300)

; End quest
SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0740_Item_00
Function Fragment_Stage_0740_Item_00()
;BEGIN CODE
; Objectives
CompleteAllObjectives()
SetObjectiveCompleted(740)

; Make it so that Covenant is open to the PC
SetStage(180)

; Make the player friends with security again
pCovenantHQSecurityFaction.SetEnemy(pPlayerFaction, TRUE, TRUE)

; Add the player to the Covenant Faction
Game.GetPlayer().AddToFaction(pCovenantFaction)

; Final XP
;Game.RewardPlayerXP(pXPMiscQuestFinal.GetValue() as int)

; Fail the rescue objective (and talk to Dan)
SetObjectiveFailed(210)
SetObjectiveFailed(400)
CompleteAllObjectives()

; If you're not working with Dan, then make him go away
if ( !GetStageDone(210) )
  pDiscountDan.GetActorRef().Disable()
endif

; Flag that Chambers has been talked to
SetStage(400)

; End quest
SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0760_Item_00
Function Fragment_Stage_0760_Item_00()
;BEGIN CODE
actor aTarg = pDiscountDan.GetActorRef()
if ( aTarg.Is3DLoaded() )
  aTarg.RemoveFromFaction(pPlayerFaction)    ; Dan no longer an ally of the player
  aTarg.GetActorBase().SetEssential(FALSE)     ; Dan is no longer essential
  aTarg.AddToFaction(pREPlayerEnemy)            ; Dan is now an enemy of the player
  aTarg.EvaluatePackage()
else
  aTarg.Disable()        ; If Dan isn't loaded, just make him go away
endif

if ( !GetStageDone(407) )  ; Is Amelia dying not intentional?
  SetStage(770)
else
  SetStage(409)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0765_Item_00
Function Fragment_Stage_0765_Item_00()
;BEGIN CODE
; Disable the CV blocking people from using the door
pCovenantMainDoorCV.Disable()

; If the quest ends because the game's ended disable Dan
pDiscountDan.GetActorRef().Disable()
SetStage(180)   ; Open the gate
SetStage(770)   ; Close the quest
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0770_Item_00
Function Fragment_Stage_0770_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
actor aTarg = pDiscountDan.GetActorRef()
aTarg.RemoveFromFaction(pPlayerFaction)    ; Dan no longer an ally of the player

CompleteAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE ms17questscript
Quest __temp = self as Quest
ms17questscript kmyQuest = __temp as ms17questscript
;END AUTOCAST
;BEGIN CODE
; Unlock the Covenant Gate
pMS17CovenantMainGate.Unlock()

; Disable the CV blocking people from using the door
pCovenantMainDoorCV.Disable()

; Close off all the investigates
kmyQuest.InvestigateStarts(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property pHiddenHQIntercom Auto Const

ReferenceAlias Property pDiscountDan Auto Const
ReferenceAlias Property pHiddenHQDoor Auto Const
ReferenceAlias Property pOldManStockton Auto Const

Scene Property pHumanTest Auto Const

Message Property pMessageClue1 Auto Const
Message Property pMS17DebugCompoundInfo Auto Const

GlobalVariable Property pMS17_QuestionAnswer Auto Const

Quest Property qMS17 Auto Const

Activator Property pMS17_KidnapClue Auto Const



ObjectReference Property pCovenantHQEntranceMarker Auto Const

ObjectReference Property pMS17DanInHQ Auto Const

ObjectReference Property pMS17DanFinale Auto Const

ObjectReference Property pMS17CovenantMainGate Auto Const

Message Property pMS17DebugPublicTerminal Auto Const

Scene Property pMS17_050_IntroDan Auto Const

ReferenceAlias Property Alias_DanIntroPartner Auto Const

Message Property pMS17BloodInvestigateMessage Auto Const

ReferenceAlias Property Alias_InvestigateCaravanSpawner Auto Const

Message Property pMS17CameraInvestigateMessage Auto Const

Message Property pMS17RadioInvestigateMessage Auto Const

Message Property pMS17RadioLuckMessage Auto Const

ReferenceAlias Property Alias_ExploreOfficeRadio Auto Const

ReferenceAlias Property Alias_OfficeDoor Auto Const

Scene Property pMS17_212_BrianAboutRadio Auto Const

ReferenceAlias Property Alias_ExplorePennysKeyInShop Auto Const

Quest Property pDialogueCovenant Auto Const

Scene Property pMS17_150b_OpenGate Auto Const

Book Property pMS17StocktonBook Auto Const

Faction Property pCovenantHQSecurityFaction Auto Const

Faction Property pPlayerFaction Auto Const

ReferenceAlias Property Alias_Swanson Auto Const

Scene Property pMS17_310a_Compound_Intro Auto Const

Scene Property pMS17_310b_CompoundExpected Auto Const

ReferenceAlias Property Alias_GuardManny Auto Const

Quest Property pFollowers Auto Const

FollowersScript Property Followers Auto Const


ReferenceAlias Property Alias_AmeliaStockton Auto Const

Scene Property pMS17_470b_AmeliaFreed Auto Const

ObjectReference Property pMS17FinalJailLink Auto Const

Scene Property pMS17_315_MannyEscort Auto Const

ObjectReference Property pMS17PowerLiftButton Auto Const

Scene Property pMS17_330_DanComment1 Auto Const

Scene Property pMS17_330_DanComment2 Auto Const

Scene Property pMS17_330_DanComment3 Auto Const

Scene Property pMS17_330_DanComment4 Auto Const

Scene Property pMS17_330_DanComment5 Auto Const

Scene Property pMS17_330_DanComment6 Auto Const

Scene Property pMS17_330_DanComment7 Auto Const

Scene Property pMS17_330_DanComment8 Auto Const

Scene Property pMS17_Inv201_BloodStains Auto Const

Scene Property pMS17_Inv202_Camera Auto Const

Scene Property pMS17_Inv205_Lemonade Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCMS17Ready Auto Const

Scene Property pMS17_212_Radio Auto Const

Faction Property pREPlayerEnemy Auto Const

Faction Property pMS17HonestDanFaction Auto Const

Scene Property pMS17_400c_ChambersKillsAmelia Auto Const

ObjectReference Property pMS17AmeliaDeathTrap Auto Const

GlobalVariable Property pPlayerKnowsSynths Auto Const

ObjectReference Property pBlytheRadio Auto Const

Scene Property pMS17_315b_TortureSounds Auto Const

ObjectReference Property pMS17TooCloseToMannyTrigger Auto Const

Faction Property pCovenantFaction Auto Const

ObjectReference Property pMS17DanTeleportMarker Auto Const

Scene Property pMS17_DanReactsToAttackingAmelia Auto Const

ObjectReference Property pMS11AmeliaJailDoor Auto Const

ObjectReference Property pCovenantHQFastExitChain Auto Const

ObjectReference Property pCovenantMainDoorCV Auto Const

ObjectReference Property pMS17DanToCompoundMarker Auto Const

Scene Property pMS17_060_SwansonWaiting Auto Const

MusicType Property pMUSzCombat Auto Const

ReferenceAlias Property Alias_JacobOrden Auto Const

Scene Property pMS17_400_Chambers Auto Const

Scene Property pMS17_400a_ChambersPeaceful Auto Const

Scene Property pMS17_400b_ChambersPeacefulEnding Auto Const

ObjectReference Property pCIS_EnterCovenantTrigger Auto Const Mandatory

Activator Property pMS17ClueSleepingBag Auto Const Mandatory

ObjectReference Property pMS17ClueSleepingBagREF Auto Const Mandatory

ReferenceAlias Property Alias_DoctorChambers Auto Const Mandatory
