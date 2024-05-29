;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Inst306_000AC7B3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().AddToFaction(InstituteFaction)
InstituteMapMarker.AddToMap(True)

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE Inst306QuestScript
Quest __temp = self as Quest
Inst306QuestScript kmyQuest = __temp as Inst306QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
Alias_Desdemona.GetActorReference().SetEssential(False)
Alias_Desdemona.GetActorReference().SetProtected(true)
if (Alias_Carrington.GetActorReference()).IsDead()==1
	if kmyquest.CarringtonDead==False
		kmyquest.CarringtonDead=True
		kmyquest.ActorsKilled +=1
	endif
endif
if (Alias_Deacon.GetActorReference()).IsDead() == 1
	if kmyquest.DeaconDead==False
		kmyquest.DeaconDead=True
		kmyquest.ActorsKilled +=1
	endif
endif
if (Alias_Glory.GetActorReference()).IsDead() == 1
if kmyquest.GloryDead==False
kmyquest.GloryDead=True
kmyquest.ActorsKilled +=1
endif
endif
if (Alias_TinkerTom.GetActorReference()).IsDead() == 1
	if kmyquest.TomDead==False
		kmyquest.TomDead=True
		kmyquest.ActorsKilled +=1
	endif
endif
if (Alias_Desdemona.GetActorReference()).IsDead() == 1
kmyquest.actorskilled +=1
	SetStage(25)
endif
if kmyquest.ActorsKilled >= 5 && GetStageDone(25)
	SetStage(30)
endif

;Enable Liberty Prime for the future
BoSEnable.SetStage(20)

; At this point the Railroad infiltration (if relevant) is complete
pRR201InfiltrationComplete.SetValue(1)


;make companions not care about murder in the location
((self as quest) as CompanionMurderLocationToggleScript).OkayToMurderInRailroadHQ()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN AUTOCAST TYPE Inst306QuestScript
Quest __temp = self as Quest
Inst306QuestScript kmyQuest = __temp as Inst306QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(25)
if kmyquest.ActorsKilled >= 5
SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveCompleted(25)
SetObjectiveDisplayed(30)

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_Inst306RRDestroyedAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_01
Function Fragment_Stage_0030_Item_01()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveCompleted(25)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Inst307.Start()
Inst307StartScene.Start()
;Update Global for Radio News
RadioDCInst306Ready.SetValue((GameDaysPassed.GetValue() + 1))

;set global
PlayerRailroad_Destroyed.SetValue(1)


Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_01
Function Fragment_Stage_0200_Item_01()
;BEGIN CODE
CompleteAllObjectives()
Inst308.SetStage(10)

;Update Global for Radio News
RadioDCInst306Ready.SetValue((GameDaysPassed.GetValue() + 1))

;set global
PlayerRailroad_Destroyed.SetValue(1)


Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Desdemona Auto Const

ReferenceAlias Property Alias_Carrington Auto Const

ReferenceAlias Property Alias_TinkerTom Auto Const

ReferenceAlias Property Alias_Deacon Auto Const

ReferenceAlias Property Alias_Glory Auto Const

Faction Property InstituteFaction Auto Const

ObjectReference Property InstituteMapMarker Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCInst306Ready Auto Const

Quest Property Inst307 Auto Const

Scene Property Inst307StartScene Auto Const

Quest Property BoSEnable Auto Const

GlobalVariable Property PlayerRailroad_Destroyed Auto Const

Quest Property Inst308 Auto Const Mandatory

GlobalVariable Property pRR201InfiltrationComplete Auto Const Mandatory

ActorValue Property COMQC_Inst306RRDestroyedAV Auto Const
