;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_InstMassFusion_0015BD39 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
If BoS303.GetStageDone(20) == 0
SetStage(10)
else
SetObjectiveDisplayed(5)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(5)
SetObjectiveCompleted(5)
;BoS303.SetObjectiveCompleted(30)
endif
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
InstMassFusionFilmoreGoing.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)


;If player has advanced BoS questline but not started 303, start it and pop optional objective
if BoS201.GetStageDone(255)==1
If Bos303.GetStageDone(20) == 0 
if PlayerBos_KickedOut.GetValue() != 1
BoS303.Start()
SetObjectiveDisplayed(30)
endif
endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;set DN084 stage
DN084.SetStage(12)

if InstMassFusionFilmoreGoing.GetValue()==1
;Force Allie into the DN084 Quest Companion alias.
DN084_QuestCompanionAlias.ForceRefTo(Allie.GetActorRef())
endif 

;Kick the player from the BoS.
BoSKickout.SetStage(20)

;Officially set BoS and Institute factions as enemies
BrotherhoodofSteelFaction.SetEnemy(InstituteFaction)
InstituteFaction.SetEnemy(BrotherhoodofSteelFaction)

if InstMassFusionFilmoreGoing.GetValue() == 1
Allie.GetActorReference().SetOutfit(InstituteJumpsuitHelmetOutfit)
Allie.GetReference().Moveto(MassFusionFilmoreMarker.GetReference())
endif
Game.GetPlayer().Addspell(TeleportPlayerOutSpell, abVerbose=0)
Utility.Wait(4.0)
Game.GetPlayer().MoveTo(MassFusionPlayerMarker.GetReference())
SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE InstMassFusionQuestScript
Quest __temp = self as Quest
InstMassFusionQuestScript kmyQuest = __temp as InstMassFusionQuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().AddSpell(TeleportPlayerInSpell, abVerbose=0)
Utility.Wait(2.0)
SetObjectiveCompleted(20)
SetObjectiveDisplayed(60)
InstMassFusion_10_Roof.Start()
If InstMassFusionFilmoreGoing.GetValue()==1
Allie.GetActorReference().GetActorBase().SetEssential()
Allie.GetActorReference().IgnoreFriendlyHits()
kmyquest.FilmoreEndConversation=1
endif

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_InstMassFusionBoSEnemyAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(60)

if InstMassFusionFilmoreGoing.GetValue() == 1
InstMassFusion_11_AgitatorMissing.Start()
elseif InstMassFusionFilmoreGoing.GetValue() == 0
InstMassFusion_11_AgitatorMissingPlayer.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleteD(60)
if DN084.GetStageDone(120)==0

SetObjectiveDisplayed(70)
else
SetObjectivedisplayed(80)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(70)
SetObjectiveCompleted(70)
endif
if GetStageDone(60)
SetObjectiveDisplayed(80)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
InstMassFusion_12_ElevatorCombat.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(90)
InstMassFusion_13_PowerLoss.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(90)
InstMassFusion_14_PowerRestored.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(90)
SetObjectiveDisplayed(90,0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
if IsObjectiveCompleted(90)==0
SetObjectiveDisplayed(90,0)
endif
If IsObjectiveCompleted(60)==0
SetObjectiveCompleted(60)
endif
SetObjectiveCompleted(80)
SetObjectiveDisplayed(100)
InstMassFusion_15_ViewReactor.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)
InstMassFusion_18_EnteringChamber.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN CODE
;SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120)

if DN084.GetStageDone(320) == 0
SetObjectiveDisplayed(130)
;run tripped scene
InstMassFusion_19_ReactorAlarmTripped.Start()
else
;run non tripped scene
InstMassFusion_19_ReactorAlarmNotTripped.Start()
SetStage(160)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(130)
SetObjectiveCompleted(130)
endif
SetObjectiveDisplayed(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
InstMassFusion_20_ElevatorToLobby.Start()
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
SetObjectiveCompleted(140)
if InstMassFusionFilmoreGoing.GetValue() == 1
Allie.GetActorReference().GetActorBase().SetEssential(False)
Allie.GetActorReference().GetActorBase().SetProtected()
Allie.GetActorReference().IgnoreFriendlyHits(False)
Allie.GetActorReference().SetOutfit(InstituteDivisionHeadFacilities)
InstMassFusionFilmoreGoing.SetValue(0)
endif
If Inst303.GetStage()< 30
Allie.GetReference().Moveto(Inst303DirectorateMarker1)
Allie.GetActorReference().EvaluatePackage()
else
Allie.GetReference().MoveTo(InstMassFusionFilmoreEndMarker)
Allie.GetActorReference().EvaluatePackage()
endif
SetObjectiveDisplayed(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;reward XP
Game.RewardPlayerXP(XPFactionFinal.GetValue() as int)

;Update Global for Radio News
RadioDCInst303Ready.SetValue((GameDaysPassed.GetValue() + 1))

;Run MinVsInst if we're not doing this quest out of order
if Inst303.GetStage() == 350
MinVsInst.SetStage(10)
endif


Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
Allie.GetActorReference().GetActorBase().SetEssential(False)
Allie.GetActorReference().GetActorBase().SetProtected()
Allie.GetActorReference().IgnoreFriendlyHits(False)
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN084 Auto Const

Scene Property InstMassFusion_20_ElevatorToLobby Auto Const

Scene Property InstMassFusion_10_Roof Auto Const

Scene Property InstMassFusion_11_AgitatorMissing Auto Const

Scene Property InstMassFusion_11_AgitatorMissingPlayer Auto Const

Scene Property InstMassFusion_12_ElevatorCombat Auto Const

Scene Property InstMassFusion_13_PowerLoss Auto Const

Scene Property InstMassFusion_14_PowerRestored Auto Const

Scene Property InstMassFusion_15_ViewReactor Auto Const

Scene Property InstMassFusion_16_BeforeEnteringChamber Auto Const

Scene Property InstMassFusion_18_EnteringChamber Auto Const

Scene Property InstMassFusion_19_ReactorAlarmNotTripped Auto Const

Scene Property InstMassFusion_19_ReactorAlarmTripped Auto Const

GlobalVariable Property InstMassFusionFilmoreGoing Auto Const

Quest Property BoS303 Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCInst303Ready Auto Const

Quest Property MinVsInst Auto Const

Quest Property Inst303 Auto Const

Quest Property BoS201 Auto Const

ReferenceAlias Property MassFusionPlayerMarker Auto Const

ReferenceAlias Property MassFusionFilmoreMarker Auto Const

ReferenceAlias Property Allie Auto Const

ObjectReference Property InstMassFusionFilmoreEndMarker Auto Const

Faction Property InstituteFaction Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

Quest Property BoSKickOut Auto Const

ReferenceAlias Property DN084_QuestCompanionAlias Auto Const

GlobalVariable Property XPFactionFinal Auto Const

Outfit Property InstituteJumpsuitHelmetOutfit Auto Const

Outfit Property InstituteDivisionHeadFacilities Auto Const

Quest Property pRR201 Auto Const

GlobalVariable Property PlayerBoS_KickedOut Auto Const

SPELL Property TeleportPlayerOutSpell Auto Const

SPELL Property TeleportPlayerInSpell Auto Const

ObjectReference Property Inst303DirectorateMarker1 Auto Const Mandatory

ActorValue Property COMQC_InstMassFusionBoSEnemyAV Auto Const
