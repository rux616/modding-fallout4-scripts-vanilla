;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03DialogueV118_010316F2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.EzraRevealed()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
kMyQuest.DoInit()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetPearlBonusActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.UnlockLockdownDoors()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0121_Item_00
Function Fragment_Stage_0121_Item_00()
;BEGIN CODE
Actor PlayerActor = Game.GetPlayer()
if PlayerActor.GetItemCount(DLC03_V118_Keycard_Player) < 1
	PlayerActor.AddItem(DLC03_V118_Keycard_Player)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0122_Item_00
Function Fragment_Stage_0122_Item_00()
;BEGIN CODE
DLC03_V118_Cluetracker.SetStage(93)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
kMyQuest.EzraRevealed()

if GetStageDone(1300)
SetStage(1370)

Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0503_Item_00
Function Fragment_Stage_0503_Item_00()
;BEGIN CODE
;Set if the player starts combat with Ezra after he is revealed
;(not starting fight through dialogue)
SetStage(500)
SetStage(710)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(DLC03_V118_Bribe)
Alias_Ezra.GetActorRef().RemoveItem(DLC03_V118_Bribe)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
kMyQuest.EzraRevealed()
if DLC03_V118_Quest.IsRunning()
	DLC03_V118_Quest.SetStage(870)
endif

if DLC03_V118_Quest2.IsRunning()
	DLC03_V118_Quest2.SetStage(350)
endif
kmyQuest.SetJuliannaAccused()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
DLC03_V118_Quest2.SetStage(350)
kmyQuest.SetJuliannaAccused()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetUpConfrontationFight(Alias_Julianna)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartConfrontationFight(Alias_Julianna, 4)
if GetStageDone(1300) || DLC03_V118_Quest2.IsRunning()
	DLC03_V118_Quest2.SetStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0801_Item_00
Function Fragment_Stage_0801_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
;If this character is the accused
if kmyQuest.Accusee == 1
	SetStage(830)
else
	;If you haven't accused the person, this is just murder!
	Actor myKiller = Alias_Santiago.GetActorRef().GetKiller() 
	if myKiller == Game.GetPlayer() || myKiller.IsInFaction(CurrentCompanionFaction)
		SetStage(810)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0802_Item_00
Function Fragment_Stage_0802_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
;If this character is the accused
if kmyQuest.Accusee == 2
	SetStage(830)
else
	;If you haven't accused the person, this is just murder!
	;If you haven't accused the person, this is just murder!
	Actor myKiller = Alias_Gilda.GetActorRef().GetKiller() 
	if myKiller == Game.GetPlayer() || myKiller.IsInFaction(CurrentCompanionFaction)
		SetStage(810)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0803_Item_00
Function Fragment_Stage_0803_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
;If this character is the accused
if kmyQuest.Accusee == 3
	SetStage(830)
else
	;If you haven't accused the person, this is just murder!
	;If you haven't accused the person, this is just murder!
	Actor myKiller = Alias_Keith.GetActorRef().GetKiller() 
	if myKiller == Game.GetPlayer() || myKiller.IsInFaction(CurrentCompanionFaction)
		SetStage(810)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0804_Item_00
Function Fragment_Stage_0804_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
;If this character is the accused
if !GetStageDone(1300)
	if getStageDone(500)
		SetStage(830)
	elseif !GetStageDone(950)
		;If you haven't accused the person, this is just murder!

		Actor myKiller = Alias_Julianna.GetActorRef().GetKiller() 
		if myKiller == Game.GetPlayer() || myKiller.IsInFaction(CurrentCompanionFaction)
			SetStage(810)
		endif
	endif
endif

If GetStageDone(950) || GetStageDone(1300)
	SetStage(1500)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0805_Item_00
Function Fragment_Stage_0805_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
;If this character is the accused
if kmyQuest.Accusee == 5
	SetStage(830)
