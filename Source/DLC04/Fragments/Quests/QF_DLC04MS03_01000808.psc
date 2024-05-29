;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MS03_01000808 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
game.GetPlayer().MoveTo(DLC04_MS03_Start)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
DLC04MS03_SeanceDoor_Ref.SetOpen(False)

int failsafe = 0
While ((DLC04MS03_SeanceDoor_Ref.GetOpenState() != 3) && (!GetStageDone(11)) && (failsafe < 100))
     Debug.Trace("Waiting 1")
     failsafe = failsafe + 1
     Utility.Wait(0.1)
EndWhile

DLC04MS03_SeanceDoor_Ref.Lock()
DLC04_ParlorBalconyCollisionRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
DLC04MS03_DiningRoomDoor_Ref.SetOpen(False)

int failsafe = 0
While ((DLC04MS03_DiningRoomDoor_Ref.GetOpenState() != 3) && (!GetStageDone(13)) && (failsafe < 100))
     Debug.Trace("Waiting 2")
     failsafe = failsafe + 1
     Utility.Wait(0.1)
EndWhile

DLC04MS03_DiningRoomDoor_Ref.Lock()
DLC04_ParlorBalconyCollisionRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
DLC04MS03_LucysRoomDoor_Ref.SetOpen(False)

int failsafe = 0
While ((DLC04MS03_LucysRoomDoor_Ref.GetOpenState() != 3) && (!GetStageDone(18)) && (failsafe < 100))
     Debug.Trace("Waiting 3")
     failsafe = failsafe + 1
     Utility.Wait(0.1)
EndWhile

