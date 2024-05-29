;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DNPrime_BoS304_00176E24 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Move Respawn Markers
Alias_BoSRespawnMarker01.getReference().moveTo(Alias_BoSRespawnMarker01.getReference().getNthLinkedRef(1))
Alias_BoSRespawnMarker02.getReference().moveTo(Alias_BoSRespawnMarker02.getReference().getNthLinkedRef(1))
Alias_BoSRespawnMarker03.getReference().moveTo(Alias_BoSRespawnMarker03.getReference().getNthLinkedRef(1))
Alias_BoSRespawnMarkerFailsafe.getReference().moveTo(Alias_BoSRespawnMarkerFailsafe.getReference().getNthLinkedRef(1))

;cleanup any REs already loaded
(REParent as reparentscript).SendCleanupEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Actor Prime =  Alias_Prime.getActorRef()
Prime.evaluatePackage()
Prime.IgnoreFriendlyHits()

;disable all path blockers and encounters
DNPrime_Triggers.enableNoWait()
DNPrime_BunkerHill.disableNoWait()
DNPrime_Path.disableNoWait()
DNPrime_Encounters.disableNoWait()
DNPrime_CITNearbyEncounters.disableNoWait()
Waterfront_LongWharfMarker.disableNoWait()
CrashedVertibird.enableNoWait()
DN131_CommonsRETrigger.disableNoWait()

;Disable the radios at Easy City Downs to prevent interference
DN035_EasyCityRadioOverrides.Start() 

;enable behemoth
Alias_Behemoth.getActorRef().enableNoWait()

;Handle BoSMarshal
BoSMarshal.SetStage(40)

;store actors
Actor Gavil = Alias_BoSGavil.getActorRef()
Actor Clarke = Alias_BoSClarke.getActorRef()
Actor Lucia = Alias_BoSLucia.getActorRef()

;set actors to ignore friendly hits
Gavil.IgnoreFriendlyHits()
Clarke.IgnoreFriendlyHits()
Lucia.IgnoreFriendlyHits()

;Move BoSMarshal Soldiers
Gavil.MoveTo(BoS01StartMarker)
Clarke.MoveTo(BoS02StartMarker)
Lucia.MoveTo(BoS03StartMarker)

Gavil.enableNoWait()
Clarke.enableNoWait()
Lucia.enableNoWait()

;clear already loaded REs
(REParent as reparentscript).SendCleanupEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
DNPrime_ChatterScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;set when one of the BoS Gavil dies

;store actor
Actor BoS01 = Alias_BoS01.getActorRef()

;move and enable generic BoS
BoS01.MoveTo(Alias_BoSRespawnMarkerFailsafe.getReference())

BoS01.enableNoWait()
BoS01.IgnoreFriendlyHits()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
;set when one of the BoS Clarke dies

;store actor
Actor BoS02 = Alias_BoS02.getActorRef()

;move and enable generic BoS
BoS02.MoveTo(Alias_BoSRespawnMarkerFailsafe.getReference())

BoS02.enableNoWait()
BoS02.IgnoreFriendlyHits()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
;set when one of the BoS Lucia dies

;store actor
Actor BoS03 = Alias_BoS03.getActorRef()

;move and enable generic BoS
BoS03.MoveTo(Alias_BoSRespawnMarkerFailsafe.getReference())

BoS03.enableNoWait()
BoS03.IgnoreFriendlyHits()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
;Stop idle chatter scene
DNPrime_ChatterScene.Stop()
;enable synths
Alias_TPBridge01a.enableAll()
utility.Wait(1.0)
Alias_TPBridge01b.enableAll()
utility.Wait(1.5)
Alias_TPBridge01c.enableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Alias_TPBridge02a.enableAll()
utility.Wait(1.0)
Alias_TPBridge02b.enableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
DNPrime_BridgeNavCutREF.enableNoWait()
Alias_TPBridge03a.enableAll()
utility.Wait(1.0)
Alias_TPBridge03b.enableAll()
utility.Wait(2.0)
setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Bridge explodes
ObjectReference BridgeActivator = Alias_BridgeActivator.getReference()

