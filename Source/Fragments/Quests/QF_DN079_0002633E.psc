;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN079_0002633E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
DN079_CanneryFaction.setEnemy(PlayerFaction, 1, 1)
DN079_CanneryTurretFaction.SetEnemy(PlayerFaction, 0, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Talked to Rylee post intro, she calms down
Alias_Trader.GetActorRef().ChangeAnimArchetype(AnimArchetypeFriendly)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
DN079_IntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
;if into scene is playing
;pause intro scene
;endif
DN079_SalesmanYellAfterPlayerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_Trader.GetActorRef().ChangeAnimArchetype(AnimArchetypeIrritated)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(50)
	SetObjectiveDisplayed(50, false)
endif
SetObjectiveDisplayed(100)
Game.GetPlayer().AddItem(CapsRewardSmall)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;If the intro scene is still running, stop it

;Disable blackplanes
DN079_BlackPlaneDisabler.Disable()

if DN079_IntroScene.isPlaying()
	DN079_IntroScene.stop()
endif

;If the sales man is not dead, start the taunt scene
if !(Alias_Salesman.getReference() as Actor).isDead()
	DN079_TalkingActivatorScene.start()
endif



;If salesman is alive, move him to sniping position
if !(Alias_Salesman.getReference() as Actor).isDead()
	
	;Move the Salesman to the sniping position
	Alias_Salesman.getReference().moveTo(DN079_SniperMarker001)
	(Alias_Salesman.getReference() as Actor).addItem(LL_HandmadeGun_Rifle_Scope_Raider)
	(Alias_Salesman.getReference() as Actor).equipItem(LL_HandmadeGun_Rifle_Scope_Raider)
	Alias_Salesman.GetActorRef().SetLinkedRef(DN079_SniperMarker001, DMP_Combat_HoldPosition_512)
	DN079_LightsEnableParent.Disable()
SetObjectiveDisplayed(200)
endif


if !alias_Trader.getActorRef().isDead()
	alias_Trader.GetRef().MoveTo(REHoldingCellTraderRyleeMarker)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0505_Item_00
Function Fragment_Stage_0505_Item_00()
;BEGIN CODE
;If false objectives are displayed, get rid of them
if IsObjectiveDisplayed(50)
	SetObjectiveCompleted(50)
endif

if IsObjectiveDisplayed(100)
	SetObjectiveDisplayed(100, false)
endif

If !Alias_Salesman.GetActorRef().IsDead()
	SetObjectiveDisplayed(200)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN AUTOCAST TYPE DN079QuestScript
Quest __temp = self as Quest
DN079QuestScript kmyQuest = __temp as DN079QuestScript
;END AUTOCAST
;BEGIN CODE
if !alias_salesman.getActorRef().isDead()
	DN079_BombEnableParent.enable()
	DN079_ExplosiveTrigger.enable()
	Alias_PodDoor.GetReference().unlock()
	Alias_PodDoor.GetReference().setOpen()
	kMyQuest.BombTheRamp()
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0515_Item_00
Function Fragment_Stage_0515_Item_00()
;BEGIN AUTOCAST TYPE DN079QuestScript
Quest __temp = self as Quest
DN079QuestScript kmyQuest = __temp as DN079QuestScript
;END AUTOCAST
;BEGIN CODE
;bomb the ramp
if !alias_salesman.getActorRef().isDead()

	;Disable the bridge so the player has to cross the conveyors
	;DN079_BridgeEnableParent.Disable()
	DN079_FightStartScene.Start()
	kMyQuest.SalesmanIsHostile = True
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN AUTOCAST TYPE DN079QuestScript
Quest __temp = self as Quest
DN079QuestScript kmyQuest = __temp as DN079QuestScript
;END AUTOCAST
;BEGIN CODE
;Make Cannery faction hostile to player
	DN079_CanneryFaction.setEnemy(PlayerFaction, 0, 0)

;Set Robots Hostile
alias_CanneryRobots.setValue(Aggression, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
Alias_Salesman.GetActorRef().ChangeAnimArchetype(AnimArchetypeScared)
DN079_SalesmanSurrender.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
Alias_Salesman.GetActorRef().ChangeAnimArchetype(AnimArchetypeIrritated)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE DN079QuestScript
Quest __temp = self as Quest
DN079QuestScript kmyQuest = __temp as DN079QuestScript
;END AUTOCAST
;BEGIN CODE
Alias_Salesman.GetActorRef().ChangeAnimArchetype(AnimArchetypeNervous)
DN079_CanneryFaction.setAlly(PlayerFaction, 0, 0)
Game.GetPlayer().StopCombat()
Alias_Salesman.getActorRef().StopCombat()
Game.GetPlayer().AddItem(CapsRewardMedium)
kmyQuest.SetNewPayoutDay()
kMyQuest.SalesmanIsHostile = False
SetObjectiveCompleted(200)
CompleteQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(200) && !IsObjectiveCompleted(200)
	SetObjectiveCompleted(200)
	SetStage(951)
	CompleteQuest()
elseif IsObjectiveDisplayed(50) || IsObjectiveDisplayed(100)
	FailAllObjectives()
	SetStage(955)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0955_Item_00
Function Fragment_Stage_0955_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_Trader.GetActorRef().ChangeAnimArchetype(AnimArchetypeFriendly)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN079_BridgeEnableParent Auto Const

ObjectReference Property DN079_SniperMarker001 Auto Const

Scene Property DN079_IntroScene Auto Const

LeveledItem Property CapsRewardSmall Auto Const

ReferenceAlias Property Alias_Salesman Auto Const

Scene Property DN079_TalkingActivatorScene Auto Const

Faction Property DN079_CanneryFaction Auto Const

Faction Property PlayerFaction Auto Const

LeveledItem Property LL_HandmadeGun_Rifle_Scope_Raider Auto Const

LeveledItem Property CapsRewardMedium Auto Const

Scene Property DN079_SalesmanYellAfterPlayerScene Auto Const

Scene Property DN079_FightStartScene Auto Const

Keyword Property DMP_Combat_HoldPosition_512 Auto Const

ObjectReference Property REHoldingCellTraderRyleeMarker Auto Const

ReferenceAlias Property Alias_Trader Auto Const

ActorValue Property Aggression Auto Const

ObjectReference Property DN079_BombEnableParent Auto Const

ObjectReference Property DN079_LightsEnableParent Auto Const

RefCollectionAlias Property Alias_CanneryRobots Auto Const

ObjectReference Property DN079_ExplosiveTrigger Auto Const

ReferenceAlias Property Alias_PodDoor Auto Const

Faction Property DN079_CanneryTurretFaction Auto Const

Scene Property DN079_SalesmanSurrender Auto Const

ObjectReference Property DN079_BlackPlaneDisabler Auto Const

Keyword Property AnimArchetypeScared Auto Const

Keyword Property AnimArchetypeIrritated Auto Const

Keyword Property AnimArchetypeNervous Auto Const

Keyword Property AnimArchetypeFriendly Auto Const
