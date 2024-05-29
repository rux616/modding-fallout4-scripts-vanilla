;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ302Min_0010C64A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
MQ302.MQ302Faction.SetValueInt(2)
MQ302.SetStage(10)
SetObjectiveDisplayed(100)
preston.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
Sturges.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
TunnelDoor.GetReference().Enable()
ExteriorTunnelDoor.Enable()

Preston.GetReference().IgnoreFriendlyHits(true)
Sturges.GetReference().IgnoreFriendlyHits(true)

RooftopSoldier01.GetReference().IgnoreFriendlyHits(true)
RooftopSoldier01.GetActorReference().GetActorBase().SetInvulnerable(true)
RooftopSoldier02.GetReference().IgnoreFriendlyHits(true)
RooftopSoldier02.GetActorReference().GetActorBase().SetInvulnerable(true)

Alias_AttackMinuteman01.GetActorRef().IgnoreFriendlyHits(true)
Alias_AttackMinuteman02.GetActorRef().IgnoreFriendlyHits(true)
Alias_AttackMinuteman03.GetActorRef().IgnoreFriendlyHits(true)

Alias_TeleporterMinuteman01.GetActorRef().IgnoreFriendlyHits(true)
Alias_TeleporterMinuteman02.GetActorRef().IgnoreFriendlyHits(true)
Alias_TeleporterMinuteman03.GetActorRef().IgnoreFriendlyHits(true)

;Soft Kill of BoS Questline if getting this far with MinuteMen
BoSSoftKickOut.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN CODE
; talk to Sturges if haven't yet
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
if GetStageDone(200)
	; talked to Sturges already - ready to attack Institute
	SetStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