Alias_Prime.getActorRef().evaluatePackage()
BridgeActivator.activate(BridgeActivator, 1)
utility.wait(2.0)
BridgeActivator.activate(BridgeActivator, 1)
utility.wait(1.0)
BridgeActivator.placeAtMe(BridgeExplosionBig)
BridgeActivator.disableNoWait()
utility.wait(2.0)
setStage(125)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
;Move Vertibird to other side of River
Alias_Vertibird01.getActorReference().EvaluatePackage()

;Prime Starts Scanning Bridge (set by stage 100)
DNPrime_BoS304_PrimeScanBridge.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
Alias_Prime.getActorRef().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
DNPrime_ChatterScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Stop idle chatter scene
DNPrime_ChatterScene.Stop()
Alias_Prime.getActorRef().evaluatePackage()
Alias_Vertibird01.getActorRef().evaluatePackage()
;Spawn Synths
;enable StepUp Synths Group 1
Alias_TPStepUp01.enableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
Alias_Prime.getActorRef().evaluatePackage()
;Spawn Synths
;enable StepUp Synths Group 2 and 3
Alias_TPStepUp02.enableAll()
Utility.Wait(2.0)
Alias_TPStepUp03.enableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
DNPrime_ChatterScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
;Stop Idle Chatter
DNPrime_ChatterScene.Stop()

;Prime passes by Bunker Hill
DNPrime_BoS304_PrimeBunkerHill.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0327_Item_00
Function Fragment_Stage_0327_Item_00()
;BEGIN CODE
DNPrime_ChatterScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
;Stop Idle Chatter
DNPrime_ChatterScene.Stop()

;Spawn Synths Near Bunker Hill
;enable Bunker Hill Synths Group 1, 2, and 3
Alias_TPSBunkerHill01.enableAll()
Utility.Wait(0.5)
Alias_TPSBunkerHill02.enableAll()
Utility.Wait(1.5)
Alias_TPSBunkerHill03.enableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0332_Item_00
Function Fragment_Stage_0332_Item_00()
;BEGIN CODE
;Bunker Hill Group 1 Synths dead
if (getStageDone(333) == 1 && getStageDone(334) == 1)
    if(getStageDone(335) == 0)
         setstage(335)
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0333_Item_00
Function Fragment_Stage_0333_Item_00()
;BEGIN CODE
;Bunker Hills Group 2 Synths Dead
if (getStageDone(332) == 1 && getStageDone(334) == 1)
    if(getStageDone(335) == 0)
         setstage(335)
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0334_Item_00
Function Fragment_Stage_0334_Item_00()
;BEGIN CODE
;Bunker Hills Group 3 Synths Dead
if (getStageDone(332) == 1 && getStageDone(333) == 1)
    if(getStageDone(335) == 0)
         setstage(335)
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0335_Item_00
Function Fragment_Stage_0335_Item_00()
;BEGIN CODE
;Bunker Hills Synths Dead (set by either 332, 333, or 334)
;Start Idle Chatter
DNPrime_ChatterScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
;Prime nears Super Mutants
DNPrime_BoS304_Behemoth01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
;Stop Idle Chatter
DNPrime_ChatterScene.Stop()

;spawn Behemoth at one of two locations based on where player is
Actor Behemoth = Alias_Behemoth02.GetActorRef()
if (BehemothGlobal.getValue() == 0)
    ;player is not near first spawn
    Behemoth.moveto(BehemothSpawnMarker01)
else
    ;player is near the first spawn
    Behemoth.moveto(BehemothSpawnMarker02)
endif

Behemoth.enable()
Utility.Wait(1.0)
DNPrime_BoS304_PrimeBehemoth.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
;Prime plays idle with Behemoth
Alias_Prime.getActorRef().PlayIdleWithTarget(PairedLibertyPrimeBehemothGrabCrush, Alias_Behemoth02.getActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
DNPrime_ChatterScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
DNPrime_ChatterScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Player is not near enough to battle, set ghosting of actors ghosting gets reset on stage 410)
;Get Prime to CIT - evaluate package to no combat version
Alias_Prime.getActorRef().evaluatePackage()

