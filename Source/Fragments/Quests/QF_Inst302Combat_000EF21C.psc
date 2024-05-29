;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Inst302Combat_000EF21C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
alias_vertibirdprime.trytoenable()
Alias_PilotPrime.TryToEnable()
;Alias_Gunner.TryToEnable()
BOS1.TryToEnable()
BOS2.TryToEnable()

Inst302Combat_VertibirdFlightScenePrime.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
(Inst302 as Inst302QuestScript).RailroadInformed = 1

if (Inst302 as Inst302QuestScript).RailroadInformed == 1

;Close and lock the front gate
BunkerHillFrontGate.Lock()
BunkerHillFrontGate.SetLockLevel(255)

;Close and lock Market Gate
BunkerHillMarketGate.Lock()
BunkerHillMarketGate.SetLockLevel(255)

;enable marker that's parent for extra RR guys
RREnableMarker.Enable()

endif

pInst302Stage50CourserTravelScene.Start()
X418.GetActorReference().EvaluatePackage()

;Ryan Scripts
;setstage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
(Inst302 as Inst302QuestScript).BoSInformed = 1

debug.trace("Stage 20 Started")

;Ryan's Addition
CombatTriggerEnableMarker.Enable()
Alias_VertibirdPrime.TryToSetValue(REVertibirdLandAirport, 1)

Alias_VertibirdPrime.TrytoEvaluatePackage()

;BoS1.GetActorReference().SetAlert()
;BoS2.GetActorReference().SetAlert()

;FrontGateScene.Start()
setstage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
debug.trace(self + "Stage 25 has started")

BunkerHillBoSFaction.SetEnemy(BunkerHillRRFaction)

Inst302Stage50CourserTravelScene.stop()
Inst302SynthTeleportScene.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Activate portal
;SynthPortal1.Activate(Game.GetPlayer())

Actor PlayerActor = Game.Getplayer()

Alias_SynthSpawnGroup01.enableall()
BunkerHillInstituteFaction.SetEnemy(BunkerHillBoSFaction)
BunkerHillInstituteFaction.SetEnemy(BunkerHillRRFaction)
BunkerHillInstituteFaction.SetAlly(SynthFaction)
BunkerHillInstituteFaction.setAlly(InstituteFaction)


if (PlayerActor.isinfaction(BrotherhoodofSteelFaction) == FALSE)
	BunkerHillBOSFaction.SetEnemy(PlayerFaction)
endif

if (PlayerActor.isinfaction(RailRoadFaction) == FALSE)
	BunkerHillRRFaction.SetEnemy(PlayerFaction)
endif



X418.GetActorReference().FollowerFollow()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
Alias_Vertibird01.TryToEnable()
if Alias_Vertibird01.TrytoEnable()
	debug.trace(self + " is enabled")
else
	debug.trace(self + "did not enable")
endif

Inst302Combat_VScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN CODE
Alias_Vertibird01.TryToSetValue(REVertibirdLandAirport, 1)
BHExtVScene01.SetValue(1)

Alias_Vertibird01.TryToEvaluatePackage()
Alias_VPA01.TrytoEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0033_Item_00
Function Fragment_Stage_0033_Item_00()
;BEGIN CODE
Alias_Vertibird02.TryToEnable()
if Alias_Vertibird02.TrytoEnable()
	debug.trace(self + " is enabled")
else
	debug.trace(self + "did not enable")
endif

Inst302Combat_VScene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0034_Item_00
Function Fragment_Stage_0034_Item_00()
;BEGIN CODE
Alias_Vertibird02.TryToSetValue(REVertibirdLandAirport, 1)
BHExtVScene02.SetValue(1)

Alias_Vertibird02.TryToEvaluatePackage()
Alias_VPA02.TrytoEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
BunkerHillFrontGate.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pInst302Stage50CourserTravelScene Auto Const

Quest Property Inst302 Auto Const

;ObjectReference Property BoSDropMarker1 Auto Const

;ObjectReference Property BoSDropMarker2 Auto Const

;ObjectReference Property BoSDropMarker3 Auto Const

ActorBase Property LvlBoSSoldierPowerArmor Auto Const

ReferenceAlias Property BoS1 Auto Const

ReferenceAlias Property BoS2 Auto Const

ReferenceAlias Property BoS3 Auto Const

ReferenceAlias Property Alias_BHIntEnableMarker Auto Const

Keyword Property LinkCustom01 Auto Const

Faction Property BunkerHillBoSFaction Auto Const

Faction Property BunkerHillRRFaction Auto Const

Faction Property BunkerHillInstituteFaction Auto Const

ObjectReference Property SynthPortal1 Auto Const

Scene Property Inst302SynthTeleportScene Auto Const

;ObjectReference Property BoSPowerArmor1 Auto Const

;ObjectReference Property BoSPowerArmor2 Auto Const

;ObjectReference Property Inst302CombatBoS1CollisionMarker Auto Const

;ObjectReference Property Inst302CombatBoS2CollisionMarker Auto Const

ObjectReference Property BunkerHillFrontGate Auto Const

ObjectReference Property RREnableMarker Auto Const

ReferenceAlias Property X418 Auto Const

Scene Property FrontGateScene Auto Const
ObjectReference Property CombatTriggerEnableMarker Auto Const

ObjectReference Property BunkerHillMarketGate Auto Const

RefCollectionAlias Property Alias_SynthSpawnGroup01 Auto Const

Scene Property Inst302Combat_VertibirdFlightScenePrime Auto Const

ReferenceAlias Property Alias_PilotPrime Auto Const

ReferenceAlias Property Alias_VertibirdPrime Auto Const

ActorValue Property REVertibirdLandAirport Auto Const

ReferenceAlias Property Alias_Vertibird01 Auto Const

GlobalVariable Property BHExtVScene01 Auto Const

GlobalVariable Property BHExtVScene02 Auto Const

ReferenceAlias Property Alias_VPA01 Auto Const

ReferenceAlias Property Alias_Pilot01 Auto Const

Scene Property Inst302Combat_VScene01 Auto Const

ReferenceAlias Property Alias_Vertibird02 Auto Const

ReferenceAlias Property Alias_Pilot02 Auto Const

ReferenceAlias Property Alias_VPA02 Auto Const

Scene Property Inst302Combat_VScene02 Auto Const

Faction Property PlayerFaction Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

Scene Property Inst302Stage50CourserTravelScene Auto Const

Faction Property RailroadFaction Auto Const

Faction Property SynthFaction Auto Const

Faction Property InstituteFaction Auto Const
