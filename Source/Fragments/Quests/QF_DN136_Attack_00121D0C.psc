;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN136_Attack_00121D0C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;with MM coming in from tunnel and RR already inside, need to handle main elevator and Old Robotics Door
;MM sets this stage when player activates keypad in InstituteTunnel

;Close Elevator Outer Doors
;ElevatorTopDoor.SetOpen(FALSE)
ElevatorMidDoor.SetOpen(FALSE)
ElevatorBottomDoor.SetOpen(FALSE)

;Disable Generic Actors
Alias_GenericActorMarker.getReference().disableNoWait()
InsituteHiggsLokenMarker.disableNoWait()
JustinAyoMarkerRef.disableNoWait()
LiamBinetMarkerRef.disableNoWait()

;Disable InstM03 guards (added by Matt D)
InstM03SynthGuard1Ref.disableNoWait()
InstM03SynthGuard2Ref.disableNoWait()
InstM03SynthGuardHallway1.disableNoWait()
InstM03SynthGuardHallway2.disableNoWait()

if (!BoS301.GetStageDone(75) && !BoS301.GetStageDone(76))
     Alias_MadisonLi.GetActorRef().DisableNoWait()
EndIf

;Need to disable Relay Scientists in cases where they were enabled when player started MQ302 with RR
;and then shoots Z1 or Des to stop that quest and proceed with MM

if(MQ302MM.getStageDone(350))
    ;disable Scientists
    Alias_RelayRoomEncounterCollection.DisableAll()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;BoS sets this stage from MQ302BoS stage 300
;Minutemen sets this stage from MQ302Min stage 360

;enable set stage triggers
Alias_SetStageTriggers.getReference().enableNoWait()

;Close Elevator Outer Doors
;ElevatorTopDoor.SetOpen(FALSE)
ElevatorMidDoor.SetOpen(FALSE)
ElevatorBottomDoor.SetOpen(FALSE)

;open Father's door
FathersDoor.SetOpen(TRUE)
FathersDoor02.SetOpen(TRUE)
FathersDoor03.DisableNoWait()
FathersDoorMarker.enableNoWait()

;Disable Fast Travel
(MQ302 as MQ302Script).FastTravelToggle(0)

;Enable structures
Alias_Structures.getReference().enableNoWait()
;OldRoboticsDoorNoUse.DisableNoWait()
FathersShutters.EnableNoWait()

;Disable clutter
ApartmentClutter.disableNoWait()

;Disable Actors
Alias_ShaunChild.getActorRef().disableNoWait()

;Disable Generic Actors
Alias_GenericActorMarker.getReference().disableNoWait()
InsituteHiggsLokenMarker.disableNoWait()
JustinAyoMarkerRef.disableNoWait()
LiamBinetMarkerRef.disableNoWait()

if (!BoS301.GetStageDone(75) && !BoS301.GetStageDone(76))
     Alias_MadisonLi.GetActorRef().DisableNoWait()
EndIf

;Enable OR Turrets
Alias_TurretsOR.getReference().enableNoWait()

;Enable Reactor Loot
Alias_ReactorLoot.getReference().enableNoWait()

;disable the water and correct pipe door in Institute
MMMarker.disableNoWait()

;Allow player to access reactor cell and turn on radiation in room and reactor
Alias_ReactorAccessMarker.GetReference().DisableNoWait()
ReactorRoomRadiationMarker.enableNoWait()
ReactorRadiationMarker.enableNoWait()

;Enable Generic Scientists
FleeingScientistMarker.enableNoWait()

;Enable Magic Doors
Alias_MagicDoorToMassFusion01.getReference().enableNoWait()
Alias_MagicDoorToMassFusion02.getReference().enableNoWait()
Alias_MagicDoorToMassFusion03.getReference().enableNoWait()
Alias_MagicDoorToMassFusion04.getReference().enableNoWait()

;Enable Faction
if(MQ302Faction.getValueInt() == 1)
    ;Brotherhood of Steel
    ;Store Actors
    Actor FactionLeader = Alias_FactionLeader.getActorRef()
    Actor FactionScientist = Alias_FactionScientist.getActorRef()
    Actor Brandis = Alias_BoSBrandis.getActorRef()
    Actor BoS02 = Alias_BoS02.getActorRef()
    ;Actor BoS03 = Alias_BoS03.getActorRef()

    FactionLeader.IgnoreFriendlyHits(TRUE)
    FactionLeader.moveto(BoSLeaderStartRef)
    FactionScientist.IgnoreFriendlyHits(TRUE)
    FactionScientist.moveto(BoSScientistStartRef)
    FactionLeader.StopCombat()
    FactionScientist.StopCombat()
    Brandis.IgnoreFriendlyHits(TRUE)
    Brandis.MoveTo(BoSGeneric01StartRef)
    BoS02.IgnoreFriendlyHits(TRUE)
    BoS02.MoveTo(BoSGeneric02StartRef)
    ;BoS03.MoveTo(BoSGeneric03StartRef)
    Brandis.enableNoWait()
    BoS02.enableNoWait()
    ;BoS03.enableNoWait()
    Followers.TryToTeleportCompanion(BoSGeneric01StartRef, ShouldPlayTeleportInEffect = false, ShouldPlayTeleportOutEffect = false)
    Followers.TryToTeleportDogmeat(BoSGeneric01StartRef, ShouldPlayTeleportInEffect = false, ShouldPlayTeleportOutEffect = false)

