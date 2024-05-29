;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RESceneLC01_0017E729 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
Alias_Accused.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN AUTOCAST TYPE RESceneLC01Script
Quest __temp = self as Quest
RESceneLC01Script kmyQuest = __temp as RESceneLC01Script
;END AUTOCAST
;BEGIN CODE
kmyquest.StartSceneTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
RESceneLC01TriggerOnce.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE RESceneLC01Script
Quest __temp = self as Quest
RESceneLC01Script kmyQuest = __temp as RESceneLC01Script
;END AUTOCAST
;BEGIN CODE
;Start execution
Alias_Accused.GetActorRef().EvaluatePackage()
kmyquest.StartExecutionTimer(4.0)
RESceneLC01_ShootAccused.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN AUTOCAST TYPE RESceneLC01Script
Quest __temp = self as Quest
RESceneLC01Script kmyQuest = __temp as RESceneLC01Script
;END AUTOCAST
;BEGIN CODE
Alias_Accused.GetActorRef().Kill()
kmyquest.CancelExecutionTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
if RESceneLC01_LoopingIntro.IsPlaying()
  RESceneLC01_LoopingIntro.Stop()
endif

if RESceneLC01_Scene.IsPlaying()
  RESceneLC01_Scene.Stop()
endif

Actor AccusedREF = Alias_Accused.GetActorRef()

RESceneLC01_AccusedFaction.SetPlayerEnemy()
RESceneLC01_AccusedFaction.SetEnemy(PlayerFaction)
RESceneLC01_AccusedFaction.SetEnemy(RESceneLC01_AccusorFaction)
AccusedREF.StartCombat(Game.GetPlayer())
Alias_Accusor.GetActorRef().StartCombat(AccusedREF)

;Setting affinity stages - does the player know if guy he's attacking is a Synth?
if !self.GetStageDone(70)
  if self.GetStageDone(50) || self.GetStageDone(155) || self.GetStageDone(150)
    self.SetStage(111)
  else
    self.SetStage(112)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
if RESceneLC01_LoopingIntro.IsPlaying()
  RESceneLC01_LoopingIntro.Stop()
endif

if RESceneLC01_Scene.IsPlaying()
  RESceneLC01_Scene.Stop()
endif

RESceneLC01_AccusorFaction.SetPlayerEnemy()
RESceneLC01_AccusorFaction.SetEnemy(PlayerFaction)
Alias_Accusor.GetActorRef().StartCombat(Game.GetPlayer())
RESceneLC01_AccusedFaction.SetEnemy(RESceneLC01_AccusorFaction)
Alias_Accused.GetActorRef().StartCombat(Alias_Accusor.GetActorRef())

;Setting affinity stages - does the player know if the accused is a Synth?
if !self.GetStageDone(80)
  if self.GetStageDone(50) || self.GetStageDone(155) || self.GetStageDone(150)
    self.SetStage(121)
  else
    self.SetStage(122)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
RESceneLC01_AccusedFaction.SetPlayerEnemy()
RESceneLC01_AccusedFaction.SetEnemy(PlayerFaction)
RESceneLC01_AccusedFaction.SetEnemy(RESceneLC01_AccusorFaction)
Alias_Accused.GetActorRef().StartCombat(Game.GetPlayer())
;Alias_NameAlias.ForceRefTo(Alias_Accused.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0155_Item_00
Function Fragment_Stage_0155_Item_00()
;BEGIN CODE
RESceneLC01_AccusedFaction.SetEnemy(RESceneLC01_AccusorFaction)
Alias_Accused.GetActorRef().StartCombat(Alias_Accusor.GetActorRef())
;Alias_NameAlias.ForceRefTo(Alias_Accused.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
if !self.GetStageDone(105)
  RESceneLC01_AccusedDead.Start()
else
 Alias_Accusor.GetActorRef().EvaluatePackage()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Alias_Accusor.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Alias_Accused.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
if RESceneLC01_LoopingIntro.IsPlaying()
  RESceneLC01_LoopingIntro.Stop()
endif

if RESceneLC01_Scene.IsPlaying()
  RESceneLC01_Scene.Stop()
endif

RESceneLC01_AccusedFaction.SetEnemy(RESceneLC01_AccusorFaction)
RESceneLC01_AccusorFaction.SetEnemy(RESceneLC01_AccusedFaction)
Alias_Accused.GetActorRef().StartCombat(Alias_Accusor.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE RESceneLC01Script
Quest __temp = self as Quest
RESceneLC01Script kmyQuest = __temp as RESceneLC01Script
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
kmyquest.CancelExecutionTimer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

Scene Property RESceneLC01_ShootAccused Auto Const

ReferenceAlias Property Alias_Accusor Auto Const

ReferenceAlias Property Alias_Accused Auto Const

Faction Property RESceneLC01_AccusedFaction Auto Const

Faction Property RESceneLC01_AccusorFaction Auto Const

GlobalVariable Property RESceneLC01TriggerOnce Auto Const

ReferenceAlias Property Alias_NameAlias Auto Const

Scene Property RESceneLC01_AccusedDead Auto Const

Faction Property PlayerFaction Auto Const

Scene Property RESceneLC01_LoopingIntro Auto Const

Scene Property RESceneLC01_Scene Auto Const
