;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN138_001073CE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Alias_PumpActivator.GetReference().BlockActivation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(0) ;Display "Repair Pipes"
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
(Alias_PumpActivator.GetReference() as CircuitBreakerMasterScript).DenyOnPosition = FALSE
SetObjectiveCompleted(0); Complete "Repair Pipes"
if Alias_Solly.GetActorReference().IsDead()
	SetObjectiveDisplayed(20); Display "Activate Pump"
else
	SetObjectiveDisplayed(10); Display "Return to Sully"
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN AUTOCAST TYPE DN138Quest
Quest __temp = self as Quest
DN138Quest kmyQuest = __temp as DN138Quest
;END AUTOCAST
;BEGIN CODE
SetObjectiveFailed(10); Failed"Return to Sully"
SetObjectiveDisplayed(20); Display "Activate Pump"

if kmyquest.RewardTracker == 0
	Alias_Solly.GetReference().AddItem(Caps001, 50)
elseif kmyquest.RewardTracker == 1
	Alias_Solly.GetReference().AddItem(Caps001, 75)
elseif kmyquest.RewardTracker == 2
	Alias_Solly.GetReference().AddItem(Caps001, 100)
elseif kmyquest.RewardTracker == 3
	Alias_Solly.GetReference().AddItem(Caps001, 125)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10); Complete "Return to Sully"
SetObjectiveDisplayed(20); Display "Activate Pump"
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE DN138Quest
Quest __temp = self as Quest
DN138Quest kmyQuest = __temp as DN138Quest
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10); Complete "Return to Sully"
SetObjectiveCompleted(20); Complete "Activate Pump"
if !Alias_Solly.GetActorReference().IsDead()
	SetObjectiveDisplayed(30); Display "Return to Sully"
else
	SetStage(1000)
endif
(Alias_PumpSoundSource.GetReference()).EnableNoWait()
(kmyquest as DN138Quest).PlayPumpSound()
Game.ShakeCamera(Game.GetPlayer(), 0.5, 1)
Game.ShakeController(0.5, 0.5, 1)
kmyQuest.StartFloodDisableTimer()
DN138AfterAmbush01.Start()
utility.Wait(2)
Alias_AmbushActivator.GetReference().EnableNoWait()
Alias_AmbushActivator.GetReference().Activate(Alias_AmbushActivator.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN AUTOCAST TYPE DN138Quest
Quest __temp = self as Quest
DN138Quest kmyQuest = __temp as DN138Quest
;END AUTOCAST
;BEGIN CODE
SetObjectiveFailed(30); Failed "Return to Sully"

if kmyquest.RewardTracker == 0
	Alias_Solly.GetReference().AddItem(Caps001, 50)
elseif kmyquest.RewardTracker == 1
	Alias_Solly.GetReference().AddItem(Caps001, 75)
elseif kmyquest.RewardTracker == 2
	Alias_Solly.GetReference().AddItem(Caps001, 100)
elseif kmyquest.RewardTracker == 3
	Alias_Solly.GetReference().AddItem(Caps001, 125)
endif

SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE DN138Quest
Quest __temp = self as Quest
DN138Quest kmyQuest = __temp as DN138Quest
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(0)
CompleteQuest()

if !Alias_Solly.GetActorReference().IsDead()
	if kmyquest.RewardTracker == 0
		Game.GetPlayer().AddItem(Caps001, 50)
	elseif kmyquest.RewardTracker == 1
		Game.GetPlayer().AddItem(Caps001, 75)
	elseif kmyquest.RewardTracker == 2
		Game.GetPlayer().AddItem(Caps001, 100)
	elseif kmyquest.RewardTracker == 3
		Game.GetPlayer().AddItem(Caps001, 125)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
Alias_FloodedMarker.GetReference().DisableNoWait()
Alias_AmbushActivator.GetReference().DisableNoWait()

CompleteAllObjectives()

if Alias_Solly.GetActorReference().IsDead() == FALSE
    Alias_SollyAsRaider.GetReference().EnableNoWait()
    Alias_Solly.GetReference().DisableNoWait()
else
    Alias_RaiderBoss.GetReference().EnableNoWait()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_PumpActivator Auto Const

ReferenceAlias Property Alias_AmbushActivator Auto Const

MiscObject Property Caps001 Auto Const

ReferenceAlias Property Alias_FloodedMarker Auto Const

ReferenceAlias Property Alias_Solly Auto Const

ReferenceAlias Property Alias_SollyAsRaider Auto Const

ReferenceAlias Property Alias_RaiderBoss Auto Const

Scene Property DN138AfterAmbush01 Auto Const

ReferenceAlias Property Alias_PumpSoundSource Auto Const