; give holotape to open gate
Game.GetPlayer().AddItem(Alias_TeleporterHolotape.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_01
Function Fragment_Stage_0200_Item_01()
;BEGIN CODE
; talk to Preston if haven't yet
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_02
Function Fragment_Stage_0200_Item_02()
;BEGIN CODE
; ready to attack Institute
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveCompleted(200)
SetObjectiveDisplayed(250)

;Enable the water and correct pipe door in Institute
InstituteMMEntranceMarker.enable()

; Preston not allowed as companion during this quest
Preston.GetActorRef().DisallowCompanion(SuppressDismissMessage = true)

;open teleporter room door
InstituteRelayDoorRef.SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
QSTKeypadMQ302Min.Play(Alias_TunnelKeypad.GetRef())
utility.wait(2.0)
;MQ302MinTunnelSecurityGate01Helper.Activate(MQ302MinTunnelSecurityGate01Helper)
MQ302MinTunnelSecurityGate01.SetOpen()
SetObjectiveCompleted(250)
SetObjectiveDisplayed(300)
; shut down MinDefendCastle to make sure it gets shut down
if MinDefendCastle.IsRunning()
	MinDefendCastle.SetStage(500)
endif

;handle DN136_Attack
DN136_Attack.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
DN136_Attack.SetStage(10)

; for package conditions
MQ302.SetStage(350)
; teleport everybody in
Utility.Wait(1.0)
ObjTeleporterInstitutePre.Play(InstituteStartRef)
Utility.Wait(2.5)
preston.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
Sturges.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
Preston.GetReference().Disable()
Sturges.GetReference().Disable()
Preston.GetReference().MoveTo(TeleporterLeaderStartRef)
Preston.GetReference().Enable()
Utility.Wait(0.7)
Sturges.GetReference().MoveTo(TeleporterScientistStartRef)
Sturges.GetReference().Enable()
ObjTeleporterInstitutePre.Play(InstituteStartRef)

SetObjectiveCompleted(300)
SetObjectiveDisplayed(350)
MQ302Min_Relay_Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Actor min01 = Alias_TeleporterMinuteman01.GetActorRef()
Actor min02 = Alias_TeleporterMinuteman02.GetActorRef()
Actor min03 = Alias_TeleporterMinuteman03.GetActorRef()
utility.wait(2.0)
min01.enableNoWait()
utility.wait(1.0)
min02.enableNoWait()
utility.wait(0.5)
min03.enableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
MQ302MinSynthConv01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1360_Item_00
Function Fragment_Stage_1360_Item_00()
;BEGIN CODE
MQ302Min_Preston_InsideInstitute.Start()

Alias_TeleporterMinuteman01.TryToDisable()
Alias_TeleporterMinuteman02.TryToDisable()
Alias_TeleporterMinuteman03.TryToDisable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
;SetObjectiveCompleted(300)
SetObjectiveCompleted(350)
SetObjectiveDisplayed(400) ; reach reactor
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1425_Item_00
Function Fragment_Stage_1425_Item_00()
;BEGIN CODE
MQ302Min_Sturges_ConcourseFight01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1430_Item_00
Function Fragment_Stage_1430_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(400,0)
SetObjectiveDisplayed(430)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1450_Item_00
Function Fragment_Stage_1450_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(450) ; issue evacuation order
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1460_Item_00
Function Fragment_Stage_1460_Item_00()
;BEGIN CODE
MQ302Min_Sturges_PathCleared.Start()
SetObjectiveCompleted(430)
SetObjectiveDisplayed(475)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(475)
SetObjectiveDisplayed(500)
MQ302Min_Preston_PlantCharge.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
if IsObjectiveCompleted(400)==0
SetObjectiveDisplayed(400,0)
endif
MQ302Min_Preston_ChargePlanted.Start()
If IsObjectiveCompleted(450) == 0
SetObjectiveDisplayed(450,0)
endif
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)
; reenable teleporter Minutemen for flavor
Actor min01 = Alias_TeleporterMinuteman01.GetActorRef()
Actor min02 = Alias_TeleporterMinuteman02.GetActorRef()
Actor min03 = Alias_TeleporterMinuteman03.GetActorRef()
min01.enableNoWait()
min02.enableNoWait()
min03.enableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1700_Item_00
Function Fragment_Stage_1700_Item_00()
;BEGIN CODE
Preston.GetReference().Moveto(LeaderRelayMarker)
Preston.GetReference().Enable()
(Preston as TeleportReferenceAlias).TeleportIn()
MQ302Min_Preston_Sturges_Kid.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1710_Item_00
Function Fragment_Stage_1710_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)
SetObjectiveDisplayed(710)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1720_Item_00
Function Fragment_Stage_1720_Item_00()
;BEGIN CODE
SetObjectiveCompleted(710)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1730_Item_00
Function Fragment_Stage_1730_Item_00()
;BEGIN CODE
SetObjectiveCompleted(710)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1740_Item_00
Function Fragment_Stage_1740_Item_00()
;BEGIN CODE
if IsObjectiveCompleted(710) == 0
SetObjectiveDisplayed(710,0)
endif
SetObjectiveCompleted(700)
SetObjectiveDisplayed(740)
; enable rooftop Minutemen
Alias_RooftopSoldier01.TryToEnable()
Alias_RooftopSoldier02.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1800_Item_00
Function Fragment_Stage_1800_Item_00()
;BEGIN CODE
MQ302Min_Preston_DetonateCharge.Start()

SetObjectiveCompleted(740)
SetObjectiveDisplayed(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1900_Item_00
Function Fragment_Stage_1900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)
SetObjectiveDisplayed(900)

;Move Sturges back to the Castle
Sturges.GetReference().Moveto(CastleCenterMarker)

; clear Prestons forcegreet value since he's already here
actor prestonActor = Preston.GetActorRef()
prestonActor.SetValue(FollowerEndgameForceGreetOn, 0)