;Store Actors
Actor Maxson = Alias_Maxson.getActorRef()
Actor Ingram = Alias_Ingram.getActorRef()
Actor BoS01G = Alias_BoS01G.getActorRef()
Actor BoS02G = Alias_BoS02G.getActorRef()
Actor BoS03G = Alias_BoS03G.getActorRef()

;Set Actors Protected
if(getStageDone(410) == FALSE)
  Maxson.SetGhost(TRUE)
  Ingram.SetGhost(TRUE)
  BoS01G.SetGhost(TRUE)
  BoS02G.SetGhost(TRUE)
  BoS03G.SetGhost(TRUE)
endif
;Move BoS leader and scientist and enable them
Maxson.moveto(BoSLeaderEndStartMarker)
Ingram.moveto(BoSScientistEndStartMarker)
Maxson.enableNoWait()
Ingram.enableNoWait()
Maxson.IgnoreFriendlyHits()
Ingram.IgnoreFriendlyHits()

;Enable BoS Soldiers at Courtyard
BoS01G.enableNoWait()
BoS02G.enableNoWait()
BoS03G.enableNoWait()
BoS01G.IgnoreFriendlyHits()
BoS02G.IgnoreFriendlyHits()
BoS03G.IgnoreFriendlyHits()

;Set all Stage 1 Synths to protected and enable them
if(getStageDone(410) == FALSE)
  int i = 0
  While (i < Alias_SynthStage1Collection.GetCount())
        (Alias_SynthStage1Collection.GetAt(i) as Actor).SetGhost(TRUE)
        i = i + 1
  EndWhile
endif
Alias_SynthStage1Collection.enableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
if(getStageDone(400) == FALSE)
    setStage(400)
endif
;Move Prime if he's not close enough
if(getStageDone(399) == FALSE)
    Alias_Prime.getActorRef().MoveTo(PrimeMoveToMarkerEnd)
endif

;Player is near to the battle, revert ghosting on actors
Alias_Maxson.getActorRef().SetGhost(FALSE)
Alias_Ingram.getActorRef().SetGhost(FALSE)
Alias_BoS01G.getActorRef().SetGhost(FALSE)
Alias_BoS02G.getActorRef().SetGhost(FALSE)
Alias_BoS03G.getActorRef().SetGhost(FALSE)

;Handle Stage 1 Synths
int i = 0
While (i < Alias_SynthStage1Collection.GetCount())
      (Alias_SynthStage1Collection.GetAt(i) as Actor).SetGhost(FALSE)
      i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN CODE
;First wave dead, start Prime scanning
setStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Stop Idle Chatter
DNPrime_ChatterScene.Stop()

;Set by stage 425
BoS304.SetStage(60)
DNPrime_BoS304_PrimeScanAndPunch.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0505_Item_00
Function Fragment_Stage_0505_Item_00()
;BEGIN CODE
;set by stage Prime Scan Scene
Utility.Wait(10.0)

;enable CIT Synths Group 1
Alias_TPCourtyard01.enableAll()
Utility.Wait(5.0)
;enable CIT Synths Group 2
Alias_TPCourtyard02.enableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
;stage set by CIT Synths Group 1 dying off
;enable CIT Synths Group 3
Alias_TPCourtyard03.enableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
;stage set by CIT Synths Group 2 dying off
;enable CIT Synths Group 4
Alias_TPCourtyard04.enableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
;stage set by CIT Synths Group 3 dying off
;enable CIT Synths Group 5
Alias_TPCourtyard05.enableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
;Prime warns to stand back
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0565_Item_00
Function Fragment_Stage_0565_Item_00()
;BEGIN CODE
;stage set by BoS304_PrimeAliasScript on Prime in BoS304
PrimeBeamDamageTrigger.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0567_Item_00
Function Fragment_Stage_0567_Item_00()
;BEGIN CODE
;stage set by BoS304_PrimeAliasScript on Prime in BoS304
PrimeBeamDamageTrigger.disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;enable hole debris inside
PrimeHoleInsideEnableMarker.enableNoWait()
PrimeBeamDamageTrigger.disableNoWait()
CITExteriorDoor.enable()
CITHoleCut.enableNoWait()


