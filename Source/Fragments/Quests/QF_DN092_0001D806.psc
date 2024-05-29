;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN092_0001D806 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE dn092questscript
Quest __temp = self as Quest
dn092questscript kmyQuest = __temp as dn092questscript
;END AUTOCAST
;BEGIN CODE
;Alias_Minuteman_Redshirt.getReference().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
debug.trace("DN092 - stage 5 set")
preMuseumStreet.stop()
Alias_Raider_RoofKiller.getReference().enable()
DN092_RedshirtScene.start()
streetintroextraraider.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;; this stage starts a scene
;Alias_EncA_Raider01.getReference().enable()
;Alias_EncA_Raider02.getReference().enable()

Alias_Preston.getActorReference().moveto(prestonwindowMarker)

;WJS - Make sure we shutdown Preston's balcony scene and the pre museum fight scene
preMuseumStreet.stop()
MQ103.SetStage(61)

Debug.trace("DN092 - Stage 10 set")

;Alias_EncA_Raider01.getReference().moveTo(Alias_EncA_Raider01.getReference().getLinkedRef(plinkCustom02))
;Alias_EncA_Raider02.getReference().moveTo(Alias_EncA_Raider02.getReference().getLinkedRef(plinkCustom02))
;DN01_EntryCombatScene.start()

; cleaning house - if raider on the roof didn't die, disable him.  We'll assume he ran in and is one of the former two guys.
if (Alias_Raider_RoofKiller.getActorReference().isDead() == FALSE)
     Alias_Raider_RoofKiller.getReference().disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
Alias_EncA_Raider01.getActorReference().EvaluatePackage()
Alias_EncA_Raider02.getActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN AUTOCAST TYPE dn092questscript
Quest __temp = self as Quest
dn092questscript kmyQuest = __temp as dn092questscript
;END AUTOCAST
;BEGIN CODE
Alias_Ambush_Raider.getReference().enable()
Alias_Ambush_Raider.getActorReference().startCombat(game.getPlayer())
;if (Alias_EncA_Raider01.getActorReference().isDead()) && (Alias_EncA_Raider02.getActorReference().isDead())
;     PrestonShutter.setOpen(false)
;endif