DLC04MS03_LucysRoomDoor_Ref.Lock()
DLC04_UpstairsHallCollisionRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Alias_Lucy.GetActorRef().Disable(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
ParlorRoomScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
Alias_Lucy.GetRef().MoveTo(DLC04MS03_Lucy02Marker)
Alias_Lucy.GetActorRef().EvaluatePackage()
DLC04MS03_ReadingRoomDoor_Ref.Unlock()
DLC04MS03_ReadingRoomDoor_Ref.SetOpen(True)
DLC04_ParlorBalconyCollisionRef.Disable()

; Complete misc objective
DLC04DialogueSettlement.SetStage(510)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
DLC04MS03_FireplaceRoomDoor_Ref.Unlock()
DLC04MS03_FireplaceRoomDoor_Ref.SetOpen(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
Alias_Lucy.GetRef().MoveTo(DLC04MS03_Lucy03Marker)
Alias_Lucy.GetActorRef().EvaluatePackage()
DLC04MS03_DiningRoomDoor_Ref.Unlock()
DLC04MS03_DiningRoomDoor_Ref.SetOpen(True)
DLC04_FireplaceRoomCollisionRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
DLC04MS03_KitchenDoor_Ref.Unlock()
DLC04MS03_KitchenDoor_Ref.SetOpen(True)

;Disable the Hold Position trigger of the Gutsy in the Flame Hall, if he's still alive.
DLC04GrandchesterFlameHallHoldPositionTrigger.DisableNoWait()

int i = 0
While (i < Alias_Robots_Kitchen.GetCount())
     (Alias_Robots_Kitchen.GetAt(i) as Actor).SetUnconscious(False)
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
DLC04MS03_BalconyDoor_Ref.Unlock()
DLC04MS03_BalconyDoor_Ref.SetOpen(True)
DLC04MS03_BalconyDoor02_Ref.Unlock()
DLC04MS03_BalconyDoor02_Ref.SetOpen(True)

int i = 0
While (i < Alias_Robots_2FHall.GetCount())
     (Alias_Robots_2FHall.GetAt(i) as Actor).SetUnconscious(False)
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0016_Item_00
Function Fragment_Stage_0016_Item_00()
;BEGIN CODE
DLC04MS03_SeanceDoor_Ref.Unlock()
DLC04MS03_SeanceDoor_Ref.SetOpen(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
DLC04MS03_UpstairsHallDoor_Ref.Unlock()
DLC04MS03_UpstairsHallDoor_Ref.SetOpen(True)

DLC04MS03_SeanceDoor_Ref.UnLock()
DLC04MS03_SeanceDoor_Ref.SetOpen(True)

int i = 0
While (i < Alias_Robots_UpstairsHall.GetCount())
     (Alias_Robots_UpstairsHall.GetAt(i) as Actor).SetUnconscious(False)
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
Alias_Lucy.GetRef().MoveTo(DLC04MS03_Lucy04Marker)
DLC04MS03_LucysRoomDoor_Ref.Unlock()
DLC04MS03_LucysRoomDoor_Ref.SetOpen(True)
DLC04_UpstairsHallCollisionRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
DLC04MS03_MasterBedroomDoor_Ref.Unlock()
DLC04MS03_MasterBedroomDoor_Ref.SetOpen(True)

Alias_Zach.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_Protectron.GetActorRef().StartCombat(Game.GetPlayer())

Alias_Lucy.GetRef().MoveTo(DLC04MS03_Lucy01Marker)
Alias_Lucy.GetActorRef().Stopcombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
game.GetPlayer().RemoveItem(PrewarMoney, 65)

DLC04MS03_GrandchesterDoorRef.Unlock()

Alias_Lucy.GetRef().MoveTo(DLC04MS03_Lucy01Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
DLC04MS03_GrandchesterDoorRef.Unlock()

Alias_Lucy.GetRef().Enable()
Alias_Lucy.GetRef().MoveTo(DLC04MS03_Lucy01Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
game.GetPlayer().RemoveItem(DLC04MS03_GrandchesterTicket, 1)

DLC04MS03_GrandchesterDoorRef.Unlock()

Alias_Lucy.GetRef().Enable()
Alias_Lucy.GetRef().MoveTo(DLC04MS03_Lucy01Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
ParlorRoomScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
ReadingRoomScene.Stop()

Alias_Lucy.GetRef().MoveTo(DLC04MS03_Lucy02Marker)

int i = 0
While (i < Alias_Robots_FlameHall.GetCount())
     (Alias_Robots_FlameHall.GetAt(i) as Actor).SetUnconscious(False)
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
FireplaceRoomScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
DiningRoomScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
KitchenScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
BalconyScene.Stop()

DLC04MS03_SeanceDoor_Ref.Lock()
DLC04MS03_SeanceDoor_Ref.activate(Alias_Lucy.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SeanceRoomScene.Stop()
Alias_Lucy.GetRef().MoveTo(DLC04MS03_Lucy03Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
UpstairsHallwayScene.Stop()
Alias_Lucy.GetRef().MoveTo(DLC04MS03_Lucy04Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Alias_Lucy.GetRef().MoveTo(DLC04MS03_Lucy04Marker)
Alias_Lucy.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC04_MS03_Start Auto Const Mandatory

MiscObject Property PrewarMoney Auto Const Mandatory

ReferenceAlias Property Alias_Hermit Auto Const Mandatory

ObjectReference Property DLC04MS03_GrandchesterDoorRef Auto Const Mandatory

ReferenceAlias Property Alias_Protectron Auto Const Mandatory

MiscObject Property DLC04MS03_GrandchesterTicket Auto Const Mandatory

ObjectReference Property DLC04MS03_Lucy01Marker Auto Const Mandatory

ReferenceAlias Property Alias_Lucy Auto Const Mandatory

ObjectReference Property DLC04MS03_Lucy02Marker Auto Const Mandatory

ObjectReference Property DLC04MS03_Lucy03Marker Auto Const Mandatory

ObjectReference Property DLC04MS03_ReadingRoomDoor_Ref Auto Const Mandatory

ObjectReference Property DLC04MS03_FireplaceRoomDoor_Ref Auto Const Mandatory

ObjectReference Property DLC04MS03_DiningRoomDoor_Ref Auto Const Mandatory

ObjectReference Property DLC04MS03_KitchenDoor_Ref Auto Const Mandatory

ObjectReference Property DLC04MS03_BalconyDoor_Ref Auto Const Mandatory

ObjectReference Property DLC04MS03_SeanceDoor_Ref Auto Const Mandatory

ObjectReference Property DLC04MS03_UpstairsHallDoor_Ref Auto Const Mandatory

ObjectReference Property DLC04MS03_LucysRoomDoor_Ref Auto Const Mandatory

ObjectReference Property DLC04MS03_MasterBedroomDoor_Ref Auto Const Mandatory

ObjectReference Property DLC04MS03_Lucy04Marker Auto Const

ObjectReference Property DLC04_MS03FinalLucyDoor Auto Const Mandatory

Key Property DLC04_MS03_HermitKey Auto Const Mandatory

Key Property DLC04_MS03_FrontDoorKey Auto Const Mandatory

Armor Property Armor_Raider_Underarmor Auto Const Mandatory

Scene Property ReadingRoomScene Auto Const Mandatory

Scene Property FireplaceRoomScene Auto Const Mandatory

Scene Property DiningRoomScene Auto Const Mandatory

Scene Property KitchenScene Auto Const Mandatory

Scene Property BalconyScene Auto Const Mandatory

Scene Property SeanceRoomScene Auto Const Mandatory

Scene Property UpstairsHallwayScene Auto Const Mandatory

Scene Property LucyBedroomScene Auto Const Mandatory

Scene Property ParlorRoomScene Auto Const Mandatory

Quest Property DLC04DialogueSettlement Auto Const Mandatory

ObjectReference Property DLC04_ParlorStairsCollisionRef Auto Const Mandatory

ObjectReference Property DLC04_FireplaceRoomCollisionRef Auto Const Mandatory

ObjectReference Property DLC04_UpstairsHallCollisionRef Auto Const Mandatory

ObjectReference Property DLC04_ParlorBalconyCollisionRef Auto Const Mandatory

ReferenceAlias Property Alias_Zach Auto Const Mandatory

RefCollectionAlias Property Alias_Robots_Kitchen Auto Const Mandatory

RefCollectionAlias Property Alias_Robots_UpstairsHall Auto Const Mandatory

RefCollectionAlias Property Alias_Robots_FlameHall Auto Const Mandatory

RefCollectionAlias Property Alias_Robots_2FHall Auto Const Mandatory

ObjectReference Property DLC04GrandchesterFlameHallHoldPositionTrigger Auto Const Mandatory

ObjectReference Property DLC04MS03_BalconyDoor02_Ref Auto Const Mandatory
