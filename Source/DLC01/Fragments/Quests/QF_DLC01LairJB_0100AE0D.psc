;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01LairJB_0100AE0D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Open Pod Doors
int i = 0
ObjectReference myPod
While (i < Alias_PodCollection.GetCount())
    myPod= (Alias_PodCollection.GetAt(i) as ObjectReference)
    myPod.playAnimation("g_IdleSitInstant")
    i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Setup for tracks
;spawn robots
PDLC01Lair_Main_Track1Dummy012.AddMachineConstrutorIndex(PDLC01LvlMechProtectron, PProtectronRace)
PDLC01Lair_Main_Track1Dummy013.AddMachineConstrutorIndex(PDLC01LvlMechMrHandy, PHandyRace)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;spawn robots
PDLC01Lair_Main_Track1Dummy012.ConstructionQueueShouldLoop = FALSE
PDLC01Lair_Main_Track1Dummy012.SetEngagedObjectsLimit(1, TRUE)
PDLC01Lair_Main_Track1Dummy012.AddMachineConstrutorIndex(PDLC01LvlMechProtectron, PProtectronRace, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
;spawn robots
PDLC01Lair_Main_Track1Dummy013.ConstructionQueueShouldLoop = FALSE
PDLC01Lair_Main_Track1Dummy013.SetEngagedObjectsLimit(1, TRUE)
PDLC01Lair_Main_Track1Dummy013.AddMachineConstrutorIndex(PDLC01LvlMechMrHandy, PHandyRace, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Open Jail Doors
int i = 0
ObjectReference myDoor
While (i < Alias_CellDoorCollection.GetCount())
    myDoor= (Alias_CellDoorCollection.GetAt(i) as ObjectReference)
    if (myDoor.GetOpenState() != 1 || myDoor.GetOpenState() != 2)
        ;not open, so open it
        myDoor.SetOpen(TRUE)
    endif
    i = i + 1
EndWhile
;turn on Klaxons
i = 0
ObjectReference myKlaxon
While (i < Alias_CellKlaxonCollection.GetCount())
    myKlaxon = (Alias_CellKlaxonCollection.GetAt(i) as ObjectReference)
    if (myKlaxon.isDestroyed() == FALSE)
        ;not destroyed, so activate it
        myKlaxon.activate(myKlaxon)
    endif
    i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
;Close Jail Doors
int i = 0
ObjectReference myDoor
While (i < Alias_CellDoorCollection.GetCount())
    myDoor= (Alias_CellDoorCollection.GetAt(i) as ObjectReference)
    if (myDoor.GetOpenState() == 1 || myDoor.GetOpenState() == 2)
        ;not closed, so close it
        myDoor.SetOpen(FALSE)
    endif
    i = i + 1
EndWhile
;turn off Klaxons
i = 0
ObjectReference myKlaxon
While (i < Alias_CellKlaxonCollection.GetCount())
    myKlaxon = (Alias_CellKlaxonCollection.GetAt(i) as ObjectReference)
    if (myKlaxon.isDestroyed() == FALSE)
        ;not destroyed, so activate it
        myKlaxon.activate(myKlaxon)
    endif
    i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_CellDoorCollection Auto Const Mandatory

RefCollectionAlias Property Alias_CellKlaxonCollection Auto Const Mandatory

RefCollectionAlias Property Alias_PodCollection Auto Const Mandatory

dlc01:dlc01_tracksystemtrack Property PDLC01Lair_Main_Track1Dummy012 Auto Const Mandatory

ActorBase Property PDLC01LvlMechProtectron Auto Const Mandatory

Race Property PProtectronRace Auto Const Mandatory

dlc01:dlc01_tracksystemtrack Property PDLC01Lair_Main_Track1Dummy013 Auto Const Mandatory

ActorBase Property PDLC01LvlMechMrHandy Auto Const Mandatory

Race Property PHandyRace Auto Const Mandatory

ObjectReference Property Arch1 Auto Const

ObjectReference Property Arch2 Auto Const

ReferenceAlias Property Alias_AssaultronMed01 Auto Const Mandatory