;also make sure the Raiders on the bridge are hostile
setStage(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN AUTOCAST TYPE dn092questscript
Quest __temp = self as Quest
dn092questscript kmyQuest = __temp as dn092questscript
;END AUTOCAST
;BEGIN CODE
setStage(13)

Alias_Ambush_Raider.getReference().enable()
;if (Alias_EncA_Raider01.getActorReference().isDead()) && (Alias_EncA_Raider02.getActorReference().isDead())
;     PrestonShutter.setOpen(false)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
; Spawn 2nd floor raider encounter.
Alias_EncB_Raider01.getReference().enable()
Alias_EncB_Raider02.getReference().enable()
DN092_InteriorEavesDropping01.start()
DN01_EntryCombatScene.stop()
;PrestonShutter.setOpen(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; enable third floor encounter
Alias_EncC_Raider01.getReference().enable()
Alias_EncC_Raider02.getReference().enable()
DN092_Raiders3rdFloorScene.start()

; enable prior encounters just in case they somehow were missed.
Alias_EncB_Raider01.getReference().enable()
Alias_EncB_Raider02.getReference().enable()
Alias_Ambush_Raider.getReference().enable()

;finish entry scene just in case
setStage(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN CODE
; failsafe kill the redshirt just in case...
Alias_Minuteman_Redshirt.GetActorReference().kill()

;pull third floor raiders from non-combat faction
;Alias_EncC_Raider01.GetActorRef().RemoveFromFaction(pDN092ThirdFloorFaction)
;Alias_EncC_Raider02.GetActorRef().RemoveFromFaction(pDN092ThirdFloorFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN AUTOCAST TYPE dn092questscript
Quest __temp = self as Quest
dn092questscript kmyQuest = __temp as dn092questscript
;END AUTOCAST
;BEGIN CODE
; enable all of our initial wave alias actors
Alias_WaveRaider01.getactorReference().enable()
Alias_WaveRaider02.getactorReference().enable()
Alias_WaveRaider03.getactorReference().enable()
Alias_WaveRaiderRoofLookout.getactorReference().enable()
Alias_RaiderBoss.getactorReference().enable()
Alias_RaiderBoss.getActorReference().setOutfit(DN092_bossOutfit)

DN092questScript questScript = DN092 as DN092questScript
questScript.registerNewActor(Alias_WaveRaider01)
questScript.registerNewActor(Alias_WaveRaider02)
questScript.registerNewActor(Alias_WaveRaider03)
questScript.registerNewActor(Alias_WaveRaiderRoofLookout)
questScript.registerNewActor(Alias_RaiderBoss)

DN092_BossTauntScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0076_Item_00
Function Fragment_Stage_0076_Item_00()
;BEGIN AUTOCAST TYPE dn092questscript
Quest __temp = self as Quest
dn092questscript kmyQuest = __temp as dn092questscript
;END AUTOCAST
;BEGIN CODE
;Debug.messagebox("DN092 Stage 76 has been set")

if !kMyQuest.getStageDone(75)
	kMyQuest.setStage(75)
endif

DN092QuestScript questScript = DN092 as DN092QuestScript
; quick failsafe - redudantly flip flag
questScript.bLeftRoofSafeZone = TRUE

Alias_WaveRaider01.getActorReference().startcombat(game.getPlayer())
Alias_WaveRaider02.getactorReference().startcombat(game.getPlayer())
Alias_WaveRaider03.getactorReference().startcombat(game.getPlayer())
Alias_WaveRaiderRoofLookout.getactorReference().startcombat(game.getPlayer())
Alias_RaiderBoss.getactorReference().startcombat(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0077_Item_00
Function Fragment_Stage_0077_Item_00()
;BEGIN CODE
; This stage can be set by:
;   - the default erspawn script running out of raiders to spawn
;   - the player entering DN092ForceSpawnDeathclawTrigger
;   - failsafe timer started by stage 76

alias_Deathclaw.getactorReference().enable()
DeathclawHoleNavBlocker.enable()
; removing music call - on base actor
;MUSzCombatBoss.add()

;set objectives on MQ103
MQ103.SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0079_Item_00
Function Fragment_Stage_0079_Item_00()
;BEGIN CODE
MQ103.setStage(123)
MUSzCombatBoss.remove()

;WJS - do not set this stage here, shutting down the quest now breaks MQ102
;setStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property prestonWindowMarker  Auto Const  

Scene Property DN01_EntryCombatScene  Auto Const  

Quest Property MQ103  Auto Const  

Scene Property DN092_InteriorEavesDropping01  Auto Const  

Scene Property DN092_Raiders3rdFloorScene  Auto Const  

Scene Property DN092_BossTauntScene  Auto Const  

ReferenceAlias Property Alias_RaiderBoss Auto Const ; Legacy alias property
ReferenceAlias Property Alias_RaiderWaveSpawner01 Auto Const ; Legacy alias property
ReferenceAlias Property Alias_EncC_Raider01 Auto Const ; Legacy alias property
ReferenceAlias Property Alias_RaiderWaveSpawner02 Auto Const ; Legacy alias property
ReferenceAlias Property Alias_EncB_Raider01 Auto Const ; Legacy alias property
ReferenceAlias Property Alias_EncA_Raider01 Auto Const ; Legacy alias property
ReferenceAlias Property Alias_Preston Auto Const ; Legacy alias property
ReferenceAlias Property Alias_EncA_Raider02 Auto Const ; Legacy alias property
ReferenceAlias Property Alias_EncB_Raider02 Auto Const ; Legacy alias property
LocationAlias Property Alias_ConcordMuseum Auto Const ; Legacy alias property
ReferenceAlias Property Alias_EncC_Raider02 Auto Const ; Legacy alias property
ReferenceAlias Property Alias_WaveRaider01 Auto Const ; Legacy alias property
ReferenceAlias Property Alias_WaveRaider03 Auto Const ; Legacy alias property
ReferenceAlias Property Alias_WaveRaider02 Auto Const ; Legacy alias property
ReferenceAlias Property Alias_Deathclaw Auto Const ; Legacy alias property

ReferenceAlias Property Alias_Ambush_Raider auto const;

Keyword Property pLinkCustom02 Auto Const

ReferenceAlias Property Alias_WaveRaiderRoofLookout Auto Const

ObjectReference Property DeathclawHoleNavBlocker Auto Const

Quest Property DN092 Auto Const

Scene Property DN092_RedshirtScene Auto Const

ReferenceAlias Property Alias_Raider_RoofKiller Auto Const

Scene Property preMuseumStreet Auto Const

ReferenceAlias Property Alias_Minuteman_Redshirt Auto Const

ObjectReference Property StreetIntroExtraRaider Auto Const

ObjectReference Property PrestonShutter Auto Const

;Faction Property pDN092ThirdFloorFaction Auto Const

MusicType Property MUSzCombatBoss Auto Const

;ObjectReference Property pMQ102PrestonBalconyCollision Auto Const

Outfit Property DN092_BossOutfit Auto Const
