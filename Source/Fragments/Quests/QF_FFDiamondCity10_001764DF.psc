;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFDiamondCity10_001764DF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE FFDiamondCity10Script
Quest __temp = self as Quest
FFDiamondCity10Script kmyQuest = __temp as FFDiamondCity10Script
;END AUTOCAST
;BEGIN CODE
Actor DannyREF = Alias_DannySullivan.GetActorRef()
Actor GenevaREF = Alias_Geneva.GetActorRef()
Actor MayorREF = Alias_MayorMcDonough.GetActorRef()
Actor PastorClementsREF = Alias_PastorClements.GetActorRef()
Actor PiperREF = Alias_Piper.GetActorRef()
ObjectReference MayorDoorREF = Alias_MayorDoor.GetRef()

DannyREF.Disable()
DannyREF.EvaluatePackage()
DannyREF.Moveto(FFDiamondCity10WoundedSit)
DannyREF.Enable()
DannyREF.SetRestrained()
DannyREF.GetActorBase().SetEssential(False)
DannyREF.ChangeAnimFaceArchetype(AnimFaceArchetypeInPain)

PastorClementsREF.Disable()
PastorClementsREF.EvaluatePackage()
PastorClementsREF.Enable()

MayorREF.moveto(FFDiamondCity10McDonoughMarker01)
MayorREF.GetActorBase().SetEssential(false)
MayorREF.ChangeAnimFaceArchetype(AnimFaceArchetypeIrritated)
MayorREF.ChangeAnimArchetype(AnimArchetypeConfident)
MayorREF.RemoveFromFaction(CrimeDiamondCity)

GenevaREF.Moveto(FFDiamondCity10McDonoughMarker01)
GenevaREF.SetRestrained()
GenevaREF.GetActorBase().SetEssential(False)
GenevaREF.ChangeAnimFaceArchetype(AnimFaceArchetypeNervous)

;setup the mayor's office
Alias_GenevaDesk.GetRef().BlockActivation(True, True)
Alias_GenevaChair.GetRef().Disable()
MayorDoorREF.BlockActivation(True, True)
MayorDoorREF.SetOpen(False)
MayorDoorREF.Lock()

;move Piper if she isn't with you
If PiperREF.IsInFaction(CurrentCompanionFaction) == 0
  PiperREF.DisallowCompanion(SuppressDismissMessage=True)
  PiperREF.Moveto(FFDiamondCity10PiperMovetoMarker)
  Alias_MayorSecurityOfficer.GetActorRef().Disable()
  kmyquest.Var_PiperAtDoor=1
EndIf

;shut down incompatible quests
DialogueDiamondCityMayorWallSpeech.SetStage(100)
FFDiamondCity12.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
FFDiamondCity10_001_Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Alias_DoctorCrocker.GetActorRef().EvaluatePackage()
Alias_DoctorSun.GetActorRef().EvaluatePackage()
Alias_PastorClements.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Stimpak, 1)
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
Alias_DannySullivan.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE FFDiamondCity10Script
Quest __temp = self as Quest
FFDiamondCity10Script kmyQuest = __temp as FFDiamondCity10Script
;END AUTOCAST
;BEGIN CODE
;make sure the door is closed
Alias_MayorDoor.GetRef().SetOpen(False)

;if piper is at the door, play her version of the scene, else play the officer version
If kmyquest.Var_PiperAtDoor == 1
  FFDiamondCity10_011_MayorOfficePiper.Start()
Else
  FFDiamondCity10_010_MayorOffice.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
