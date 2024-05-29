;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Inst301_000E2058 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Set stage 5, which places actors, make the rumor available, etc
SetStage(5)

;Move the player
;Game.GetPlayer().MoveTo(Inst301Playtest1)

;Add the player to the Institute Faction, which is necessary for some faction interactions
Game.GetPlayer().AddToFaction(InstituteFaction)

;Add the Institute map marker
InstituteMapMarker.AddToMap(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE inst301script
Quest __temp = self as Quest
inst301script kmyQuest = __temp as inst301script
;END AUTOCAST
;BEGIN CODE
;Set ???

SetObjectiveDisplayed(5)

;Start Inst misc quest 1
InstM01.Start()

; KMK - adding due to teleport script change
; register for teleport events for X6 and Synth boss
TeleportActorScript x6 = alias_x6.GetActorRef() as TeleportActorScript
TeleportActorScript boss = alias_synthBoss.GetActorRef() as TeleportActorScript

kmyQuest.RegisterForCustomEvent(x6, "TeleportDone")
kmyQuest.RegisterForCustomEvent(boss, "TeleportDone")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set if the player says he is not ready to retrieve the rogue synth
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
;Set at the end of the synth porters force-greet scene
;Prevents him from greting twice
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Set if the player successfully extorts loot from the boos

;Hook the player up with some loot
utility.Wait(2)
Game.GetPlayer().AddItem(Inst301LibertaliaPassword)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
;Sets when player leaves the trigger on the roof

if GetStageDone(45) == False
     Inst301SceneBossAttack.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Set in the boss confrontation if the player threatens the boss
;This will make the boss and his guards hostile to the player and X6

;Add Boss and Guards to Inst301PlayerEnemyFaction
Alias_SynthBoss.GetActorRef().AddToFaction(Inst301PlayerEnemyFaction)
Alias_Guard1.GetActorRef().AddToFaction(Inst301PlayerEnemyFaction)
Alias_Guard2.GetActorRef().AddToFaction(Inst301PlayerEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
;Remove factions, end combat, basically goes inert

Actor SynthBossRef = Alias_SynthBoss.GetActorRef()

SynthBossRef.RemoveFromFaction(Inst301BossGuardFaction)
SynthBossRef.RemoveFromFaction(Inst301PlayerEnemyFaction)
SynthBossRef.EvaluatePackage()
SynthBossRef.SetGhost()
SynthBossRef.StopCombatAlarm()
SynthBossRef.StopCombat()
SynthBossRef.BlockActivation(True, True)

;Stop the scene that fires when the player leaves the initial primitive
Inst301SceneBossAttack.Stop()

;Cause the synth boss to play the shutdown idle
Utility.Wait(0.25)
SynthBossRef.PlayIdle(IdleSynthShutdown)

;Used as a condition on BossShutdownPackage, which is a travel to self, evp
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0047_Item_00
Function Fragment_Stage_0047_Item_00()
;BEGIN CODE
;Start lieutenant attack scene
Inst301SceneLieutenantsAttack.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Add Boss Guards to Inst301PlayerEnemyFaction
Alias_Guard1.GetActorRef().AddToFaction(Inst301PlayerEnemyFaction)
Alias_Guard2.GetActorRef().AddToFaction(Inst301PlayerEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
;X6 teleports out
TeleportActorScript courser = Alias_X6.GetActorRef() as TeleportActorScript
;courser.TeleportOut(Inst301PorterWait)
courser.TeleportOut()  ; KMK - quest script now moves to this marker on custom event when teleport is done
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;X6 teleports out
TeleportActorScript courser = Alias_X6.GetActorRef() as TeleportActorScript
;courser.TeleportOut(Inst301PorterWait)
courser.TeleportOut()  ;KMK - quest script now moves to this marker on custom event when teleport is done


;Boss also teleports
TeleportActorScript boss = Alias_SynthBoss.GetActorRef() as TeleportActorScript
;boss.TeleportOut(Inst301GabrielTeleportIn)
boss.TeleportOut()  ; KMK - quest script now moves to this marker on custom event when teleport is done

SetStage(65)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
;Set in Stage 60, which is set at the end of the scene where X6 and Gabriel teleport out
;Used as a condition on Gabriel's "sit in chair" package
;This will casue him to sit in the reprogramming chair in the SRB

;Block activation of Gabriel
Alias_SynthBoss.GetActorRef().BlockActivation(true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
;Enable Gabriel (he was disabled by the teleport)
Alias_SynthBoss.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Called from a script on the synth boss alias
;This is set when the synth boss enter combat, and in turn starts a scene where X6 uses the reset code

if GetStageDone(45) == False
     Inst301SceneX6UsesCode.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set at the end of Father's intro scene

SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set at the end of Father's intro scene

;Enable X6 and the raider corpses
Alias_X6.GetActorRef().Enable()
Inst301EnableMarker.Enable()
Alias_PreQuestBoss.GetRef().Disable()

;Unlock Boss Doors
Alias_BossDoor1.GetReference().Unlock()
Alias_BossDoor2.GetReference().Unlock()

;Add the Libertalia map marker
LiberitaliaDocksMapMarker.AddToMap()

SetObjectiveCompleted(5)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE inst301script
Quest __temp = self as Quest
inst301script kmyQuest = __temp as inst301script
;END AUTOCAST
;BEGIN CODE
;Set at the end of X6's first scene
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

;Set the quest variable that contorls the follow package
kmyquest.X6Following=1

;Small XP Reward
;Game.RewardPlayerXP(XPFactionSmall.GetValue() as int)

;update stage for kid synth quest
DialogueInstituteShaunKid.SetStage(5)

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_Inst301AssaultLibertaliaAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN AUTOCAST TYPE inst301script
Quest __temp = self as Quest
inst301script kmyQuest = __temp as inst301script
;END AUTOCAST
;BEGIN CODE
;Move X6 to interior cell before boss room
Alias_X6.GetActorRef().MoveTo(Alias_X6MoveIntoIntMarker.GetRef())

;Disable all outside raiders
kmyQuest.DisableLivingRaiders()

;Start the intercept scene
Inst301SceneX6GivesResetCode.Start()

SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0335_Item_00
Function Fragment_Stage_0335_Item_00()
;BEGIN CODE
;Set (in the scene data) at the end of the scene Inst301X6MoveToIntercept
;Used a condition on X6's forcegreet package where he tells the player about the reset code
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0336_Item_00
Function Fragment_Stage_0336_Item_00()
;BEGIN CODE
;Set when X6 has forcegreeted the player with the greeting for the reset code scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
;Set by activating the interior trap door from bosses room to the roof
Alias_SynthBoss.GetReference().EnableNoWait()
Alias_Guard1.GetReference().EnableNoWait()
Alias_Guard2.GetReference().EnableNoWait()

;Move X6 to the roof
Alias_X6.GetActorRef().MoveTo(Alias_X6MoveToRoofMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Stop scenes that might be playing which assume the boss is alive
Inst301SceneLieutenantsAttack.Stop()
Inst301SceneX6UsesCode.Stop()

;X6 is angry that boss died
Inst301SceneX6AngryAtBossDeath.Start()

;Fail objective 30
SetObjectiveFailed(30)

SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
;Set when the second Lieutenant is killed and his counter is incremented

;Check if the synth boss is dead or not
If GetStageDone(400)
  ;The synth boss is dead
  ;Start the scene where X6 teleports back alone
  Inst301X6ReturnAlone.Start()
else
  ;The synth boss is alive
  SetStage(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Set stage and start scene where X6 teleports the boss back
Inst301SynthBoss.SetEssential()
Inst301SceneBossReturn.Start()
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE inst301script
Quest __temp = self as Quest
inst301script kmyQuest = __temp as inst301script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)

;Enable all outside raiders
kmyQuest.EnableDisabledRaiders()

;X6 no longer follows the player
kmyquest.X6Following=0

Alias_X6.GetActorRef().evaluatepackage()

;Add reward items to container in players' quarters
Alias_PlayerQuartersContainer.GetReference().AddItem(Clothes_InstituteUniform, 1)
Alias_PlayerQuartersContainer.GetReference().AddItem(LL_InstituteLaserGun_Boss, 1)
Alias_PlayerQuartersContainer.GetReference().AddItem(AmmoFusionCell, 25)
Alias_PlayerQuartersContainer.GetReference().AddItem(PlasmaGrenade, 5)
Alias_PlayerQuartersContainer.GetReference().AddItem(PlasmaMine, 5)

;move kid shaun to Doctor Li's lab
Alias_ShaunChild.GetReference().MoveTo(ShaunChildDeactivatedMarker)
Alias_ShaunChild.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_01
Function Fragment_Stage_0600_Item_01()
;BEGIN AUTOCAST TYPE inst301script
Quest __temp = self as Quest
inst301script kmyQuest = __temp as inst301script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)

;Enable all outside raiders
kmyQuest.EnableDisabledRaiders()

;X6 no longer follows the player
kmyquest.X6Following=0

Alias_X6.GetActorRef().evaluatepackage()

;Add reward items to container in players' quarters
Alias_PlayerQuartersContainer.GetReference().AddItem(Clothes_InstituteUniform, 1)
Alias_PlayerQuartersContainer.GetReference().AddItem(LL_InstituteLaserGun_SimpleRifle, 1)
Alias_PlayerQuartersContainer.GetReference().AddItem(AmmoFusionCell, 5)
Alias_PlayerQuartersContainer.GetReference().AddItem(Stimpak, 5)

;move kid shaun to Doctor Li's lab
Alias_ShaunChild.GetReference().MoveTo(ShaunChildDeactivatedMarker)
Alias_ShaunChild.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
;Set at the end of the final conversation with Father

SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)

;Unlock the door to the players' quarters
Alias_PlayerQuartersDoor.GetReference().Unlock()

;Enable X6's reference (it was disabled when he teleported out of Libertalia)
Alias_X6.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
;Set when the player enters his quarters for the first time
;Causes X6 to run his scene telling the player to go back to Father

Inst301SceneConnectToInst302.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Set when the player enters his quarters for the first time.

CompleteAllObjectives()

;Final XP Reward
;Game.RewardPlayerXP(XPFactionFinal.GetValue() as int)

;Start all Institute radiant quests
InstR01.Start()
InstR02.Start()
InstR03.Start()
InstR04.Start()
InstR05.Start()

;Start the next quest
Inst302.SetStage(10)

;Disable Gabriel
Alias_SynthBoss.GetActorRef().Disable()

;Start the post quest
Inst301Post.Start()

;Update Global for Radio News
RadioDCInst301Ready.SetValue((GameDaysPassed.GetValue() + 1))

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property Inst301EnableMarker Auto Const

ReferenceAlias Property Alias_SynthBoss Auto Const

Faction Property Inst301PlayerEnemyFaction Auto Const

ReferenceAlias Property Alias_Guard1 Auto Const

ReferenceAlias Property Alias_Guard2 Auto Const

Faction Property Inst301BossGuardFaction Auto Const

Faction Property Inst301GuardEnemyFaction Auto Const

ReferenceAlias Property Alias_X6 Auto Const

Quest Property InstR01 Auto Const

Quest Property InstR02 Auto Const

Quest Property InstR03 Auto Const

GlobalVariable Property XPFactionSmall Auto Const

GlobalVariable Property XPFactionFinal Auto Const

ReferenceAlias Property Alias_BossDoor1 Auto Const

ReferenceAlias Property Alias_BossDoor2 Auto Const

ReferenceAlias Property Alias_X6MoveIntoIntMarker Auto Const

ReferenceAlias Property Alias_X6MoveToRoofMarker Auto Const

ObjectReference Property CompanionX6_88Ref Auto Const

ObjectReference Property InstM04Playtest1 Auto Const

Scene Property Inst301SceneX6Intercept Auto Const

ObjectReference Property LiberitaliaDocksMapMarker Auto Const

Scene Property Inst301SceneLieutenantsAttack Auto Const

Scene Property Inst301SceneBossAttack Auto Const

Scene Property Inst301SceneX6UsesCode Auto Const

Scene Property Inst301SceneX6AngryAtBossDeath Auto Const

Scene Property Inst301SceneBossReturn Auto Const

Scene Property Inst301X6ReturnAlone Auto Const

ActorBase Property Inst301SynthBoss Auto Const

Key Property Inst301LibertaliaPassword Auto Const

ReferenceAlias Property Alias_PlayerQuartersDoor Auto Const

ObjectReference Property Inst301Playtest1 Auto Const

Faction Property InstituteFaction Auto Const

ObjectReference Property InstituteMapMarker Auto Const

ObjectReference Property Inst301PorterWait Auto Const

Scene Property Inst301SceneConnectToInst302 Auto Const

Quest Property Inst302 Auto Const

GlobalVariable Property RadioDCInst301Ready Auto Const

GlobalVariable Property GameDaysPassed Auto Const

ObjectReference Property Inst301GabrielTeleportIn Auto Const

Quest Property InstM01 Auto Const

LocationAlias Property Alias_Liberitalia Auto Const

Idle Property IdleSynthShutDown Auto Const

ReferenceAlias Property Alias_PreQuestBoss Auto Const

ReferenceAlias Property Alias_PlayerQuartersContainer Auto Const

Armor Property Clothes_InstituteUniform Auto Const

LeveledItem Property LL_InstituteLaserGun_SimpleRifle Auto Const

Potion Property Stimpak Auto Const

Ammo Property AmmoFusionCell Auto Const

ObjectReference Property ShaunChildDeactivatedMarker Auto Const

ReferenceAlias Property Alias_ShaunChild Auto Const

Quest Property DialogueInstituteShaunKid Auto Const

Scene Property Inst301SceneX6GivesResetCode Auto Const Mandatory

LeveledItem Property LL_InstituteLaserGun_Boss Auto Const Mandatory

Weapon Property PlasmaGrenade Auto Const Mandatory

Weapon Property PlasmaMine Auto Const Mandatory

Quest Property InstR04 Auto Const Mandatory

Quest Property InstR05 Auto Const Mandatory

ActorValue Property COMQC_Inst301AssaultLibertaliaAV Auto Const

Quest Property Inst301Post Auto Const Mandatory
