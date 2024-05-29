;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04GZBattlezone_010295C8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZBattlezoneQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZBattlezoneQuestScript kmyQuest = __temp as DLC04:DLC04GZBattlezoneQuestScript
;END AUTOCAST
;BEGIN CODE
;The Lure Protectron starts in the list.
Alias_Arena_Enemies.AddRefCollection(Alias_Arena_Wave1Protectrons_10)
Alias_Arena_Enemies.AddRefCollection(Alias_Arena_Wave1Eyebots_11)
Alias_Arena_Enemies.AddRefCollection(Alias_Arena_Wave2Bots_12)
Alias_Arena_Enemies.AddRefCollection(Alias_Arena_Wave3Bots_13)
Alias_Arena_Enemies.AddRefCollection(Alias_Arena_Wave4Eyebots_14)
Alias_Arena_Enemies.AddRefCollection(Alias_Arena_Wave4Sentry_15)

kMyQuest.GhostRefCollection(Alias_Arena_Wave1Protectrons_10, True)
kMyQuest.GhostRefCollection(Alias_Arena_Wave1Eyebots_11, True)
kMyQuest.GhostRefCollection(Alias_Arena_Wave2Bots_12, True)
kMyQuest.GhostRefCollection(Alias_Arena_Wave3Bots_13, True)
kMyQuest.GhostRefCollection(Alias_Arena_Wave4Eyebots_14, True)
kMyQuest.GhostRefCollection(Alias_Arena_Wave4Sentry_15, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;Set by DLC04GZMainQuest
;Damage the Repair Sentry when the player enters the Battlezone interior for the first time.
Actor RepairSentry = Alias_RepairShop_SentryBot.GetActorRef()
RepairSentry.DamageValue(LeftMobilityCondition, 10000)
RepairSentry.DamageValue(RightMobilityCondition, 10000)
RepairSentry.DamageValue(PerceptionCondition, 10000)
RepairSentry.SetValue(Aggression, 3)
RepairSentry.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
DLC04GZBattlezone_ArenaEntry.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
if (GetStageDone(25) && GetStageDone(26) && DLC04GZMainQuest.IsRunning())
     SetStage(27)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0026_Item_00
Function Fragment_Stage_0026_Item_00()
;BEGIN CODE
if (GetStageDone(25) && GetStageDone(26) && DLC04GZMainQuest.IsRunning())
     SetStage(27)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0027_Item_00
Function Fragment_Stage_0027_Item_00()
;BEGIN CODE
int i = 0
While (i < Alias_BattlezoneStandsEnemies.GetCount())
     ObjectReference starter = Alias_BattlezoneStandsEnemies.GetAt(i)
     ObjectReference next = starter.GetLinkedRef(LinkCustom02)
     if (next != None)
          Debug.Trace("STARTING " + next)
          next.Activate(starter)
          Utility.Wait(Utility.RandomFloat(0.5, 1))
     EndIf
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZBattlezoneQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZBattlezoneQuestScript kmyQuest = __temp as DLC04:DLC04GZBattlezoneQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.StartCountdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZBattlezoneQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZBattlezoneQuestScript kmyQuest = __temp as DLC04:DLC04GZBattlezoneQuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.StartCountdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZBattlezoneQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZBattlezoneQuestScript kmyQuest = __temp as DLC04:DLC04GZBattlezoneQuestScript
;END AUTOCAST
;BEGIN CODE
if (DLC04GZMainQuest.IsRunning())
     ;Close the door.
     DLC04GZBattlezone_ArenaEntranceDoorCollision.EnableNoWait()
     DLC04GZBattlezone_ArenaEntranceDoor.SetOpenNoWait(False)

     ;EVP the Lure Protectron.
     Actor Lure = Alias_Arena_Enemies.GetAt(0) as Actor
     if (Lure != None)
          Lure.EvaluatePackage()
     EndIf

     ;Play a Stinger.
     MUSStinger.Add()
     Utility.Wait(2)

     ;Start the scene.
     DLC04GZBattlezone_ArenaStart.Start()

     Utility.Wait(3)

     ;Disable the house lights.
     OBJLightsPowerOff.Play(DLC04GZBattlezone_ArenaAnnouncementSource)
     DLC04GZBattlezone_HouseLightsEnableMarker.DisableNoWait()

     Utility.Wait(5)

     ;Play Companion reaction.
     Alias_Companion.GetActorRef().SayCustom(DLC04_AOT_GZ002)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN CODE
;Play the first Arena Fight scene.
DLC04GZBattlezone_ArenaMid01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0052_Item_00
Function Fragment_Stage_0052_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZBattlezoneQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZBattlezoneQuestScript kmyQuest = __temp as DLC04:DLC04GZBattlezoneQuestScript
;END AUTOCAST
;BEGIN CODE
;Start the music override.
DLC04MUSzCombatArena.Add()

;2 Protectrons from Lifts
;3 Eyebots from Door (right rear)

kMyQuest.GhostRefCollection(Alias_Arena_Wave1Protectrons_10, False)
kMyQuest.GhostRefCollection(Alias_Arena_Wave1Eyebots_11, False)

DLC04GZBattlezoneLiftLeft.PlaceAndRun(Alias_Arena_Wave1Protectrons_10.GetAt(0))
DLC04GZBattlezoneLiftRight.PlaceAndRun(Alias_Arena_Wave1Protectrons_10.GetAt(1))

DLC04GZBattlezone_Arena_Wave1Door.SetOpenNoWait()
int i = 0
While (i < Alias_Arena_Wave1Eyebots_11.GetCount())
     Actor current = Alias_Arena_Wave1Eyebots_11.GetAt(i) as Actor
     current.SetUnconscious(False)
     current.EvaluatePackage()
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0053_Item_00
Function Fragment_Stage_0053_Item_00()
;BEGIN CODE
;Play the first Arena Fight scene.
DLC04GZBattlezone_ArenaMid01.Stop()
DLC04GZBattlezone_ArenaMid02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0054_Item_00
Function Fragment_Stage_0054_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZBattlezoneQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZBattlezoneQuestScript kmyQuest = __temp as DLC04:DLC04GZBattlezoneQuestScript
;END AUTOCAST
;BEGIN CODE
;Start Wave 2 when the Wave 1 Protectrons are dead.

;Protectron & Assaultron from Door.
kMyQuest.GhostRefCollection(Alias_Arena_Wave2Bots_12, False)
DLC04GZBattlezone_Arena_Wave2DoorA.SetOpenNoWait()
DLC04GZBattlezone_Arena_Wave2DoorB.SetOpenNoWait()
int i = 0
While (i < Alias_Arena_Wave2Bots_12.GetCount())
     Actor current = Alias_Arena_Wave2Bots_12.GetAt(i) as Actor
     current.SetUnconscious(False)
     current.EvaluatePackage()
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
;Play the first Arena Fight scene.
DLC04GZBattlezone_ArenaMid02.Stop()
DLC04GZBattlezone_ArenaMid03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0056_Item_00
Function Fragment_Stage_0056_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZBattlezoneQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZBattlezoneQuestScript kmyQuest = __temp as DLC04:DLC04GZBattlezoneQuestScript
;END AUTOCAST
;BEGIN CODE
;Start Wave 3 when the Wave 2 bots are dead.

;Assaultrons from Lift
kMyQuest.GhostRefCollection(Alias_Arena_Wave3Bots_13, False)
DLC04GZBattlezoneLiftLeft.PlaceAndRun(Alias_Arena_Wave3Bots_13.GetAt(0))
DLC04GZBattlezoneLiftRight.PlaceAndRun(Alias_Arena_Wave3Bots_13.GetAt(1))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0057_Item_00
Function Fragment_Stage_0057_Item_00()
;BEGIN CODE
;Play the first Arena Fight scene.
DLC04GZBattlezone_ArenaMid03.Stop()
DLC04GZBattlezone_ArenaMid04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0058_Item_00
Function Fragment_Stage_0058_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZBattlezoneQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZBattlezoneQuestScript kmyQuest = __temp as DLC04:DLC04GZBattlezoneQuestScript
;END AUTOCAST
;BEGIN CODE
;Start Wave 4 when the Wave 3 bots are dead.

;Pair of Eyebots from each lift.
Debug.Trace("Now Placing: " + Alias_Arena_Wave4Eyebots_14.GetAt(0) +"," + Alias_Arena_Wave4Eyebots_14.GetAt(1) +"," + Alias_Arena_Wave4Eyebots_14.GetAt(2) +"," + Alias_Arena_Wave4Eyebots_14.GetAt(3))
kMyQuest.GhostRefCollection(Alias_Arena_Wave4Eyebots_14, False)
kMyQuest.GhostRefCollection(Alias_Arena_Wave4Sentry_15, False)
DLC04GZBattlezoneLiftLeft.PlaceAndRun(Alias_Arena_Wave4Eyebots_14.GetAt(0))
DLC04GZBattlezoneLiftRight.PlaceAndRun(Alias_Arena_Wave4Eyebots_14.GetAt(1))
DLC04GZBattlezoneLiftLeft.PlaceAndRun(Alias_Arena_Wave4Eyebots_14.GetAt(2))
DLC04GZBattlezoneLiftRight.PlaceAndRun(Alias_Arena_Wave4Eyebots_14.GetAt(3))

;Sentrybot from the Rear Door
DLC04GZBattlezone_Arena_Wave4Door.SetOpenNoWait()
Actor current = Alias_Arena_Wave4Sentry_15.GetAt(0) as Actor
current.SetUnconscious(False)
current.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04GZBattlezoneQuestScript
Quest __temp = self as Quest
DLC04:DLC04GZBattlezoneQuestScript kmyQuest = __temp as DLC04:DLC04GZBattlezoneQuestScript
;END AUTOCAST
;BEGIN CODE
;Remove the music override.
DLC04MUSzCombatArena.Remove()

;Play the Reward stinger.
MUSReward.Add()
Utility.Wait(2)

;ReEnable the house lights.
OBJLightsPowerOn.Play(DLC04GZBattlezone_ArenaAnnouncementSource)
DLC04GZBattlezone_HouseLightsEnableMarker.EnableNoWait()

;Start the end scene.
DLC04GZBattlezone_ArenaEnd.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
;Reopen the door.
DLC04GZBattlezone_ArenaEntranceDoorCollision.DisableNoWait()
DLC04GZBattlezone_ArenaEntranceDoor.SetOpenNoWait(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Purge the Arena RefCollectionAliases
Alias_Arena_Enemies.RemoveAll()
Alias_Arena_Wave1Protectrons_10.RemoveAll()
Alias_Arena_Wave1Eyebots_11.RemoveAll()
Alias_Arena_Wave2Bots_12.RemoveAll()
Alias_Arena_Wave3Bots_13.RemoveAll()
Alias_Arena_Wave4Eyebots_14.RemoveAll()
Alias_Arena_Wave4Sentry_15.RemoveAll()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC04GZMainQuest Auto Const Mandatory

Default2StateActivator Property DLC04GZBattlezone_ArenaEntranceDoor Auto Const Mandatory

ObjectReference Property DLC04GZBattlezone_ArenaEntranceDoorCollision Auto Const Mandatory

Scene Property DLC04GZBattlezone_ArenaStart Auto Const Mandatory

MusicType Property DLC04MUSzCombatArena Auto Const Mandatory

RefCollectionAlias Property Alias_Arena_Enemies Auto Const Mandatory

RefCollectionAlias Property Alias_Arena_Wave1Protectrons_10 Auto Const Mandatory

RefCollectionAlias Property Alias_Arena_Wave1Eyebots_11 Auto Const Mandatory

DLC04:DLC04_RobotLiftScript Property DLC04GZBattlezoneLiftLeft Auto Const Mandatory

DLC04:DLC04_RobotLiftScript Property DLC04GZBattlezoneLiftRight Auto Const Mandatory

Default2StateActivator Property DLC04GZBattlezone_Arena_Wave1Door Auto Const Mandatory

Default2StateActivator Property DLC04GZBattlezone_Arena_Wave2DoorA Auto Const Mandatory

Default2StateActivator Property DLC04GZBattlezone_Arena_Wave2DoorB Auto Const Mandatory

RefCollectionAlias Property Alias_Arena_Wave2Bots_12 Auto Const Mandatory

RefCollectionAlias Property Alias_Arena_Wave3Bots_13 Auto Const Mandatory

Scene Property DLC04GZBattlezone_ArenaEnd Auto Const Mandatory

RefCollectionAlias Property Alias_Arena_Wave4Eyebots_14 Auto Const Mandatory

RefCollectionAlias Property Alias_Arena_Wave4Sentry_15 Auto Const Mandatory

Default2StateActivator Property DLC04GZBattlezone_Arena_Wave4Door Auto Const Mandatory

ReferenceAlias Property Alias_RepairShop_SentryBot Auto Const Mandatory

ActorValue Property LeftMobilityCondition Auto Const Mandatory

ActorValue Property PerceptionCondition Auto Const Mandatory

ActorValue Property RightMobilityCondition Auto Const Mandatory

Scene Property DLC04GZBattlezone_ArenaEntry Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ObjectReference Property DLC04GZBattlezone_HouseLightsEnableMarker Auto Const Mandatory

Scene Property DLC04GZBattlezone_ArenaMid01 Auto Const Mandatory

Scene Property DLC04GZBattlezone_ArenaMid02 Auto Const Mandatory

Scene Property DLC04GZBattlezone_ArenaMid03 Auto Const Mandatory

Scene Property DLC04GZBattlezone_ArenaMid04 Auto Const Mandatory

RefCollectionAlias Property Alias_BattlezoneStandsEnemies Auto Const Mandatory

Keyword Property LinkCustom01 Auto Const Mandatory

Keyword Property LinkCustom02 Auto Const Mandatory

RefCollectionAlias Property Alias_RepairShop_OtherRobots Auto Const Mandatory

Keyword Property DLC04_AOT_GZ002 Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

MusicType Property MUSDread Auto Const Mandatory

MusicType Property MUSReward Auto Const Mandatory

MusicType Property MUSStinger Auto Const Mandatory

ObjectReference Property DLC04GZBattlezone_ArenaAnnouncementSource Auto Const Mandatory

Sound Property OBJLightsPowerOff Auto Const Mandatory

Sound Property OBJLightsPowerOn Auto Const Mandatory
