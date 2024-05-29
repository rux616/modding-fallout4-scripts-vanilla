;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoS304_00173ED9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
BoSEnable.SetStage(20)
BoSEnable.SetStage(30)
BoSEnable.SetStage(40)
Utility.Wait(2)
BoSDoors.Enable()
BoSDialoguePrydwen.SetStage(30)
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
BoS101.SetStage(555)
BoS200.SetStage(255)
BoS201.SetStage(150)
BoS201.SetStage(255)
BoS201B.SetStage(255)
BoS202.SetStage(255)
BoS202.SetStage(300)
BoS202LinkMQ.SetStage(255)
BoS203.SetStage(255)
BoS204.SetStage(255)
BoS301.SetStage(255)
BoS302.SetStage(255)
BoS302B.SetStage(255)
BoS303.SetStage(255)
BoSAirport_Gate_EnableMarker.Disable()
BoS304GateOpen.Enable()
BoSAirport_GateVehicles_EnableMarker.Disable()

;Debug LibertyPrime Switch - Usually done in BoS302 Stage 20
Alias_BoS304LibertyPrime.getActorReference().setrestrained(false)
Alias_BoS304LibertyPrime.getActorReference().disable()
Utility.Wait(1.0)
PrimeStatic.enable()
BoSLibertyPrimeStaticREFlights.Enable()

Alias_BoS304ProctorIngram.GetActorRef().MoveTo(BoS304IngramFinalMarker)
Game.GetPlayer().AddToFaction(BrotherhoodofSteelFaction)
Game.GetPlayer().MoveTo(BoS304Start)
SetStage(10)
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
BoSEnable.SetStage(20)
BoSEnable.SetStage(30)
BoSEnable.SetStage(40)
Utility.Wait(2)
BoSDoors.Enable()
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
BoS101.SetStage(555)
BoS200.SetStage(255)
BoS201.SetStage(150)
BoS201.SetStage(255)
BoS201B.SetStage(255)
BoS202.SetStage(255)
BoS202.SetStage(300)
BoS202LinkMQ.SetStage(255)
BoS203.SetStage(255)
BoS204.SetStage(255)
BoS301.SetStage(255)
BoS302.SetStage(255)
BoS302B.SetStage(255)
BoS303.SetStage(255)
BoSAirport_Gate_EnableMarker.Disable()
BoS304GateOpen.Enable()
BoSAirport_GateVehicles_EnableMarker.Disable()

;Debug LibertyPrime Switch - Usually done in BoS302 Stage 20
Alias_BoS304LibertyPrime.getActorReference().setrestrained(false)
Alias_BoS304LibertyPrime.getActorReference().disable()
Utility.Wait(1.0)
PrimeStatic.enable()
BoSLibertyPrimeStaticREFlights.Enable()

Alias_BoS304ProctorIngram.GetActorRef().MoveTo(BoS304IngramFinalMarker)
Game.GetPlayer().AddToFaction(BrotherhoodofSteelFaction)
Game.GetPlayer().MoveTo(BoS304QuickStart)
SetStage(10)
SetStage(20)
SetStage(25)
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)
BoSEnable.SetStage(20)
BoSEnable.SetStage(30)
BoSEnable.SetStage(40)
Utility.Wait(2)
BoSDoors.Enable()
BoS100Fight.SetStage(1)
BoS100.SetStage(255)
BoS101.SetStage(555)
BoS200.SetStage(255)
BoS201.SetStage(150)
BoS201.SetStage(255)
BoS201B.SetStage(255)
BoS202.SetStage(255)
BoS202.SetStage(300)
BoS202LinkMQ.SetStage(255)
BoS203.SetStage(255)
BoS204.SetStage(255)
BoS301.SetStage(255)
BoS302.SetStage(255)
BoS302B.SetStage(255)
BoS303.SetStage(255)
BoSAirport_Gate_EnableMarker.Disable()
BoS304GateOpen.Enable()
BoSAirport_GateVehicles_EnableMarker.Disable()
Alias_BoS304ProctorIngram.GetActorRef().MoveTo(BoS304IngramFinalMarker)
Game.GetPlayer().AddToFaction(BrotherhoodofSteelFaction)
SetStage(10)
SetStage(20)
SetStage(25)
SetStage(30)
SetStage(40)
SetStage(45)
SetStage(50)
SetStage(55)
Alias_BoS304LibertyPrime.getActorRef().moveto(game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
BoS304VB.SetStage(10)


;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_BoS304LibertyPrimeUnleashedAV)

SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(20,1)
if BoS304VB.GetStageDone(10) == 0
BoS304VB.SetStage(10)
endif
InstituteDoor.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
BoS304VB.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
BoSHatch.SetOpen(true)
LibertyPrimeAgitatorInsertFurnitureRef.Enable()
if BoS303Ending.GetValue() == 1
Game.GetPlayer().AddItem(Alias_BoS304BerylliumAgitator.GetRef())
endif

;Start crowd scene
BoS304_01a_CrowdStage030.Start()

;Get crowd moving to their spots
Alias_AirportGuard01.GetActorRef().EvaluatePackage()
Alias_AirportGuard02.GetActorRef().EvaluatePackage()
Alias_AirportGuard03.GetActorRef().EvaluatePackage()
Alias_AirportGuard04.GetActorRef().EvaluatePackage()
Alias_AirportGuard05.GetActorRef().EvaluatePackage()
Alias_AirportGuard06.GetActorRef().EvaluatePackage()
Alias_AirportGuard07.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
DNPrime_BoS304.setStage(10)
Game.GetPlayer().RemoveItem(Alias_BoS304BerylliumAgitator.GetRef())
LibertyPrimeAgitatorInsertFurnitureRef.BlockActivation()
Utility.Wait(7)
BoSHatch.SetOpen(false)
;Play Gantry Anim FX
Alias_PrimeGantry.GetReference().PlayAnimation("ready")
;This is where we hook in Liberty Prime's Startup
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
;This disables the static Prime and enables the Prime Actor
Alias_BoS304LibertyPrime.getActorReference().enable()
Utility.Wait(1.0)
PrimeStatic.disable()
BoSHatch.Disable()
BoSLibertyPrimeStaticRefLights.Disable()
Inst307PrimeRefHackingLightRef.Disable()
Alias_BoS304LibertyPrime.getActorReference().getActorBase().setInvulnerable(TRUE)
;Disable the 'Insert Agitator' furniture.
LibertyPrimeAgitatorInsertFurnitureRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;stage set by the button at the airport
;play music cue for Prime exiting
PrimeExitGantryMusic.Add()

SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)
BoS304VB.SetStage(30)
BoS304_02_PrimeStage040.Start()

;Enable Danse's Kick Trigger
BoS304DanseKickTriggerRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
DNPrime_BoS304.setStage(15)

