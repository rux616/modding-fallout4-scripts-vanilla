;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CZ_0002074B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(CZDebugMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Actor Cait = Alias_Cait.GetActorReference()
Actor CaitsCombatant = Alias_CaitsCombatant.GetActorReference()
Actor Tommy = Alias_Tommy.GetActorReference()

;Add Limitless health spells, damage reduction perk to Cait, Combatant
Cait.addSpell(CZ_LimitlessHealth)
Cait.addPerk(CZ_ReduceDamage)
CaitsCombatant.addSpell(CZ_LimitlessHealth)
CaitsCombatant.addPerk(CZ_ReduceDamage)

;Make Tommy and Cait ignore player hits
Cait.IgnoreFriendlyHits()
Tommy.IgnoreFriendlyHits()

;Make Cait and Tommy Player allies
Tommy.AddToFaction(CZ_TommyCaitPlayerAllyFaction)
Cait.AddToFaction(CZ_TommyCaitPlayerAllyFaction)

;Make Tommy and Cait Immune to Poison
Cait.addPerk(ImmuneToPoison)
Tommy.addPerk(ImmuneToPoison)

;Make Tommy, Cait immune to Hold Up
Cait.AddKeyword(ImmuneToHoldupKeyword)
Tommy.AddKeyword(ImmuneToHoldupKeyword)

;Block pickpocketing on Cait and Tommy
Alias_CaitNoPickpocket.ForceRefTo(Cait)
Alias_TommyNoPickpocket.ForceRefTo(Tommy)

;Have Combatant attack Cait
CaitsCombatant.SetValue(Game.GetAggressionAV(),1)
Cait.StartCombat(Alias_CaitsCombatant.GetActorReference())
CaitsCombatant.StartCombat(Alias_Cait.GetActorReference())

;Get that crowd roaring
((self as Quest) as DefaultCrowdEventManager).CreateCrowdInLoadedArea()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;See script attached to CaitsCombatant

if Alias_Cait.GetActorRef().PlayIdleWithTarget(PairedKill, Alias_CaitsCombatant.GetActorRef())
  debug.trace(self + "Cait kills Opponent anim SUCCESSFUL")
Else
  debug.trace(self + "Cait kills Opponent anim FAILED")
EndIf

;Pull limitless health off combatant
Alias_CaitsCombatant.GetActorReference().RemoveSpell(CZ_LimitlessHealth)

;Remove reduced damage perk
Alias_CaitsCombatant.GetActorReference().RemovePerk(CZ_ReduceDamage)
Alias_Cait.GetActorReference().RemovePerk(CZ_ReduceDamage)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE czscript
Quest __temp = self as Quest
czscript kmyQuest = __temp as czscript
;END AUTOCAST
;BEGIN CODE
;Start Tommy's scene if player is in cell. Otherwise, start Raider attack
if Game.GetPlayer().GetParentCell() == CombatZone01
  if !self.GetStageDone(250)
    CZ_Scene_TommyIntro.Start()
  endif

  ;If Stage 150 hasn't been set, set it now
  if !GetStageDone(150)
    SetStage(150)
  endif
else
  if !GetStageDone(250)
    SetStage(250)
  endif
endif

Alias_Cait.GetActorReference().RemoveSpell(CZ_LimitlessHealth)

Actor CaitRef = Alias_Cait.GetActorReference()
CaitRef.ResetHealthAndLimbs()
debug.trace(self + "STAGE 200 WILL HEAL CAIT NOW")
int waitingFor
while CaitRef.GetValue(Game.GetHealthAV()) < 0 && waitingFor< 30
	debug.trace(self + "waiting for Cait's health to restore before removing buff. WatingFor: " + waitingFor)
	waitingFor+= 1
	utility.wait(1)
endwhile

;try a few times to get her to play the triumphant idle, then give up
if !GetStageDone(250)
    kmyquest.PlayTriumphantIdle(Alias_Cait)
else
    Alias_Cait.GetActorRef().EvaluatePackage()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0204_Item_00
Function Fragment_Stage_0204_Item_00()
;BEGIN AUTOCAST TYPE czscript
Quest __temp = self as Quest
czscript kmyQuest = __temp as czscript
;END AUTOCAST
;BEGIN CODE
kmyquest.SpotlightPlayer(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
Alias_Tommy.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;SetObjectiveCompleted(200)
;((self as quest) as  DefaultEventCameraQuestScript). PlayCamera(0)
;((self as quest) as CZScript).SetupMatch(Combatant1Ref = Game.GetPlayer(), Combatant2Ref = Alias_Cait.GetActorReference())
;DN134.SetLiftButtonActive(IsLiftOne = false, shouldBeActive = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN AUTOCAST TYPE czscript
Quest __temp = self as Quest
czscript kmyQuest = __temp as czscript
;END AUTOCAST
;BEGIN CODE
kmyquest.SpotlightPlayer(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN AUTOCAST TYPE czscript
Quest __temp = self as Quest
czscript kmyQuest = __temp as czscript
;END AUTOCAST
;BEGIN CODE
if !self.GetStageDone(250)
  self.SetStage(250)
endif

;Make player enemy of Raiders
;CZ_Faction.SetEnemy(PlayerFaction)
;Alias_RaiderScene01.GetActorRef().StartCombat(Game.GetPlayer())

;Combat starts with crowd
kmyquest.SetRaiderAggression(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0243_Item_00
Function Fragment_Stage_0243_Item_00()
;BEGIN CODE
if !self.GetStageDone(250)
  ;debug.messagebox("Stage 243 hit!")
  CZ_Scene_PlayerAttacksRaiders.Start()
  self.SetStage(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0245_Item_00
Function Fragment_Stage_0245_Item_00()
;BEGIN CODE
self.SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0247_Item_00
Function Fragment_Stage_0247_Item_00()
;BEGIN CODE
;Kick off combat stage
self.SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE czscript
Quest __temp = self as Quest
czscript kmyQuest = __temp as czscript
;END AUTOCAST
;BEGIN CODE
Actor Cait = Alias_Cait.GetActorRef()

;If Cait hasn't wrapped up fight, trigger stage 150
if !GetStageDone(150)
  SetStage(150)
endif

;End Tommy's scene if it's still playing
CZ_Scene_TommyIntro.Stop()

;Turn off invisible walls
CZ_FightConstrainerParent.Disable()

;Turn on Cait's crouch trigger
Alias_CaitCageTrigger.GetRef().Enable()

;Unlock cage door
Alias_CageDoor.GetRef().Unlock()

;Tommy runs to the cage
CZ_TommyRunsIntoCage.Start()
Alias_Tommy.GetActorRef().EvaluatePackage()

;If Cait's opponent is already dead, have her get a move on
if GetStageDone(200)
  Cait.EvaluatePackage()
  Cait.PlayIdle(StopIdle)
endif

;Pull limitless health off combatant (in case it didn't take in stage 150)
Cait.RemoveSpell(CZ_LimitlessHealth)

;Remove reduced damage perk (in case it didn't take in stage 150)
Alias_CaitsCombatant.GetActorReference().RemovePerk(CZ_ReduceDamage)
Cait.RemovePerk(CZ_ReduceDamage)

;Turn off spotlights on player, Tommy, Cait
kmyquest.SpotlightPlayer(false)

;Raider guard shouts
if !self.GetStageDone(243)
  debug.trace("Kick off Raider shout scene")
  CZ_Scene_RaidersAttack.Start()
else
  self.SetStage(248)
endif

;Set up crowd to attack
CZ_Faction.SetEnemy(PlayerFaction)
CZ_CombatantFaction.SetEnemy(PlayerFaction)
CrowdSoundMarker.Disable()
CrowdSoundMarker01.Disable()

if self.GetStageDone(247)
  Utility.Wait(2.0)
endif

;Combat starts with crowd
kmyquest.SetRaiderAggression(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0265_Item_00
Function Fragment_Stage_0265_Item_00()
;BEGIN CODE
if !self.GetStageDone(390)
  Utility.Wait(0.25)
  CZ_Scene_CaitRuns.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0267_Item_00
Function Fragment_Stage_0267_Item_00()
;BEGIN CODE
Alias_Cait.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
CZ_CaitInCage_Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0283_Item_00
Function Fragment_Stage_0283_Item_00()
;BEGIN CODE
CZ_CaitInCage_Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0285_Item_00
Function Fragment_Stage_0285_Item_00()
;BEGIN CODE
CZ_CaitInCage_Scene.Start()

if !self.GetStageDone(390)
  SetObjectiveDisplayed(290)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
CZ_Scene_TommyCaitIntro.Start()

;Start up kick-off scene for Drinking Buddy quest
DN134.SetStage(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
SetObjectiveCompleted(290)
SetObjectiveDisplayed(400)

Actor CaitRef = Alias_Cait.GetActorReference()
Actor TommyRef = Alias_Tommy.GetActorReference()

;Allow Cait and Tommy to get attacked again
Alias_Cait.GetReference().IgnoreFriendlyHits(false)
Alias_Tommy.GetReference().IgnoreFriendlyHits(false)

;Remove Cait and Tommy from Player ally faction
TommyRef.RemoveFromFaction(CZ_TommyCaitPlayerAllyFaction)
CaitRef.RemoveFromFaction(CZ_TommyCaitPlayerAllyFaction)

;Make Tommy and Cait susceptible to poison again
CaitRef.RemovePerk(ImmuneToPoison)
TommyRef.RemovePerk(ImmuneToPoison)

;Allow Tommy, Cait immune to be affected by Hold Up
CaitRef.RemoveKeyword(ImmuneToHoldupKeyword)
TommyRef.RemoveKeyword(ImmuneToHoldupKeyword)

;Allow player to pickpocket Cait and Tommy again
Alias_CaitNoPickpocket.Clear()
Alias_TommyNoPickpocket.Clear() 

;End Combat between player, Cait and Tommy
CaitRef.StopCombat()
TommyRef.StopCombat()

;Heal Cait and Tommy now take normal damage
CaitRef.ResetHealthAndLimbs()
TommyRef.ResetHealthAndLimbs()

;Remove Cait from special combat faction
CaitRef.RemoveFromFaction(CZ_SpecialCombatFaction)

;Give Cait back her shotgun
CaitRef.AddItem(CompCaitDoubleBarrelShotgun)

;Player can now loot the place
CombatZone01.SetFactionOwner(PlayerFaction)

;Start Cait and Tommy's post-battle scene
if self.GetStageDone(263)
  CZ_PostBattleCaitTommy_Scene.Start()
endif

TommyRef.EvaluatePackage()
CaitRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;End post battle chatter if it's still playing
if CZ_PostBattleCaitTommy_Scene.IsPlaying()
  CZ_PostBattleCaitTommy_Scene.Stop()
endif

;Start final convo
Alias_Cait.GetActorRef().EvaluatePackage()
Alias_Tommy.GetActorRef().EvaluatePackage()
CZ_Scene_PostBattleScene.Start()


;In case it didn't take before, allow Cait and Tommy to get attacked again
Alias_Cait.GetReference().IgnoreFriendlyHits(false)
Alias_Tommy.GetReference().IgnoreFriendlyHits(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN AUTOCAST TYPE czscript
Quest __temp = self as Quest
czscript kmyQuest = __temp as czscript
;END AUTOCAST
;BEGIN CODE
kmyquest.TurnOffCaitIntroSpotlight()
CZ_PostBattleCaitTommy_Scene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Reward)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
Alias_Cait.GetActorRef().SetAvailableToBeCompanion()
Alias_Cait.GetActorRef().EvaluatePackage()
Alias_Tommy.GetActorRef().EvaluatePackage()

;Start up post quests
CZPostQuest.SetStage(10)
;CZPostQuestDialogue.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
self.SetStage(500)
self.SetStage(490)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
;Alias_Crowd.AddToFaction(CZRaiderFaction)
Alias_Tommy.GetActorRef().StartCombat(Game.GetPlayer())
CZRaiderFaction.SendAssaultAlarm()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ArenaScript Property Arena Auto Const

ReferenceAlias Property Alias_Tommy Auto Const

ReferenceAlias Property Alias_ArenaSpawnMarker Auto Const

ReferenceAlias Property Alias_ArenaCorner1Marker Auto Const

ReferenceAlias Property Alias_ArenaCorner2Marker Auto Const

ReferenceAlias Property Alias_ArenaAnnounceMarker Auto Const

ReferenceAlias Property Alias_ArenaPlayerEntranceTrigger Auto Const

ReferenceAlias Property Alias_FrontDoor Auto Const

ReferenceAlias Property Alias_CaitsCombatant Auto Const

Scene Property CZ_Scene_TommyIntro Auto Const

ReferenceAlias Property Alias_Cait Auto Const

ReferenceAlias Property Alias_AnnouncerHeadTrackMarker1 Auto Const

ReferenceAlias Property Alias_AnnouncerHeadTrackMarker2 Auto Const

ReferenceAlias Property Alias_AnnouncerHeadTrackMarker3 Auto Const

ReferenceAlias Property Alias_AnnouncerHeadTrackMarker4 Auto Const

ReferenceAlias Property Alias_AnnouncerHeadTrackMarker5 Auto Const

Scene Property CZ_Scene_TommyCaitIntro Auto Const

ReferenceAlias Property Alias_Cage Auto Const

ReferenceAlias Property Alias_AudienceCamera Auto Const

SPELL Property CZ_LimitlessHealth Auto Const

ReferenceAlias Property Alias_StageController Auto Const

ReferenceAlias Property Alias_CageDoor Auto Const

DN134QuestScript Property DN134 Auto Const

Quest Property DN134Quest Auto Const

RefCollectionAlias Property Alias_Crowd Auto Const

Faction Property CZRaiderFaction Auto Const

Faction Property CZ_Faction Auto Const

Faction Property PlayerFaction Auto Const

RefCollectionAlias Property Alias_Attackers Auto Const

Scene Property CZ_Scene_RaidersAttack Auto Const

Scene Property CZ_TommyRunsIntoCage Auto Const

Faction Property HasBeenCompanionFaction Auto Const

Scene Property CZ_CaitInCage_Scene Auto Const

LeveledItem Property reward Auto Const

Quest Property CZPostQuest Auto Const

Cell Property CombatZone01 Auto Const

ObjectReference Property CrowdSoundMarker Auto Const

Quest Property CZMisc Auto Const

Scene Property CZ_PostBattleCaitTommy_Scene Auto Const

ObjectReference Property CZDebugMarker Auto Const

ObjectReference Property CrowdSoundMarker01 Auto Const

ObjectReference Property CrowdSoundMarker02 Auto Const

Scene Property CZ_Scene_PostBattleScene Auto Const

Scene Property CZ_Scene_PlayerAttacksRaiders Auto Const

Idle Property PairedKill Auto Const

Idle Property StopIdle Auto Const

Scene Property CZ_Scene_CaitRuns Auto Const

ReferenceAlias Property Alias_RaiderScene01 Auto Const

Faction Property CZ_SpecialCombatFaction Auto Const

Perk Property CZ_ReduceDamage Auto Const

Faction Property HandToHandNoPairedMoves Auto Const

Faction Property CZ_TommyCaitPlayerAllyFaction Auto Const

ObjectReference Property CZ_FightConstrainerParent Auto Const

Weapon Property CompCaitDoubleBarrelShotgun Auto Const

ReferenceAlias Property Alias_CaitCageTrigger Auto Const Mandatory

ReferenceAlias Property Alias_CaitNoPickpocket Auto Const Mandatory

ReferenceAlias Property Alias_TommyNoPickpocket Auto Const Mandatory

Faction Property CZ_CombatantFaction Auto Const

Perk Property ImmuneToPoison Auto Const

Keyword Property ImmuneToHoldupKeyword Auto Const
