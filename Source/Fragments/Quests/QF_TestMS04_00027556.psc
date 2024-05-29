;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestMS04_00027556 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Unlock Kent's door
pKentsDoor.Unlock()

; Add everyone to Kent's Killer faction
Alias_KentsKillers.AddRef(Alias_SinjinRightHand.GetActorRef())
Alias_KentsKillers.AddRef(Alias_SinjinGhoul.GetActorRef())
int index = 0
while index < Alias_SinjinsFinalGuys.GetCount()
  Alias_KentsKillers.addRef(Alias_SinjinsFinalGuys.GetAt(index))
  index += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
; Kent breaks out
;actor aKent = Alias_Kent.GetActorRef()
;actor aSinjin = Alias_SinjinGhoul.GetActorRef()
;aKent.PlayIdleWithTarget(pPairedKentHeadButtsShinjin, aSinjin)

actor aKent = Alias_Kent.GetActorRef()
aKent.SetRestrained(FALSE)                            ; Now he isn't restrained
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
pWayneDelancy.GetActorRef().SetValue(pMS04SilverShroudTarget, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; OLD: Start the scene for the Memory Den
;pScene_050_Intro.Start()

; Haven't deleted this flag because it's being used elsewhere
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
; Kent reacts to door opening
pMS04_Ambient_KentDoor.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objective
SetObjectiveCompleted(25)

; If you didn't already have the Costume, go look for it
if ( !GetStageDone(200) )
  SetObjectiveDisplayed(100, true)
endif

; If the player negotiated for more money
if ( GetStageDone(110) )
  Game.GivePlayerCaps(75)
endif

; Make Kent essential (for now)
pKentConnolly.GetActorRef().GetActorBase().SetEssential()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Objectives
if ( GetStageDone(100) )
  SetObjectiveCompleted(100)
  SetObjectiveDisplayed(200)
endif

;Give the player the Shroud Hat
pTempContainer.GetRef().RemoveItem(pMS04_SilverShroudHat.GetReference(), 1, false, Game.GetPlayer())

; Spawn the costume and give it to the player
ObjectReference oShroudCostume = pKentConnolly.GetActorRef().PlaceAtMe(pClothesSilverShroud)
pMS04_SilverShroudCostume.ForceRefTo(oShroudCostume)
Game.GetPlayer().AddItem(oShroudCostume)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Complete objective
SetObjectiveCompleted(200, true)

; Give some XP for this part of the quest
;Game.RewardPlayerXP(pXPMiscQuestSmall.GetValue() as int)

; Give the player the reward
Game.GivePlayerCaps(125)

int nExtraCaps = 0

; Check to see if the player has some memorabilia
if ( Game.GetPlayer().GetItemCount(pMS04_CollectiblePhoto) > 0 )
  Game.GetPlayer().RemoveItem(pMS04_CollectiblePhoto)
  nExtraCaps += 40
endif

if ( Game.GetPlayer().GetItemCount(pMS04_CollectiblePropGun) > 0 )
  Game.GetPlayer().RemoveItem(pMS04_CollectiblePropGun)
  nExtraCaps += 40
endif

if ( Game.GetPlayer().GetItemCount(pMS04_CollectibleSilverShroudTVScript) > 0 )
  Game.GetPlayer().RemoveItem(pMS04_CollectibleSilverShroudTVScript)
  nExtraCaps += 40
endif

; Player gets extra cap reward
Game.GivePlayerCaps(nExtraCaps)

;Temporarily remove the Costume & Hat
if ( !GetStageDone(305) )
  Game.GetPlayer().RemoveItem(pMS04_SilverShroudCostume.GetReference())
  Game.GetPlayer().RemoveItem(pMS04_SilverShroudHat.GetReference(), 1, false, pKentConnolly.GetActorRef() )
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
;Failed objective
SetObjectiveDisplayed(200, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
; Give the player something to help
Game.GetPlayer().AddItem(pSuperStimpak, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
;Show the objective
SetObjectiveDisplayed(390, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE MS04_Script
Quest __temp = self as Quest
MS04_Script kmyQuest = __temp as MS04_Script
;END AUTOCAST
;BEGIN CODE
;Show the objective
;SetObjectiveDisplayed(400, true)
SetObjectiveDisplayed(405, true)

; Play some music
pMUSReward.Add()

;Hide Quest Rejected message
SetObjectiveDisplayed(390, false)

; Give the player the silver tommy gun (and bullets)
pKentConnolly.GetActorRef().RemoveItem(Alias_SilverTommyGun.GetRef(), 1, false, Game.GetPlayer() )
Game.GetPlayer().AddItem(pAmmo556, 96)

; Add Calling Cards to player's inventory
pKentConnolly.GetActorRef().RemoveItem(pMS04CallingCard, 6, FALSE, Game.GetPlayer())
pKentConnolly.GetActorRef().RemoveItem(pMS04CallingCard, 4, TRUE, Game.GetPlayer())
pKentConnolly.GetActorRef().RemoveItem(pMS04CallingCard, 4, TRUE, Game.GetPlayer())
pKentConnolly.GetActorRef().RemoveItem(pMS04CallingCard, 4, TRUE, Game.GetPlayer())
pKentConnolly.GetActorRef().RemoveItem(pMS04CallingCard, 4, TRUE, Game.GetPlayer())
pKentConnolly.GetActorRef().RemoveItem(pMS04CallingCard, 4, TRUE, Game.GetPlayer())
Game.GetPlayer().AddPerk(pMS04CallingCardPerk)   ; Makes it so you can leave calling cards on bodies

; Remove the costume (just in case the player kept it)
Game.GetPlayer().RemoveItem(pMS04_SilverShroudCostume.GetReference())
pMS04_SilverShroudCostume.Clear()

; Get the new and improved Silver Shroud Armor
ObjectReference oShroudCostume = pKentConnolly.GetActorRef().PlaceAtMe(pMS04ShroudArmorLL)
oShroudCostume.AttachMod(pmod_Legendary_Armor_LessDMGHumans)
pMS04_SilverShroudCostume.ForceRefTo(oShroudCostume)
Game.GetPlayer().AddItem(oShroudCostume)

;Track the iLevel of the Shroud Armor
if ( Game.GetPlayer().GetLevel() >= 45 )
  pMS04ArmorLevel.SetValue(100)  ; Arbitrarily high number
elseif  ( Game.GetPlayer().GetLevel() >= 35 )
  pMS04ArmorLevel.SetValue(45)
elseif  ( Game.GetPlayer().GetLevel() >= 25 )
  pMS04ArmorLevel.SetValue(35)
else
  pMS04ArmorLevel.SetValue(25)
endif

;Got the Hat back
if ( !GetStageDone(305) )
  pKentConnolly.GetActorRef().RemoveItem(pMS04_SilverShroudHat.GetReference(), 1, false, Game.GetPlayer() )
endif

; If the PC negotiated a reward, give it to him
if ( GetStageDone(310) )
   ; TO DO: Add some sort of non money reward here
   Game.GivePlayerCaps(100)
endif

; Make people appear
pWayneDelancy.GetActorRef().Enable()

; Make the alley triggermen disappear
Alias_AlleyBadGuys.DisableAll()

; Start up the quest handler scene
pRadioSilverShroudQuest_MS04Logic.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0406_Item_00
Function Fragment_Stage_0406_Item_00()
;BEGIN CODE
; Shut down Kent's door so the player can't get in there
pKentsDoor.SetOpen(FALSE)
pKentsDoor.Lock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
;Show the objective
SetObjectiveCompleted(1100)
SetObjectiveCompleted(405)
if ( !GetStageDone(430) )  ; Is she still alive?
  SetObjectiveDisplayed(410)
endif

; Replay the radio station
pRadioSilverShroudQuest_Music.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
;Show the objective
SetObjectiveCompleted(410)
SetObjectiveDisplayed(420)

; Now make Whitechapel Charlie protected instead of essential
actor aCharlie = pWhitechapelCharlie.GetActorRef()
aCharlie.SetEssential(FALSE)
aCharlie.SetProtected(TRUE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
;Show the objective
SetObjectiveFailed(410)
SetObjectiveDisplayed(420)
SetObjectiveCompleted(405)
SetObjectiveCompleted(420)
SetObjectiveDisplayed(430)

; Make the alley triggermen reappear
Alias_AlleyBadGuys.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0435_Item_00
Function Fragment_Stage_0435_Item_00()
;BEGIN CODE
; Kendra and her goons go hostile
Alias_Kendra.GetActorRef().RemoveFromFaction(pCaptiveFaction)
pMS04KendraFaction.SetEnemy(pPlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
;Show the objective
SetObjectiveCompleted(430)

; Check if Hancock is a companion
if ( Alias_Companion.GetActorRef() == Alias_Hancock.GetActorRef() ) 
  pMS04_Ambient_HancockInterrupts.Start()    ; If he is - then he interrupts
  SetObjectiveDisplayed(598)                             ; Quest objective to talk with him
else
  SetObjectiveDisplayed(440)                             ; Otherwise, go to Goodneighbor
endif

; Give some XP for this part of the quest
;Game.RewardPlayerXP(pXPMiscQuestSmall.GetValue() as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0442_Item_00
Function Fragment_Stage_0442_Item_00()
;BEGIN CODE
; Enable the target - Shelly Tiller at the National Guard Training Facility
Alias_KendraTarget.GetActorRef().Enable()

Utility.Wait(0.1)

; Objectives
SetObjectiveDisplayed(442)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0445_Item_00
Function Fragment_Stage_0445_Item_00()
;BEGIN CODE
; Make the reward pop up
Alias_KendraAssassinReward.GetReference().Enable()

Utility.Wait(0.1)

; Objectives
SetObjectiveCompleted(442)
SetObjectiveDisplayed(445)

; If you do this branch, you're more evil
Quest __temp = self as Quest
MS04_Script kmyQuest = __temp as MS04_Script 

kmyQuest.EvilShroud += 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0449_Item_00
Function Fragment_Stage_0449_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(445)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
; Objectives
if ( !GetStageDone(480) )   ; Is he still alive?
  SetObjectiveDisplayed(450)  
endif

; This is a global to make sure Bobbi No-Nose doesn't do her forcegreet while you're fighting
pMS04AJIsActive.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0459_Item_00
Function Fragment_Stage_0459_Item_00()
;BEGIN CODE
; You didn't deal with AJ
SetObjectiveCompleted(450)

; You get a different number of caps depending on negotiations
if ( GetStageDone(456) )
  Game.GivePlayerCaps(200)
elseif ( GetStageDone(454) )
  Game.GivePlayerCaps(90)
elseif ( GetStageDone(452) )
  Game.GivePlayerCaps(75)
else
  Game.GivePlayerCaps(50)
endif

; The segment is now done
SetStage(499)

; The player is more evil in Kent's book
Quest __temp = self as Quest
MS04_Script kmyQuest = __temp as MS04_Script 

kmyQuest.EvilShroud += 1

; Check to see if the player is wearing the Shroud
if ( Game.GetPlayer().HasPerk(pMS04_Perk_Shroud_Costume) )
  SetStage(458)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
; You didn't deal with AJ
SetObjectiveFailed(450)

; The segment is now done
SetStage(499)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0470_Item_00
Function Fragment_Stage_0470_Item_00()
;BEGIN CODE
; AJ attacks
pMS04AJFaction.SetEnemy(pPlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(450)
SetObjectiveDisplayed(490)

; IF the player had made a deal with AJ, then killing him makes the player OK in Kent's book
if ( GetStageDone(459) )
  Quest __temp = self as Quest
  MS04_Script kmyQuest = __temp as MS04_Script 

  kmyQuest.EvilShroud -= 1
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(490)

; Finish this segment
SetStage(499)

; Bobbi No-Nose is free to greet the player now
pMS04AJIsActive.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0499_Item_00
Function Fragment_Stage_0499_Item_00()
;BEGIN CODE
; Make Kendra appear
pMS04KendraEnableMarker.Enable()
pMS04KendraDisableMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Show the objective
if ( !GetStageDone(590) )    ; Make sure he isn't already dead
  SetObjectiveDisplayed(500, true)  
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
; Wayne goes hostile
pMS04WayneDelancyFaction.SetEnemy(pPlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN CODE
; TODO: Succeed or fail based off of whether in costume
SetStage(590)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0590_Item_00
Function Fragment_Stage_0590_Item_00()
;BEGIN CODE
;Complete objective
SetObjectiveCompleted(500, true)
SetObjectiveDisplayed(590)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0599_Item_00
Function Fragment_Stage_0599_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(590)

; Make AJ and his bodyguards appear
pMS04AJEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Complete objectives
SetObjectiveCompleted(440)
SetObjectiveDisplayed(600, true)

; Restart the station
pRadioSilverShroudQuest_Music.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
; Give the player the reward
Game.GivePlayerCaps(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(405, true)    ; No longer need to listen to the radio
SetObjectiveCompleted(440, true)
SetObjectiveCompleted(598, true)
SetObjectiveCompleted(600, true)
SetObjectiveDisplayed(800, true)
SetObjectiveDisplayed(900, true)

; Make the LTs now appear
Alias_Northy.GetActorRef().Enable()
Alias_SmilingKate.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
; Complete objective
SetObjectiveCompleted(800, true)

; Is the other LT dead?
if ( !GetStageDone(900) )
  ; If not, give them the holotape
  Alias_Northy.GetActorRef().AddItem(Alias_Holo_SinjinsLocation.GetReference())
  SetStage(810)
else
  ; Both LTs are dead
  SetStage(950)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0802_Item_00
Function Fragment_Stage_0802_Item_00()
;BEGIN CODE
; Kate does her speech
pMS04_Ambient_SmilingKatePepTalk.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0807_Item_00
Function Fragment_Stage_0807_Item_00()
;BEGIN CODE
; End Smiling Kate's speech
pMS04_Ambient_SmilingKatePepTalk.Stop()

; Now that the player is close, have her do her force greet package
Alias_SmilingKate.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
; Smiling Kate goes hostile
pMS04SmilingKatesPosseFaction.SetEnemy(pPlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; Complete objective
SetObjectiveCompleted(900, true)

; Is the other LT dead?
if ( !GetStageDone(800) )
  ; If not, give them the holotape
  Alias_SmilingKate.GetActorRef().AddItem(Alias_Holo_SinjinsLocation.GetReference())
else
  ; Both LTs are dead
  SetStage(950)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN CODE
; Once Northy gets in combat he has a panicked conversation
pMS04_0910_NorthyIsScared.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveDisplayed(950)

; Give some XP for this part of the quest
;Game.RewardPlayerXP(pXPMiscQuestSmall.GetValue() as int)

; SET UP FOR FINAL SEQUENCE
; TODO: Ryan sets up the encounters for the area
; Make Sinjin's Ghoul appear
Alias_SinjinGhoul.GetActorRef().Enable()
Alias_SinjinRightHand.GetActorRef().Enable()

; Move Kent to the torture room
actor aKent = Alias_Kent.GetActorRef()
aKent.SetValue(Game.GetHealthAV(), 1)     ; Make him a one shot kill
aKent.MoveTo(pMarkerKentTorture)
aKent.GetActorBase().SetEssential(false)    ; Make Kent non-essential
aKent.SetRestrained()                                  ; Restain him

; Kent's room is now messed up
pMS04KentEnableMarker.Disable()

; Let Kent's door be open
pKentsDoor.Unlock()
pKentsDoor.SetOpen(TRUE)

; Register for a Sinjin combat event
RegisterForRemoteEvent(Alias_SinjinGhoul.GetActorRef(), "OnCombatStateChanged")

;Flip Enemies in Dungeon
DN146_QuestEnemyMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(950, true)
SetObjectiveDisplayed(1000, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
; You've found Kent - so complete the objective
SetObjectiveCompleted(1000)

; Play some music
pMUSDread.Add()

; If you haven't listened to the radio station - go ahead and kill this objective
if ( !GetStageDone(1100) )
  SetObjectiveDisplayed(1100, FALSE)
endif

; Now show Rescue Kent and Kill Sinjin
SetObjectiveDisplayed(1200)
SetObjectiveDisplayed(1210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1100, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(1000)
SetObjectiveCompleted(1100)
SetObjectiveDisplayed(1200)
SetObjectiveDisplayed(1210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1220_Item_00
Function Fragment_Stage_1220_Item_00()
;BEGIN CODE
; Play Sinjin on the PA
pScene_1300_SinjinMonologueStart.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1230_Item_00
Function Fragment_Stage_1230_Item_00()
;BEGIN CODE
; Sinjin has his conversation
pScene_1300_SinjinMonologueStart.Stop()   ; This conversation should be over by then, failsafe

Utility.Wait(0.1)
if ( !GetStageDone(1330) )  ; The PC didn't kill Kent, right?
  pMS04_1300b_SinjinEnd.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(1200)

; If Kent's dead, show going to Hancock
if ( GetStageDone(1350) )
   SetObjectiveDisplayed(1400)     ; Talk with Hancock
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1303_Item_00
Function Fragment_Stage_1303_Item_00()
;BEGIN CODE
; Turn off the radio station
pMS04ShroudRadioTransmitter.Disable()

; If Kent's alive, complete that objective
if ( !GetStageDone(1350) )
  SetObjectiveCompleted(1210)
  SetObjectiveDisplayed(1360)      ; Talk with Kent
  SetStage(1359)     ; Log for this case
else
   SetObjectiveDisplayed(1400)     ; Talk with Hancock
endif

actor aKent = Alias_Kent.GetActorRef()
aKent.SetRestrained(FALSE)         ; Now he isn't restrained
aKent.GetActorBase().SetProtected(TRUE)     ; And he's protected
aKent.RemoveFromFaction(pCaptiveFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1305_Item_00
Function Fragment_Stage_1305_Item_00()
;BEGIN CODE
; Kent is no longer in danger
actor aKent = Alias_Kent.GetActorRef()
aKent.AddToFaction(pCaptiveFaction)
aKent.SetValue(Game.GetHealthAV(), 100)     ; Make him have some HP again
aKent.GetActorBase().SetProtected(TRUE)     ; And he's protected

; Now they attack
;SetStage(1310)

;/
ALL OF THIS IS OLD
; Kent breaks out
actor aKent = Alias_Kent.GetActorRef()
aKent.SetRestrained(FALSE)                            ; Now he isn't restrained
aKent.SetValue(Game.GetHealthAV(), 100)     ; Make him have some HP again
aKent.GetActorBase().SetProtected(TRUE)     ; And he's protected

; Now play the paired animation
actor aSinjin = Alias_SinjinGhoul.GetActorRef()
;aSinjin.EvaluatePackage()
;Utility.Wait(0.1)
;aKent.PlayIdleWithTarget(pPairedKentHeadButtsShinjin, aSinjin)
aSinjin.PlayIdleWithTarget(pPairedKentHeadButtsShinjin, aKent)
/;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1307_Item_00
Function Fragment_Stage_1307_Item_00()
;BEGIN CODE
; Stop Sinjin's conversation
pMS04_1300b_SinjinEnd.Stop()

; Then make him attack
SetStage(1310)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1310_Item_00
Function Fragment_Stage_1310_Item_00()
;BEGIN AUTOCAST TYPE MS04_Script
Quest __temp = self as Quest
MS04_Script kmyQuest = __temp as MS04_Script
;END AUTOCAST
;BEGIN CODE
; Fight starts
; NOTE: Sinjin's package has a kill order on Kent

; Check to see if the minions have been terrified
if ( kMyQuest.bEndMinionsAfraid == 0 )
  pMS04SinjinPersonalFaction.setEnemy(pPlayerFaction, false, false) ; If they're not - set to enemy
endif

; Turn Sinjin hostile
actor aSinjin = Alias_SinjinGhoul.GetActorRef()
aSinjin.RemoveFromFaction(pMS04SinjinPersonalFaction)
pMS04SinjinSoloFaction.setEnemy(pPlayerFaction)

; Make Sinjin do his kill Kent package
aSinjin.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1320_Item_00
Function Fragment_Stage_1320_Item_00()
;BEGIN AUTOCAST TYPE MS04_Script
Quest __temp = self as Quest
MS04_Script kmyQuest = __temp as MS04_Script
;END AUTOCAST
;BEGIN CODE
; Add Sinjin's guys to the captive faction
Alias_SinjinsFinalGuys.AddToFaction(pCaptiveFaction)
Alias_SinjinsFinalGuys.EvaluateAll()

; No longer necessary to kill them to save Kent
int index = 0
while index < Alias_SinjinsFinalGuys.GetCount()
  Alias_KentsKillers.RemoveRef(Alias_SinjinsFinalGuys.GetAt(index))
  index += 1
endWhile

; Indicate Sinjin's minions aren't with him any more
kMyQuest.bEndMinionsAfraid = 1

; Make Sinjin attack
SetStage(1310)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1330_Item_00
Function Fragment_Stage_1330_Item_00()
;BEGIN CODE
; If the player hasn't talked to Kent - then end the quest
if ( !GetStageDone(100) )
  SetStage(9000)
endif

; Play a reaction scene (if the fighting hasn't started already)
if ( !GetStageDone(1310) && !GetStageDone(1300) && GetStageDone(100) )
  pMS04_1300b_SinjinEnd.Stop()   ; Stop Sinjin's scene
  pMS04_1330_PCKillsKent.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1340_Item_00
Function Fragment_Stage_1340_Item_00()
;BEGIN AUTOCAST TYPE MS04_Script
Quest __temp = self as Quest
MS04_Script kmyQuest = __temp as MS04_Script
;END AUTOCAST
;BEGIN CODE
; Add Sinjin's guys to the player faction
Alias_SinjinsFinalGuys.AddToFaction(pPlayerFaction)
Alias_SinjinsFinalGuys.EvaluateAll()

; No longer necessary to kill them to save Kent
int index = 0
while index < Alias_SinjinsFinalGuys.GetCount()
  Alias_KentsKillers.RemoveRef(Alias_SinjinsFinalGuys.GetAt(index))
  index += 1
endWhile

; Indicate Sinjin's minions aren't with him any more
kMyQuest.bEndMinionsAfraid = 1

; Start the combat
SetStage(1310)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1345_Item_00
Function Fragment_Stage_1345_Item_00()
;BEGIN AUTOCAST TYPE MS04_Script
Quest __temp = self as Quest
MS04_Script kmyQuest = __temp as MS04_Script
;END AUTOCAST
;BEGIN CODE
; Indicate Sinjin's minions aren't with him any more
kMyQuest.bEndMinionsAfraid = 1

; Start the combat
SetStage(1310)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1350_Item_00
Function Fragment_Stage_1350_Item_00()
;BEGIN CODE
; Fail the Kent optional quest
SetObjectiveFailed(1210)
SetObjectiveFailed(1300)
SetObjectiveFailed(1360)

; If Sinjin's dead already then change objectives
if ( GetStageDone(1300) )
   SetObjectiveFailed(1300)
   SetObjectiveDisplayed(1400)
endif

; Update Sinjin's package
Alias_SinjinGhoul.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1360_Item_00
Function Fragment_Stage_1360_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(1360)
SetObjectiveDisplayed(1400)

; Kent's room is now cleaned up
pMS04KentEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1370_Item_00
Function Fragment_Stage_1370_Item_00()
;BEGIN CODE
Actor aKent = Alias_Kent.GetActorRef()

; Is Kent alive?
if ( !aKent.IsDead() )
  aKent.MoveTo(Alias_Hancock.GetActorRef())   ; If so teleport to Hancock
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(1400)

; Is Kent alive?
if ( GetStageDone(380) )
  SetStage(1425)   ; If so play a custom log file
endif

; Stop the logic scene & restart the radio
pMS04_Radio_4_KentKidnapping.Stop()
pRadioSilverShroudQuest_MS04Logic.Stop()
pRadioSilverShroudQuest_Music.Start()

; Update Global for Radio News
RadioDCMS04Ready.SetValue((GameDaysPassed.GetValue() + 1))

; Stop the quest
SetStage(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
; Fire up the post quest
pMS04PostQuest.SetStage(0)

; Turn off the radio station
pMS04ShroudRadioTransmitter.Disable()

Stop()
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

;BEGIN FRAGMENT Fragment_Stage_9100_Item_00
Function Fragment_Stage_9100_Item_00()
;BEGIN CODE
; If the quest ends for any reason lose the ability to place calling cards
Game.GetPlayer().RemovePerk(pMS04CallingCardPerk)

; Potentially make Hancock non-essential
; IF Hancock is already a companion, then he's completed all his essential duties
;if ( Alias_Hancock.GetActorRef().IsInFaction(pHasBeenCompanionFaction) )
;  Alias_Hancock.GetActorRef().GetActorBase().SetEssential(FALSE)
;endif

; Disable Kendra's assassination target (and clean up objectives)
Alias_KendraTarget.GetActorRef().Disable()
if ( !GetStageDone(442) || !GetStageDone(445) )
  SetObjectiveDisplayed(442, FALSE)
  SetObjectiveDisplayed(445, FALSE)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property pMS04_DiagnosticKit Auto Const
MiscObject Property pMS04CallingCard Auto Const
Book Property pMS04_CollectiblePhoto Auto Const
MiscObject Property pMS04_CollectiblePropGun Auto Const
Holotape Property pMS04_CollectibleSilverShroudTVScript Auto Const

ReferenceAlias Property pKentConnolly Auto Const
ReferenceAlias Property pWhitechapelCharlie Auto Const
ReferenceAlias Property pWayneDelancy Auto Const
ReferenceAlias Property Alias_SmilingKate Auto Const
ReferenceAlias Property Alias_Northy Auto Const
ReferenceAlias Property Alias_Holo_SinjinsLocation Auto Const
ReferenceAlias Property Alias_SinjinGhoul Auto Const
ReferenceAlias Property Alias_SinjinRightHand Auto Const
ReferenceAlias Property Alias_Kent Auto Const
ReferenceAlias Property pMS04_SilverShroudCostume Auto Const
ReferenceAlias Property pMS04_SilverShroudHat Auto Const
ReferenceAlias Property Alias_AJ Auto Const
ReferenceAlias Property Alias_Kendra Auto Const
ReferenceAlias Property Alias_KendraTarget Auto Const
ReferenceAlias Property Alias_KendraAssassinReward Auto Const
ReferenceAlias Property Alias_Hancock Auto Const
ReferenceAlias Property pTempContainer Auto Const

ObjectReference Property pMemoryDenStart Auto Const
ObjectReference Property pMarkerKentTorture Auto Const
ObjectReference Property pMS04KentMemoryDenMarker Auto Const

Faction Property pMS04SinjinPersonalFaction Auto Const
Faction Property pPlayerFaction Auto Const
Faction Property pMS04KendraFaction Auto Const
Faction Property pMS04WayneDelancyFaction Auto Const
Faction Property pMS04SmilingKatesPosseFaction Auto Const
Faction Property pCaptiveFaction Auto Const
Faction Property pMS04AJFaction Auto Const

Scene Property pMS04_600_RadioHancock Auto Const
Scene Property pScene_Radio_KillWayne0 Auto Const
Scene Property pScene_Radio_KentKidnapping Auto Const
Scene Property pScene_1300_SinjinMonologueStart Auto Const
Scene Property pScene_1300_SinjinMonologueEnd Auto Const
Scene Property pMS04_1330_PCKillsKent Auto Const
Scene Property pMS04_1300b_SinjinEnd Auto Const
Scene Property pMS04_0910_NorthyIsScared Auto Const
Scene Property pRadioSilverShroudQuest_Music Auto Const

Message Property pMS04MessageTempSinjinDeath Auto Const
Message Property pMS04MessageTempKentTorture Auto Const
Message Property pMS04MessageTempHeroActivities Auto Const

GlobalVariable Property RadioDCMS04Ready Auto Const
GlobalVariable Property GameDaysPassed Auto Const
GlobalVariable Property pMS04ArmorLevel Auto Const

Holotape Property pMS04HolotapeSinjin Auto Const

Perk Property pMS04_Perk_Shroud_Costume Auto Const
Perk Property pMS04TrueHeroPerk Auto Const
Perk Property pMS04CallingCardPerk Auto Const

Quest Property pMS04PostQuest Auto Const

Potion Property pSuperStimpak Auto Const

ObjectReference Property DN146_QuestEnemyMarker Auto Const
ObjectReference Property pMS04AJEnableMarker Auto Const

Ammo Property pammo556 Auto Const

LeveledItem Property pMS04ShroudArmorLL Auto Const

Faction Property pHasBeenCompanionFaction Auto Const


RefCollectionAlias Property Alias_AlleyBadGuys Auto Const

ReferenceAlias Property Alias_SilverTommygun Auto Const

Scene Property pMS04_Ambient_SmilingKatePepTalk Auto Const

ObjectReference Property pMS04KentEnableMarker Auto Const

ObjectReference Property pMS04ShroudRadioTransmitter Auto Const

ReferenceAlias Property Alias_Companion Auto Const

Scene Property pMS04_Ambient_HancockInterrupts Auto Const

RefCollectionAlias Property Alias_SinjinsFinalGuys Auto Const

ObjectReference Property pMS04KendraEnableMarker Auto Const

GlobalVariable Property pMS04AJIsActive Auto Const

Scene Property pMS04_Ambient_KentDoor Auto Const

Idle Property pPairedKentHeadButtsShinjin Auto Const

ObjectReference Property pKentsDoor Auto Const

ActorValue Property pMS04SilverShroudTarget Auto Const

RefCollectionAlias Property Alias_KentsKillers Auto Const

ObjectReference Property pMS04KendraDisableMarker Auto Const

Faction Property pMS04SinjinSoloFaction Auto Const

Scene Property pMS04_Radio_1_KillWayne Auto Const

Scene Property pRadioSilverShroudQuest_MS04Logic Auto Const

Scene Property pMS04_Radio_4_KentKidnapping Auto Const

MusicType Property pMUSReward Auto Const

MusicType Property pMUSDread Auto Const

Keyword Property pFeaturedItem Auto Const Mandatory

Armor Property pClothesSilverShroud Auto Const Mandatory

ObjectMod Property pmod_Legendary_Armor_LessDMGHumans Auto Const Mandatory
