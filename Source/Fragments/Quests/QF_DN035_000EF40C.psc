;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:qf_dn035_000ef40c Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DN035QuestScript
Quest __temp = self as Quest
DN035QuestScript kmyQuest = __temp as DN035QuestScript
;END AUTOCAST
;BEGIN CODE
;Set the Reserve Racers global to 3.
DN035_ReserveRacersCount.SetValue(3)

;Snap the Reserve Racers back to their editor locations.
int i = 0
While (i < Alias_EasyCityDownsRobotReserve.GetCount())
     Alias_EasyCityDownsRobotReserve.GetAt(i).MoveToMyEditorLocation()
     i = i + 1
EndWhile

;Start the race, using Route #1: Normal
kmyQuest.SetRaceRoute(1)

;Register the robots for hit events.
(Alias_EasyCityDownsRobots as DN035_RacingRobotsScript).RegisterRobotsForHitEvents()

;Force the note onto the boss' henchman, if we were able to grab the name of Libertalia's current boss.
if (Alias_LibertaliaBoss.GetActorRef() != None)
     Alias_EasyCityDownsRaiderHenchman.GetActorRef().AddItem(Alias_EasyCityDownsRaiderHenchmanNote.GetReference())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;When anyone (Raider, Robot, or Turret) hits or is hit by the player, the boss switches to his
;Hostiles scene (provided he himself isn't hostile yet).
if (!GetStageDone(40))
     DN035_Announcement01_Idle.Stop()
     DN035_Announcement03_CallInRobots.Stop()
     DN035_Announcement04_Reprogramming.Stop()
     DN035_Announcement02_Hostiles.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE DN035QuestScript
Quest __temp = self as Quest
DN035QuestScript kmyQuest = __temp as DN035QuestScript
;END AUTOCAST
;BEGIN CODE
;When the player enters the camp area, call in the robots unless they've self-destructed
;or the boss is hostile (and therefore not making further announcements).
if ((kMyQuest.RaceSelfDestruct == 0) && (!GetStageDone(40)))
     DN035_Announcement01_Idle.Stop()
     DN035_Announcement02_Hostiles.Stop()
     DN035_Announcement04_Reprogramming.Stop()
     DN035_Announcement03_CallInRobots.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN AUTOCAST TYPE DN035QuestScript
Quest __temp = self as Quest
DN035QuestScript kmyQuest = __temp as DN035QuestScript
;END AUTOCAST
;BEGIN CODE
;Call in the Robots to defend the camp.
kMyQuest.SetRaceRoute(2)
kMyQuest.SetRaceCombatInhibitors(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;When the player enters the boss' area (trigger) or hits the boss with any weapon,
;the boss breaks off his announcements and drops out of his Ignore Combat package.
DN035_Announcement01_Idle.Stop()
DN035_Announcement02_Hostiles.Stop()
DN035_Announcement03_CallInRobots.Stop()
DN035_Announcement04_Reprogramming.Stop()
DN035_Announcement05_Hostile.Start()

;EVP him to make sure the package changes immediately.
Alias_EasyCityDownsRaiderBoss.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_RobotLeader Auto Const

ReferenceAlias Property Alias_Robot01 Auto Const

ReferenceAlias Property Alias_Robot02 Auto Const

ReferenceAlias Property Alias_Robot03 Auto Const

ReferenceAlias Property Alias_Robot04 Auto Const

ReferenceAlias Property Alias_Robot05 Auto Const

ActorValue Property Aggression Auto Const

Scene Property DN035_CallInRobotsScene Auto Const

Scene Property DN035_Announcement01_Idle Auto Const

Scene Property DN035_Announcement02_Hostiles Auto Const

Scene Property DN035_Announcement03_CallInRobots Auto Const

RefCollectionAlias Property Alias_EasyCityDownsRaiders Auto Const

RefCollectionAlias Property Alias_EasyCityDownsRobots Auto Const

RefCollectionAlias Property Alias_EasyCityDownsTurrets Auto Const

RefCollectionAlias Property Alias_EasyCityDownsAllHostiles Auto Const

ObjectReference Property DN035_EasyCityDownsCOCMarker Auto Const

ReferenceAlias Property Alias_EasyCityDownsRaiderBoss Auto Const

Scene Property DN035_Announcement04_Reprogramming Auto Const

ObjectReference Property DN035_IsNamedBossEnabledMarker Auto Const

Message Property DN035_LvlRaiderBossName Auto Const

ReferenceAlias Property Alias_DN035_EasyCityDownsTransmitter Auto Const

ReferenceAlias Property Alias_DN035_NameOverride_Transmitter Auto Const

ReferenceAlias Property Alias_DN035_NameOverride_RaiderBoss Auto Const

Scene Property DN035_Announcement05_Hostile Auto Const

ReferenceAlias Property Alias_LibertaliaBoss Auto Const

ReferenceAlias Property Alias_EasyCityDownsRaiderHenchmanNote Auto Const

ReferenceAlias Property Alias_EasyCityDownsRaiderHenchman Auto Const

RefCollectionAlias Property Alias_EasyCityDownsRobotReserve Auto Const

GlobalVariable Property DN035_ReserveRacersCount Auto Const
