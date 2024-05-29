;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFGoodneighbor07_001323AB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;cleanup the GoodneighborEntrance quest

If DialogueGoodneighborEntrance.IsRunning()
  DialogueGoodneighborEntrance.SetStage(98)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;DEBUG - Turn off Bobbi's essential flag and move to temp hideout
Alias_Bobbi.GetActorRef().EvaluatePackage()
alias_Bobbi.getActorRef().getActorBase().setEssential(false)
Alias_Bobbi.GetActorRef().Moveto(pBobbiDebugMarker)
Alias_Fahrenheit.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
alias_Bobbi.getRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
;Teleport Hancock to marker inside Old State House
Alias_Hancock.GetRef().MoveTo(HancockPreSpeechLeanMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_RandomEncounterTrigger.GetRef().Disable()
Alias_BobbiStuffEnableMarker.GetRef().Enable()

;Move Hancock out front and eval packages
Actor Hancock = Alias_Hancock.GetActorRef()

pFFG07HancockLeanMarker.SetActorOwner(None)
Utility.Wait(0.5)
pFFG07HancockLeanMarker.SetActorOwner((Alias_Hancock.GetActorRef()).GetActorBase())
Hancock.Moveto(pFFG07HancockLeanMarker)
Hancock.EvaluatePackage()

;Change Hancock's archetype to irritated
Hancock.ChangeAnimArchetype(AnimArchetypeIrritated)
Hancock.ChangeAnimArchetype(AnimFaceArchetypeIrritated)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
Alias_Bobbi.GetActorRef().Moveto(pBobbiDebugMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
if !self.GetStageDone(14)
  self.setstage(14)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
if !self.GetStageDone(55)
  SetObjectiveDisplayed(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
(Alias_Bobbi.GetActorRef()).SetValue(Game.GetAggressionAV(), 1)
BobbiFaction.SetEnemy(PlayerFaction)
;BobbiFaction.SetPlayerEnemy()
Alias_BobbiTurretA.GetActorRef().StartCombat(Game.GetPlayer())
Alias_BobbiTurretB.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(55)
Alias_BobbiFloorSafe.GetRef().SetActorOwner(None)
Alias_BobbiFloorSafe.GetRef().SetActorOwner(Game.GetPlayer().GetActorBase())

Alias_BobbiSafe.GetRef().SetActorOwner(None)
Alias_BobbiSafe.GetRef().SetActorOwner(Game.GetPlayer().GetActorBase())

Alias_BobbiRewardCase.GetRef().SetActorOwner(None)
Alias_BobbiRewardCase.GetRef().SetActorOwner(Game.GetPlayer().GetActorBase())

Alias_BobbiRewardCooler.GetRef().SetActorOwner(None)
Alias_BobbiRewardCooler.GetRef().SetActorOwner(Game.GetPlayer().GetActorBase())

Alias_BobbiRewardDuffle.GetRef().SetActorOwner(None)
Alias_BobbiRewardDuffle.GetRef().SetActorOwner(Game.GetPlayer().GetActorBase())


;Teleport Hancock to interior marker
Alias_Hancock.GetRef().MoveTo(HancockPreSpeechLeanMarker)

;Set Hancock to confident archetype
Actor Hancock = Alias_Hancock.GetActorRef()
Hancock.ChangeAnimArchetype(AnimArchetypeConfident)
Hancock.ChangeAnimArchetype(AnimFaceArchetypeConfident)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0052_Item_00
Function Fragment_Stage_0052_Item_00()
;BEGIN CODE
;Bobbi hands over her caps and runs

Alias_Bobbi.GetActorRef().RemoveItem(Caps001, 375)
Game.GetPlayer().AddItem(Caps001, 375)
self.SetStage(50)
Alias_Bobbi.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0053_Item_00
Function Fragment_Stage_0053_Item_00()
;BEGIN CODE
;Turn off Bobbi on unload if player lets her run
Alias_Bobbi.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
if GetStageDone(40) == 0
  SetObjectiveCompleted(20)
endIf

if GetStageDone(20) == 1
 SetObjectiveDisplayed(55)
endif

;Move Hancock to lean marker inside Old State House if he's given player the quest 
;or player sided with Fahrenheit 
if GetStageDone(20) || pMS16.GetStageDone(270)
  Alias_Hancock.GetRef().MoveTo(HancockPreSpeechLeanMarker)
endif

;If the player has not sided with Hancock and kills Bobbi, but Hancock in his "confident" archetype
if !pMS16.GetStageDone(270)
  Actor Hancock = Alias_Hancock.GetActorRef()
  Hancock.ChangeAnimArchetype(AnimArchetypeConfident)
  Hancock.ChangeAnimArchetype(AnimFaceArchetypeConfident)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0057_Item_00
Function Fragment_Stage_0057_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
if GetStageDone(20) == 1
 SetObjectiveCompleted(55)
endif

;If you convinced Bobbi to go and she hasn't skipped town yet, turn her off now
if self.GetStageDone(50) && !self.GetStageDone(53)
  self.setstage(53)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
HancockFarewellSpeech.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(80)

;Change Hancock's anim archetype
Actor Hancock = Alias_Hancock.GetActorRef()

Hancock.SetAvailableToBeCompanion()

;Just in case he hasn't already been set to confident, do it now
Hancock.ChangeAnimArchetype(AnimArchetypeConfident)
Hancock.ChangeAnimArchetype(AnimFaceArchetypeConfident)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80)
Alias_RandomEncounterTrigger.GetRef().Enable()
pMS16.SetStage(500)

;If the player's convinced Bobbi to skip town, but she hasn't, disable her now
if (self.GetStageDone(52) || self.GetStageDone(50)) && !self.GetStageDone(53)
  self.SetStage(53)
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;If the player's convinced Bobbi to skip town, but she hasn't, disable her now
if (self.GetStageDone(52) || self.GetStageDone(50)) && !self.GetStageDone(53)
  self.SetStage(53)
endif

;Turn off MS16 and 
pMS16.SetStage(500)
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Hancock Auto Const

ReferenceAlias Property Alias_Bobbi Auto Const

Faction Property BobbiFaction Auto Const

Faction Property PlayerFaction Auto Const

MiscObject Property Caps001 Auto Const

ObjectReference Property pFFG07HancockLeanMarker Auto Const

Faction Property HasBeenCompanionFaction Auto Const

Scene Property HancockFarewellSpeech Auto Const

ObjectReference Property pBobbiDebugMarker Auto Const

ReferenceAlias Property Alias_BobbiTurretA Auto Const

ReferenceAlias Property Alias_BobbiTurretB Auto Const

ReferenceAlias Property Alias_RandomEncounterTrigger Auto Const

Quest Property pMS16 Auto Const

Quest Property pHancockSpeechQuest Auto Const

ReferenceAlias Property Alias_BobbiSafe Auto Const

ReferenceAlias Property Alias_BobbiRewardCase Auto Const

ReferenceAlias Property Alias_BobbiRewardDuffle Auto Const

ReferenceAlias Property Alias_BobbiFloorSafe Auto Const

ReferenceAlias Property Alias_BobbiRewardCooler Auto Const

ReferenceAlias Property Alias_BobbiStuffEnableMarker Auto Const

ReferenceAlias Property Alias_Fahrenheit Auto Const

LeveledItem Property pRewardCaps Auto Const

ObjectReference Property HancockPreSpeechLeanMarker Auto Const

Keyword Property AnimArchetypeConfident Auto Const

Keyword Property AnimFaceArchetypeConfident Auto Const

Quest Property DialogueGoodneighborEntrance Auto Const

Keyword Property AnimArchetypeIrritated Auto Const

Keyword Property AnimFaceArchetypeIrritated Auto Const
