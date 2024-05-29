;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ302BoS_0010C64B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Leader.ForceRefTo(Maxson.GetRef())
Maxson.GetReference().SetValue(TeleportRefCollOptionalRequired, 0)
Maxson.GetReference().IgnoreFriendlyHits(true)
Ingram.GetReference().IgnoreFriendlyHits(true)
RooftopSoldier1.GetReference().IgnoreFriendlyHits(true)
RooftopSoldier1.GetActorReference().GetActorBase().SetInvulnerable(true)
RooftopSoldier2.GetReference().IgnoreFriendlyHits(true)
RooftopSoldier2.GetActorReference().GetActorBase().SetInvulnerable(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(300)
DN136_Attack.setstage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
MQ302BOS_Maxson_OldRobotics.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0357_Item_00
Function Fragment_Stage_0357_Item_00()
;BEGIN CODE
MQ302BoS_Ingram_PAHacked.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
MQ302BOS_Maxson_BioScience.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN CODE
MQ302BoS_Ingram_ConcourseFight01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(400,0)
SetObjectiveDisplayed(430)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
MQ302BoS_Ingram_PathCleared.Start()
SetObjectiveCompleted(430)
SetObjectiveDisplayed(475)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(475)
SetObjectiveDisplayed(500)
MQ302BOS_Maxson_PlantCharge.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)
InstituteRelayDoorRef.Unlock()
InstituteRelayDoorRef.SetOpen(true)
Maxson.GetReference().SetValue(TeleportRefCollOptionalRequired, 1)
MQ302BOS_Maxson_ChargePlanted.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Maxson.GetReference().Moveto(LeaderRelayMarker)
Maxson.GetReference().Enable()
(Maxson as TeleportReferenceAlias).TeleportIn()
MQ302Bos_Maxson_Ingram_Kid.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)
SetObjectiveDisplayed(710)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
SetObjectiveCompleted(710)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0730_Item_00
Function Fragment_Stage_0730_Item_00()
;BEGIN CODE
SetObjectiveCompleted(710)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0740_Item_00
Function Fragment_Stage_0740_Item_00()
;BEGIN CODE
if IsObjectiveCompleted(710) == 0
SetObjectiveDisplayed(710,0)
endif
SetObjectiveCompleted(700)
SetObjectiveDisplayed(740)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
MQ302BOS_Maxson_DetonateCharge.Start()
SetObjectiveCompleted(740)
SetObjectiveDisplayed(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
Ingram.GetReference().MoveTo(BoSIngramSandboxMarker)
SetObjectiveCompleted(800)
SetObjectiveDisplayed(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_01
Function Fragment_Stage_0900_Item_01()
;BEGIN CODE
;WorkshopParent.AddPermanentActorToWorkshopPUBLIC(Alias_ShaunChild.GetActorRef(), (Alias_BostonAirportWorkshop.GetRef() as WorkshopScript).GetWorkshopID(), false)
Alias_ShaunChild.GetReference().Moveto(MQ302BoSShaunPrydwenMarker)
Alias_ShaunChild.GetActorReference().SetOutfit(KidOutfit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
BoS305.SetStage(10)
MQ302.SetStage(1000)
CompleteAllObjectives()
Maxson.GetReference().IgnoreFriendlyHits(false)
Ingram.GetReference().IgnoreFriendlyHits(false)
;Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BoS302 Auto Const

ReferenceAlias Property Leader Auto Const

ReferenceAlias Property Danse Auto Const

ReferenceAlias Property Maxson Auto Const

Scene Property MQ302BoS_Maxson_BioScience Auto Const

Scene Property MQ302BoS_Maxson_OldRobotics Auto Const

Scene Property MQ302BoS_Maxson_Stage100 Auto Const

Scene Property MQ302BoS_Maxson_InsideInstitute Auto Const

Scene Property MQ302BoS_Maxson_PlantCharge Auto Const

Scene Property MQ302BoS_Maxson_ChargePlanted Auto Const

Scene Property MQ302BoS_Maxson_DetonateCharge Auto Const

Scene Property MQ302BoS_Maxson_Final Auto Const

ActorValue Property TeleportRefCollOptionalRequired Auto Const

Quest Property BoS305 Auto Const

Scene Property MQ302BoS_Ingram_PAHacked Auto Const

Scene Property MQ302BoS_Ingram_PathCleared Auto Const

Scene Property MQ302BoS_Ingram_ConcourseFight01 Auto Const

ObjectReference Property BoSIngramSandboxMarker Auto Const

ReferenceAlias Property Ingram Auto Const

ReferenceAlias Property Alias_BostonAirportWorkshop Auto Const

ReferenceAlias Property Alias_MQ302ReactorActivator Auto Const

ReferenceAlias Property Alias_ShaunChild Auto Const

workshopparentscript Property WorkshopParent Auto Const

Quest Property DN136_Attack Auto Const

Quest Property MQ302 Auto Const

Scene Property MQ302BoS_Maxson_Ingram_Kid Auto Const Mandatory

ObjectReference Property LeaderRelayMarker Auto Const

Outfit Property KidOutfit Auto Const

ObjectReference Property MQ302BoSShaunPrydwenMarker Auto Const Mandatory

ReferenceAlias Property RooftopSoldier1 Auto Const

ReferenceAlias Property RooftopSoldier2 Auto Const

ObjectReference Property InstituteRelayDoorRef Auto Const Mandatory