else
	;If you haven't accused the person, this is just murder!
	;If you haven't accused the person, this is just murder!
	Actor myKiller = Alias_Bert.GetActorRef().GetKiller() 
	if myKiller == Game.GetPlayer() || myKiller.IsInFaction(CurrentCompanionFaction)
		SetStage(810)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0806_Item_00
Function Fragment_Stage_0806_Item_00()
;BEGIN CODE
;Killing Maxwell is always Murder
;If you haven't accused the person, this is just murder!
	Actor myKiller = Alias_Receptionist.GetActorRef().GetKiller() 
	if myKiller == Game.GetPlayer() || myKiller.IsInFaction(CurrentCompanionFaction)
		SetStage(810)
	endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0807_Item_00
Function Fragment_Stage_0807_Item_00()
;BEGIN CODE
if DLC03_V118_Intro.GetStageDone(100) && Alias_Pearl.GetReference().IsInLocation(DLC03Vault118Location)
	;If you haven't accused the person, this is just murder!
	Actor myKiller = Alias_Pearl.GetActorRef().GetKiller() 
	if myKiller == Game.GetPlayer() || myKiller.IsInFaction(CurrentCompanionFaction)
		SetStage(810)
	endif
else
	DLC03_V118_MiscObjectives.SetStage(5)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
;Quest failure States
kmyQuest.SetKickout()

;Show the message that the player is now enemies with V118
DLC03_V118_KickoutMessage.Show()


if DLC03_V118_Quest.IsRunning()
	DLC03_V118_Quest.SetStage(980)
endif

if DLC03_V118_Quest2.IsRunning()
	DLC03_V118_Quest2.SetStage(980)
endif

DLC03_V118_MiscObjectives.SetStage(980)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
;Set stage on quest to display objective
DLC03_V118_Quest.SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0830_Item_00
Function Fragment_Stage_0830_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
;Set stage on quest to display objective
DLC03_V118_Quest.SetStage(910)
kmyQuest.SetTurnInValid(true)
kmyQuest.SetInTurnInState(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
DLC03_V118_Quest.SetStage(950)
kmyQuest.SetTurnInValid(false)
kmyQuest.SetInTurnInState(false)
kmyQuest.SetPostQuestState(true)

; payment for defeating the wrong killer
Game.GetPlayer().AddItem(DLC03_V118_LItem_Reward1)

if kmyQuest.pearlBonus
	Game.GetPlayer().AddItem(DLC03_V118_LItem_RewardPearlBonus)
endif

SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN CODE
if GetStageDone(805)
SetStage(940)
endif

if !Alias_Julianna.GetActorRef().IsDead()
SetStage(935)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0930_Item_00
Function Fragment_Stage_0930_Item_00()
;BEGIN CODE
if !Alias_Julianna.GetActorRef().IsDead()
SetStage(935)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
kMyQuest.EzraRevealed()
if DLC03_V118_Quest2.IsRunning()
	DLC03_V118_Quest2.SetStage(500)
endif
kMyQuest.CancelEzraEscape()
kMyQuest.VaultAttackEzra()
Alias_Receptionist.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0960_Item_00
Function Fragment_Stage_0960_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
; payment for defeating Ezra, if you caught him the first time
Game.GetPlayer().AddItem(DLC03_V118_LItem_Reward3)

if kmyQuest.pearlBonus
	Game.GetPlayer().AddItem(DLC03_V118_LItem_RewardPearlBonus)
endif
SetStage(1000)
DLC03_V118_Quest.SetStage(950)
if DLC03_V118_Quest2.IsRunning()
	DLC03_V118_Quest2.SetStage(900)
else
	Game.RewardPlayerXP(XPMiscQuestMidLvl.GetValue() as int)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0970_Item_00
Function Fragment_Stage_0970_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
;Secondary payment for defeating Ezra, if you missed him the first time
Game.GetPlayer().AddItem(DLC03_V118_LItem_Reward2)

kmyQuest.SetPostQuestState(true)
kmyQuest.SetInLockdownState(false)
SetStage(1000)
SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;DLC03_V118_Quest.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartQuest2Timer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.EzraRevealed()
kmyQuest.SetPostQuestState(false)
kmyQuest.SetInLockdownState(true)
kmyQuest.SetupLockdownState()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1350_Item_00
Function Fragment_Stage_1350_Item_00()
;BEGIN CODE
DLC03_V118_Quest2.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1370_Item_00
Function Fragment_Stage_1370_Item_00()
;BEGIN CODE
;Found Ezra before Maxwell
if !GetStageDone(1350) && !GetStageDone(503)
DLC03_V118_Quest2.SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Valuables01.GetReference())
Game.GetPlayer().RemoveItem(Alias_Valuables02.GetReference())
Game.GetPlayer().RemoveItem(Alias_Valuables03.GetReference())