; Preston allowed as companion again
prestonActor.AllowCompanion(false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1900_Item_01
Function Fragment_Stage_1900_Item_01()
;BEGIN CODE
Actor shaun = Alias_ShaunChild.GetActorRef()
WorkshopParent.AddPermanentActorToWorkshopPUBLIC(shaun, (Alias_CastleWorkshop.GetRef() as WorkshopScript).GetWorkshopID(), false)
shaun.SetOutfit(KidOutfit)
shaun.Moveto(CastleCenterMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1910_Item_00
Function Fragment_Stage_1910_Item_00()
;BEGIN CODE
CompleteAllObjectives()
; failsafe
MQ302.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1950_Item_00
Function Fragment_Stage_1950_Item_00()
;BEGIN CODE
; give player custom laser musket
CustomItemQuest.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
; make sure
setStage(1900)
CompleteAllObjectives()
MQ302.SetStage(1000)
Preston.GetReference().IgnoreFriendlyHits(false)
Sturges.GetReference().IgnoreFriendlyHits(false)

; NOTE: quest is stopped by Sturges reward scene: MQ302Min_Sturges_Final
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MQ302Script Property MQ302 Auto Const

Scene Property MQ302Min_Preston_InsideInstitute Auto Const

Scene Property MQ302Min_Preston_PlantCharge Auto Const

Scene Property MQ302Min_Preston_ChargePlanted Auto Const

Scene Property MQ302Min_Preston_DetonateCharge Auto Const

Scene Property MQ302MinSynthConv01 Auto Const

Holotape Property MQ302MinHolotape Auto Const

ReferenceAlias Property Alias_TunnelSecurityGate01 Auto Const

ReferenceAlias Property Alias_TunnelKeypad Auto Const

sound Property QSTKeypadMQ302Min Auto Const

ObjectReference Property MQ302MinTunnelSecurityGate01Helper Auto Const

ReferenceAlias Property preston Auto Const

ActorValue Property TeleportRefCollOptionalRequired Auto Const

ReferenceAlias Property Sturges Auto Const

ObjectReference Property TeleporterLeaderStartRef Auto Const

ObjectReference Property TeleporterScientistStartRef Auto Const

Scene Property MQ302Min_Relay_Scene Auto Const

Quest Property DN136_Attack Auto Const

ObjectReference Property ChildShaunMarker Auto Const

ReferenceAlias Property ShaunChild Auto Const

ReferenceAlias Property TunnelDoor Auto Const

ObjectReference Property MQ302MinTunnelSecurityGate01 Auto Const

ReferenceAlias Property Alias_TeleporterHolotape Auto Const

Quest Property MinDefendCastle Auto Const

ObjectReference Property ExteriorTunnelDoor Auto Const

ObjectReference Property InstituteMMEntranceMarker Auto Const

GlobalVariable Property MQ302MinPostQuestTimer Auto Const

Quest Property BoSSoftKickOut Auto Const

Scene Property MQ302Min_Sturges_PathCleared Auto Const

Scene Property MQ302Min_Sturges_ConcourseFight01 Auto Const

ReferenceAlias Property Alias_ShaunChild Auto Const

ReferenceAlias Property Alias_CastleWorkshop Auto Const

workshopparentscript Property WorkshopParent Auto Const

ReferenceAlias Property Alias_RooftopSoldier01 Auto Const

ReferenceAlias Property Alias_RooftopSoldier02 Auto Const

Scene Property MinutemenRadioInstituteDestroyed Auto Const

ActorValue Property FollowerEndgameForceGreetOn Auto Const

ObjectReference Property LeaderRelayMarker Auto Const

Scene Property MQ302Min_Preston_Sturges_Kid Auto Const Mandatory

Outfit Property KidOutfit Auto Const

Quest Property CustomItemQuest Auto Const Mandatory

ReferenceAlias Property Alias_TeleporterMinuteman01 Auto Const Mandatory

ReferenceAlias Property Alias_TeleporterMinuteman02 Auto Const Mandatory

ReferenceAlias Property Alias_TeleporterMinuteman03 Auto Const Mandatory

ObjectReference Property InstituteRelayDoorRef Auto Const Mandatory

Sound Property OBJTeleporterInstitutePre Auto Const Mandatory

Sound Property OBJTeleporterInstitutePost Auto Const Mandatory

ObjectReference Property InstituteStartRef Auto Const Mandatory

ObjectReference Property CastleCenterMarker Auto Const Mandatory

ReferenceAlias Property RooftopSoldier01 Auto Const

ReferenceAlias Property RooftopSoldier02 Auto Const

ReferenceAlias Property Alias_AttackMinuteman01 Auto Const Mandatory

ReferenceAlias Property Alias_AttackMinuteman02 Auto Const Mandatory

ReferenceAlias Property Alias_AttackMinuteman03 Auto Const Mandatory
