;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ104_0001F25E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Actor NickREF = Alias_Nick.GetActorRef()

;always make sure Nick has been moved
NickREF.Moveto(MQ104NickCaptiveMarker)

;nick has to ignore friendly hits until we're clear of the dungeon
NickREF.IgnoreFriendlyHits()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
If GetStageDone(50) == 0
  SetObjectiveDisplayed(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;Clear any enemy flags caused by crime for Nick's crime faction
CrimeDiamondCity.SetPlayerEnemy(False)
Alias_Nick.GetActorRef().StopCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
Alias_MobsterTaunter.GetRef().SetValue(pAggression, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
p001_MQ104_NickGoonScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
Alias_MobsterTaunter.GetActorRef().EvaluatePackage()
SetStage(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
p002_MQ104_NickPlayerScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
If GetStageDone(30) == 0
  SetObjectiveCompleted(10)
  SetObjectiveDisplayed(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE MQ104QuestScript
Quest __temp = self as Quest
MQ104QuestScript kmyQuest = __temp as MQ104QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

p002_MQ104_NickPlayerScene01.Stop()

;remove Nick from the Captive Faction
Alias_Nick.GetActorRef().RemoveFromFaction(pCaptiveFaction)

;check for Nick to light up
kmyquest.RegisterForAnimationEvent(Alias_Nick.GetActorRef(), "cigLight")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
p002_MQ104_NickPlayerScene01.Stop()
;p003_MQ104_NickWalktoSmoke.Start()
p004_MQ104_NickPlayer.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0042_Item_00
Function Fragment_Stage_0042_Item_00()
;BEGIN CODE
;Alias_Nick.GetActorRef().ChangeAnimFlavor(AnimFlavorSmoking)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0044_Item_00
Function Fragment_Stage_0044_Item_00()
;BEGIN CODE
;Alias_Nick.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Previous quest is finished if it wasn't already
MQ103.SetStage(100)

;shut down the Memory Den freeform quest
FFGoodneighbor01.Stop()

;shutdown Ellie's intro
IntroSceneValentinesStart.Disable()

SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)

p005_MQ104_NickTalk01.Start()

;Nick is a teammate
Actor NickREF = Alias_Nick.GetActorRef()
NickREF.SetPlayerTeammate(abCanDoFavor=False)

;turn off nick lights
MQ104NickLightson.Enable()

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_MQ104RescueNickAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0052_Item_00
Function Fragment_Stage_0052_Item_00()
;BEGIN CODE
Alias_MobsterPatroller.GetActorRef().SetValue(pAggression, 2)
Alias_MobsterPatroller02.GetActorRef().SetValue(pAggression, 2)
Alias_MobsterPatroller03.GetActorRef().SetValue(pAggression, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
;enable goons
Vault114AtriumGoonsEnableMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0056_Item_00
Function Fragment_Stage_0056_Item_00()
;BEGIN CODE
;make sure previous stages are set
SetStage(55)
SetStage(52)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0057_Item_00
Function Fragment_Stage_0057_Item_00()
;BEGIN CODE
p005_MQ104_MobsterPatrol.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0067_Item_00
Function Fragment_Stage_0067_Item_00()
;BEGIN CODE
Alias_NickDoor02.GetRef().Lock(False)
Alias_NickDoor02.GetRef().SetOpen()

;make nick aggressive to triggermen
Alias_Nick.GetActorRef().AddToFaction(MQ104NickHatesTriggermanFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
;enable all the mobsters
Alias_SkinnyMalone.GetActorRef().Enable()
Alias_MobsterGirl.GetActorRef().Enable()
Alias_MaloneGuard01.GetActorRef().Enable()
Alias_MaloneGuard02.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0086_Item_00
Function Fragment_Stage_0086_Item_00()
;BEGIN CODE
;Triggermen are temporary allies to player
TriggermanFaction.SetAlly(PlayerFaction, True, True)

Alias_Nick.GetActorRef().RemoveFromFaction(MQ104NickHatesTriggermanFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0087_Item_00
Function Fragment_Stage_0087_Item_00()
;BEGIN CODE
Alias_Cell02ExitDoor.GetRef().Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0088_Item_00
Function Fragment_Stage_0088_Item_00()
;BEGIN CODE
SetStage(91)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Alias_SkinnyMalone.GetActorRef().Enable()
;Alias_MobsterGirl.GetActorRef().Enable()
;Alias_MaloneGuard01.GetActorRef().Enable()
;Alias_MaloneGuard02.GetActorRef().Enable()

;cue scenes
p005_MQ104_NickTalk01.Stop()
p007_MQ104_NickTalk03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0091_Item_00
Function Fragment_Stage_0091_Item_00()
;BEGIN AUTOCAST TYPE MQ104QuestScript
Quest __temp = self as Quest
MQ104QuestScript kmyQuest = __temp as MQ104QuestScript
;END AUTOCAST
;BEGIN CODE
If kmyquest.Malone_Var01 == 0
  ;Skinny and Darla open fire
  SetStage(95)
  SetStage(96)
  SetStage(101)
ElseIf kmyquest.Malone_Var01 == 1
  ;Darla leaves, both remain unaggressive
  Alias_MobsterGirl.GetActorRef().RemoveFromFaction(TriggermanFaction)
  Alias_MobsterGirl.GetActorRef().EvaluatePackage()
ElseIf kmyquest.Malone_Var01 == 2
  ;Darla turns on Skinny, Skinny opens fire
  SetStage(95)
  Alias_MobsterGirl.GetActorRef().RemoveFromFaction(TriggermanFaction)
  Alias_MobsterGirl.GetActorRef().AddtoFaction(pMQ104PlayerAllyFaction)
ElseIf kmyquest.Malone_Var01 == 3
  ;Skinny Malone backs down, both remain unaggressive
ElseIf kmyquest.Malone_Var01 == 4
  ;Skinny throws out Darla, both remain unaggressive
  Alias_MobsterGirl.GetActorRef().RemoveFromFaction(TriggermanFaction)
  Alias_MobsterGirl.GetActorRef().EvaluatePackage()
EndIf

;persistent dialogue quest starts
pDialogueVault114Aftermath.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0092_Item_00
Function Fragment_Stage_0092_Item_00()
;BEGIN CODE
SetStage(95)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0093_Item_00
Function Fragment_Stage_0093_Item_00()
;BEGIN CODE
SetStage(96)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0094_Item_00
Function Fragment_Stage_0094_Item_00()
;BEGIN CODE
SetStage(91)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

;make sure Triggermen are no longer friends with the player
TriggermanFaction.SetEnemy(PlayerFaction, True, True)

Alias_SkinnyMalone.GetActorRef().SetValue(pAggression, 2)
Alias_MaloneGuard01.GetActorRef().SetValue(pAggression, 2)
Alias_MaloneGuard02.GetActorRef().SetValue(pAggression, 2)
Alias_SkinnyMalone.GetActorRef().StartCombat(PlayerREF)
Alias_MaloneGuard01.GetActorRef().StartCombat(PlayerREF)
Alias_MaloneGuard02.GetActorRef().StartCombat(PlayerREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0096_Item_00
Function Fragment_Stage_0096_Item_00()
;BEGIN CODE
Alias_MobsterGirl.GetActorRef().SetValue(pAggression, 2)
Alias_MobsterGirl.GetActorRef().StartCombat(Game.GetPlayer())

;if Darla is still a Mobster, have everyone else enter combat
If Alias_MobsterGirl.GetActorRef().IsInFaction(TriggermanFaction)
  SetStage(95)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Actor NickREF = Alias_Nick.GetActorRef()

;Nick goes to the surface
NickREF.EvaluatePackage()

;Nick is no longer a teammate
NickREF.SetPlayerTeammate(abTeammate=false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN CODE
SkinnyMaloneCountdown.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0102_Item_00
Function Fragment_Stage_0102_Item_00()
;BEGIN AUTOCAST TYPE MQ104QuestScript
Quest __temp = self as Quest
MQ104QuestScript kmyQuest = __temp as MQ104QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Malone_Var01 = 1
kmyquest.Darla_Home01 = 1
kmyquest.Malone_CountDown = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0103_Item_00
Function Fragment_Stage_0103_Item_00()
;BEGIN AUTOCAST TYPE MQ104QuestScript
Quest __temp = self as Quest
MQ104QuestScript kmyQuest = __temp as MQ104QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Malone_Var01 = 2
kmyquest.Darla_Home01 = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0104_Item_00
Function Fragment_Stage_0104_Item_00()
;BEGIN AUTOCAST TYPE MQ104QuestScript
Quest __temp = self as Quest
MQ104QuestScript kmyQuest = __temp as MQ104QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Malone_Var01 = 3
kmyquest.Darla_Home01 = 1
kmyquest.Malone_CountDown = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN AUTOCAST TYPE MQ104QuestScript
Quest __temp = self as Quest
MQ104QuestScript kmyQuest = __temp as MQ104QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Malone_Var01 = 4
kmyquest.Darla_Home01 = 1
kmyquest.Malone_CountDown = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0108_Item_00
Function Fragment_Stage_0108_Item_00()
;BEGIN CODE
p006_MQ104_NickTalk03.Stop()
p008_MQ104_NickTalk04.Start()

;make sure other goons aggro
SetStage(92)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0109_Item_00
Function Fragment_Stage_0109_Item_00()
;BEGIN CODE
;make sure other goons aggro if needed
SetStage(93)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Nick is no longer a teammate
Alias_Nick.GetActorRef().SetPlayerTeammate(abTeammate=false)

;scene shutdown failsafe
p005_MQ104_NickTalk01.Stop()

;make sure Triggermen are now always enemy of player
TriggermanFaction.SetEnemy(PlayerFaction, True, True)

;if Skinny Malone is still alive, he and his men are now Very Aggressive if you walk back into the vault
Alias_SkinnyMalone.GetActorRef().SetValue(pAggression, 2)
Alias_MaloneGuard01.GetActorRef().SetValue(pAggression, 2)
Alias_MaloneGuard02.GetActorRef().SetValue(pAggression, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE MQ104QuestScript
Quest __temp = self as Quest
MQ104QuestScript kmyQuest = __temp as MQ104QuestScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
;rewardXP
;Game.RewardPlayerXP(XPActOneFinal.GetValue() as int)

;achievement
Game.AddAchievement(3)

;make sure Diamond City is open
If DialogueDiamondCityEntrance.IsRunning()
  DialogueDiamondCityEntrance.SetStage(23)
EndIf

MQ105.SetStage(10)

;MS07 is now ready and waiting
MS07Intro.SetStage(10)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Actor NickREF = Alias_Nick.GetActorRef()

;Update Global for Radio News
RadioDCMQ104Ready.SetValue((GameDaysPassed.GetValue() + 1 ))

;shutdown incompatible quests
FFDiamondCity12.Stop()

;Nick now counts friendly hits
NickREF.IgnoreFriendlyHits(False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Player Auto Const ; Legacy alias property

ReferenceAlias Property Alias_Nick Auto Const

ObjectReference Property NickValentineGoodneighborMarker1 Auto Const

Scene Property pMQ04MeetNickGoodneighborScene Auto Const

Scene Property pMQ04NickGoestoBobbiScene Auto Const

Scene Property pMQ04NickVault114Intro Auto Const

Quest Property pFFDiamondCity07 Auto Const

Scene Property p001_MQ104_NickGoonScene01 Auto Const

ReferenceAlias Property Alias_MobsterTaunter Auto Const

Scene Property p002_MQ104_NickPlayerScene01 Auto Const

Faction Property pCaptiveFaction Auto Const

Scene Property p005_MQ104_NickTalk01 Auto Const

ReferenceAlias Property Alias_SkinnyMalone Auto Const

Scene Property p007_MQ104_NickTalk03 Auto Const

Scene Property p008_MQ104_NickTalk04 Auto Const

Quest Property pMQ105 Auto Const

ReferenceAlias Property Alias_Cell02ExitDoor Auto Const

ReferenceAlias Property Alias_MobsterPatroller Auto Const

ReferenceAlias Property Alias_NickDoor02 Auto Const

Scene Property p013_MQ104_NickGoInside Auto Const

ReferenceAlias Property Alias_MobsterGirl Auto Const

Faction Property pMobsterFaction Auto Const

Faction Property pMQ104PlayerAllyFaction Auto Const

Quest Property pDialogueVault114Aftermath Auto Const

ActorValue Property pAggression Auto Const

ReferenceAlias Property Alias_MaloneGuard01 Auto Const

ReferenceAlias Property Alias_MaloneGuard02 Auto Const

Scene Property p005_MQ104_MobsterPatrol Auto Const

Scene Property p006_MQ104_NickTalk03 Auto Const

Scene Property p017_MQ104_MemoryLoungerActivation Auto Const

ReferenceAlias Property Alias_MemoryPod Auto Const

Quest Property MQ105 Auto Const

Scene Property SkinnyMaloneCountdown Auto Const

ObjectReference Property Vault114AtriumGoonsEnableMarker Auto Const

GlobalVariable Property XPActOneSmall Auto Const

GlobalVariable Property XPActOneFinal Auto Const

Scene Property p003_MQ104_NickWalktoSmoke Auto Const

Quest Property MQ103 Auto Const

Quest Property pMS07 Auto Const

Keyword Property AnimFlavorSmoking Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCMQ104Ready Auto Const

Quest Property MS07Intro Auto Const

Quest Property DialogueGoodneighborEntrance Auto Const

Quest Property FFGoodneighbor01 Auto Const

Faction Property TriggermanFaction Auto Const

Faction Property PlayerFaction Auto Const

ObjectReference Property IntroSceneValentinesStart Auto Const

Quest Property DialogueDiamondCityEntrance Auto Const

ObjectReference Property MQ104NickLightsOn Auto Const

Scene Property p004_MQ104_NickPlayer Auto Const

Quest Property FFDiamondCity12 Auto Const

Faction Property MQ104TriggermanAllyFaction Auto Const

Faction Property MQ104NickHatesTriggermanFaction Auto Const

ReferenceAlias Property Alias_MobsterPatroller02 Auto Const

ReferenceAlias Property Alias_MobsterPatroller03 Auto Const

ObjectReference Property MQ104NickCaptiveMarker Auto Const Mandatory

Faction Property CrimeDiamondCity Auto Const Mandatory

ActorValue Property COMQC_MQ104RescueNickAV Auto Const