;set stage on BoS304 to enter Institute
BoS304.SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
Alias_Prime.getActorRef().EvaluatePackage()

DNPrime_BoS304_PrimeBustsHole.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
DNPrime_ChatterScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Stop Idle Chatter
DNPrime_ChatterScene.Stop()
;Cleanup Outside (set by BoS304 255)
Actor Prime = Alias_Prime.getActorRef()
;move Prime back to airport
Prime.MoveTo(PostMQPrimeMarker)

;Set Prime back to vulnerable
;Prime.getActorBase().setInvulnerable(FALSE)

;enable all path blockers and encounters
DNPrime_Triggers.disableNoWait()
DNPrime_BunkerHill.enableNoWait()
DNPrime_Path.enableNoWait()
DNPrime_Encounters.enableNoWait()
DNPrime_CITNearbyEncounters.enableNoWait()
Waterfront_LongWharfMarker.enableNoWait()
(DN131_CommonsRETrigger as DN131_RETriggerManagerScript).EnableIfReady()

;cleanup
Alias_SynthStage1Collection.disableAll()
Alias_TPCourtyard01.disableAll()
Alias_TPCourtyard02.disableAll()
Alias_TPCourtyard03.disableAll()
Alias_TPCourtyard04.disableAll()
Alias_TPBridge01a.disableAll()
Alias_TPBridge01b.disableAll()
Alias_TPBridge01c.disableAll()
Alias_BoSGavil.getActorRef().disableNoWait()
Alias_BoSClarke.getActorRef().disableNoWait()
Alias_BoSLucia.getActorRef().disableNoWait()
Alias_BoS01.getActorRef().disableNoWait()
Alias_BoS02.getActorRef().disableNoWait()
Alias_BoS03.getActorRef().disableNoWait()
Alias_BoS01G.getActorRef().disableNoWait()
Alias_BoS02G.getActorRef().disableNoWait()
Alias_BoS03G.getActorRef().disableNoWait()
CITExteriorDoor.disableNoWait()
Alias_Vertibird01.getActorRef().disableNoWait()
BoS304VB.setStage(255)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DNPrime_BunkerHill Auto Const

ObjectReference Property DNPrime_Path Auto Const

ReferenceAlias Property Alias_BridgeActivator Auto Const

Explosion Property BridgeExplosionBig Auto Const

ReferenceAlias Property Alias_Prime Auto Const

Scene Property DNPrime_BoS304_PrimeScanAndPunch Auto Const

Scene Property DNPrime_BoS304_PrimeScanBridge Auto Const

ObjectReference Property DNPrime_Encounters Auto Const

RefCollectionAlias Property Alias_TeleportActors Auto Const

RefCollectionAlias Property Alias_TPCourtyard01 Auto Const

RefCollectionAlias Property Alias_TPBridge01a Auto Const

RefCollectionAlias Property Alias_TPBridge01b Auto Const

RefCollectionAlias Property Alias_TPBridge01c Auto Const

RefCollectionAlias Property Alias_TPBridge02a Auto Const

RefCollectionAlias Property Alias_TPBridge02b Auto Const

ObjectReference Property DNPrime_BridgeNavCutREF Auto Const

RefCollectionAlias Property Alias_TPBridge03a Auto Const

RefCollectionAlias Property Alias_TPBridge03b Auto Const

ObjectReference Property PrimeHoleInsideEnableMarker Auto Const

ObjectReference Property DNPrime_GrassMarker Auto Const

Quest Property BoS304 Auto Const

ObjectReference Property BoS01EndStartMarker Auto Const

ObjectReference Property BoS02EndStartMarker Auto Const

ObjectReference Property BoS03EndStartMarker Auto Const

ObjectReference Property BoSLeaderEndStartMarker Auto Const

ObjectReference Property BoS01ScientistStartMarker Auto Const