elseif(MQ302Faction.getValueInt() == 2)
    ;Minutemen
    ;Store Actors
    Actor Min01 = Alias_Min01.getActorRef()
    Actor Min02 = Alias_Min02.getActorRef()
    ;Actor Min03 = Alias_Min03.getActorRef()

    Min01.IgnoreFriendlyHits(TRUE)
    Min01.MoveTo(TeleporterGeneric01StartRef)
    Min02.IgnoreFriendlyHits(TRUE)
    Min02.MoveTo(TeleporterGeneric02StartRef)
    ;Min03.MoveTo(TeleporterGeneric03StartRef)
    Min01.enableNoWait()
    Utility.Wait(1.0)
    Min02.enableNoWait()
    ;Min03.enableNoWait()
elseif(MQ302Faction.getValueInt() == 3)
    ;Railroad
    ;Store Actors
    Actor RR01 = Alias_RR01.getActorRef()
    Actor RR02 = Alias_RR02.getActorRef()
    ;Actor RR03 = Alias_RR03.getActorRef()

    RR01.IgnoreFriendlyHits(TRUE)
    RR01.MoveTo(TeleporterGeneric01StartRef)
    RR02.IgnoreFriendlyHits(TRUE)
    RR02.MoveTo(TeleporterGeneric02StartRef)
    ;RR03.MoveTo(TeleporterGeneric03StartRef)
    RR01.enableNoWait()
    Utility.Wait(1.0)
    RR02.enableNoWait()
    ;RR03.enableNoWait()
else
    ;no Faction!
    debug.notification("no faction")
endif


;Turn on Klaxons in Teleporter and Old Robotics
int i = 0
ObjectReference myKlaxon
While (i < Alias_KlaxonTeleporterCollection.GetCount())
    myKlaxon = (Alias_KlaxonTeleporterCollection.GetAt(i) as ObjectReference)
    if (myKlaxon.isDestroyed() == FALSE)
        ;not destroyed, so activate it
        myKlaxon.activate(myKlaxon)
    endif
    i = i + 1
EndWhile

i = 0
While (i < Alias_KlaxonOldRoboticsCollection.GetCount())
    myKlaxon = (Alias_KlaxonOldRoboticsCollection.GetAt(i) as ObjectReference)
     if (myKlaxon.isDestroyed() == FALSE)
        ;not destroyed, so activate it
        myKlaxon.activate(myKlaxon)
    endif
    i = i + 1
EndWhile

;open BioScienceSecurity Door and turn on Klaxons
Default2StateActivator BioScienceDoor = Alias_BioScienceSecurityDoor.GetReference() as Default2StateActivator
if(BioScienceDoor.isOpen == 0)
        ;then open the door
        BioScienceDoor.activate(BioScienceDoor)
endif

i = 0
While (i < Alias_KlaxonBioScienceCollection.GetCount())
    myKlaxon = (Alias_KlaxonBioScienceCollection.GetAt(i) as ObjectReference)
     if (myKlaxon.isDestroyed() == FALSE)
        ;not destroyed, so activate it
        myKlaxon.activate(myKlaxon)
    endif
    i = i + 1
EndWhile

;close all security doors
    objectReference[] linkedRefChain = Alias_SecurityDoorMaster.getReference().getLinkedRefChain(LinkCustom02)
    i = 0
    while i < linkedRefChain.length
        if((linkedRefChain[i] as Default2StateActivator).isOpen == 1)
            ;then close the door
            linkedRefChain[i].activate(linkedRefChain[i])
        endif
        i += 1
    endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;BoS Brandis Dead

;Store Actor
Actor BoS01 = Alias_BoS01.getActorRef()

BoS01.IgnoreFriendlyHits(TRUE)
BoS01.MoveTo(Alias_RespawnFailsafe.getReference())
BoS01.enableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;enable Synths
Alias_OREnableMarker100.getReference().enable()

