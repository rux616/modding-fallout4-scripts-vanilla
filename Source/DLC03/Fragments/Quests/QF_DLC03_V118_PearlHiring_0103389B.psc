;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03_V118_PearlHiring_0103389B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(DLC03_V118_PearlHiring_Reward1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(DLC03_V118_PearlHiring_Reward2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
DLC03DialogueV118.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
if !Alias_MapMarker.GetReference().IsMapMarkerVisible()
	Alias_MapMarker.GetReference().AddToMap()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if DLC03_V118_PearlAvery.IsRunning()
DLC03_V118_PearlAvery.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
DLC03_V118_Intro.SetStage(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Alias_Pearl.GetActorRef().EvaluatePackage()
DLC03_V118_MiscObjectives.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_PearlHiringScript
Quest __temp = self as Quest
DLC03:DLC03_V118_PearlHiringScript kmyQuest = __temp as DLC03:DLC03_V118_PearlHiringScript
;END AUTOCAST
;BEGIN CODE
Alias_Pearl.GetActorRef().EvaluatePackage()
kMyQuest.SetPearlFriend()
if kmyQuest.bEscortToHotelActive
	DLC03_V118_MiscObjectives.SetStage(15)
else
	DLC03_V118_MiscObjectives.SetStage(20)
endif
if !Alias_MapMarker.GetReference().IsMapMarkerVisible()
	Alias_MapMarker.GetReference().AddToMap()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_PearlHiringScript
Quest __temp = self as Quest
DLC03:DLC03_V118_PearlHiringScript kmyQuest = __temp as DLC03:DLC03_V118_PearlHiringScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.bEscortToHotelActive = false
kmyQuest.bWaitOutsideHotel = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_PearlHiringScript
Quest __temp = self as Quest
DLC03:DLC03_V118_PearlHiringScript kmyQuest = __temp as DLC03:DLC03_V118_PearlHiringScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.bEscortToHotelActive = false
kmyQuest.bWaitOutsideHotel = false
kmyQuest.bEscortInHotelActive = true

DLC03_V118_MiscObjectives.SetStage(30)
DLC03_V118_PearlCheckElevator.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_PearlHiringScript
Quest __temp = self as Quest
DLC03:DLC03_V118_PearlHiringScript kmyQuest = __temp as DLC03:DLC03_V118_PearlHiringScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.bEscortToHotelActive = false
kmyQuest.bWaitOutsideHotel = false
kmyQuest.bEscortInHotelActive = false
kmyQuest.bWaitAtElevator = true
if DLC03_V118_PearlCheckElevator.IsPlaying()
	DLC03_CliffsEdgeQuickElevatorButtonLowRef.Activate(game.getPlayer())
endif

DLC03_V118_PearlLoadElevatorScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_PearlHiringScript
Quest __temp = self as Quest
DLC03:DLC03_V118_PearlHiringScript kmyQuest = __temp as DLC03:DLC03_V118_PearlHiringScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.bEscortToHotelActive = false
kmyQuest.bWaitOutsideHotel = false
;kmyQuest.bEscortInHotelActive = false
kmyQuest.bWaitAtElevator = false
kmyQuest.bEscortToVaultDoorActive = true
DLC03_V118_Intro.SetStage(6)

if DLC03_V118_PearlCheckElevator.isPlaying()
	DLC03_V118_PearlCheckElevator.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_PearlHiringScript
Quest __temp = self as Quest
DLC03:DLC03_V118_PearlHiringScript kmyQuest = __temp as DLC03:DLC03_V118_PearlHiringScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.bEscortInHotelActive = false
if DLC03_V118_PearlLoadElevatorScene.IsPlaying()
	DLC03_V118_PearlLoadElevatorScene.Stop()
Endif
DLC03_V118_PearlVaultDoorScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0701_Item_00
Function Fragment_Stage_0701_Item_00()
;BEGIN CODE
DLC03_V118_MiscObjectives.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
DLC03_V118_PearlVaultDoorScene2.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
DLC03_V118_MiscObjectives.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03_V118_PearlAvery Auto Const Mandatory

ReferenceAlias Property Alias_Pearl Auto Const Mandatory

Quest Property DLC03_V118_MiscObjectives Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

Scene Property DLC03_V118_PearlCheckElevator Auto Const Mandatory

ObjectReference Property DLC03_CliffsEdgeQuickElevatorButtonLowRef Auto Const Mandatory



Scene Property DLC03_V118_PearlLoadElevatorScene Auto Const Mandatory

Quest Property DLC03_V118_Intro Auto Const Mandatory

Scene Property DLC03_V118_PearlVaultDoorScene2 Auto Const Mandatory

LeveledItem Property DLC03_V118_PearlHiring_Reward1 Auto Const Mandatory

LeveledItem Property DLC03_V118_PearlHiring_Reward2 Auto Const Mandatory

Quest Property DLC03DialogueV118 Auto Const Mandatory

Scene Property DLC03_V118_PearlVaultDoorScene Auto Const Mandatory