Game.GetPlayer().AddItem(DLC03_V118_LItem_RewardEzra)
Alias_Bert.GetActorRef().AddItem(DLC03_V118_LItem_RewardEzra)
DLC03_V118_Quest2.SetStage(650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03DialogueV118Script
Quest __temp = self as Quest
DLC03:DLC03DialogueV118Script kmyQuest = __temp as DLC03:DLC03DialogueV118Script
;END AUTOCAST
;BEGIN CODE
DLC03_V118_Quest2.SetStage(700)
if DLC03_V118_Quest.IsRunning()
	DLC03_V118_Quest.SetStage(920)
endif
kmyQuest.SetTurnInValid(true)
kmyQuest.SetInTurnInState(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
DLC03_V118_Quest2.SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property DLC03_V118_LItemJuliannasMeds Auto Const Mandatory

Key Property DLC03_V118_Keycard_Player Auto Const Mandatory

Quest Property DLC03_V118_ClueTracker Auto Const Mandatory

ReferenceAlias Property Alias_Bert Auto Const Mandatory

Quest Property DLC03_V118_Quest Auto Const Mandatory

LeveledItem Property DLC03_V118_LItem_Reward1 Auto Const Mandatory

LeveledItem Property DLC03_V118_LItem_Reward2 Auto Const Mandatory

LeveledItem Property DLC03_V118_LItem_Reward3 Auto Const Mandatory

LeveledItem Property DLC03_V118_LItem_RewardPearlBonus Auto Const Mandatory

Quest Property DLC03_V118_Quest2 Auto Const Mandatory

RefCollectionAlias Property Alias_CrateActivators Auto Const Mandatory

ReferenceAlias Property Alias_Valuables01 Auto Const Mandatory

ReferenceAlias Property Alias_Valuables02 Auto Const Mandatory

ReferenceAlias Property Alias_Valuables03 Auto Const Mandatory

LeveledItem Property DLC03_V118_LItem_RewardEzra Auto Const Mandatory

Holotape Property DLC03_v118_EzraHolotape Auto Const Mandatory

ReferenceAlias Property Alias_Receptionist Auto Const Mandatory

ReferenceAlias Property Alias_Julianna Auto Const Mandatory

LeveledItem Property DLC03_V118_Bribe Auto Const Mandatory

ReferenceAlias Property Alias_Ezra Auto Const Mandatory

Message Property DLC03_V118_KickoutMessage Auto Const Mandatory

Quest Property DLC03_V118_Intro Auto Const Mandatory

ReferenceAlias Property Alias_Pearl Auto Const Mandatory

Cell Property DLC03Vault118 Auto Const Mandatory

Quest Property DLC03_V118_MiscObjectives Auto Const Mandatory

Location Property DLC03Vault118Location Auto Const Mandatory

ReferenceAlias Property Alias_Santiago Auto Const Mandatory

Faction Property CurrentCompanionFaction Auto Const Mandatory

ReferenceAlias Property Alias_Gilda Auto Const Mandatory

ReferenceAlias Property Alias_Keith Auto Const Mandatory

GlobalVariable Property XPMiscQuestMidLvl Auto Const Mandatory
