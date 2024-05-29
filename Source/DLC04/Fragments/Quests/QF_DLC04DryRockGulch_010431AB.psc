;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04DryRockGulch_010431AB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;do any checks needed if the Protectrons are already dead

;do any checks needed if the player somehow got the key early
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
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()

SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;give player an outfit
PlayerREF.AddItem(DLC04_Armor_Western_Hat_02)
PlayerREF.AddITem(DLC04_Armor_Western_01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(DLC04_DRG_44Western)
Alias_OneEyedIke.GetActorRef().RemoveItem(DLC04_Revolver)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(30)
DLC04_DRG_Obj30Global.SetValueInt(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Alias_OneEyedIke.GetActorRef().RemoveItem(DLC04_DRG_Combo01)
Game.GetPlayer().AddItem(DLC04_DRG_Combo01)
Game.GetPlayer().AddItem(Ammo44, 6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(30, False)
DLC04_DRG_Obj30Global.SetValueInt(0)

;check if the player picked up the other parts
If (GetStageDone(220) == 1) && (GetStageDone(320) == 1)
  SetStage(400)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
Alias_OneEyedIke.GetActorRef().RemoveItem(DLC04_DRG_Combo01)
Game.GetPlayer().AddItem(DLC04_DRG_Combo01)

;also hand over the pistol
SetStage(95)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_DRG_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_DRG_QuestScript kmyQuest = __temp as DLC04:DLC04_DRG_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(30, False)
DLC04_DRG_Obj30Global.SetValueInt(0)
kmyquest.CountDeadBots()

SetStage(17)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0195_Item_00
Function Fragment_Stage_0195_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(DLC04_NukaCola_Wild)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(40)
DLC04_DRG_Obj40Global.SetValueInt(1)

Alias_ServeDrinkTrigger.GetRef().Enable()
Alias_ServeDrinkTrigger01.GetRef().Enable()
Alias_ServeDrinkTrigger02.GetRef().Enable()

;enable triggers for bloodworm ambushes
DLC04_DRG_01EnableMarkerREF.EnableNoWait()

Alias_PlayerDrinkQuestItem.GetRef().Enable()
Game.GetPlayer().AddItem(Alias_PlayerDrinkQuestItem.GetRef(), absilent=True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Alias_ServeDrinkTrigger.GetRef().Disable()
Alias_CustomersDrink.getRef().Enable()

;check if all drink orders are done
If (GetStageDone(212) == 1) && (GetStageDone(214) == 1)
  SetStage(218)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0212_Item_00
Function Fragment_Stage_0212_Item_00()
;BEGIN CODE
Alias_ServeDrinkTrigger01.GetRef().Disable()
Alias_CustomersDrink01.getRef().Enable()

;check if all drink orders are done
If (GetStageDone(210) == 1) && (GetStageDone(214) == 1)
  SetStage(218)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0214_Item_00
Function Fragment_Stage_0214_Item_00()
;BEGIN CODE
Alias_ServeDrinkTrigger02.GetRef().Disable()
Alias_CustomersDrink02.getRef().Enable()

;check if all drink orders are done
If (GetStageDone(210) == 1) && (GetStageDone(212) == 1)
  SetStage(218)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0218_Item_00
Function Fragment_Stage_0218_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(40, False)
SetObjectiveDisplayed(45)

Game.GetPlayer().RemoveItem(Alias_PlayerDrinkQuestItem.GetRef(), absilent=True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(40, False)
SetObjectiveDisplayed(45, False)
DLC04_DRG_Obj40Global.SetValueInt(0)

;check if the player picked up the other parts
If (GetStageDone(120) == 1) && (GetStageDone(320) == 1)
  SetStage(400)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
Alias_DocPhosphate.GetActorRef().RemoveItem(DLC04_DRG_Combo02)
Game.GetPlayer().AddItem(DLC04_DRG_Combo02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0235_Item_00
Function Fragment_Stage_0235_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(DLC04_NukaCola_Wild, 6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
Alias_DocPhosphate.GetActorRef().RemoveItem(DLC04_DRG_Combo02)
Game.GetPlayer().AddItem(DLC04_DRG_Combo02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_DRG_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_DRG_QuestScript kmyQuest = __temp as DLC04:DLC04_DRG_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(40, False)
SetObjectiveDisplayed(45, False)
DLC04_DRG_Obj40Global.SetValueInt(0)
kmyquest.CountDeadBots()

SetStage(17)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(50)
DLC04_DRG_Obj50Global.SetValueInt(1)

;enable bloodworm ambushes
DLC04_DRG_02EnableMarkerREF.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(50, False)
DLC04_DRG_Obj50Global.SetValueInt(0)

;check if the player picked up the other parts
If (GetStageDone(120) == 1) && (GetStageDone(220) == 1)
  SetStage(400)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
DLC04DryRockGulch_32_GiddyupPieces.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
DLC04DryRockGulch_31_GiddyupSuccess.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
Alias_TheGiddyupKid.GetActorRef().RemoveItem(DLC04_DRG_Combo03)
Game.GetPlayer().AddItem(DLC04_DRG_Combo03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_DRG_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_DRG_QuestScript kmyQuest = __temp as DLC04:DLC04_DRG_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(50, False)
SetObjectiveDisplayed(55, False)
DLC04_DRG_Obj50Global.SetValueInt(0)
kmyquest.CountDeadBots()

SetStage(17)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
Alias_TheGiddyupKid.GetActorRef().RemoveItem(DLC04_DRG_Combo03)
Game.GetPlayer().AddItem(DLC04_DRG_Combo03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveDisplayed(60)
Actor PlayerREF = Game.GetPlayer()

PlayerREF.AddItem(DLC04_DRG_SafeCombination)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetobjectiveCompleted(10)
SetobjectiveCompleted(20)
SetObjectiveCompleted(70)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Actor Sheriff01REF = Alias_Sheriff01.GetActorRef()
Actor Sheriff02REF = Alias_Sheriff02.GetActorRef()
Actor OneEyedIkeREF = Alias_OneEyedIke.GetActorRef()
Actor DocPhosphateREF = Alias_DocPhosphate.GetActorRef()
Actor TheGiddyupKidREF = Alias_TheGiddyupKid.GetActorRef()
Actor PlayerREF = Game.GetPlayer()

SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)

;Protectron Sheriffs are no longer Essential
Sheriff01REF.GetActorBase().SetEssential(False)
Sheriff02REF.GetActorBase().SetEssential(False)

;other robots no longer Protected
OneEyedIkeREF.GetActorBase().SetProtected(False)
DocPhosphateREF.GetActorBase().SetProtected(False)
TheGiddyupKidREF.GetActorBase().SetProtected(False)

;all protectrons are hostile
Sheriff01REF.RemoveFromFaction(PlayerAllyFaction)
Sheriff02REF.RemoveFromFaction(PlayerAllyFaction)
OneEyedIkeREF.RemoveFromFaction(PlayerAllyFaction)
DocPhosphateREF.RemoveFromFaction(PlayerAllyFaction)
TheGiddyupKidREF.RemoveFromFaction(PlayerAllyFaction)

Sheriff01REF.AddtoFaction(PlayerEnemyFaction)
Sheriff02REF.AddtoFaction(PlayerEnemyFaction)
OneEyedIkeREF.AddtoFaction(PlayerEnemyFaction)
DocPhosphateREF.AddtoFaction(PlayerEnemyFaction)
TheGiddyupKidREF.AddtoFaction(PlayerEnemyFaction)

Sheriff01REF.SetValue(Aggression, 2)
Sheriff02REF.SetValue(Aggression, 2)
OneEyedIkeREF.SetValue(Aggression, 2)
DocPhosphateREF.SetValue(Aggression, 2)
TheGiddyupKidREF.SetValue(Aggression, 2)

Sheriff01REF.StartCombat(PlayerREF)
Sheriff02REF.StartCombat(PlayerREF)
OneEyedIkeREF.StartCombat(PlayerREF)
DocPhosphateREF.StartCombat(PlayerREF)
TheGiddyupKidREF.StartCombat(PlayerREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_DRG_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_DRG_QuestScript kmyQuest = __temp as DLC04:DLC04_DRG_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CountDeadBots()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_DRG_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_DRG_QuestScript kmyQuest = __temp as DLC04:DLC04_DRG_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CountDeadBots()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Caps_Reward_Large)
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Caps_Reward_Large)
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveCompleted(120)

;Protectron Sheriffs are no longer Essential
Alias_Sheriff01.GetActorRef().GetActorBase().SetEssential(False)
Alias_Sheriff02.GetActorRef().GetActorBase().SetEssential(False)

;If MQ03 was running, the zone is now secured. Allow the player to raise the flag.
if (DLC04MQ03.IsRunning()) && DLC04PlayerKickedOut.getValue() == 0
  DLC04MQ03.SetStage(200)
  ;Set objective stage to raise the flag
  SetStage(1100)
Else 	
  ;If MQ03 is NOT running, this quest is now complete
  SetStage(2000)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04_DRG_QuestScript
Quest __temp = self as Quest
DLC04:DLC04_DRG_QuestScript kmyQuest = __temp as DLC04:DLC04_DRG_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(1000)
kmyQuest.ListenForFlagRaise()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
SetObjectiveFailed(1000)
SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC04MQ03 Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_Sheriff01 Auto Const Mandatory

ReferenceAlias Property Alias_Sheriff02 Auto Const Mandatory

ReferenceAlias Property Alias_ServeDrinkTrigger Auto Const Mandatory

ReferenceAlias Property Alias_PlayerDrinkQuestItem Auto Const Mandatory

ReferenceAlias Property Alias_CustomersDrink Auto Const Mandatory

Armor Property DLC04_Armor_Western_01 Auto Const Mandatory

Armor Property DLC04_Armor_Western_Hat_02 Auto Const Mandatory

LeveledItem Property DLC04_DRG_44Western Auto Const Mandatory

Book Property DLC04_DRG_Combo01 Auto Const Mandatory

Potion Property DLC04_NukaCola_Wild Auto Const Mandatory

Book Property DLC04_DRG_Combo02 Auto Const Mandatory

Book Property DLC04_DRG_Combo03 Auto Const Mandatory

Scene Property DLC04DryRockGulch_31_GiddyupSuccess Auto Const Mandatory

Scene Property DLC04DryRockGulch_32_GiddyupPieces Auto Const Mandatory

Key Property DLC04_DRG_SafeCombination Auto Const Mandatory

ReferenceAlias Property Alias_CustomersDrink01 Auto Const Mandatory

ReferenceAlias Property Alias_CustomersDrink02 Auto Const Mandatory

ReferenceAlias Property Alias_ServeDrinkTrigger01 Auto Const Mandatory

ReferenceAlias Property Alias_ServeDrinkTrigger02 Auto Const Mandatory

GlobalVariable Property DLC04_DRG_Obj30Global Auto Const Mandatory

GlobalVariable Property DLC04_DRG_Obj40Global Auto Const Mandatory

Ammo Property Ammo44 Auto Const Mandatory

MiscObject Property Caps001 Auto Const Mandatory

ReferenceAlias Property Alias_OneEyedIke Auto Const Mandatory

ReferenceAlias Property Alias_DocPhosphate Auto Const Mandatory

ReferenceAlias Property Alias_TheGiddyupKid Auto Const Mandatory

Faction Property PlayerAllyFaction Auto Const Mandatory

LeveledItem Property LL_Caps_Reward_Large Auto Const Mandatory

GlobalVariable Property DLC04PlayerKickedOut Auto Const Mandatory

ObjectReference Property DLC04_DRG_01EnableMarkerREF Auto Const

ObjectReference Property DLC04_DRG_02EnableMarkerREF Auto Const

ObjectReference Property DLC04_DRG_03EnableMarkerREF Auto Const

GlobalVariable Property DLC04_DRG_Obj50Global Auto Const Mandatory

Weapon Property DLC04_Revolver Auto Const Mandatory
