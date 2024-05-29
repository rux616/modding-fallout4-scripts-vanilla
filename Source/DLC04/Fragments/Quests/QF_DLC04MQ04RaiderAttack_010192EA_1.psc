;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MQ04RaiderAttack_010192EA_1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().Moveto(Alias_Sinner.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04RaiderAttackScript
Quest __temp = self as Quest
DLC04:DLC04MQ04RaiderAttackScript kmyQuest = __temp as DLC04:DLC04MQ04RaiderAttackScript
;END AUTOCAST
;BEGIN CODE
kmyquest.StartUp()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04RaiderAttackScript
Quest __temp = self as Quest
DLC04:DLC04MQ04RaiderAttackScript kmyQuest = __temp as DLC04:DLC04MQ04RaiderAttackScript
;END AUTOCAST
;BEGIN CODE
kmyquest.EnableandEvalNPCs()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04RaiderAttackScript
Quest __temp = self as Quest
DLC04:DLC04MQ04RaiderAttackScript kmyQuest = __temp as DLC04:DLC04MQ04RaiderAttackScript
;END AUTOCAST
;BEGIN CODE
DLC04MQ04.SetStage(210)

;If Sinner's load script hasn't fired, set its stage now
if !GetStageDone(15)
  SetStage(15)
endif

;Fire off failsafe timer
kmyquest.StartFailsafeTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
DLC04MQ04RaiderAttack_000_SinnerShoutsScene.Start()

;If the gang spokesperson scene is running, kill it and set the appropriate stage
if DLC04MQ04RaiderAttack_000_SettlementSpokeperson.IsPlaying()
  Utility.Wait(1.0)
  DLC04MQ04RaiderAttack_000_SettlementSpokeperson.Stop()
  SetStage(20)
endif

;Get the settlement raiders moving towards Sinner
Alias_SettlementRaiders.EvaluateAll()

;Mark objectives in MQ04
DLC04MQ04.SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
Alias_Sinner.GetActorRef().EvaluatePackage()
Alias_SinnerGang.EvaluateAll()

if DLC04MQ04RaiderAttack_000_SinnerShoutsScene.IsPlaying()
  DLC04MQ04RaiderAttack_000_SinnerShoutsScene.Stop()
endif

DLC04MQ04RaiderAttack_001_SinnerScene.Start()

;Mark objectives in MQ04
DLC04MQ04.SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
Alias_Sinner.GetActorRef().EvaluatePackage()
Alias_SinnerGang.EvaluateAll()

SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0145_Item_00
Function Fragment_Stage_0145_Item_00()
;BEGIN CODE
Alias_Sinner.GetActorRef().EvaluatePackage()
Alias_SinnerGang.EvaluateAll()

SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04RaiderAttackScript
Quest __temp = self as Quest
DLC04:DLC04MQ04RaiderAttackScript kmyQuest = __temp as DLC04:DLC04MQ04RaiderAttackScript
;END AUTOCAST
;BEGIN CODE
kmyquest.BeginAttack()

if DLC04MQ04RaiderAttack_001_SinnerScene.IsPlaying()
  DLC04MQ04RaiderAttack_001_SinnerScene.Stop()
endif

if DLC04MQ04RaiderAttack_000_SettlementSpokeperson.IsPlaying()
  DLC04MQ04RaiderAttack_000_SettlementSpokeperson.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Check to see if Sinner's gangers are all dead. If so, continue.
if GetStageDone(210)
  SetStage(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Check to see if Sinner's dead. If so, continue.
if GetStageDone(200)
  SetStage(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04RaiderAttackScript
Quest __temp = self as Quest
DLC04:DLC04MQ04RaiderAttackScript kmyQuest = __temp as DLC04:DLC04MQ04RaiderAttackScript
;END AUTOCAST
;BEGIN CODE
SetStage(20)
DLC04MQ04.SetStage(250)

;Set up attacker to get deleted
kmyquest.AddAttackersToDeletionCollection()

;Get Settlement back to normal
Alias_SettlementRaiders.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04RaiderAttackScript
Quest __temp = self as Quest
DLC04:DLC04MQ04RaiderAttackScript kmyQuest = __temp as DLC04:DLC04MQ04RaiderAttackScript
;END AUTOCAST
;BEGIN CODE
kmyquest.BeginAttack()
kmyquest.AddAttackersToDeletionCollection()
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC04MQ04 Auto Const Mandatory

ReferenceAlias Property Alias_Sinner Auto Const Mandatory

RefCollectionAlias Property Alias_SinnerGang Auto Const Mandatory

Scene Property DLC04MQ04RaiderAttack_000_SinnerShoutsScene Auto Const Mandatory

RefCollectionAlias Property Alias_SettlementRaiders Auto Const Mandatory

Scene Property DLC04MQ04RaiderAttack_000_SettlementSpokeperson Auto Const Mandatory

Scene Property DLC04MQ04RaiderAttack_001_SinnerScene Auto Const Mandatory
