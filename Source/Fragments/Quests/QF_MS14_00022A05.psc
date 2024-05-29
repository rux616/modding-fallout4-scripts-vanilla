;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS14_00022A05 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MS14QuestScript
Quest __temp = self as Quest
MS14QuestScript kmyQuest = __temp as MS14QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

;WJS - Misc pointer to quest is complete
If MS14Misc.IsRunning()
  MS14Misc.SetStage(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE MS14QuestScript
Quest __temp = self as Quest
MS14QuestScript kmyQuest = __temp as MS14QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
Alias_Travis.GetActorReference().AddtoFaction(PlayerAllyFaction)
kmyquest.FightTimerSetup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE MS14QuestScript
Quest __temp = self as Quest
MS14QuestScript kmyQuest = __temp as MS14QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
;Put Travis in faction for brawl
Alias_Travis.GetActorRef().AddToFaction(GenericBrawlPlayerAllyFaction)
;register for set stage events on brawl quest
kmyquest.RegisterforRemoteEvent(GenericBrawl, "OnStageSet")
;start brawl
GenericBrawlStart.SendStoryEvent(akRef1=Alias_Breadbox.GetRef(), akRef2=Alias_Bully2.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
Alias_Travis.GetActorRef().RemoveFromFaction(GenericBrawlPlayerAllyFaction)
;MS14TravisPostBarFightScene.Start()
;MS14BullyPostBarFightScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(20) ==1
SetObjectiveDisplayed(20,0)
endif

SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)
Alias_Vadim.GetActorReference().AddToFaction(CaptiveFaction)
Alias_Scarlett.GetReference().MoveTo(ScarlettWaitMarker)
Alias_Scarlett.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE MS14QuestScript
Quest __temp = self as Quest
MS14QuestScript kmyQuest = __temp as MS14QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(60,1)
MS14BadGuyFaction.SetEnemy(PlayerFaction)
BeantownBrewery01.Reset()
kmyquest.RunKidnapping()
Alias_BreadBox.GetActorReference().SetFactionRank(RaiderFaction,0)
Alias_Breadbox.GetActorReference().SetValue(Aggression,2)
Alias_Breadbox.GetActorReference().SetProtected(False)
Alias_Bully2.GetActorReference().SetFactionRank(RaiderFaction,0)
Alias_Bully2.GetActorReference().SetValue(Aggression,2)
Alias_Bully2.GetActorReference().SetProtected(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60,1)
SetObjectiveDisplayed(65,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(65,1)
SetObjectiveDisplayed(70,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE MS14QuestScript
Quest __temp = self as Quest
MS14QuestScript kmyQuest = __temp as MS14QuestScript
;END AUTOCAST
;BEGIN CODE
;if player hasn't yet talked to Travis...


if GetStageDone(70) == 0

	if GetStageDone(65) == 0
		SetObjectiveDisplayed(60,0)
	else

;if player has talked to travis but didn't wait outside
		SetObjectiveDisplayed(65,0)
		SetObjectiveDisplayed(70,0)
	endif

;in either case move Travis to the closest marker

	if Game.GetPlayer().GetDistance(BeantownTrigger1.GetReference()) < 500
		Alias_Travis.GetReference().MoveTo(BeantownTrigger1.GetReference().GetLinkedRef())
	else
		Alias_Travis.GetReference().MoveTo(BeantownTrigger2.GetReference().GetLinkedRef())
	endif
	kmyquest.Stage80TravisCatchUp=1
	Alias_Travis.GetActorReference().EvaluatePackage()


else

	SetObjectiveCompleted(70,1)
endif




SetObjectiveDisplayed(80,1)
Alias_Travis.GetActorRef().FollowerFollow()
Alias_Travis.GetActorRef().IgnoreFriendlyHits()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80,1)
SetObjectiveDisplayed(90,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()

Alias_Travis.GetActorRef().IgnoreFriendlyHits(False)
Alias_Travis.GetActorReference().SetEssential(False)
Alias_Vadim.GetActorReference().SetEssential(False)
;reward xp
;Game.RewardPlayerXP(XPMiscQuestFinal.GetValue() as int)


;Update Global for Radio News
RadioDCMS14Ready.SetValue((GameDaysPassed.GetValue() + 1))

Stop()

;Global radio uses for Travis' confidence is set in the news scene for MS14 in quest RadioDiamondCity
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE MS14QuestScript
Quest __temp = self as Quest
MS14QuestScript kmyQuest = __temp as MS14QuestScript
;END AUTOCAST
;BEGIN CODE
Alias_Travis.GetActorReference().SetEssential(False)
Alias_Vadim.GetActorReference().SetEssential(False)
if GetStageDone(50)==True
if kmyquest.VadimFree== 0
if Game.GetPlayer().GetParentCell() != BeantownBrewery01
Alias_Vadim.GetActorReference().SetProtected(false)
Alias_Vadim.GetActorReference().Kill()
endif
endif
endif
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Travis Auto Const

ObjectReference Property MS14TravisBarMarker Auto Const

ReferenceAlias Property Alias_Breadbox Auto Const

Scene Property MS14BarPreFightScene Auto Const

ReferenceAlias Property Alias_Hawthorne Auto Const

ObjectReference Property MS14HawthorneMarker Auto Const

Scene Property MS14TravisPostBarFightScene Auto Const

Scene Property MS14TravisBarConfrontScene Auto Const

Quest Property GenericBrawl Auto Const

Keyword Property GenericBrawlStart Auto Const

ReferenceAlias Property Alias_Bully2 Auto Const

Faction Property GenericBrawlPlayerAllyFaction Auto Const

Scene Property MS14BullyPostBarFightScene Auto Const

Faction Property MS14VadimBeantownFaction Auto Const

ReferenceAlias Property Alias_Vadim Auto Const

Quest Property DialogueDiamondCity Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCMS14Ready Auto Const

ReferenceAlias Property BeantownTrigger1 Auto Const

ReferenceAlias Property BeantownTrigger2 Auto Const

Faction Property MS14BadGuyFaction Auto Const

Faction Property PlayerFaction Auto Const

GlobalVariable Property XPMiscQuestFinal Auto Const

Faction Property RaiderFaction Auto Const

Faction Property CaptiveFaction Auto Const

ActorValue Property Aggression Auto Const

Cell Property BeantownBrewery01 Auto Const

ReferenceAlias Property Alias_Scarlett Auto Const

ObjectReference Property ScarlettWaitMarker Auto Const

Faction Property PlayerAllyFaction Auto Const

Quest Property MS14Misc Auto Const Mandatory

Quest Property IntroSceneDiamondCityDugoutInn Auto Const Mandatory
