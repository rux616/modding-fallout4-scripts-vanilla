;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueDrumlinDiner_001069A9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
DrumlinDiner_Intro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
DrumlinDiner_WolfgangScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
Alias_Wolfgang.GetActorRef().evaluatepackage()
Alias_Simone.GetActorRef().evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_Wolfgang.GetActorRef().evaluatepackage()
Alias_Simone.GetActorRef().evaluatepackage()

;Settlers win
SetStage(2100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
SetStage(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetStage(35)
;settlers are hostile
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
If GetStageDone(75) == 0 && GetStageDone(80) == 0 && GetStageDone(70) == 0
  ;do nothing
Else
  SetObjectiveDisplayed(30)
  SetObjectiveDisplayed(35)
EndIf

If GetStageDone(200) == 0
  ;settlers are allied to player
  Alias_Trudy.GetActorRef().AddtoFaction(PlayerAllyFaction)
  Alias_Patrick.GetActorRef().AddtoFaction(PlayerAllyFaction)
EndIf

Actor WolfgangREF = Alias_Wolfgang.GetActorRef()
Actor SimoneREF = Alias_Simone.GetActorRef()

;make player an enemy
WolfgangREF.AddtoFaction(PlayerEnemyFaction)
SimoneREF.AddtoFaction(PlayerEnemyFaction)
WolfgangREF.RemoveFromFaction(PlayerAllyFaction)
SimoneREF.RemoveFromFaction(PlayerAllyFaction)

;start combat
WolfgangREF.SetValue(Aggression, 2)
SimoneREF.SetValue(Aggression, 2)

;chem dealers no longer protected
WolfgangREF.GetActorBase().SetProtected(False)
SimoneREF.GetActorBase().SetProtected(False)

If GetStageDone(200) == 1
  SetStage(6100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
If GetStageDone(75) == 0 && GetStageDone(80) == 0 && GetStageDone(70) == 0
  ;do nothing
Else
  SetObjectiveDisplayed(10, False)
  SetObjectiveDisplayed(20)
  SetObjectiveDisplayed(25)
EndIf

If GetStageDone(100) == 0
  ;chem dealers are allied to player
  Alias_Wolfgang.GetActorRef().AddtoFaction(PlayerAllyFaction)
  Alias_Simone.GetActorRef().AddtoFaction(PlayerAllyFaction)
EndIf

Actor TrudyREF = Alias_Trudy.GetActorRef()
Actor PatrickREF = Alias_Patrick.GetActorRef()

;make player an enemy
TrudyREF.AddtoFaction(PlayerEnemyFaction)
TrudyREF.RemoveFromFaction(PlayerAllyFaction)
PatrickREF.AddtoFaction(PlayerEnemyFaction)
PatrickREF.RemoveFromFaction(PlayerAllyFaction)

;start combat
TrudyREF.SetValue(Aggression, 2)
PatrickREF.SetValue(Aggression, 2)

;settlers are no longer protected
TrudyREF.GetActorBase().SetProtected(False)
PatrickREF.GetActorBase().SetProtected(False)

If GetStageDone(100) == 1
  SetStage(6100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)

;chem dealers are hostile
SetStage(100)

;if both are dead, Settlers win
If GetStageDone(310) == 1 && GetStage() < 1000
  SetStage(2000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
SetObjectiveCompleted(35)

;chem dealers are hostile
SetStage(100)

;if both are dead, Settlers win
If GetStageDone(300) == 1 && GetStage() < 1000
  SetStage(2000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)

;Settlers are hostile
SetStage(200)

;if both are dead, Chem Dealers win
If GetStageDone(410) == 1 && GetStage() < 1000
  SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
SetObjectiveCompleted(25)

;Settlers are hostile
SetStage(200)

;if both are dead, Chem Dealers win
If GetStageDone(400) == 1 && GetStage() < 1000
  SetStage(1000)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
If GetStageDone(75) == 0 && GetStageDone(80) == 0 && GetStageDone(70) == 0
  ;do nothing
ElseIf GetStageDone(100) == 0
  SetObjectiveDisplayed(100)
EndIf

Alias_Wolfgang.GetActorRef().EvaluatePackage()
Alias_Simone.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
If GetStageDone(75) == 0 && GetStageDone(80) == 0 && GetStageDone(70) == 0
  ;do nothing
ElseIf GetStageDone(200) == 0
  SetObjectiveDisplayed(200)
EndIf

Alias_Trudy.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2100_Item_00
Function Fragment_Stage_2100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3000_Item_00
Function Fragment_Stage_3000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(100)
Alias_Trudy.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_4000_Item_00
Function Fragment_Stage_4000_Item_00()
;BEGIN AUTOCAST TYPE DialogueDrumlinDinerScript
Quest __temp = self as Quest
DialogueDrumlinDinerScript kmyQuest = __temp as DialogueDrumlinDinerScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()

;Reward XP
;Game.RewardPlayerXP(XPRadiant.GetValue() as int)

If kmyquest.var_TrudyReward == 0
  Game.GetPlayer().AddItem(Caps001, 100)
ElseIf kmyquest.var_TrudyReward == 1
  Game.GetPlayer().AddItem(Caps001, 125)
ElseIf kmyquest.var_TrudyReward == 2
  Game.GetPlayer().AddItem(Caps001, 150)
ElseIf kmyquest.var_TrudyReward == 3
  Game.GetPlayer().AddItem(Caps001, 200)
EndIf

SetStage(7000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5000_Item_00
Function Fragment_Stage_5000_Item_00()
;BEGIN AUTOCAST TYPE DialogueDrumlinDinerScript
Quest __temp = self as Quest
DialogueDrumlinDinerScript kmyQuest = __temp as DialogueDrumlinDinerScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()

;Reward XP
;Game.RewardPlayerXP(XPRadiant.GetValue() as int)

If kmyquest.var_WolfgangReward == 0
  Game.GetPlayer().AddItem(Caps001, 100)
ElseIf kmyquest.var_WolfgangReward == 1
  Game.GetPlayer().AddItem(Caps001, 125)
ElseIf kmyquest.var_WolfgangReward == 2
  Game.GetPlayer().AddItem(Caps001, 150)
ElseIf kmyquest.var_WolfgangReward == 3
  Game.GetPlayer().AddItem(Caps001, 200)
EndIf

SetStage(7000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6000_Item_00
Function Fragment_Stage_6000_Item_00()
;BEGIN CODE
FailAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_6100_Item_00
Function Fragment_Stage_6100_Item_00()
;BEGIN CODE
FailAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_7000_Item_00
Function Fragment_Stage_7000_Item_00()
;BEGIN CODE
;remove everyone from the player ally faction
Alias_Trudy.GetActorRef().RemoveFromFaction(PlayerAllyFaction)
Alias_Patrick.GetActorRef().RemoveFromFaction(PlayerAllyFaction)
Alias_Wolfgang.GetActorRef().RemoveFromFaction(PlayerAllyFaction)
Alias_Simone.GetActorRef().RemoveFromFaction(PlayerAllyFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DrumlinDiner_WolfgangScene Auto Const

Scene Property DrumlinDiner_Intro Auto Const

ReferenceAlias Property Alias_Simone Auto Const

ReferenceAlias Property Alias_Wolfgang Auto Const

Faction Property REPlayerEnemy Auto Const

Faction Property PlayerEnemyFaction Auto Const

Faction Property PlayerAllyFaction Auto Const

ReferenceAlias Property Alias_Trudy Auto Const

ReferenceAlias Property Alias_Patrick Auto Const

Quest Property FFDrumlinDiner01 Auto Const

MiscObject Property Caps001 Auto Const

Scene Property DrumlinDiner_02_WolfgangScene Auto Const

GlobalVariable Property XPRadiant Auto Const

ActorValue Property Aggression Auto Const Mandatory
