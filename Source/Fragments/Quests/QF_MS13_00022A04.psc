;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS13_00022A04 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(220)
	; log entry
	setStage(900)
	; complete quest
	setStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
; initialize quest
kmyQuest.InitializeQuest()
; add depressed keyword to Paul
Alias_PaulPembroke.GetActorRef().AddKeyword(DepressedAnims)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DefaultCrowdEventManager
Quest __temp = self as Quest
DefaultCrowdEventManager kmyQuest = __temp as DefaultCrowdEventManager
;END AUTOCAST
;BEGIN CODE
; player triggers intro scene
MS13IntroScene.Start()
kmyQuest.CreateCrowdInLoadedArea()
; remove Nelson from LatimerCrimeFaction (so he'll react to player attacking people)
Alias_NelsonLatimer.GetActorRef().RemoveFromFaction(LatimerCrimeFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
actor paul = Alias_PaulPembroke.GetActorRef()
actor cooke = Alias_HenryCooke.GetActorRef()
(Alias_HenryCooke as MS13IntroBrawlAliasScript).InitBrawl()
(Alias_PaulPembroke as MS13IntroBrawlAliasScript).InitBrawl()

debug.trace(self + " stage 12 - starting combat")
paul.StartCombat(cooke)

debug.trace(self + " stage 12 - done")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
actor paul = Alias_PaulPembroke.GetActorRef()
actor cooke = Alias_HenryCooke.GetActorRef()

debug.trace(self + " stage 15 - IntroCookeAttack start")
if cooke.PlayIdleWithTarget(IntroCookeAttack, paul)
  debug.trace(self + " stage 15 - IntroCookeAttack SUCCESS")
endif
debug.trace(self + " stage 15 - done")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
actor paul = Alias_PaulPembroke.GetActorRef()
actor cooke = Alias_HenryCooke.GetActorRef()
paul.StopCombatAlarm()
cooke.StopCombatAlarm()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
; clear crowd alias
Alias_TaphousePatronsIntro.RemoveAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
setStage(18)
;stop intro scenes
MS13IntroScene.Stop()
MS13IntroFightScene.Stop()
MS13IntroFightScene.Start() ; for after combat is over
setStage(18)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
MS13IntroScene.Stop()
; failsafe
setStage(20)
; clear Taphouse location (so it's not reserved any more)
Alias_TaphouseLocation.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_01
Function Fragment_Stage_0025_Item_01()
;BEGIN CODE
setStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
if !MS13CookeIntro.IsPlaying()
	MS13CookeIntro.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
actor paul = Alias_PaulPembroke.GetActorRef()
actor cooke = Alias_HenryCooke.GetActorRef()

; remove Paul and Cooke from intro combat faction (special combat anim condition)
cooke.RemoveFromFaction(MS13SpecialCombatFaction)
paul.RemoveFromFaction(MS13SpecialCombatFaction)

; no longer protected
cooke.setProtected(false)
paul.SetProtected(false)

; put Nelson into LatimerCrimeFaction
Alias_NelsonLatimer.GetActorRef().SetCrimeFaction(LatimerCrimeFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
; pay initial reward
SetStage(190)
; player has agreed to help
SetStage(180)
;FollowersScript.SendAffinityEvent(self, Game.GetCommonProperties().CA__CustomEvent_Selfish)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
; remove depressed keyword from Paul
Alias_PaulPembroke.GetActorRef().RemoveKeyword(DepressedAnims)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Caps001, PaulInitialReward)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0195_Item_00
Function Fragment_Stage_0195_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Caps_Reward_Small_and_Change)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
Alias_PaulPembroke.GetActorRef().EvaluatePackage()
Alias_DarcyPembroke.GetActorRef().EvaluatePackage()
; NPCs not allowed in Taphouse until confrontation is over
kmyQuest.NPCsAllowedTaphouse = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
; Phase A done
setstage(200)
; pay reward
setstage(190)
SetObjectiveDisplayed(10)
SetObjectiveDisplayed(11, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
; Phase A done
setstage(200)
; pay reward
setstage(190)
kmyQuest.PhaseBPlayerHelping = true
SetObjectiveDisplayed(11)
; set up Darcy/Paul hello scene
MS13DarcyPaulHello.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
; Phase A done
setstage(200)
kmyQuest.PhaseBPlayerHelping = false
; post-scene comment
;CA_DialogueBump_SceneScript.SayLastDialogueBumpLine()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
; player into special combat faction (so not flagged for crime for this fight)
Game.GetPlayer().AddToFaction(MS13ConfrontationCombatFaction)
; Paul and Henry into special combat faction
Actor cooke = Alias_HenryCooke.GetActorRef()
Actor paul = Alias_PaulPembroke.GetActorRef()
cooke.AddToFaction(MS13ConfrontationCombatFaction)
paul.AddToFaction(MS13ConfrontationCombatFaction)

; make sure Darcy/Paul hello scene is stopped
MS13DarcyPaulHello.Stop()

; move Cooke into Taphouse if not there already
if cooke.GetCurrentLocation() != kmyquest.DiamondCityColonialTaphouseLocation
	cooke.MoveTo(MS13IntroSceneCookeMarker01)
endif
; move Paul into Taphouse if not there already (unless player is going alone)
if paul.GetCurrentLocation() != kmyquest.DiamondCityColonialTaphouseLocation && !GetStageDone(210)
	paul.MoveTo(MS13BConfrontCookePaulMarker001)
endif

; start Nelson intro
MS13BConfrontCookeNelsonIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
; evp Nelson to get him to leave
Alias_NelsonLatimer.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
; set by MS13PaulDies
SetObjectiveFailed(11)

; end Cooke's hostility to player
Game.GetPlayer().RemoveFromFaction(MS13SideB)
actor cooke = Alias_HenryCooke.GetActorRef()
cooke.StopCombatAlarm()

; evp Cooke to get him into new package
cooke.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
; if player isn't helping, Paul is immediately killed when hit by Cooke
if !kmyquest.PhaseBPlayerHelping
	Alias_PaulPembroke.GetActorRef().Kill()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
MS13BConfrontCookeScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stage 305")
if kmyQuest.PhaseBPlayerHelping
	; make Cooke hostile to player
	SetStage(320)
endif
; always hostile to Paul
SetStage(310)
; end scene
MS13BConfrontCookeScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
actor cooke = Alias_HenryCooke.GetActorRef()
actor paul = Alias_PaulPembroke.GetActorRef()

cooke.AddToFaction(MS13SideA)
paul.AddToFaction(MS13SideB)

; start combat - actors in special combat factions don't aggro on each other
cooke.StartCombat(paul)
paul.StartCombat(cooke)

setstage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
Alias_HenryCooke.GetActorRef().AddToFaction(MS13SideA)
Game.GetPlayer().AddToFaction(MS13SideB)
setstage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
SetStage(320)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
; confrontation "over"
setstage(400)
; if intimidate Cooke active, advance to search Cooke
if IsObjectiveDisplayed(10) || IsObjectiveDisplayed(11) || IsObjectiveDisplayed(20)
	SetObjectiveCompleted(10)
	SetObjectiveCompleted(11)
	SetObjectiveCompleted(20)
endif

; always give Cooke note and start new objective here
setStage(335)
SetObjectiveDisplayed(30) ; search Cooke

; if player came alone, report back to Paul objective
if GetStageDone(210)
	SetObjectiveDisplayed(25)
else
	; Paul scene
	MS13BAfterConfrontationPaul.Start()
endif

; Cooke gone, NPCs eat outside now
kmyQuest.CookeAtTaphouse = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0335_Item_00
Function Fragment_Stage_0335_Item_00()
;BEGIN CODE
Alias_HenryCooke.GetRef().AddItem(Alias_CookeNote.GetRef())
Alias_CookeNote.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
; Paul dies and disappears
actor paul = Alias_PaulPembroke.GetActorRef()
actor cooke = Alias_HenryCooke.GetActorRef()

paul.Kill(cooke)
paul.Disable()
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
; if player came alone, report back to Paul objective
SetObjectiveCompleted(25)
MS13BAfterConfrontationPaul.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
; if Cooke still alive, he wins
actor cooke = Alias_HenryCooke.GetActorRef()
actor paul = alias_PaulPembroke.GetActorRef()

if cooke.IsDead() == false
	if paul.IsDead() == false
		paul.Kill(cooke)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
; if Paul is dead, disable his body
Actor paul = Alias_PaulPembroke.GetActorRef()
if paul.IsDead()
  paul.Disable()
endif
; allow NPCs back into Taphouse
kmyQuest.NPCsAllowedTaphouse = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_01
Function Fragment_Stage_0390_Item_01()
;BEGIN CODE
MS13CTravelChatterCookePaul.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveFromFaction(MS13ConfrontationCombatFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
; start fight
; repeat here in case this happened AFTER the fight:
Alias_HenryCooke.GetActorRef().AddToFaction(MS13SideA)
Game.GetPlayer().AddToFaction(MS13SideB)
setstage(320)
setstage(310)
setstage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
setstage(400)
setobjectiveCompleted(10)
setobjectiveCompleted(11)

; ambush objective
setobjectiveDisplayed(100)
; FOR NOW: just set stage 450 to set up ambush
setstage(450)
; Paul goes along if he's here
if GetStageDone(210) == false
	setStage(455)
else
	; objective to talk to Paul
	SetObjectiveDisplayed(25)
endif
; Darcy not allowed to come to Taphouse anymore
kmyQuest.DarcyAllowedTaphouse = false
; Cooke gone, NPCs eat outside now
kmyQuest.CookeAtTaphouse = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
; complete search objective
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
; set up ambush
setStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0435_Item_00
Function Fragment_Stage_0435_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30) ; failsafe
SetObjectiveCompleted(40)
; ambush objective
setobjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
; Nelson dies and disappears
actor nelsonActor = Alias_NelsonLatimer.GetActorRef()
if nelsonActor.IsDead() == false
	nelsonActor.Kill()
	nelsonActor.Disable()
endif
SetStage(400)
; failsafe:
; NPCs can come back to Taphouse
kmyQuest.NPCsAllowedTaphouse = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
actor gibsonActor = Alias_Gibson.GetActorRef()
actor nelsonActor = Alias_NelsonLatimer.GetActorRef()
actor paulActor = Alias_PaulPembroke.GetActorRef()
actor henryActor = Alias_HenryCooke.GetActorRef()
actor player = Game.GetPlayer()

; enable Gibson
gibsonActor.EnableNoWait()
; move into position
gibsonActor.MoveTo(MS13ChemDealLatimerMarker001)

; don't let Gibson recover from bleedout
gibsonActor.SetNoBleedoutRecovery(true)
gibsonActor.AllowBleedoutDialogue(true)

; enable whatever other NPCs/trappings for the ambush
MS13ChemDealLatimerMarker.EnableNoWait()
Alias_AmbushGuard01.GetRef().EnableNoWait()
Alias_AmbushGuard02.GetRef().EnableNoWait()
Alias_AmbushGuard03.GetRef().EnableNoWait()

; move Nelson (if alive) into ambush alias
if !nelsonActor.IsDead()
	Alias_NelsonAtAmbush.ForceRefTo(nelsonActor)
else
	; TODO - need another option here
endif

nelsonActor = Alias_NelsonAtAmbush.GetActorRef()

; move Nelson/alternate into position
nelsonActor.MoveTo(MS13ChemDealLatimerMarker001)
; remove Nelson from crime faction (temporarily)
nelsonActor.RemoveFromFaction(LatimerCrimeFaction)

; remove mutual enemy faction
paulActor.RemoveFromFaction(MS13SideB)
player.RemoveFromFaction(MS13SideB)

; add everyone to SideA faction
henryActor.AddToFaction(MS13SideA)
paulActor.AddToFaction(MS13SideA)
player.AddToFaction(MS13SideA)

; remove from special combat faction
henryActor.RemoveFromFaction(MS13ConfrontationCombatFaction)
paulActor.RemoveFromFaction(MS13ConfrontationCombatFaction)
player.RemoveFromFaction(MS13ConfrontationCombatFaction)


; for now, make SideA and SideB neutral to each other
MS13SideA.SetEnemy(MS13SideB, true, true)

; make Paul and Henry protected? (I think this makes sense here)
henryActor.GetActorBase().SetProtected(true)
paulActor.GetActorBase().SetProtected(true)

; make Nelson unessential
nelsonActor.GetActorBase().SetEssential(false)

henryActor.EvaluatePackage()
paulActor.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
; start looping ambush scene
MS13CAmbushLooping.Start()
; NPCs can come back to Taphouse
kmyQuest.NPCsAllowedTaphouse = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN CODE
MS13CAmbushCooke.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0485_Item_00
Function Fragment_Stage_0485_Item_00()
;BEGIN CODE
MS13CAmbushPaul.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0490_Item_00
Function Fragment_Stage_0490_Item_00()
;BEGIN CODE
debug.trace(self + " stage 490")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0495_Item_00
Function Fragment_Stage_0495_Item_00()
;BEGIN CODE
; start combat for Paul and Cooke to make sure
debug.trace(self + " stage 495")
; make SideA and SideB enemy to each other
;MS13SideA.SetEnemy(MS13SideB)

; try just having them head for Trish
actor trish = Alias_Gibson.GetActorRef()
actor paul = Alias_PaulPembroke.GetActorRef()
actor cooke = Alias_HenryCooke.GetActorRef()

paul.EvaluatePackage()
cooke.EvaluatePackage()

;/
Alias_HenryCooke.GetActorRef().StartCombat(trish)
if paul.Is3DLoaded()
	paul.StartCombat(trish)
endif
/;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
debug.trace(self + " stage 500")
; failsafe:
if GetStageDone(430)
	setStage(435) ; in case player never read note but went to ambush site anyway
endif
MS13CAmbushCooke.Stop()
MS13CAmbushPaul.Stop()
MS13CAmbushLooping.Stop()
; make SideA and SideB enemy to each other
MS13SideA.SetEnemy(MS13SideB)
; start combat for Paul and Cooke to make sure
actor trish = Alias_Gibson.GetActorRef()
actor paul = Alias_PaulPembroke.GetActorRef()
Alias_HenryCooke.GetActorRef().StartCombat(trish)
if paul.Is3DLoaded()
	paul.StartCombat(trish)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN AUTOCAST TYPE defaultcounterquest
Quest __temp = self as Quest
defaultcounterquest kmyQuest = __temp as defaultcounterquest
;END AUTOCAST
;BEGIN CODE
; increment counter as if he had died (only if alive)
actor nelsonActor = Alias_NelsonAtAmbush.GetActorRef()

if !nelsonActor.IsDead()
	kmyquest.Increment()
	nelsonActor.Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0515_Item_00
Function Fragment_Stage_0515_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
; Paul one more step along the road
kmyQuest.PaulBreaksBad()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN CODE
; make Trish non-hostile so she doesn't keep aggroing
actor trish = Alias_Gibson.GetActorRef()
actor nelson = Alias_NelsonAtAmbush.GetActorRef()

; clear combat on Trish
trish.StopCombatAlarm()

; make her non-hostile
trish.RemoveFromFaction(MS13SideB)
trish.SetValue(Game.GetAggressionAV(), 0)

; Cooke approaches Trish
MS13CAmbushGibsonCookeStart.Start()

; trigger flee if not already started
nelson.RemoveFromFaction(MS13SideB)
nelson.SetValue(Game.GetAggressionAV(), 0)
nelson.StopCombatAlarm()
nelson.EvaluatePackage()

; stop combat on Cooke and Paul to keep them from chasing Nelson
Alias_HenryCooke.GetActorRef().StopCombat()
Alias_PaulPembroke.GetActorRef().StopCombat()

; update objectives
setStage(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
; make Gibson non-hostile
setstage(540)

; ambush objective done
setobjectiveCompleted(100)

; interrogate Trish
setobjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0560_Item_00
Function Fragment_Stage_0560_Item_00()
;BEGIN CODE
; NOTE: used to be in 650:
; Trish is no longer essential
; she can now recover from bleedout
actor gibson = Alias_Gibson.GetActorRef()
gibson.SetNoBleedoutRecovery(false)
; heal him so he doesn't just die
gibson.RestoreValue(Game.GetHealthAV(), 50)
gibson.GetActorBase().SetEssential(false)
; end old 650 section
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0580_Item_00
Function Fragment_Stage_0580_Item_00()
;BEGIN CODE
Alias_HenryCooke.GetActorRef().StartCombat(Alias_Gibson.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
; failsafe: complete ambush objective
SetObjectiveCompleted(100)
; player removed from special combat faction (MAYBE - should this be later?)
Game.GetPlayer().RemoveFromFaction(MS13ConfrontationCombatFaction)

; interrogate Trish done
setobjectiveCompleted(150)

; Cooke attacks Trish
if Alias_HenryCooke.GetActorRef().IsDead() == false && Alias_Gibson.GetActorRef().IsDead() == false
	MS13CAmbushCookeKillGibson.Start()
else
	; start spoils scene
	setStage(750)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
setstage(650)
; make him hostile
Alias_Gibson.GetActorRef().AddToFaction(MS13SideB)
Alias_Gibson.GetActorRef().SetValue(Game.GetAggressionAV(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0665_Item_00
Function Fragment_Stage_0665_Item_00()
;BEGIN CODE
SetObjectiveCompleted(170)
if GetStageDone(700) == false
  SetObjectiveDisplayed(180)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0680_Item_00
Function Fragment_Stage_0680_Item_00()
;BEGIN CODE
; interrogation "done"
setStage(650)

; if had the objective to kill her, complete it
if IsObjectiveDisplayed(160)
	; she's dead
	setObjectiveCompleted(160)
endif

if GetStageDone(700) == false
	; search her
	setObjectiveDisplayed(170)
endif

; failsafe - if already have note, complete objective
if GetStageDone(665)
  SetObjectiveCompleted(170)
endif

; start spoils scene
setstage(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0690_Item_00
Function Fragment_Stage_0690_Item_00()
;BEGIN CODE
; disable Gibson for now
actor gibsonActor = Alias_Gibson.GetActorRef()
if !gibsonActor.IsDead()
	gibsonActor.Disable()
endif

; start spoils scene
setStage(750)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; add map marker
FourLeafFishpackingMapMarkerRef.AddToMap()
; failsafe
SetObjectiveCompleted(170)
SetObjectiveCompleted(180)
; give misc objective to plant
;MS13MiscObj.SetStage(10)
SetObjectiveDisplayed(220)
if GetStageDone(1) ; player has already been there
	SetObjectiveCompleted(220)
	if getStageDone(800)
		setStage(1000) ; complete quest
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
; consider this means the player is letting him live (at least temporarily)
setstage(670)
; location of plant
setstage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
; give player password (silently - this is an unplayable invisible object)
Game.getPlayer().AddItem(pDN047FourLeafSecurityPassword)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stage 750. Paul dead=" + Alias_PaulPembroke.GetActorRef().IsDead() )
; if Paul didn't come or is dead, no dividing spoils
if !GetStageDone(455) || Alias_PaulPembroke.GetActorRef().IsDead()
	kmyQuest.DivideSpoils = false
else
	kmyQuest.DivideSpoils = true
	; this may need to move earlier
	SetObjectiveDisplayed(200)
	SetStage(755)
endif

; what scene to run?
if Alias_HenryCooke.GetActorRef().IsDead()
	; if Paul didn't come along, or is dead - all done - player gets everything
	if !kmyQuest.DivideSpoils
		setStage(820)
	else
		MS13EDivideSpoils.Start()
	endif
else
	MS13EDivideSpoilsCooke.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0760_Item_00
Function Fragment_Stage_0760_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
if kmyQuest.DivideSpoils== false
  setStage(820)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0770_Item_00
Function Fragment_Stage_0770_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
actor cooke = Alias_HenryCooke.GetActorRef()
if cooke.IsDead() == false
	kmyQuest.CookeVanishes = true		; so we know he's not really dead
	cooke.Disable()
	; make sure he's killable
	cooke.GetActorBase().SetProtected(false)
	cooke.GetActorBase().SetEssential(false)
	; kill him so we don't have to check multiple conditions for him being effectively "dead"
	cooke.Kill()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0790_Item_00
Function Fragment_Stage_0790_Item_00()
;BEGIN CODE
; by default, divide 50-50
setStage(810)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
; finish objective
SetObjectiveCompleted(200)

;Update Global for Radio News
RadioDCMS13Ready.SetValue((GameDaysPassed.GetValue() + 1))

actor nelsonAtAmbush = Alias_NelsonAtAmbush.GetActorRef()
actor nelson = Alias_NelsonLatimer.GetActorRef()
actor paul = Alias_PaulPembroke.GetActorRef()
actor cooke = Alias_henryCooke.GetActorRef()
actor trish = Alias_Gibson.GetActorRef()

; clear factions
paul.RemoveFromFaction(MS13SideA)
cooke.RemoveFromFaction(MS13SideA)
Game.GetPlayer().RemoveFromFaction(MS13ConfrontationCombatFaction)

; resolve ambush if not already done:
; Witness escaped?
if GetStageDone(440) == false
; 	if Nelson or Trish escaped - yes
	if nelsonAtAmbush && nelsonAtAmbush == nelson && (GetStageDone(510) || nelson.isDead() == false)
		kmyQuest.LatimerAmbushWitness = true
	endif

	if GetStageDone(690) || trish.IsDead() == false
		kmyQuest.LatimerAmbushWitness = true
	endif
endif

; Paul loot crates
debug.trace(self + " PaulShouldLootCrates = " + kmyQuest.PaulShouldLootCrates)
if kmyQuest.PaulShouldLootCrates
	MS13EDivideSpoilsPaulLootCrates.Start()
endif

; Marowski's revenge
MS13MarowskiRevenge.Start()

; Marowski not essential any more
Alias_Marowski.GetActorRef().GetActorBase().SetEssential(false)

; Trish - did she escape?

; clean up
; move Nelson back home
if nelson == nelsonAtAmbush && !nelson.IsDead()
	nelson.Enable()
	nelson.MoveToMyEditorLocation()
	; put him back in DC crime faction
	nelson.SetCrimeFaction(LatimerCrimeFaction)
endif
; failsafe:
; NPCs can come back to Taphouse
kmyQuest.NPCsAllowedTaphouse = true

; Cooke's house
kmyQuest.UpdateCookeHouseStatus()

; TODO:
; reenable Trish?
; etc.

; are all objectives complete? (player already cleared chems lab)
if GetStageDone(1)
	setStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0805_Item_00
Function Fragment_Stage_0805_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Game.GetCaps(), kmyQuest.NelsonLootAmount/2, false, Alias_PaulPembroke.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.DivideSpoils(0.5)
setStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0815_Item_00
Function Fragment_Stage_0815_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.PaulAngryAtPlayer = true
kmyQuest.DivideSpoils(0.3)
;FollowersScript.SendAffinityEvent(self, Game.GetCommonProperties().CA__CustomEvent_Selfish)
setStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0815_Item_01
Function Fragment_Stage_0815_Item_01()
;BEGIN CODE
setStage(816)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.PaulAngryAtPlayer = true
kmyQuest.DivideSpoils(0.0)
;FollowersScript.SendAffinityEvent(self, Game.GetCommonProperties().CA__CustomEvent_Selfish)
setStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0830_Item_00
Function Fragment_Stage_0830_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.PaulAngryAtPlayer = true
setStage(800)
Alias_PaulPembroke.GetActorRef().AddToFaction(MS13SideB)
Game.GetPlayer().AddToFaction(MS13SideA)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0840_Item_00
Function Fragment_Stage_0840_Item_00()
;BEGIN CODE
setStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN AUTOCAST TYPE MS13Script
Quest __temp = self as Quest
MS13Script kmyQuest = __temp as MS13Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.PaulLootCrates()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0860_Item_00
Function Fragment_Stage_0860_Item_00()
;BEGIN CODE
Alias_PaulPembroke.GetActorRef().SetOutfit(MS13PaulPembrokeRichOutfit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
FailAllObjectives()
; don't stop quest - other follow-on quests rely on aliases in here
;Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MS13IntroScene Auto Const

Scene Property MS13CookeIntro Auto Const

Scene Property MS13BConfrontCookeScene Auto Const

ReferenceAlias Property Alias_PaulPembroke Auto Const

ReferenceAlias Property Alias_HenryCooke Auto Const

ReferenceAlias Property Alias_Gibson Auto Const

ObjectReference Property MS13ChemDealLatimerMarker001 Auto Const

ReferenceAlias Property Alias_NelsonLatimer Auto Const

Scene Property MS13CAmbushLooping Auto Const

Scene Property MS13CAmbushCooke Auto Const

ReferenceAlias Property Alias_AmbushGuard01 Auto Const

ReferenceAlias Property Alias_AmbushGuard02 Auto Const

ReferenceAlias Property Alias_AmbushGuard03 Auto Const

Faction Property MS13SideA Auto Const

Faction Property MS13SideB Auto Const

Scene Property MS13CAmbushGibsonCookeStart Auto Const

ReferenceAlias Property Alias_NelsonAtAmbush Auto Const

Faction Property MS13SpecialCombatFaction Auto Const

ObjectReference Property FourLeafFishpackingMapMarkerRef Auto Const

Scene Property MS13CAmbushCookeKillGibson Auto Const

ObjectReference Property MS13ChemDealLatimerMarker Auto Const

Scene Property MS13EDivideSpoilsCooke Auto Const

Scene Property MS13EDivideSpoils Auto Const

MiscObject Property Caps001 Auto Const

Int Property PaulInitialReward = 80 Auto Const

ObjectReference Property MS13IntroSceneCookeMarker01 Auto Const

ObjectReference Property MS13BConfrontCookePaulMarker001 Auto Const

Keyword Property DepressedAnims Auto Const

Quest Property MS13MarowskiRevenge Auto Const

Scene Property MS13BAfterConfrontationPaul Auto Const

ReferenceAlias Property Alias_DarcyPembroke Auto Const

Scene Property MS13CAmbushPaul Auto Const

GlobalVariable Property XPMiscQuestSmall Auto Const

GlobalVariable Property XPMiscQuestFinal Auto Const

Book Property DN047_FourLeafSecurityPassword Auto Const

Form Property MS13ChemsLabPasswordUnplayable Auto Const

Keyword Property CA__CustomEvent_Selfish Auto Const

Book Property MS13CookeNote Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCMS13Ready Auto Const

Key Property pDN047FourLeafSecurityPassword Auto Const

Quest Property MS13IntroTaphouseSit Auto Const

Scene Property MS13BConfrontCookeNelsonIntro Auto Const

GlobalVariable Property MS13TaphouseOpen Auto Const

RefCollectionAlias Property Alias_TaphousePatronsIntro Auto Const

ReferenceAlias Property Alias_Marowski Auto Const

Scene Property MS13EDivideSpoilsPaulLootCrates Auto Const

Scene Property MS13CTravelChatterCookePaul Auto Const

Outfit Property MS13PaulPembrokeRichOutfit Auto Const

Faction Property CrimeDiamondCity Auto Const

ReferenceAlias Property Alias_CookeNote Auto Const

LocationAlias Property Alias_TaphouseLocation Auto Const

Quest Property MS13DarcyPaulHello Auto Const

Idle Property PairedAttack Auto Const
{paired H2H anim between Cooke and Paul for intro}

Idle Property IntroPaulAttack Auto Const

Idle Property IntroCookeAttack Auto Const

Scene Property MS13IntroFightScene Auto Const

Scene Property MS13IntroAfterFight Auto Const

Faction Property MS13ConfrontationCombatFaction Auto Const

Faction Property LatimerCrimeFaction Auto Const

LeveledItem Property LL_Caps_Reward_Medium_and_Change Auto Const Mandatory

LeveledItem Property LL_Caps_Reward_Small_and_Change Auto Const Mandatory
