;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MS02_01000807 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
game.GetPlayer().MoveTo(DLC04MS02Start)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
if game.GetPlayer().GetSitState() >0
    DLC04UFOConsoleRef.Activate(game.GetPlayer())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
if game.GetPlayer().GetSitState() >0
    DLC04UFOConsoleRef.Activate(game.GetPlayer())
endif

if GetStageDone(920) == true
    SetStage(1001)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
if game.GetPlayer().GetSitState() >0
    DLC04UFOConsoleRef.Activate(game.GetPlayer())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
if GetStage() == 800
    SetStage(900)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
ModObjectiveGlobal(0, DLC04MS02_Spacesuit_Count, 300, 5, true, true)

;game.GetPlayer().GetItemCount(DLC04_Armor_Spacesuit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
;Alias_Cleansed.GetActorRef().EquipItem(DLC04_Armor_Spacesuit)
Alias_Cleansed.GetActorRef().AddItem(DLC04_Armor_Spacesuit_Helmet, 1)
Alias_Cleansed.GetActorRef().SetOutfit(DLC04_DaraHubbellOutfit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
;Alias_Maurice.GetActorRef().EquipItem(DLC04_Armor_Spacesuit)
Alias_Maurice.GetActorRef().AddItem(DLC04_Armor_Spacesuit_Helmet, 1)
Alias_Maurice.GetActorRef().SetOutfit(DLC04_DaraHubbellOutfit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN CODE
;Alias_Phil.GetActorRef().EquipItem(DLC04_Armor_Spacesuit)
Alias_Phil.GetActorRef().AddItem(DLC04_Armor_Spacesuit_Helmet, 1)
Alias_Phil.GetActorRef().SetOutfit(DLC04_DaraHubbellOutfit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0024_Item_00
Function Fragment_Stage_0024_Item_00()
;BEGIN CODE
;Alias_Rolanda.GetActorRef().EquipItem(DLC04_Armor_Spacesuit)
Alias_Rolanda.GetActorRef().AddItem(DLC04_Armor_Spacesuit_Helmet, 1)
Alias_Rolanda.GetActorRef().SetOutfit(DLC04_DaraHubbellOutfit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
;Alias_Tula.GetActorRef().EquipItem(DLC04_Armor_Spacesuit)
Alias_Tula.GetActorRef().AddItem(DLC04_Armor_Spacesuit_Helmet, 1)
Alias_Tula.GetActorRef().SetOutfit(DLC04_DaraHubbellOutfit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0027_Item_00
Function Fragment_Stage_0027_Item_00()
;BEGIN CODE
Setstage(21)
Setstage(22)
Setstage(23)
Setstage(24)
Setstage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
MS02DaraJunkyardSpeech.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(210, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
DLC04_CustomItemQuest.SetStage(20)
game.GetPlayer().Additem(AmmoAlienBlaster, 10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
if GetStageDone(550) == true
    SetObjectiveCompleted(600)
    SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
Alias_Cleansed.GetRef().MoveTo(DLC04MS02_CleansedAlt02_Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
Alias_Cleansed.GetRef().MoveTo(DLC04MS02_CleansedAlt03_Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN CODE
Alias_DaraHubbell.GetActorRef().SetEssential(false)

DLC04GZTrackingQuest.SetStage(21)
DLC04DialogueHubologists.SetObjectiveFailed(30, false)
DLC04HubologistFaction.SetEnemy(PlayerFaction)

Alias_DaraHubbell.GetActorRef().RemoveFromFaction(PlayerFriendFaction)
Alias_Phil.GetActorRef().RemoveFromFaction(PlayerFriendFaction)
Alias_Cleansed.GetActorRef().RemoveFromFaction(PlayerFriendFaction)
Alias_Maurice.GetActorRef().RemoveFromFaction(PlayerFriendFaction)
Alias_Rolanda.GetActorRef().RemoveFromFaction(PlayerFriendFaction)
Alias_Tula.GetActorRef().RemoveFromFaction(PlayerFriendFaction)

; Set stage on DLC04DialogueSettlement quest to remove Misc objective.
DLC04DialogueSettlement.SetObjectiveFailed(30)

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Clear misc objective.
DLC04DialogueSettlement.SetStage(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200, true)
SetObjectiveDisplayed(210, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200, true)
SetObjectiveCompleted(210, true)
SetObjectiveDisplayed(300, true)


; Clear misc objective.
DLC04DialogueSettlement.SetStage(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300, true)
SetObjectiveDisplayed(400, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
if game.GetPlayer().GetItemCount(DLC04_Armor_SpaceSuit) == 5
    game.GetPlayer().UnequipItem(DLC04_Armor_SpaceSuit)
endif
if game.GetPlayer().GetItemCount(DLC04_Armor_SpaceSuit_Helmet) == 5
    game.GetPlayer().UnequipItem(DLC04_Armor_SpaceSuit_Helmet)
endif
game.GetPlayer().RemoveItem(DLC04_Armor_SpaceSuit, 5)
game.GetPlayer().RemoveItem(DLC04_Armor_SpaceSuit_Helmet, 5)

If IsObjectiveDisplayed(200)
     SetObjectiveCompleted(200, true)
EndIf
If IsObjectiveDisplayed(300)
     SetObjectiveCompleted(300, true)
EndIf
SetObjectiveCompleted(400, true)
SetObjectiveCompleted(210, true)
SetObjectiveDisplayed(500, true)

if GetStageDone(10) == true || GetStageDone(11) == false
    game.GetPlayer().AddItem(caps001, 200)
elseif GetStageDone(13) == true
    game.GetPlayer().AddItem(caps001, 350)
elseif GetStageDone(12) == true
    game.GetPlayer().AddItem(caps001, 300)
elseif GetStageDone(11) == true
    game.GetPlayer().AddItem(caps001, 250)
endif

; Clear misc objective.
DLC04DialogueSettlement.SetStage(410)
DLC04GZTrackingQuest.SetStage(21)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500, true)
SetObjectiveDisplayed(550, true)

;SC: Disable the Random Encounter trigger on the road to the junkyard; enable the worm ambush.
DLC04RE10Trigger.Disable()
DLC04MS02WormAmbushEnableParent.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500, true)
SetObjectiveCompleted(550, true)
SetObjectiveDisplayed(600, true)

DLC04HubologistFaction.SetAlly(PlayerFaction, true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600, true)
SetObjectiveDisplayed(650, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(650, true)
SetObjectiveDisplayed(700, true)

MS02DaraJunkyardSpeech.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700, true)
SetObjectiveDisplayed(800, true)
SetObjectiveDisplayed(805, true)

DLC04_JunkyardWarehouse_Center.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
Alias_DaraHubbell.GetActorRef().SetEssential(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800, true)
SetObjectiveCompleted(805, true)
SetObjectiveDisplayed(900, true)

if game.GetPlayer().HasDetectionLOS(DLC04MS02_DaraMoveToRef) == false
    if game.GetPlayer().HasDetectionLOS(Alias_DaraHubbell.GetRef()) == false
        Alias_DaraHubbell.GetRef().MoveTo(DLC04MS02_DaraMoveToRef)
    endif
    if game.GetPlayer().HasDetectionLOS(Alias_Phil.GetRef()) == false
        Alias_Phil.GetRef().MoveTo(DLC04MS02_HubologistsMoveToRef)
    endif
    if game.GetPlayer().HasDetectionLOS(Alias_Maurice.GetRef()) == false
        Alias_Maurice.GetRef().MoveTo(DLC04MS02_HubologistsMoveToRef)
    endif
    if game.GetPlayer().HasDetectionLOS(Alias_Rolanda.GetRef()) == false
        Alias_Rolanda.GetRef().MoveTo(DLC04MS02_HubologistsMoveToRef)
    endif
    if game.GetPlayer().HasDetectionLOS(Alias_Phil.GetRef()) == false
        Alias_Cleansed.GetRef().MoveTo(DLC04MS02_HubologistsMoveToRef)
    endif
    if Alias_Tula.GetActorRef().IsDead() == false && game.GetPlayer().HasDetectionLOS(Alias_Tula.GetRef()) == false
        Alias_Tula.GetRef().MoveTo(DLC04MS02_HubologistsMoveToRef)
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0905_Item_00
Function Fragment_Stage_0905_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800, true)
SetObjectiveCompleted(900, true)
SetObjectiveDisplayed(905, true)

Alias_ControlConsole.GetRef().BlockActivation(false)
DLC04MS02Companion.SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN CODE
SetObjectiveCompleted(905, true)
SetObjectiveDisplayed(1000, true)

if game.GetPlayer().GetSitState() > 0
    Alias_ControlConsole.GetRef().Activate(game.GetPlayer(), true)
endif

DLC04MS02Companion.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0920_Item_00
Function Fragment_Stage_0920_Item_00()
;BEGIN CODE
SetObjectiveCompleted(905, true)
DLC04MS02Companion.SetStage(100)

Alias_DaraHubbell.GetActorRef().Kill()
Alias_DaraHubbell.GetActorRef().Dismember("Head1", false, true)
Alias_Cleansed.GetActorRef().SetEssential(false)
Alias_Cleansed.GetActorRef().Kill(game.GetPlayer())
Alias_Cleansed.GetActorRef().Dismember("LeftLeg1", true)
Alias_Phil.GetActorRef().SetEssential(false)
Alias_Phil.GetActorRef().Kill(game.GetPlayer())
Alias_Phil.GetActorRef().Dismember("RightArm1", false, true)
Alias_Maurice.GetActorRef().SetEssential(false)
Alias_Maurice.GetActorRef().Kill(game.GetPlayer())
Alias_Maurice.GetActorRef().Dismember("Head1", true)
Alias_Rolanda.GetActorRef().SetEssential(false)
Alias_Rolanda.GetActorRef().Kill(game.GetPlayer())
Alias_Rolanda.GetActorRef().Dismember("RightLeg1", false, true)
Alias_Tula.GetActorRef().Kill(game.GetPlayer())

if game.GetPlayer().GetSitState() > 0
    Alias_ControlConsole.GetRef().Activate(game.GetPlayer(), true)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(900, true)
game.GetPlayer().Additem(AmmoAlienBlaster, 100)

;SC: Re-enable the Random Encounter trigger; disable the worm ambush.
DLC04RE10Trigger.Enable()
DLC04MS02WormAmbushEnableParent.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1001_Item_00
Function Fragment_Stage_1001_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property DLC04_Armor_SpaceSuit Auto Const Mandatory

ReferenceAlias Property Alias_Cleansed Auto Const Mandatory

ReferenceAlias Property Alias_Maurice Auto Const Mandatory

ReferenceAlias Property Alias_Rolanda Auto Const Mandatory

ReferenceAlias Property Alias_Tula Auto Const Mandatory

ReferenceAlias Property Alias_Phil Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

Faction Property DLC04HubologistFaction Auto Const Mandatory

ObjectReference Property DLC04MS02Start Auto Const Mandatory

MiscObject Property Caps001 Auto Const Mandatory

LeveledItem Property RewardItem Auto Const

Scene Property MS02CleansedEscortPC Auto Const Mandatory

GlobalVariable Property DLC04_AHS_Rank Auto Const Mandatory

ObjectReference Property DLC04_CleansedMoveMarker Auto Const Mandatory

Armor Property DLC04_Armor_SpaceSuit_Helmet Auto Const Mandatory

Ammo Property AmmoAlienBlaster Auto Const Mandatory

ObjectReference Property DLC04_JunkyardWarehouse_Center Auto Const Mandatory

Scene Property MS02DaraJunkyardSpeech Auto Const Mandatory

ObjectReference Property DLC04MS02_CleansedAlt02_Marker Auto Const Mandatory

ObjectReference Property DLC04MS02_CleansedAlt03_Marker Auto Const Mandatory

ObjectReference Property DLC04RE10Trigger Auto Const Mandatory

ObjectReference Property DLC04MS02WormAmbushEnableParent Auto Const Mandatory
ReferenceAlias Property Alias_DaraHubbell Auto Const Mandatory

Quest Property DLC04_CustomItemQuest Auto Const Mandatory

ObjectReference Property DLC04MS02_DaraMoveToRef Auto Const Mandatory

ObjectReference Property DLC04MS02_HubologistsMoveToRef Auto Const Mandatory

Scene Property MS02DaraSpaceshipPowered Auto Const Mandatory

GlobalVariable Property DLC04MS02_Spacesuit_Count Auto Const Mandatory

Quest Property DLC04DialogueSettlement Auto Const Mandatory

Outfit Property DLC04_DaraHubbellOutfit Auto Const Mandatory

ReferenceAlias Property Alias_ControlConsole Auto Const Mandatory

Quest Property DLC04GZTrackingQuest Auto Const Mandatory

Quest Property DLC04DialogueHubologists Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

Faction Property PlayerAllyFaction Auto Const Mandatory

ObjectReference Property DLC04UFOConsoleRef Auto Const Mandatory

Quest Property DLC04MS02Companion Auto Const Mandatory