ReferenceAlias Property Alias_Maxson Auto Const

ReferenceAlias Property Alias_Ingram Auto Const

ReferenceAlias Property Alias_BoS01 Auto Const

ReferenceAlias Property Alias_BoS02 Auto Const

ReferenceAlias Property Alias_BoS03 Auto Const

ObjectReference Property BoSScientistEndStartMarker Auto Const

ObjectReference Property DNPrime_Stage1Synths Auto Const

ReferenceAlias Property Alias_BoSRespawnMarker01 Auto Const

ReferenceAlias Property Alias_BoSRespawnMarker02 Auto Const

ReferenceAlias Property Alias_BoSRespawnMarker03 Auto Const

ReferenceAlias Property Alias_BoSRespawnMarkerFailsafe Auto Const

ObjectReference Property BoS01StartMarker Auto Const

ObjectReference Property BoS02StartMarker Auto Const

ObjectReference Property BoS03StartMarker Auto Const

ObjectReference Property BoSPrimeEnableMarker Auto Const

RefCollectionAlias Property Alias_TPCourtyard02 Auto Const

RefCollectionAlias Property Alias_TPCourtyard03 Auto Const

RefCollectionAlias Property Alias_TPCourtyard04 Auto Const

ReferenceAlias Property Alias_BoS01G Auto Const

ReferenceAlias Property Alias_BoS02G Auto Const

ReferenceAlias Property Alias_BoS03G Auto Const

RefCollectionAlias Property Alias_SynthStage1Collection Auto Const

RefCollectionAlias Property Alias_TPCourtyard05 Auto Const

GlobalVariable Property DNPrime_CombatPlayerGlobal Auto Const

ObjectReference Property PostMQPrimeMarker Auto Const

ObjectReference Property DNPrime_CITNearbyEncounters Auto Const

RefCollectionAlias Property Alias_TPStepUp01 Auto Const

RefCollectionAlias Property Alias_TPStepUp02 Auto Const

RefCollectionAlias Property Alias_TPStepUp03 Auto Const

ReferenceAlias Property Alias_Vertibird01 Auto Const

ReferenceAlias Property Alias_Behemoth Auto Const

Idle Property PairedLibertyPrimeBehemothGrabCrush Auto Const

ObjectReference Property DNPrime_Triggers Auto Const

Scene Property DNPrime_BoS304_PrimeBunkerHill Auto Const

Scene Property DNPrime_BoS304_PrimeBustsHole Auto Const

RefCollectionAlias Property Alias_TPSBunkerHill01 Auto Const

RefCollectionAlias Property Alias_TPSBunkerHill02 Auto Const

RefCollectionAlias Property Alias_TPSBunkerHill03 Auto Const

Scene Property DNPrime_BoS304_PrimeBehemoth Auto Const

ObjectReference Property CrashedVertibird Auto Const

ReferenceAlias Property Alias_Behemoth02 Auto Const

GlobalVariable Property BehemothGlobal Auto Const

ObjectReference Property BehemothSpawnMarker01 Auto Const

ObjectReference Property BehemothSpawnMarker02 Auto Const

Quest Property BoSMarshal Auto Const

ReferenceAlias Property Alias_BoSGavil Auto Const

ReferenceAlias Property Alias_BoSClarke Auto Const

ReferenceAlias Property Alias_BoSLucia Auto Const

ObjectReference Property Waterfront_LongWharfMarker Auto Const

ObjectReference Property CITExteriorDoor Auto Const

ObjectReference Property CITHoleCut Auto Const

Quest Property BoS304VB Auto Const

Scene Property DNPrime_ChatterScene Auto Const

Scene Property DNPrime_BoS304_Behemoth01 Auto Const

Quest Property DN035_EasyCityRadioOverrides Auto Const

ObjectReference Property PrimeBeamDamageTrigger Auto Const

MusicType Property PrimeComeToLifeCue Auto Const

ObjectReference Property PrimeMoveToMarkerEnd Auto Const

ObjectReference Property DN131_CommonsRETrigger Auto Const

Quest Property REParent Auto Const