Alias_MayorDoor.GetRef().BlockActivation(False, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Alias_MayorDoor.GetRef().Lock(False)
Alias_MayorDoor.GetRef().SetOpen()

SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
Alias_Piper.GetActorRef().EvaluatePackage()
Alias_MayorSecurityOfficer.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
FFDiamondCity10_015_McDonough.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Actor MayorREF = Alias_MayorMcDonough.GetActorRef()

MayorREF.AddtoFaction(PlayerEnemyFaction)
MayorREF.AddtoFaction(DiamondCityEnemyFaction)
MayorREF.SetValue(Aggression, 2)
MayorREF.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
Actor GenevaREF = Alias_Geneva.GetActorRef()

GenevaREF.SetRestrained(False)
GenevaREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_MayorMcDonough.GetActorRef().EvaluatePackage()
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Alias_MayorMcDonough.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
If IsObjectiveCompleted(20) == 0
  SetObjectiveDisplayed(20, abDisplayed=False)
EndIf
;Game.RewardPlayerXP(XPRadiant.GetValue() as int)

FFDiamondCity10_020_Resolution.Start()

;geneva is free
SetStage(160)

Alias_Piper.GetActorRef().EvaluatePackage()
Alias_MayorSecurityOfficer.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
FFDiamondCity10_021_Companion.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_GenevaDesk.GetRef().BlockActivation(False, False)
Alias_GenevaChair.GetRef().Enable()

Actor DannyREF = Alias_DannySullivan.GetActorRef()
Actor GenevaREF = Alias_Geneva.GetActorRef()

;Piper is allowed to be a companion again
Alias_Piper.GetActorRef().AllowCompanion(False, False)

If GetStageDone(50)== 0
  DannyREF.Kill()
EndIf

If GenevaREF.IsDead()
  GenevaREF.Disable()
Else
  GenevaREF.ChangeAnimFaceArchetype()
  GenevaREF.SetRestrained(False)
EndIf

If DannyREF.IsDead()
  DannyREF.Disable()
Else
  DannyREF.ChangeAnimFaceArchetype()
  DannyREF.SetRestrained(False)
EndIf

If Alias_MayorSecurityOfficer.GetActorRef().IsDisabled()
  Alias_MayorSecurityOfficer.GetActorRef().Enable()
EndIf

If (PublickArticle03EnableMarker.IsEnabled() == 0) && (PublickArticle04EnableMarker.IsEnabled() == 0)
  PublickArticle01EnableMarker.Disable()
  PublickArticle02EnableMarker.Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_PastorClements Auto Const

ReferenceAlias Property Alias_DannySullivan Auto Const

ObjectReference Property FFDiamondCity10DannyMoveMarker Auto Const

Potion Property Stimpak Auto Const

ReferenceAlias Property Alias_DoctorSun Auto Const

ReferenceAlias Property Alias_DoctorCrocker Auto Const

ReferenceAlias Property Alias_GenevaDesk Auto Const

ReferenceAlias Property Alias_GenevaChair Auto Const

ReferenceAlias Property Alias_MayorDoor Auto Const

ReferenceAlias Property Alias_Piper Auto Const

Faction Property CurrentCompanionFaction Auto Const

ObjectReference Property FFDiamondCity10PiperMovetoMarker Auto Const

ReferenceAlias Property Alias_MayorSecurityOfficer Auto Const

Scene Property FFDiamondCity10_010_MayorOffice Auto Const

Scene Property FFDiamondCity10_011_MayorOfficePiper Auto Const

Keyword Property AnimFlavorHandsUp Auto Const

ReferenceAlias Property Alias_MayorMcDonough Auto Const

ReferenceAlias Property Alias_Geneva Auto Const

Scene Property FFDiamondCity10_001_Scene Auto Const

ObjectReference Property FFDiamondCity10McDonoughMarker01 Auto Const

ActorValue Property Aggression Auto Const

Faction Property PlayerEnemyFaction Auto Const

Keyword Property AnimFaceArchetypeIrritated Auto Const

Keyword Property AnimFaceArchetypeNervous Auto Const

Keyword Property AnimFaceArchetypeInPain Auto Const

Faction Property CrimeDiamondCity Auto Const

Keyword Property AnimArchetypeIrritated Auto Const

Faction Property DiamondCityEnemyFaction Auto Const

GlobalVariable Property XPRadiant Auto Const

Scene Property FFDiamondCity10_020_Resolution Auto Const

Scene Property FFDiamondCity10_021_Companion Auto Const

Quest Property DialogueDiamondCityMayorWallSpeech Auto Const

Scene Property FFDiamondCity10_015_McDonough Auto Const

Keyword Property AnimArchetypeConfident Auto Const

Quest Property FFDiamondCity12 Auto Const

ObjectReference Property PublickArticle02EnableMarker Auto Const Mandatory

ObjectReference Property PublickArticle03EnableMarker Auto Const Mandatory

ObjectReference Property PublickArticle04EnableMarker Auto Const Mandatory

ObjectReference Property PublickArticle01EnableMarker Auto Const Mandatory

ObjectReference Property FFDiamondCity10WoundedSit Auto Const Mandatory
