;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS07_000229FC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;FOR TESTING ONLY

;Setup Nick's office
pIntroSceneValentinesStart.Disable()
pDialogueDiamondCity.SetStage(170)
pMQ04.Stop()
MS07Intro.SetStage(10)
Utility.Wait(1.0)
Game.GetPlayer().Moveto(TestMQ201PlayerMarker)
Alias_Ellie.GetRef().Moveto(pEllieStartMarker)
Alias_Ellie.GetActorRef().EvaluatePackage()
Alias_Nick.GetActorRef().Moveto(Game.GetPlayer())
(Followers as FollowersScript).SetCompanion(Alias_Nick.GetActorRef())
Alias_Nick.GetActorRef().RemoveFromFaction(pCaptiveFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Enable The Disappearing Act Case File
;Alias_CaseFileA.GetRef().Enable()
;Alias_CaseFileBoxB.GetRef().Enable()

;Also take this opportunity to reset Faneuil Hall, so the player has something to fight.
FaneuilHallExt.Reset()
FaneuilHall01.Reset()

;If the Gilded Grasshopper is already done, mark it so in this quest
if pMS07b.GetStageDone(40)
  if !self.GetStageDone(90)
    self.SetStage(90)
  endif 
endif

SetObjectiveCompleted(3, 1)
SetObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(3, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
if !GetStageDone(10)
  SetObjectiveDisplayed(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5, 1)
SetObjectiveCompleted(10, 1)
SetObjectiveCompleted(3, 1)
SetObjectiveCompleted(95, 1)

self.SetStage(40)

;If MQ201 isn't playing, play Ellie's Earl intro scene
if !MQ201.IsRunning()
  p001a_ElliesEarlCaseIntroScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;If Nick doesn't hate you, start the first case. Otherwise, just show case file.

if !self.GetStageDone(500)
  pMS07a.SetStage(10)
  SetObjectiveCompleted(95, 1)
endif

Alias_EarlSterlingCase.GetRef().Activate(Game.GetPlayer())
Alias_CaseFileA.GetRef().Disable()

;If player has already picked up the holotape for MS07b and Nick hates you, close this out
if self.GetStageDone(70) && self.GetStageDone(500)
  self.SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
if !NickEllieMartyScene.IsPlaying() && self.GetStageDone(12) && !MQ201.IsRunning() && Alias_Nick && Alias_Nick.GetActorRef().GetCurrentLocation() == DiamondCityValentinesLocation
  NickEllieEarlScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;If Gilded Grasshopper is done, close out quest
if self.GetStageDone(90)
  self.SetStage(1000)
else
  Utility.Wait(1.0)

  ;If player hasn't already heard about/started/finished MS07b and Nick doesn't hate them, play the pointing scene
  if !pMS07bGrasshopper.getStageDone(20) &&  !self.getStageDone(60) && !self.getStageDone(65) && !self.getStageDone(90) && !self.getStageDone(97) && !self.GetStageDone(500)
    SetStage(60)

    ;If Nick is nearby and MQ201 isn't running, play the scene involving him. Otherwise, play standard scene.
    if !MQ201.IsRunning()
      if Alias_Nick.GetRef().GetDistance(Alias_Ellie.GetRef()) < 750
        p005_MS07EllieTransitionFromAToB.Start()
      else
        p005_MS07EllieTransitionFromAToB_NoNick.Start()
      endif
    endif
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(60, 1)
SetObjectiveCompleted(3, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
;If the player hasn't already finished the Gilded Grasshopper and the Marty intro isn't playing, 
;kick off the Gilded Grasshopper intro

if !self.GetStageDone(97) && !self.GetStageDone(90) && !MQ201.IsRunning()
  self.SetStage(70)
  pEllieMartyIntroScene.Start()
else
  self.SetStage(70)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
Alias_CaseFileBoxB.GetRef().Disable()
Game.GetPlayer().AddItem(Alias_MartysHolotape.GetRef(), 1)
SetObjectiveCompleted(60, 1)

if !self.GetStageDone(97)
  MartyEnableMarker.Disable()
  SetObjectiveDisplayed(70, 1)
  SetObjectiveCompleted(5, 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0071_Item_00
Function Fragment_Stage_0071_Item_00()
;BEGIN CODE
if !NickEllieEarlScene.IsPlaying() && self.GetStageDone(67) && !MQ201.IsRunning() && Alias_Nick.GetActorRef().GetCurrentLocation() == DiamondCityValentinesLocation
  NickEllieMartyScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60, 1)
SetObjectiveCompleted(70, 1)

if self.GetStageDone(40) && self.GetStageDone(500)
  self.SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;If all MS07 quests done, shut this down
if self.GetStageDone(50)
  self.SetStage(1000)
endif

SetObjectiveCompleted(60, 1)
SetObjectiveCompleted(70, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
if !self.GetStageDone(500)  
  SetObjectiveDisplayed(95, 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0098_Item_00
Function Fragment_Stage_0098_Item_00()
;BEGIN CODE
;Set Ellie knows Marty's dead global
MS07bEllieKnowsMartysDead.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN CODE
SetObjectiveCompleted(95, 1)

Utility.Wait(3.0)

if !self.getStageDone(10) && !self.getStageDone(40) && !self.getStageDone(50) && !self.GetStageDone(97) && !self.GetStageDone(500)
   SetStage(5)
  
    if !MQ201.IsRunning()
      if Alias_Nick.GetRef().GetDistance(Alias_Ellie.GetRef()) < 750
        p006_MS07EllieTransitionFromBToA.Start()
      else
        p006_MS07EllieTransitionFromBtoA_NoNick.Start()
      endif
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Ellie is not happy anymore
Alias_Ellie.GetActorRef().ChangeAnimArchetype(none)
Alias_Ellie.GetActorRef().ChangeAnimFaceArchetype(none)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0501_Item_00
Function Fragment_Stage_0501_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDialogueDiamondCity Auto Const

ReferenceAlias Property Alias_Nick Auto Const

Quest Property pMQ04 Auto Const

ObjectReference Property pIntroSceneValentinesStart Auto Const

Quest Property pMS07a Auto Const

ReferenceAlias Property Alias_EarlSterlingCase Auto Const

ReferenceAlias Property Alias_Ellie Auto Const

Scene Property p001a_ElliesEarlCaseIntroScene Auto Const

ReferenceAlias Property Alias_CaseFileBoxTrigger Auto Const

ReferenceAlias Property Alias_CaseFileBoxb Auto Const

ReferenceAlias Property Alias_CaseFileBoxTriggerb Auto Const

ReferenceAlias Property Alias_MartysHolotape Auto Const

Holotape Property MS07bMartyBullfinchHolotape00 Auto Const

Scene Property pEllieMartyIntroScene Auto Const

ReferenceAlias Property Alias_CaseFileA Auto Const

ObjectReference Property pEllieStartMarker Auto Const

Quest Property MS07Intro Auto Const

ObjectReference Property TestMQ201PlayerMarker Auto Const

Quest Property Followers Auto Const

Quest Property pMS07bGrasshopper Auto Const

Quest Property pMS07b Auto Const

Scene Property p005_MS07EllieTransitionFromAToB Auto Const

EncounterZone Property FaneuilHallZone Auto Const

Cell Property FaneuilHall01 Auto Const

Cell Property FaneuilHallExt Auto Const

Scene Property p006_MS07EllieTransitionFromBToA Auto Const

Faction Property pCaptiveFaction Auto Const

GlobalVariable Property MS07bEllieKnowsMartysDead Auto Const

Scene Property NickEllieEarlScene Auto Const

Scene Property NickEllieMartyScene Auto Const

ObjectReference Property MartyEnableMarker Auto Const

Quest Property MQ201 Auto Const

Location Property DiamondCityValentinesLocation Auto Const

Scene Property p005_MS07EllieTransitionFromAToB_NoNick Auto Const

Scene Property p006_MS07EllieTransitionFromBtoA_NoNick Auto Const
