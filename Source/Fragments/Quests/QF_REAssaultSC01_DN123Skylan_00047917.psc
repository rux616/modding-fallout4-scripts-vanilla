;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REAssaultSC01_DN123Skylan_00047917 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
;Initial Setup
;debug.trace(self + " STARTING")
kmyquest.Startup()
((self as Quest) as DN123REAssaultQuestScript).InitAssault()

;Disable the second wave of raiders.
Alias_Raider05.GetActorRef().Disable()
Alias_Raider06.GetActorRef().Disable()
Alias_Raider07.GetActorRef().Disable()
Alias_Raider08.GetActorRef().Disable()
Alias_Raider09.GetActorRef().Disable()

;If Ness is not loaded, teleport her into position. Otherwise, don't; she'll walk there.
Actor Ness = Alias_Ness.GetActorRef()
if (!Ness.Is3DLoaded())
     Ness.MoveTo(Alias_NessStartMarker.GetReference())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE DN123REAssaultQuestScript
Quest __temp = self as Quest
DN123REAssaultQuestScript kmyQuest = __temp as DN123REAssaultQuestScript
;END AUTOCAST
;BEGIN CODE
;EITHER:
;- Ness has finished her speech and starts the attack run, OR
;- The player ignores Ness and begins the attack on their own (hits a trigger).

;Set prior stages if necessary.
SetStage(20)
SetStage(25)

;Trigger Ness' attack scene.
StopRunningScenes()
REAssaultSC01_Stage025_NessSpeech2.Start()

;Start the attack run.
DN123_NessMercenaryFaction.SetEnemy(DN123_SkylanesRaiderFaction)
kMyQuest.StartAssault()

;Notify DN123 to update its objective.
DN123.SetStage(40) ;Secure the plane.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN CODE
;Player attacks any Raider. This is the minimum necessary for the player to earn their pay.

;Set stage 50 to trigger the attack run, if it hasn't already started.
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN AUTOCAST TYPE DN123REAssaultQuestScript
Quest __temp = self as Quest
DN123REAssaultQuestScript kmyQuest = __temp as DN123REAssaultQuestScript
;END AUTOCAST
;BEGIN CODE
;Spawn the second wave of enemies.
kMyQuest.StartSecondWaveAssault()

;Delay just a bit...
Utility.Wait(2)

;Play Ness' "Incoming Raiders" scene.
Debug.Trace("Incoming: " + REAssaultSC01_Stage075_NessSecondWave)
REAssaultSC01_Stage075_NessSecondWave.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DN123REAssaultQuestScript
Quest __temp = self as Quest
DN123REAssaultQuestScript kmyQuest = __temp as DN123REAssaultQuestScript
;END AUTOCAST
;BEGIN CODE
;Let DN123 know the plane is secure.
DN123.SetStage(140)

;Flag Skylanes as cleared.
Alias_SkylanesFlightLocation.GetLocation().SetCleared()

;Play Ness' "Secure the Plane" scene.
if (!GetStageDone(151))
     REAssaultSC01_Stage100_NessSecurePlane.Start()
EndIf

;Move Ness to the secret compartment.
Alias_Ness.TryToEvaluatePackage()

;Enable the trigger around the secret compartment.
DN123_SkylanesSecretCompartmentTrigger.Enable()