;give Z1 a weapon
Alias_Z114.getReference().addItem(Z1LeveledWeapon, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Move Respawn Markers
Alias_RespawnMarker01.getReference().moveTo(Alias_RespawnMarker01.getReference().getNthLinkedRef(1))
Alias_RespawnMarker02.getReference().moveTo(Alias_RespawnMarker02.getReference().getNthLinkedRef(1))
Alias_RespawnMarker03.getReference().moveTo(Alias_RespawnMarker03.getReference().getNthLinkedRef(1))
Alias_RespawnFailsafe.getReference().moveTo(Alias_RespawnFailsafe.getReference().getNthLinkedRef(1))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
;enable Synths
Alias_OREnableMarker115.getReference().enable()

;Move Respawn Markers
Alias_RespawnMarker01.getReference().moveTo(Alias_RespawnMarker01.getReference().getNthLinkedRef(2))
Alias_RespawnMarker02.getReference().moveTo(Alias_RespawnMarker02.getReference().getNthLinkedRef(2))
Alias_RespawnMarker03.getReference().moveTo(Alias_RespawnMarker03.getReference().getNthLinkedRef(2))
Alias_RespawnFailsafe.getReference().moveTo(Alias_RespawnFailsafe.getReference().getNthLinkedRef(2))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
;enable Synths and move ally respawn marker
Alias_OREnableMarker125.getReference().enable()

;Move Respawn Markers
Alias_RespawnMarker01.getReference().moveTo(Alias_RespawnMarker01.getReference().getNthLinkedRef(3))
Alias_RespawnMarker02.getReference().moveTo(Alias_RespawnMarker02.getReference().getNthLinkedRef(3))
Alias_RespawnMarker03.getReference().moveTo(Alias_RespawnMarker03.getReference().getNthLinkedRef(3))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;enable Synths
Alias_OREnableMarker150.getReference().enable()

;Move Respawn Markers
Alias_RespawnMarker01.getReference().moveTo(Alias_RespawnMarker01.getReference().getNthLinkedRef(4))
Alias_RespawnMarker02.getReference().moveTo(Alias_RespawnMarker02.getReference().getNthLinkedRef(4))
Alias_RespawnMarker03.getReference().moveTo(Alias_RespawnMarker03.getReference().getNthLinkedRef(4))
Alias_RespawnFailsafe.getReference().moveTo(Alias_RespawnFailsafe.getReference().getNthLinkedRef(3))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
;Player just jumped down hatch in Old Robotics
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Move Respawn Markers
Alias_RespawnMarker01.getReference().moveTo(Alias_RespawnMarker01.getReference().getNthLinkedRef(5))
Alias_RespawnMarker02.getReference().moveTo(Alias_RespawnMarker02.getReference().getNthLinkedRef(5))
Alias_RespawnMarker03.getReference().moveTo(Alias_RespawnMarker03.getReference().getNthLinkedRef(5))
Alias_RespawnFailsafe.getReference().moveTo(Alias_RespawnFailsafe.getReference().getNthLinkedRef(4))

;Cleanup Previous Area
Alias_TurretsOR.getReference().disableNoWait()
Alias_OREnableMarker100.getReference().disableNoWait()
Alias_OREnableMarker115.getReference().disableNoWait()
Alias_OREnableMarker125.getReference().disableNoWait()
Alias_OREnableMarker150.getReference().disableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
;Enable Synths
Alias_BioEnableMarker225.getReference().enableNoWait()

;Move Respawn Markers
Alias_RespawnMarker01.getReference().moveTo(Alias_RespawnMarker01.getReference().getNthLinkedRef(6))
Alias_RespawnMarker02.getReference().moveTo(Alias_RespawnMarker02.getReference().getNthLinkedRef(6))
Alias_RespawnMarker03.getReference().moveTo(Alias_RespawnMarker03.getReference().getNthLinkedRef(6))
Alias_RespawnFailsafe.getReference().moveTo(Alias_RespawnFailsafe.getReference().getNthLinkedRef(5))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
;enable synths on the side passage of BioScience
Alias_BioEnableMarker230.getReference().enableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
;open gorilla doors if any of the two gorillas are alive
if(((Alias_Gorilla01.GetReference() as Actor).isDead() == FALSE) || ((Alias_Gorilla01.GetReference() as Actor).isDead() == FALSE))
    Default2StateActivator myDoor = GorillaDoor as Default2StateActivator
    myDoor.IsAnimating = True
    myDoor.SetOpenNoWait(True)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;enable Synths
Alias_Con01EnableMarker.getReference().enableNoWait()

;disable the water and correct pipe door in Institute
MMMarker.disableNoWait()

;Move Respawn Markers
Alias_RespawnMarker01.getReference().moveTo(Alias_RespawnMarker01.getReference().getNthLinkedRef(7))
Alias_RespawnMarker02.getReference().moveTo(Alias_RespawnMarker02.getReference().getNthLinkedRef(7))
Alias_RespawnMarker03.getReference().moveTo(Alias_RespawnMarker03.getReference().getNthLinkedRef(7))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Followers stop following

;Enable Rebel Synths if RR
if(MQ302Faction.getValueInt() == 3)
    Alias_RebelCollectionConcourse01Auto.enableAll()
    Alias_RebelCollectionConcourse01Rifle.enableAll()
    Alias_RebelCollectionConcourse01Pistol.enableAll()
endif
;Move Respawn Markers
Alias_RespawnMarker01.getReference().moveTo(Alias_RespawnMarker01.getReference().getNthLinkedRef(8))
Alias_RespawnMarker02.getReference().moveTo(Alias_RespawnMarker02.getReference().getNthLinkedRef(8))
Alias_RespawnMarker03.getReference().moveTo(Alias_RespawnMarker03.getReference().getNthLinkedRef(8))
Alias_RespawnFailsafe.getReference().moveTo(Alias_RespawnFailsafe.getReference().getNthLinkedRef(6))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
;If RR, enable Rebels near Adv Systems

if(MQ302Faction.getValueInt() == 3)
    if getStageDone(350) == 0
        RebelCCAdvSysMarker.enableNoWait()
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0311_Item_00
Function Fragment_Stage_0311_Item_00()
;BEGIN CODE
;If RR, enable Rebels near SRB

if(MQ302Faction.getValueInt() == 3)
    if getStageDone(350) == 0
        RebelCCSRBMarker.enableNoWait()
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0312_Item_00
Function Fragment_Stage_0312_Item_00()
;BEGIN CODE
;If RR, enable Rebels near Robotics

if(MQ302Faction.getValueInt() == 3)
    if getStageDone(350) == 0
        RebelCCRoboticsMarker.enableNoWait()
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
;gets set by script on Concourse01Collection alias
;set stage on MQ302 to play PA announcement
;if RR, then enable Rebel Synth who talks to Z, if Z is still alive
if(MQ302Faction.getValueInt() == 3)
    if(Alias_Z114.GetActorRef().isDead() == 0)
        Actor Rebel = Alias_SynthZ1MeetUp.GetActorRef()
        Rebel.Enable()
        Rebel.EvaluatePackage()
    endif
endif
MQ302.SetStage(425)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
;Scene between Z1 and Rebel Synth in Concourse ended
;Disable the Rebel Synth
Alias_SynthZ1MeetUp.GetActorRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Need to open all security doors and play and klaxons
;Open all security doors
    objectReference[] linkedRefChain = Alias_SecurityDoorMaster.getReference().getLinkedRefChain(LinkCustom02)
    int i = 0
    while i < linkedRefChain.length
        if((linkedRefChain[i] as Default2StateActivator).isOpen == 0)
            ;then open the door
            linkedRefChain[i].activate(linkedRefChain[i])
        endif
        i += 1
    endWhile

;Turn on Klaxons
i = 0
ObjectReference myKlaxon
;ObjectReference myKlaxonMesh
While (i < Alias_KlaxonCollection.GetCount())
    myKlaxon = (Alias_KlaxonCollection.GetAt(i) as ObjectReference)
    if (myKlaxon.isDestroyed() == FALSE)
        ;not destroyed, so activate it
        myKlaxon.activate(myKlaxon)
    endif
    i = i + 1
EndWhile


;Enable AdvancedSystems Encounters in Advanced Systems
Alias_AdvSysEnableMarker400.getReference().enableNoWait()

;Enable Encounters in SRB and Robotics
SRBEnableMarker.EnableNoWait()
RoboticsEnableMarker.EnableNoWait()
BioEnableMarker.EnableNoWait()

;If RR, then enable Rebel Synths in SRB and Robotics
if(MQ302Faction.getValueInt() == 3)
    Alias_RebelCollectionSRBAuto.EnableAll()
    Alias_RebelCollectionSRBRifle.EnableAll()
    Alias_RebelCollectionSRBPistol.EnableAll()
    Alias_RebelCollectionRoboticsAuto.EnableAll()
    Alias_RebelCollectionRoboticsRifle.EnableAll()
    Alias_RebelCollectionRoboticsPistol.EnableAll()
    Alias_RebelCollectionRoboticsAuto.EnableAll()
    Alias_RebelCollectionRoboticsRifle.EnableAll()
    Alias_RebelCollectionRoboticsPistol.EnableAll()
endif

;open Father's Door
FathersDoorMarker.DisableNoWait()

;Turn on Klaxons in Robotics
i = 0
While (i < Alias_KlaxonRoboticsCollection.GetCount())
    myKlaxon = (Alias_KlaxonRoboticsCollection.GetAt(i) as ObjectReference)
    if (myKlaxon.isDestroyed() == FALSE)
        ;not destroyed, so activate it
        myKlaxon.activate(myKlaxon)
    endif
    i = i + 1
EndWhile

;Turn on Klaxons in AdvSys
i = 0
While (i < Alias_KlaxonAdvSysCollection.GetCount())
    myKlaxon = (Alias_KlaxonAdvSysCollection.GetAt(i) as ObjectReference)
    if (myKlaxon.isDestroyed() == FALSE)
        ;not destroyed, so activate it
        myKlaxon.activate(myKlaxon)
    endif
    i = i + 1
EndWhile

;Turn on Klaxons in SRB
i = 0
While (i < Alias_KlaxonSRBCollection.GetCount())
    myKlaxon = (Alias_KlaxonSRBCollection.GetAt(i) as ObjectReference)
    if (myKlaxon.isDestroyed() == FALSE)
        ;not destroyed, so activate it
        myKlaxon.activate(myKlaxon)
    endif
    i = i + 1
EndWhile

;Turn on Klaxons in Reactor
i = 0
While (i < Alias_KlaxonReactorCollection.GetCount())
    myKlaxon = (Alias_KlaxonReactorCollection.GetAt(i) as ObjectReference)
    if (myKlaxon.isDestroyed() == FALSE)
        ;not destroyed, so activate it
        myKlaxon.activate(myKlaxon)
    endif
    i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN CODE
;Player has shut down synths using Father's Terminal
SynthShutdownMarker.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
;Enable Post Father's Terminal Encounter Marker
;If RR, then enable the RR version
if(MQ302Faction.getValueInt() == 3)
    FathersTerminalRREncounterMarker.EnableNoWait()
else
    FathersTerminalEncounterMarker.EnableNoWait()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
Alias_FactionLeader.getActorRef().StopCombat()

;Move Respawn Markers
Alias_RespawnMarker01.getReference().moveTo(Alias_RespawnMarker01.getReference().getNthLinkedRef(9))
Alias_RespawnMarker02.getReference().moveTo(Alias_RespawnMarker02.getReference().getNthLinkedRef(9))
Alias_RespawnMarker03.getReference().moveTo(Alias_RespawnMarker03.getReference().getNthLinkedRef(9))
Alias_RespawnFailsafe.getReference().moveTo(Alias_RespawnFailsafe.getReference().getNthLinkedRef(7))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;preload door to mass fusion in reactor cell
Alias_MagicDoorToMassFusion02.getReference().preloadTargetArea()

Alias_FactionLeader.getActorRef().StopCombat()

if(MQ302Faction.getValueInt() == 1)
    ;Brotherhood of Steel
    Alias_FactionLeader.getActorRef().EvaluatePackage()
    Alias_BoS01.getActorRef().EvaluatePackage()
    Alias_BoS02.getActorRef().EvaluatePackage()
    ;Alias_BoS03.getActorRef().EvaluatePackage()
elseif(MQ302Faction.getValueInt() == 2)
    ;Minutemen
    Alias_FactionLeader.getActorRef().EvaluatePackage()
    Alias_Min01.getActorRef().EvaluatePackage()
    Alias_Min02.getActorRef().EvaluatePackage()
    ;Alias_Min03.getActorRef().EvaluatePackage()
elseif(MQ302Faction.getValueInt() == 3)
    ;Railroad
    Alias_FactionLeader.getActorRef().EvaluatePackage()
    Alias_RR01.getActorRef().EvaluatePackage()
    Alias_RR02.getActorRef().EvaluatePackage()
    ;Alias_RR03.getActorRef().EvaluatePackage()
endif

;Move Respawn Markers
Alias_RespawnMarker01.getReference().moveTo(Alias_RespawnMarker01.getReference().getNthLinkedRef(10))
Alias_RespawnMarker02.getReference().moveTo(Alias_RespawnMarker02.getReference().getNthLinkedRef(10))
Alias_RespawnMarker03.getReference().moveTo(Alias_RespawnMarker03.getReference().getNthLinkedRef(10))
Alias_RespawnFailsafe.getReference().moveTo(Alias_RespawnFailsafe.getReference().getNthLinkedRef(8))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
if(MQ302Faction.getValueInt() == 1)
    ;Brotherhood of Steel
    Alias_FactionLeader.getActorRef().EvaluatePackage()
    Alias_BoS01.getActorRef().EvaluatePackage()
    Alias_BoS02.getActorRef().EvaluatePackage()
    ;Alias_BoS03.getActorRef().EvaluatePackage()
elseif(MQ302Faction.getValueInt() == 2)
    ;Minutemen
    Alias_FactionLeader.getActorRef().EvaluatePackage()
    Alias_Min01.getActorRef().EvaluatePackage()
    Alias_Min02.getActorRef().EvaluatePackage()
    ;Alias_Min03.getActorRef().EvaluatePackage()
elseif(MQ302Faction.getValueInt() == 3)
    ;Railroad
    Alias_FactionLeader.getActorRef().EvaluatePackage()
    Alias_RR01.getActorRef().EvaluatePackage()
    Alias_RR02.getActorRef().EvaluatePackage()
    ;Alias_RR03.getActorRef().EvaluatePackage()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
;enable Reactor Encounters
Alias_ReactorEncounters.getReference().enableNoWait()

;Move Respawn Markers
Alias_RespawnMarker01.getReference().moveTo(Alias_RespawnMarker01.getReference().getNthLinkedRef(11))
Alias_RespawnMarker02.getReference().moveTo(Alias_RespawnMarker02.getReference().getNthLinkedRef(11))
Alias_RespawnMarker03.getReference().moveTo(Alias_RespawnMarker03.getReference().getNthLinkedRef(11))
Alias_RespawnFailsafe.getReference().moveTo(Alias_RespawnFailsafe.getReference().getNthLinkedRef(9))

;move scientist to marker for safety measure
Alias_FactionScientist.getReference().moveTo(MQ302ScientistEndMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
;Move Respawn Markers
Alias_RespawnMarker01.getReference().moveTo(Alias_RespawnMarker01.getReference().getNthLinkedRef(12))
Alias_RespawnMarker02.getReference().moveTo(Alias_RespawnMarker02.getReference().getNthLinkedRef(12))
Alias_RespawnMarker03.getReference().moveTo(Alias_RespawnMarker03.getReference().getNthLinkedRef(12))
Alias_RespawnFailsafe.getReference().moveTo(Alias_RespawnFailsafe.getReference().getNthLinkedRef(10))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
;set by MQ302 stage 600

;kill/disable concourse encounters
Alias_Con01EnableMarker.getReference().DisableNoWait()
FathersTerminalRREncounterMarker.DisableNoWait()
FathersTerminalEncounterMarker.DisableNoWait()
Alias_ConcourseEnableMarkerCollection.DisableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
;Reactor Synths have been cleared

OldRoboticsDoorNoUse.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;Cleanup and Stop (set by MQ302 stage 800)

if(MQ302Faction.getValueInt() == 1)
    ;Brotherhood of Steel
    Alias_BoS01.getActorRef().disableNoWait()
    Alias_BoS02.getActorRef().disableNoWait()
    ;Alias_BoS03.getActorRef().disableNoWait()
    ;Handle BoSMarshal
    BoSMarshal.SetStage(240)
elseif(MQ302Faction.getValueInt() == 2)
    ;Minutemen
    Alias_Min01.getActorRef().disableNoWait()
    Alias_Min02.getActorRef().disableNoWait()
    ;Alias_Min03.getActorRef().disableNoWait()
elseif(MQ302Faction.getValueInt() == 3)
    ;Railroad
    Alias_RR01.getActorRef().disableNoWait()
    Alias_RR02.getActorRef().disableNoWait()
    ;Alias_RR03.getActorRef().disableNoWait()
endif

Alias_BioEnableMarker225.getReference().disableNoWait()
Alias_Con01EnableMarker.getReference().disableNoWait()
Alias_AdvSysEnableMarker400.getReference().disableNoWait()
Alias_ReactorEncounters.getReference().disableNoWait()

;Disable Generic Scientists
FleeingScientistMarker.disableNoWait()

;Disable Magic Doors
Alias_MagicDoorToMassFusion01.getReference().Disable()
Alias_MagicDoorToMassFusion02.getReference().Disable()
Alias_MagicDoorToMassFusion03.getReference().Disable()
Alias_MagicDoorToMassFusion04.getReference().Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BoS01 Auto Const

ReferenceAlias Property Alias_BoS02 Auto Const

ReferenceAlias Property Alias_BoS03 Auto Const

ReferenceAlias Property Alias_OREnableMarker100 Auto Const

ReferenceAlias Property Alias_OREnableMarker125 Auto Const

ReferenceAlias Property Alias_OREnableMarker150 Auto Const

ReferenceAlias Property Alias_RespawnMarker01 Auto Const

ReferenceAlias Property Alias_OREnableMarker115 Auto Const

;ReferenceAlias Property Alias_ObstacleBioscience Auto Const

;ReferenceAlias Property Alias_LibertyPrime Auto Const

ReferenceAlias Property Alias_GenericActorMarker Auto Const

ReferenceAlias Property Alias_Structures Auto Const

;ReferenceAlias Property Alias_ObstacleSynthLab Auto Const

;ReferenceAlias Property Alias_ObstacleSynthRetention Auto Const

;ReferenceAlias Property Alias_ObstacleAdvancedSystems Auto Const

;ReferenceAlias Property Alias_SLEnableMarker325 Auto Const

GlobalVariable Property MQ302Faction Auto Const

ReferenceAlias Property Alias_FactionLeader Auto Const

ReferenceAlias Property Alias_FactionScientist Auto Const

ReferenceAlias Property Alias_FactionLeaderStartMarker Auto Const

ReferenceAlias Property Alias_FactionScientistStartMarker Auto Const

ReferenceAlias Property Alias_BioEnableMarker225 Auto Const

;ReferenceAlias Property Alias_ObstacleSynthLab02 Auto Const

;ReferenceAlias Property Alias_SLEnableMarker350 Auto Const

ReferenceAlias Property Alias_Z114 Auto Const

;ReferenceAlias Property Alias_G981 Auto Const

ReferenceAlias Property Alias_RespawnMarker02 Auto Const

ReferenceAlias Property Alias_RespawnMarker03 Auto Const

ReferenceAlias Property Alias_RespawnFailsafe Auto Const

ReferenceAlias Property Alias_TurretsOR Auto Const

;ReferenceAlias Property Alias_TurretsBio Auto Const

;ReferenceAlias Property Alias_SREnableMarker550 Auto Const

;ReferenceAlias Property Alias_SREnableMarker500 Auto Const

;ReferenceAlias Property Alias_AdvSysEnableMarker600 Auto Const

;ReferenceAlias Property Alias_ObstacleSynthRetention02 Auto Const

;ReferenceAlias Property Alias_ObstacleSynthRetention03 Auto Const

;ReferenceAlias Property Alias_ObstacleAdvancedSystems02 Auto Const

;ReferenceAlias Property Alias_AdvSysEnableMarker625 Auto Const

;ReferenceAlias Property Alias_FodderMarker Auto Const

;ReferenceAlias Property Alias_ShaunOld Auto Const

ReferenceAlias Property Alias_ShaunChild Auto Const

ReferenceAlias Property Alias_SecurityDoorMaster Auto Const

Keyword Property LinkCustom02 Auto Const

;ReferenceAlias Property Alias_BioLobbyDoor01 Auto Const

;ReferenceAlias Property Alias_SLLobbyDoor01 Auto Const

;ReferenceAlias Property Alias_SRLobbyDoor01 Auto Const

;ReferenceAlias Property Alias_AdvSysLobbyDoor01 Auto Const

ReferenceAlias Property Alias_SetStageTriggers Auto Const

ReferenceAlias Property Alias_ReactorEncounters Auto Const

ReferenceAlias Property Alias_ReactorLoot Auto Const

ReferenceAlias Property Alias_Min01 Auto Const

ReferenceAlias Property Alias_Min02 Auto Const

ReferenceAlias Property Alias_Min03 Auto Const

ObjectReference Property TeleporterGeneric01StartRef Auto Const

ObjectReference Property TeleporterGeneric02StartRef Auto Const

ObjectReference Property TeleporterGeneric03StartRef Auto Const

;ReferenceAlias Property Alias_ElevatorReactorSwitch Auto Const

;ObjectReference Property DN136_BioScienceKlaxon01REF Auto Const

;ReferenceAlias Property Alias_KlaxonBio01 Auto Const

;ReferenceAlias Property Alias_KlaxonBio02 Auto Const

;ReferenceAlias Property Alias_KlaxonSL01 Auto Const

;ReferenceAlias Property Alias_KlaxonSL02 Auto Const

;ReferenceAlias Property Alias_KlaxonBio03 Auto Const

;ReferenceAlias Property Alias_KlaxonSL03 Auto Const

;ReferenceAlias Property Alias_KlaxonSL04 Auto Const

;ReferenceAlias Property Alias_KlaxonSR01 Auto Const

;ReferenceAlias Property Alias_KlaxonSR02 Auto Const

;ReferenceAlias Property Alias_KlaxonSR03 Auto Const

;ReferenceAlias Property Alias_KlaxonSR04 Auto Const

;ReferenceAlias Property Alias_KlaxonAdvSys01 Auto Const

;ReferenceAlias Property Alias_KlaxonAdvSys02 Auto Const

;ReferenceAlias Property Alias_KlaxonAdvSys03 Auto Const

ObjectReference Property BoSGeneric01StartRef Auto Const

ObjectReference Property BoSGeneric02StartRef Auto Const

ObjectReference Property BoSGeneric03StartRef Auto Const

ObjectReference Property BoSLeaderStartRef Auto Const

ObjectReference Property BoSScientistStartRef Auto Const

ReferenceAlias Property Alias_Con01EnableMarker Auto Const

ObjectReference Property ApartmentClutter Auto Const

;ObjectReference Property ElevatorStructures Auto Const

;ObjectReference Property ConcourseTrees Auto Const

;ObjectReference Property ConcoursePlatform Auto Const

ObjectReference Property GorillaDoor Auto Const

RefCollectionAlias Property Alias_KlaxonCollection Auto Const

;ObjectReference Property DN136_ElevatorTrigger Auto Const

;ObjectReference Property ElevatorButtonSparks Auto Const

ObjectReference Property FathersDoor Auto Const

ReferenceAlias Property Alias_AdvSysEnableMarker400 Auto Const

Quest Property MQ302 Auto Const

RefCollectionAlias Property Alias_KlaxonOldRoboticsCollection Auto Const

RefCollectionAlias Property Alias_KlaxonTeleporterCollection Auto Const

;Quest Property DNPrime_BoS304 Auto Const

ReferenceAlias Property Alias_RR01 Auto Const

ReferenceAlias Property Alias_RR02 Auto Const

ReferenceAlias Property Alias_RR03 Auto Const

ObjectReference Property FathersDoorMarker Auto Const

ObjectReference Property FathersDoor02 Auto Const

ObjectReference Property FathersDoor03 Auto Const

ObjectReference Property ElevatorTopDoor Auto Const

ObjectReference Property ElevatorMidDoor Auto Const

ObjectReference Property ElevatorBottomDoor Auto Const

ObjectReference Property FathersTerminalEncounterMarker Auto Const

ObjectReference Property MMMarker Auto Const

ReferenceAlias Property Alias_ReactorAccessMarker Auto Const

ReferenceAlias Property Alias_Gorilla01 Auto Const

ReferenceAlias Property Alias_Gorilla02 Auto Const

ReferenceAlias Property Alias_BioScienceSecurityDoor Auto Const

ReferenceAlias Property Alias_BioEnableMarker230 Auto Const

Quest Property BoSMarshal Auto Const

ReferenceAlias Property Alias_BoSBrandis Auto Const

ObjectReference Property ReactorRoomRadiationMarker Auto Const

ObjectReference Property ReactorRadiationMarker Auto Const

ObjectReference Property OldRoboticsDoorNoUse Auto Const

RefCollectionAlias Property Alias_RebelCollectionConcourse01Auto Auto Const

RefCollectionAlias Property Alias_RebelCollectionConcourse01Rifle Auto Const

RefCollectionAlias Property Alias_RebelCollectionConcourse01Pistol Auto Const

ObjectReference Property RebelCCAdvSysMarker Auto Const

ObjectReference Property RebelCCSRBMarker Auto Const

ObjectReference Property RebelCCRoboticsMarker Auto Const

ObjectReference Property SRBEnableMarker Auto Const

ObjectReference Property RoboticsEnableMarker Auto Const

RefCollectionAlias Property Alias_RebelCollectionRoboticsAuto Auto Const

RefCollectionAlias Property Alias_RebelCollectionRoboticsRifle Auto Const

RefCollectionAlias Property Alias_RebelCollectionRoboticsPistol Auto Const

RefCollectionAlias Property Alias_RebelCollectionSRBAuto Auto Const

RefCollectionAlias Property Alias_RebelCollectionSRBRifle Auto Const

RefCollectionAlias Property Alias_RebelCollectionSRBPistol Auto Const

RefCollectionAlias Property Alias_RebelCollectionBioAuto Auto Const

RefCollectionAlias Property Alias_RebelCollectionBioRifle Auto Const

RefCollectionAlias Property Alias_RebelCollectionBioPistol Auto Const

ObjectReference Property BioEnableMarker Auto Const

ObjectReference Property FathersTerminalRREncounterMarker Auto Const

ObjectReference Property SynthShutdownMarker Auto Const

ReferenceAlias Property Alias_SynthZ1MeetUp Auto Const

RefCollectionAlias Property Alias_KlaxonRoboticsCollection Auto Const

RefCollectionAlias Property Alias_KlaxonSRBCollection Auto Const

RefCollectionAlias Property Alias_KlaxonReactorCollection Auto Const

ReferenceAlias Property Alias_MagicDoorToMassFusion01 Auto Const

ReferenceAlias Property Alias_MagicDoorToMassFusion02 Auto Const

ObjectReference Property FathersShutters Auto Const

ReferenceAlias Property Alias_MagicDoorToMassFusion03 Auto Const

ReferenceAlias Property Alias_MagicDoorToMassFusion04 Auto Const

RefCollectionAlias Property Alias_KlaxonBioScienceCollection Auto Const

RefCollectionAlias Property Alias_KlaxonAdvSysCollection Auto Const

ReferenceAlias Property Alias_MadisonLi Auto Const

Quest Property BoS301 Auto Const

LeveledItem Property Z1LeveledWeapon Auto Const

ObjectReference Property FleeingScientistMarker Auto Const

ObjectReference Property InsituteHiggsLokenMarker Auto Const

RefCollectionAlias Property Alias_RelayRoomEncounterCollection Auto Const Mandatory

Quest Property MQ302RR Auto Const

Quest Property MQ302MM Auto Const

ObjectReference Property JustinAyoMarkerRef Auto Const

ObjectReference Property LiamBinetMarkerRef Auto Const

RefCollectionAlias Property Alias_ConcourseEnableMarkerCollection Auto Const Mandatory

ObjectReference Property MQ302ScientistEndMarker Auto Const

ObjectReference Property InstM03SynthGuardHallway1 Auto Const Mandatory

ObjectReference Property InstM03SynthGuardHallway2 Auto Const Mandatory

ObjectReference Property InstM03SynthGuard2Ref Auto Const Mandatory

ObjectReference Property InstM03SynthGuard1Ref Auto Const Mandatory

FollowersScript Property Followers Auto Const
