;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN011_000FF3C2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DN011QuestScript
Quest __temp = self as Quest
DN011QuestScript kmyQuest = __temp as DN011QuestScript
;END AUTOCAST
;BEGIN CODE
Alias_EntranceIntercom.GetRef().Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE DN011QuestScript
Quest __temp = self as Quest
DN011QuestScript kmyQuest = __temp as DN011QuestScript
;END AUTOCAST
;BEGIN CODE
Alias_EntranceIntercom.GetRef().Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE DN011QuestScript
Quest __temp = self as Quest
DN011QuestScript kmyQuest = __temp as DN011QuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().AddToFaction(kmyQuest.DN011SecurityFaction)
(Alias_EnableEnemyTriggerMarker.GetReference()).DisableNoWait()
Alias_LoadDoorFront.GetReference().Lock(FALSE)
Alias_LoadDoorStation.GetReference().Lock(FALSE)
int instanceID01 = UILockpickingUnlock.play(Alias_LoadDoorFront.GetReference())
int instanceID02 = UILockpickingUnlock.play(Alias_LoadDoorStation.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Alias_ChainToDisableFromStation.GetReference().EnableNoWait()
Alias_ChainToEnableFromStation.GetReference().DisableNoWait()
Alias_LoadDoorStation.GetReference().Lock(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
Alias_DisableFromStationMarker.GetReference().DisableNoWait()
Alias_ChainToDisableFromStation.GetReference().DisableNoWait()
Alias_ChainToEnableFromStation.GetReference().EnableNoWait()
Alias_LoadDoorFront.GetReference().Lock(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE DN011QuestScript
Quest __temp = self as Quest
DN011QuestScript kmyQuest = __temp as DN011QuestScript
;END AUTOCAST
;BEGIN CODE
;If the player is enemy
if !GetStageDone(400)
	;and has entered from the front
	if GetStageDone(500)
		;then start enemies spawning from station entrance
		Alias_RespawnMarker01.GetReference().Moveto(Alias_RespawnMarker01.GetReference().GetNthLinkedRef(2))
		Alias_RespawnMarker02.GetReference().Moveto(Alias_RespawnMarker02.GetReference().GetNthLinkedRef(2))
		Alias_RespawnMarker03.GetReference().Moveto(Alias_RespawnMarker03.GetReference().GetNthLinkedRef(2))
		Alias_RespawnMarker04.GetReference().Moveto(Alias_RespawnMarker04.GetReference().GetNthLinkedRef(2))
		Alias_HoldPositionLocation01.GetReference().Moveto(Alias_HoldPositionLocation01.GetReference().GetNthLinkedRef(2))
		Alias_RespawningActor01.GetReference().Moveto(Alias_RespawnMarker01.GetReference())
		Alias_RespawningActor02.GetReference().Moveto(Alias_RespawnMarker01.GetReference())
		Alias_RespawningActor03.GetReference().Moveto(Alias_RespawnMarker01.GetReference())
		Alias_RespawningActor04.GetReference().Moveto(Alias_RespawnMarker01.GetReference())
		Alias_RespawningActor05.GetReference().Moveto(Alias_RespawnMarker01.GetReference())
		debug.Trace(self + ": First Wave Starts At Station!")
		(kmyQuest as DN011QuestScript).StartFirstSpawnTimer()
		DN011SecurityBreachSubwayEntranceScene.Start()
	else		
		;then start enemies spawning from front entrance
		(kmyQuest as DN011QuestScript).StartFirstSpawnTimer()
		debug.Trace(self + ": First Wave Starts At Entrance!")
		DN011SecurityBreachFrontEntranceScene.Start()
	endif
else
	;player isn't enemy, then spawn supermutants from front entrance first
	utility.Wait(10)
	(kmyQuest as DN011QuestScript).StartFirstSpawnTimer()
	debug.Trace(self + ": First Wave Starts At Entrance!")
	DN011SecurityBreachFrontEntranceScene.Start()
endif

;Enable all enemies
Alias_RespawningActor01.GetReference().EnableNoWait()
Alias_RespawningActor02.GetReference().EnableNoWait()
Alias_RespawningActor03.GetReference().EnableNoWait()
Alias_RespawningActor04.GetReference().EnableNoWait()
Alias_RespawningActor05.GetReference().EnableNoWait()

utility.Wait(3)
FFGoodneighbor02.SetStage(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
debug.Trace(self + ": First Wave Stops!")
SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE DN011QuestScript
Quest __temp = self as Quest
DN011QuestScript kmyQuest = __temp as DN011QuestScript
;END AUTOCAST
;BEGIN CODE
;If the player is enemy
if !GetStageDone(400)
	;and has entered from the station
	if GetStageDone(550)
		;then change to enemies spawning from front entrance
		Alias_RespawnMarker01.GetReference().Moveto(Alias_RespawnMarker01.GetReference().GetNthLinkedRef(1))
		Alias_RespawnMarker02.GetReference().Moveto(Alias_RespawnMarker02.GetReference().GetNthLinkedRef(1))
		Alias_RespawnMarker03.GetReference().Moveto(Alias_RespawnMarker03.GetReference().GetNthLinkedRef(1))
		Alias_RespawnMarker04.GetReference().Moveto(Alias_RespawnMarker04.GetReference().GetNthLinkedRef(1))
		Alias_HoldPositionLocation01.GetReference().Moveto(Alias_HoldPositionLocation01.GetReference().GetNthLinkedRef(1))
		debug.Trace(self + ": Second wave starts from Front entrance!")
		(kmyQuest as DN011QuestScript).StartSecondSpawnTimer()
		DN011SecurityBreachFrontEntranceScene.Start()
	else		
		;else, change to enemies spawning from the station entrance
		Alias_RespawnMarker01.GetReference().Moveto(Alias_RespawnMarker01.GetReference().GetNthLinkedRef(2))
		Alias_RespawnMarker02.GetReference().Moveto(Alias_RespawnMarker02.GetReference().GetNthLinkedRef(2))
		Alias_RespawnMarker03.GetReference().Moveto(Alias_RespawnMarker03.GetReference().GetNthLinkedRef(2))
		Alias_RespawnMarker04.GetReference().Moveto(Alias_RespawnMarker04.GetReference().GetNthLinkedRef(2))
		Alias_HoldPositionLocation01.GetReference().Moveto(Alias_HoldPositionLocation01.GetReference().GetNthLinkedRef(2))
		debug.Trace(self + ": Second Wave Starts At Station Entrance!")
		(kmyQuest as DN011QuestScript).StartSecondSpawnTimer()
		DN011SecurityBreachSubwayEntranceScene.Start()
	endif
else
	;else, if player isn't enemy, then start second wave at station entrance
	Alias_RespawnMarker01.GetReference().Moveto(Alias_RespawnMarker01.GetReference().GetNthLinkedRef(2))
	Alias_RespawnMarker02.GetReference().Moveto(Alias_RespawnMarker02.GetReference().GetNthLinkedRef(2))
	Alias_RespawnMarker03.GetReference().Moveto(Alias_RespawnMarker03.GetReference().GetNthLinkedRef(2))
	Alias_RespawnMarker04.GetReference().Moveto(Alias_RespawnMarker04.GetReference().GetNthLinkedRef(2))
	Alias_HoldPositionLocation01.GetReference().Moveto(Alias_HoldPositionLocation01.GetReference().GetNthLinkedRef(2))
	debug.Trace(self + ": Second Wave Starts At Station Entrance!")
	(kmyQuest as DN011QuestScript).StartSecondSpawnTimer()
	DN011SecurityBreachSubwayEntranceScene.Start()
endif

Alias_RespawningActor06.GetReference().EnableNoWait()
Alias_RespawningActor07.GetReference().EnableNoWait()
Alias_RespawningActor08.GetReference().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
debug.Trace(self + ": Stop spawning!")
(Alias_RespawningActor01 as DN011RespawningActorScript).StartCheckingForDead()
(Alias_RespawningActor02 as DN011RespawningActorScript).StartCheckingForDead()
(Alias_RespawningActor03 as DN011RespawningActorScript).StartCheckingForDead()
(Alias_RespawningActor04 as DN011RespawningActorScript).StartCheckingForDead()
(Alias_RespawningActor05 as DN011RespawningActorScript).StartCheckingForDead()
(Alias_RespawningActor06 as DN011RespawningActorScript).StartCheckingForDead()
(Alias_RespawningActor07 as DN011RespawningActorScript).StartCheckingForDead()
(Alias_RespawningActor08 as DN011RespawningActorScript).StartCheckingForDead()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
debug.Trace(self + ": All enemies dead!")
DN011SecurityBreachDoneScene.Start()
FFGoodneighbor02.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_EntranceIntercom Auto Const

ReferenceAlias Property Alias_RespawningActor01 Auto Const

ReferenceAlias Property Alias_RespawningActor02 Auto Const

ReferenceAlias Property Alias_RespawningActor03 Auto Const

ReferenceAlias Property Alias_RespawningActor04 Auto Const

ReferenceAlias Property Alias_RespawnMarker01 Auto Const

ReferenceAlias Property Alias_RespawnMarker02 Auto Const

ReferenceAlias Property Alias_RespawnMarker03 Auto Const

ReferenceAlias Property Alias_RespawnMarker04 Auto Const

ReferenceAlias Property Alias_HoldPositionLocation01 Auto Const

Scene Property DN011SecurityBreachFrontEntranceScene Auto Const

Scene Property DN011SecurityBreachSubwayEntranceScene Auto Const

ReferenceAlias Property Alias_RespawningActor05 Auto Const

Scene Property DN011SecurityBreachDoneScene Auto Const

ReferenceAlias Property Alias_EnableEnemyTriggerMarker Auto Const

ReferenceAlias Property Alias_DisableFromStationMarker Auto Const

ReferenceAlias Property Alias_RespawningActor06 Auto Const

ReferenceAlias Property Alias_RespawningActor07 Auto Const

ReferenceAlias Property Alias_RespawningActor08 Auto Const

ReferenceAlias Property Alias_ChainToDisableFromStation Auto Const

ReferenceAlias Property Alias_ChainToEnableFromStation Auto Const

ReferenceAlias Property Alias_LoadDoorStation Auto Const

ReferenceAlias Property Alias_LoadDoorFront Auto Const

sound Property UILockpickingUnlock Auto Const

Quest Property FFGoodneighbor02 Auto Const