;Complete assault.
kMyQuest.CompleteAssault()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Let DN123 know we're ready to proceed.
DN123.SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;Have DN123 give the agreed-upon reward, complete the objective, and award XP.
DN123.SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0123_Item_00
Function Fragment_Stage_0123_Item_00()
;BEGIN CODE
;Speech Challenge 1: Have DN123 give the agreed-upon reward even if the player didn't earn it.
DN123.SetStage(61)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0124_Item_00
Function Fragment_Stage_0124_Item_00()
;BEGIN CODE
;Speech Challenge 2: 100 additional caps.
Game.GetPlayer().AddItem(Caps001, 100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;Stop any running scenes.
StopRunningScenes()

;Play theft scene.
REAssaultSC01_Stage150_NessTheft.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0151_Item_00
Function Fragment_Stage_0151_Item_00()
;BEGIN CODE
;Stop any running scenes.
StopRunningScenes()

;Mercenaries become hostile.
PlayerFaction.SetEnemy(DN123_NessMercenaryFaction)
Actor Ness = Alias_Ness.GetActorRef()
Ness.StartCombat(Game.GetPlayer())
Ness.EvaluatePackage()
Alias_Mercenary01.GetActorRef().EvaluatePackage()
Alias_Mercenary02.GetActorRef().EvaluatePackage()
Alias_Mercenary03.GetActorRef().EvaluatePackage()
Alias_Mercenary04.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
;debug.trace(self + " STOPPING")
((Self as Quest) as DN123REAssaultQuestScript).CleanupAssault()
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

;Stop any running scenes.
Function StopRunningScenes()
	REAssaultSC01_Stage010_NessForcegreet.Stop()
	REAssaultSC01_Stage020_NessSpeech1.Stop()
	REAssaultSC01_Stage025_NessSpeech2.Stop()
	REAssaultSC01_Stage075_NessSecondWave.Stop()
	REAssaultSC01_Stage100_NessSecurePlane.Stop()
	REAssaultSC01_Stage110A_NessApproach.Stop()
	REAssaultSC01_Stage110B_NessReward.Stop()
	REAssaultSC01_Stage110C_NessExplain1.Stop()
	REAssaultSC01_Stage110D_NessExplain2.Stop()
	REAssaultSC01_Stage160_NessDead.Stop()
EndFunction


ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_Attacker01Links Auto Const
ReferenceAlias Property Alias_Attacker02Links Auto Const
ReferenceAlias Property Alias_Attacker03Links Auto Const
ReferenceAlias Property Alias_Attacker04Links Auto Const
ReferenceAlias Property Alias_Attacker05Links Auto Const
ReferenceAlias Property Alias_Defender01Links Auto Const
ReferenceAlias Property Alias_Defender02Links Auto Const
ReferenceAlias Property Alias_Defender03Links Auto Const
ReferenceAlias Property Alias_Defender04Links Auto Const
ReferenceAlias Property Alias_Defender05Links Auto Const

Faction Property PlayerFaction Auto Const

Faction Property DN123NessMercenaryFaction Auto Const

ObjectReference Property DN123SkylanesPriorityTrigger Auto Const

MiscObject Property Caps001 Auto Const

Quest Property DN123 Auto Const

ReferenceAlias Property Alias_Ness Auto Const

ObjectReference Property SecondWaveSpawnMarker Auto Const

ObjectReference Property DN123SecondWaveSpawnMarker Auto Const

ReferenceAlias Property Alias_Raider05 Auto Const

ReferenceAlias Property Alias_Raider06 Auto Const

ReferenceAlias Property Alias_Raider07 Auto Const

ReferenceAlias Property Alias_Raider08 Auto Const

ReferenceAlias Property Alias_Raider09 Auto Const

Keyword Property LinkCustom01 Auto Const

ReferenceAlias Property Alias_SceneMarker01 Auto Const

ReferenceAlias Property Alias_Mercenary01 Auto Const

ReferenceAlias Property Alias_Mercenary02 Auto Const

ReferenceAlias Property Alias_Mercenary03 Auto Const

ReferenceAlias Property Alias_Mercenary04 Auto Const

ReferenceAlias Property Alias_MercenarySpeaker01 Auto Const

ReferenceAlias Property Alias_MercenarySpeaker02 Auto Const

ReferenceAlias Property Alias_Defender10Marker Auto Const

Scene Property REAssaultSC01_Stage075_NessSecondWave Auto Const
Scene Property REAssaultSC01_Stage100_NessSecurePlane Auto Const
Scene Property REAssaultSC01_Stage150_NessTheft Auto Const
Scene Property REAssaultSC01_Stage160_NessDead Auto Const

Scene Property REAssaultSC01_Stage010_NessForcegreet Auto Const
Scene Property REAssaultSC01_Stage020_NessSpeech1 Auto Const
Scene Property REAssaultSC01_Stage025_NessSpeech2 Auto Const
Scene Property REAssaultSC01_Stage110A_NessApproach Auto Const
Scene Property REAssaultSC01_Stage110B_NessReward Auto Const
Scene Property REAssaultSC01_Stage110C_NessExplain1 Auto Const
Scene Property REAssaultSC01_Stage110D_NessExplain2 Auto Const
Quest Property RETravelSC01_DN123SkylanesPointer Auto Const

Faction Property DN123TempFriendFaction Auto Const

ReferenceAlias Property Alias_NessStartMarker Auto Const

LocationAlias Property Alias_SkylanesFlightLocation Auto Const

Key Property DN123SkylanesKey Auto Const

Faction Property DN123_SkylanesRaiderFaction Auto Const

Faction Property DN123_NessMercenaryFaction Auto Const



ObjectReference Property DN123_SkylanesSecretCompartmentTrigger Auto Const
