;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS00_0005DDAB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
BoS00Fight.SetStage(10)
SetStage(40)
Game.GetPlayer().Moveto(BoS00Start)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(5,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5,1)
SetObjectiveDisplayed(10,1)
;Alias_BoS00Rhys.GetActorRef().SetRestrained()
if BoS000.GetStageDone(10) == 1
BoS000.SetStage(255)
endif

(DNMasterQuest as RadioFailsafeScript).RemoveScene(BoS100RadioScene)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
if BoS000.GetStageDone(10) == 1
BoS000.SetStage(255)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(5) == 1
SetObjectiveDisplayed(5,0)
endif

if BoS000.GetStageDone(10) == 1
BoS000.SetStage(255)
endif

SetObjectiveCompleted(10,1)

if (!BoS100Fight.GetStageDone(100))
SetObjectiveDisplayed(20,1)
else
SetStage(40)
EndIf

BoS100Radio.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
BoS100PlayerEntersCompound.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)

if BoS000.GetStageDone(10) == 1
BoS000.SetStage(255)
endif

Alias_BoS00Danse.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
BoSDanseName.SetValue(1)

if BoS000.GetStageDone(10) == 1
BoS000.SetStage(255)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0052_Item_00
Function Fragment_Stage_0052_Item_00()
;BEGIN CODE
BoSDanseName.SetValue(1)

if BoS000.GetStageDone(10) == 1
BoS000.SetStage(255)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
BoSDanseName.SetValue(1)

if BoS000.GetStageDone(10) == 1
BoS000.SetStage(255)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30,1)
CompleteAllObjectives()
BoSDanseName.SetValue(1)
Alias_BoS00Rhys.GetActorRef().SetRestrained(false)
Alias_BoS00Rhys.GetActorRef().EvaluatePackage()
BoSPoliceStation.SetStage(10)
BoS101.SetStage(10)

;Add the player to the BoS Faction.
Game.GetPlayer().AddToFaction(BrotherhoodOfSteelFaction)

;Add player to Prydwen door owner faction
Game.GetPlayer().AddToFaction(PrydwenPlayerOwnerFaction)

;Player knows a little about the BoS.
PlayerKnowsBoS.SetValue(1)

;DN130 - Cambridge PD
;Unlock the doors to the Police Station.
DN130.SetStage(20)

;Update Global for Radio News
RadioDCBoS100Ready.SetValue((GameDaysPassed.GetValue() + 1))

;Just in case, kill BoS000
if BoS000.GetStage() >= 10
BoS000.SetStage(255)
elseif BoS000.GetStage() < 10
BoS000.Stop()
endif

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_BoS100HelpAtPDAV)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30,1)
CompleteAllObjectives()
Alias_BoS00Rhys.GetActorRef().SetRestrained(false)
Alias_BoS00Rhys.GetActorRef().EvaluatePackage()
BoSPostQuestMMWon.SetStage(10)

;Player knows a little about the BoS.
PlayerKnowsBoS.SetValue(1)

;DN130 - Cambridge PD
DN130.SetStage(13)
DN130.SetStage(20)

;Update Global for Radio News
RadioDCBoS100Ready.SetValue((GameDaysPassed.GetValue() + 1))

CustomItemQuest.SetStage(40)

; Give final XP
Game.RewardPlayerXP(XPFactionFinal.GetValue() as int)

;Just in case, kill BoS000
if BoS000.GetStage() >= 10
BoS000.SetStage(255)
elseif BoS000.GetStage() < 10
BoS000.Stop()
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BoS00Danse Auto Const

ReferenceAlias Property Alias_BoS00Haylen Auto Const

ReferenceAlias Property Alias_BoS00Rhys Auto Const

ObjectReference Property BoS00Start Auto Const

Quest Property BoS00Fight Auto Const

Quest Property XZX Auto Const

ObjectReference Property BoS00Transmitter Auto Const

Quest Property BoSPoliceStation Auto Const

Quest Property DN130 Auto Const

Quest Property BoS101 Auto Const

LeveledItem Property LL_LaserGun_Rifle Auto Const

Scene Property BoS100PlayerEntersCompound Auto Const

Scene Property BoS100SceneMainRedo Auto Const

Quest Property BoS100Radio Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCBoS100Ready Auto Const

Quest Property BoS000 Auto Const

GlobalVariable Property XPFactionFinal Auto Const

GlobalVariable Property PlayerKnowsBoS Auto Const

ObjectReference Property BoSPoliceStationSceneTrigger Auto Const

Quest Property BoS100Fight Auto Const

GlobalVariable Property BoSDanseName Auto Const

Quest Property BoSPostQuestMMWon Auto Const

Quest Property CustomItemQuest Auto Const Mandatory

Faction Property PrydwenPlayerOwnerFaction Auto Const

ActorValue Property COMQC_BoS100HelpAtPDAV Auto Const

Quest Property DNMasterQuest Auto Const Mandatory

Scene Property BoS100RadioScene Auto Const Mandatory