;Essentialize leftover BoS NPCs
MadisonLi.SetEssential(true)
ProfessorScara.SetEssential(true)
PAM.SetEssential(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0057_Item_00
Function Fragment_Stage_0057_Item_00()
;BEGIN CODE
Utility.Wait(1.0)
Alias_AirportGuard03.GetActorRef().PlayIdle(BoSSalute)
Alias_AirportGuard04.GetActorRef().PlayIdle(BoSSalute)
Alias_AirportGuard05.GetActorRef().PlayIdle(BoSSalute)
Alias_AirportGuard06.GetActorRef().PlayIdle(BoSSalute)
Alias_AirportGuard07.GetActorRef().PlayIdle(BoSSalute)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0058_Item_00
Function Fragment_Stage_0058_Item_00()
;BEGIN CODE
Alias_AirportGuard01.GetActorRef().PlayIdle(BoSSalute)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(60,1)

;If Prime somehow avoided his trigger to disperse the crowd, do it now
self.SetStage(59)

;Turn off Prydwen Cables and Scribes
BoSPrydwenCable.Disable()
BoSPScribe02.GetActorRef().Disable()
BoSPScribe03.GetActorRef().Disable()
BoSPScribe04.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0061_Item_00
Function Fragment_Stage_0061_Item_00()
;BEGIN CODE
;Get crowd moving to their spots
Alias_AirportGuard01.GetActorRef().EvaluatePackage()
Alias_AirportGuard02.GetActorRef().EvaluatePackage()
Alias_AirportGuard03.GetActorRef().EvaluatePackage()
Alias_AirportGuard04.GetActorRef().EvaluatePackage()
Alias_AirportGuard05.GetActorRef().EvaluatePackage()
Alias_AirportGuard06.GetActorRef().EvaluatePackage()
Alias_AirportGuard07.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;this stage gets set by DNPrime_BoS304 quest at stage 600
SetObjectiveCompleted(60,1)
SetObjectiveDisplayed(70,1)
MQ302Faction.setValue(1)
MQ302.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;This stage gets set by a trigger in the Institute after the player loads in from jumping in the hole
SetObjectiveCompleted(70,1)
Game.AddAchievement(18)
;Update Global for Radio News
RadioDCBoS304Ready.SetValue((GameDaysPassed.GetValue() + 1))
MQ302.SetStage(300)
DNPrime_BoS304.setstage(1000)
InstKickOut.SetStage(200)

;Make sure the 'Insert Agitator' furniture was disabled.
LibertyPrimeAgitatorInsertFurnitureRef.Disable()

;Remove Essential on leftover NPCs
MadisonLi.SetEssential(false)
MadisonLi.SetProtected(true)
ProfessorScara.SetEssential(false)
ProfessorScara.SetProtected(true)
PAM.SetEssential(false)
PAM.SetProtected(true)

;Disable Danse's KickTrigger
BoS304DanseKickTriggerRef.Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
;Make sure the 'Insert Agitator' furniture was disabled.
LibertyPrimeAgitatorInsertFurnitureRef.Disable()

;If Prime somehow avoided his trigger to disperse the crowd, do it now
self.SetStage(59)

FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BoS100Fight Auto Const

Quest Property BoS100 Auto Const

Quest Property BoS101 Auto Const

Quest Property BoS200 Auto Const

Quest Property BoSPoliceStation Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

ObjectReference Property BoS304IngramFinalMarker Auto Const

ReferenceAlias Property Alias_BoS304ProctorIngram Auto Const

ObjectReference Property BoS304Start Auto Const

GlobalVariable Property BoS303Ending Auto Const

ReferenceAlias Property Alias_BoS304BerylliumAgitator Auto Const

ObjectReference Property BoSPrimeEnabler Auto Const

ObjectReference Property BoS304QuickStart Auto Const

GlobalVariable Property RadioDCBoS304Ready Auto Const

GlobalVariable Property GameDaysPassed Auto Const

Quest Property DNPrime_BoS304 Auto Const

ObjectReference Property BoSAirport_GateVehicles_EnableMarker Auto Const

ObjectReference Property BoSHatch Auto Const

ObjectReference Property BoSAirport_Gate_EnableMarker Auto Const

Quest Property BoS304VB Auto Const

Scene Property BoS304_02_PrimeStage040 Auto Const

ReferenceAlias Property Alias_BoS304LibertyPrime Auto Const

ObjectReference Property PrimeStatic Auto Const

Quest Property BoSEnable Auto Const

GlobalVariable Property MQ302Faction Auto Const

Quest Property MQ302 Auto Const

Quest Property DN136_Attack Auto Const

ReferenceAlias Property InstituteDoor Auto Const

Quest Property BoSDialoguePrydwen Auto Const

ObjectReference Property BoSDoors Auto Const

GlobalVariable Property XPFactionFinal Auto Const

ReferenceAlias Property Alias_AirportGuard01 Auto Const

Idle Property BoSSalute Auto Const

Scene Property BoS304_01a_CrowdStage030 Auto Const

ReferenceAlias Property Alias_AirportGuard02 Auto Const

ReferenceAlias Property Alias_AirportGuard03 Auto Const

ReferenceAlias Property Alias_AirportGuard04 Auto Const

ReferenceAlias Property Alias_AirportGuard05 Auto Const

ReferenceAlias Property Alias_AirportGuard06 Auto Const

ReferenceAlias Property Alias_AirportGuard07 Auto Const

ObjectReference Property LibertyPrimeAgitatorInsertFurnitureRef Auto Const

ObjectReference Property BoS304GateOpen Auto Const

Quest Property BoS202LinkMQ Auto Const

Quest Property BoS303 Auto Const

Quest Property BoS302 Auto Const

Quest Property BoS302B Auto Const

Quest Property BoS201 Auto Const

Quest Property BoS202 Auto Const

Quest Property BoS203 Auto Const

Quest Property BoS204 Auto Const

Quest Property BoS301 Auto Const

Quest Property BoS201B Auto Const

ObjectReference Property BoSLibertyPrimeStaticREFlights Auto Const

ObjectReference Property inst307PrimeRefHackingLightRef Auto Const

ReferenceAlias Property Alias_PrimeGantry Auto Const

MusicType Property PrimeExitGantryMusic Auto Const

ObjectReference Property BoSPrydwenCable Auto Const

ReferenceAlias Property BoSPScribe02 Auto Const

ReferenceAlias Property BoSPScribe03 Auto Const

ReferenceAlias Property BoSPScribe04 Auto Const

ActorValue Property COMQC_BoS304LibertyPrimeUnleashedAV Auto Const

ObjectReference Property DNPrime_EnableMarkerEncounters01 Auto Const

GlobalVariable Property BoSLPLightsOnForever Auto Const

Quest Property InstKickOut Auto Const

ActorBase Property PAM Auto Const

ActorBase Property ProfessorScara Auto Const

ActorBase Property MadisonLi Auto Const

ObjectReference Property BoS304DanseKickTriggerRef Auto Const
