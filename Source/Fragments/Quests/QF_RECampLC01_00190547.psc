;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RECampLC01_00190547 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
Alias_Jules.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
RECampLC01TriggerOnce.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Player made a decision in conversation
self.SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
;Player made a decision in conversation
self.SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
;Player made a decision in conversation
self.SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
if RECampLC01_MainScene.IsPlaying()
  RECampLC01_MainScene.Stop()
endif

if RECampLC01_LoopingIntro.IsPlaying()
  RECampLC01_LoopingIntro.Stop()
endif

;If Jules execution stage or release stage haven't already been set...
if !self.GetStageDone(200) && !self.GetStageDone(400) && !self.GetStageDone(800)
    Alias_Jules.GetActorRef().Kill()
    RECampLC01_FredFarewell.Start()
endif

;Evaluate stage, see if affinity should fire
if !self.GetStageDone(600)
  if self.GetStageDone(25)
    ;Player attacked Jules knowing he's a Synth
    self.SetStage(96)
  else
    ;Player attacked Jules not knowing he's a Synth
    self.SetStage(97)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
RECampLC01_CaptorFaction.SetEnemy(PlayerFaction)
RECampLC01_CaptorFaction.SetPlayerEnemy()
Alias_Fred.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Angie.GetActorRef().StartCombat(Game.GetPlayer())

;Trigger Jules' combat scene
self.SetStage(625)

;Player made a decision in dialogue
self.SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE RECampLC01Script
Quest __temp = self as Quest
RECampLC01Script kmyQuest = __temp as RECampLC01Script
;END AUTOCAST
;BEGIN CODE
if RECampLC01_MainScene.IsPlaying()
  RECampLC01_MainScene.Stop()
endif

RECampLC01_FredExecutesJules.Start()

;Turn on failsafe timer
kmyquest.StartExecutionTimer(4.0)

Alias_Fred.GetActorRef().EvaluatePackage()
Alias_Angie.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN AUTOCAST TYPE RECampLC01Script
Quest __temp = self as Quest
RECampLC01Script kmyQuest = __temp as RECampLC01Script
;END AUTOCAST
;BEGIN CODE
Alias_Jules.GetActorRef().Kill()

;Shut down failsafe timer
kmyquest.CancelExecutionTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LLReward)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
self.SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
Alias_Jules.GetActorRef().EvaluatePackage()
Alias_Fred.GetActorRef().EvaluatePackage()
Alias_Angie.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN CODE
Actor Jules = Alias_Jules.GetActorRef()

RECampLC01_CaptiveFaction.SetPlayerEnemy()
RECampLC01_CaptiveFaction.SetEnemy(PlayerFaction)
Jules.SetValue(Game.GetAggressionAV(), 2)
Jules.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
Actor Angie = Alias_Angie.GetActorRef()

Alias_Fred.GetActorRef().EvaluatePackage()
Angie.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
if RECampLC01_MainScene.IsPlaying()
  RECampLC01_MainScene.Stop()
endif

if RECampLC01_LoopingIntro.IsPlaying()
  RECampLC01_LoopingIntro.Stop()
endif

RECampLC01_CaptorFaction.SetPlayerEnemy()
RECampLC01_CaptorFaction.SetEnemy(PlayerFaction)
Alias_Fred.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Angie.GetActorRef().StartCombat(Game.GetPlayer())

;Trigger Jules' combat scene
if !GetStageDone(800) && !self.GetStageDone(400)
  self.SetStage(625)
endif

;Evaluate stage, see if affinity should fire
if !self.GetStageDone(95)
  if self.GetStageDone(25)
    ;Player attacked Fred/Angie knowing Jules is a Synth
    self.SetStage(601)
  else
    ;Player attacked Fred/Angie not knowing Jules is a Synth
    self.SetStage(602)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0625_Item_00
Function Fragment_Stage_0625_Item_00()
;BEGIN CODE
if !self.GetStageDone(400)
  RECampLC01_JulesDuringCombat.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
Alias_Jules.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
Actor Jules = Alias_Jules.GetActorRef()

if !GetStageDone(400)
  Jules.ChangeAnimArchetype(AnimArchetypeNervous)
  Jules.ChangeAnimFaceArchetype(AnimFaceArchetypeNervous)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
;self.SetStage(405)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
if RECampLC01_MainScene.IsPlaying()
  RECampLC01_MainScene.Stop()
endif

if RECampLC01_LoopingIntro.IsPlaying()
  RECampLC01_LoopingIntro.Stop()
endif

if !GetStageDone(400)
  Actor Jules = Alias_Jules.GetActorRef()

  ;Get Jules in the mood for blood
  Jules.SetValue(Confidence, 4)
  Jules.SetValue(Aggression, 1)

  ;Set everyone enemy of each other
  RECampLC01_CaptorFaction.SetEnemy(RECampLC01_CaptiveFaction) 
  RECampLC01_CaptiveFaction.SetEnemy(RECampLC01_CaptorFaction)
  Alias_Fred.GetActorRef().StartCombat(Jules)
  Alias_Angie.GetActorRef().StartCombat(Jules)
else
  SetStage(405)
  SetStage(410)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE RECampLC01Script
Quest __temp = self as Quest
RECampLC01Script kmyQuest = __temp as RECampLC01Script
;END AUTOCAST
;BEGIN CODE
;Shut down failsafe timer
kmyquest.CancelExecutionTimer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Jules Auto Const

ReferenceAlias Property Alias_Angie Auto Const

ReferenceAlias Property Alias_Fred Auto Const

Scene Property RECampLC01_FredExecutesJules Auto Const

GlobalVariable Property RECampLC01TriggerOnce Auto Const

Faction Property RECampLC01_CaptorFaction Auto Const

Faction Property RECampLC01_CaptiveFaction Auto Const

Scene Property RECampLC01_JulesDuringCombat Auto Const

Scene Property RECampLC01_MainScene Auto Const

LeveledItem Property LLReward Auto Const

Scene Property RECampLC01_ReleaseJulesEarly Auto Const

Scene Property RECampLC01_ReleaseJules Auto Const

Keyword Property AnimFaceArchetypeNervous Auto Const

Keyword Property AnimArchetypeNervous Auto Const

ActorValue Property Confidence Auto Const

ActorValue Property Aggression Auto Const

Scene Property RECampLC01_FredFarewell Auto Const

Faction Property PlayerFaction Auto Const

Scene Property RECampLC01_LoopingIntro Auto Const
