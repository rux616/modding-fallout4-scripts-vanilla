;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS07a_0001CB51 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Debug stage for hearing the companion interjections associated with this quest
self.setstage(10)
Utility.Wait(2.0)

ObjectReference PlayerRef = Game.GetPlayer()

PlayerRef.Moveto(pPlayerDebugMarker)
PlayerRef.AddItem(pSurgeryKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN CODE
;Doc Crocker is no longer essential
Alias_DocProctor.getActorRef().getActorBase().setEssential(false)
Alias_DocProctor.getRef().moveto(pCrockerMarker)

SetObjectiveDisplayed(10, 1)

;If Vadim's not dead, show the "speak to Vadim" objective
if !Alias_Vadim.GetActorRef().IsDead()
  SetObjectiveDisplayed(15, 1)
endif 

;check if the player already has Earl's key
If Game.GetPlayer().GetItemCount(pDmndEarlKey) > 0
  Setstage(15)
EndIf

;enable the blood tracks in the Surgery Center, spawn, then kill, the body in the cellar and the receipt
Alias_BloodTracks.GetRef().Enable()
Alias_BloodTracks.GetRef().SetDestroyed()
Alias_BloodTracksTrigger.GetRef().Enable()
Alias_EarlBody.GetRef().Enable()
Alias_ReceiptBook.GetRef().Enable()
Alias_EarlBody.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
;Play Nick's Dugout Inn scene
NickEntersDugoutScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
Alias_Vadim.GetRef().RemoveItem(pDmndEarlKey, 1)
Game.GetPlayer().AddItem(pDmndEarlKey, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetObjectiveCompleted(15, 1)

;Set ownership of Earl's place to player faction
DmndEarlsHouse01.SetFactionOwner(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
;Once inside Earl's play Nick's scene if present

if !GetStageDone(20) && !GetStageDone(30) && !GetStageDone(35) && !GetStageDone(40) && !GetStageDone(50)
  Utility.Wait(1.5)
  p001a_MS07aNickEntersEarlsPlace.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
;Player has entered Earl's place, fire objective again and set ownership of Earl's place to player faction
DmndEarlsHouse01.SetFactionOwner(PlayerFaction)

Utility.Wait(0.5)
MUSDread01b.Add()
SetObjectiveCompleted(15, 1)
SetObjectiveDisplayed(10, 1, abForce = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_01
Function Fragment_Stage_0020_Item_01()
;BEGIN CODE
;Player has activated receipt

;Kill Nick's scene if it's still playing
if  p001a_MS07aNickEntersEarlsPlace.IsPlaying()
   p001a_MS07aNickEntersEarlsPlace.Stop()
endif

;if player hasn't bypassed this objective, kick off others and Nick's acknowledgement scene
if !self.GetStageDone(30) && !self.GetStageDone(40) && !self.GetStageDone(50)
  SetObjectiveCompleted(10, 1)
  SetObjectiveCompleted(15, 1)
  SetObjectiveDisplayed(20, 1)
  Utility.Wait(0.5)
  p001b_MS07aPlayerAcquiresReceipt.Start()
endif

;Close off Vadim's key conversation
self.setstage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
;Player has entered Earl's place, fire objective again

;if !self.GetStageDone(30) && !self.GetStageDone(40)
;  SetObjectiveDisplayed(20, 1, abForce = true)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0027_Item_00
Function Fragment_Stage_0027_Item_00()
;BEGIN CODE
;Play failed the inital pair of speech challenges with Sun, so remind them they need to search the area
Utility.Wait(3.0)
if IsObjectiveDisplayed(20) && !IsObjectiveDisplayed(30) && !GetStageDone(40) && !GetStageDone(50)
  SetObjectiveDisplayed(20, 1, abForce = true)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;If player hasn't bypassed this objective, play Blood Spotted scene
if !self.GetStageDone(50)

  ;If the player is in a scene with Doc Sun, boot them out
  if DoctorGreetScene.IsPlaying()
    DoctorGreetScene.Stop()
  elseif DoctorMedicineScene02_Exam.IsPlaying()
    DoctorMedicineScene02_Exam.Stop()
  elseif DoctorMedicineScene03_AllDone.IsPlaying()
    DoctorMedicineScene03_AllDone.Stop()
  endif

  pBloodTracksScene.Start()
endif

Alias_BloodTracksTrigger.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_01
Function Fragment_Stage_0035_Item_01()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveCompleted(15, 1)

;If player doesn't know to get into the cellar, tell them now
if !self.GetStageDone(40)
  SetObjectiveDisplayed(30, 1)
endif

;If player doesn't have key and doesn't know to enter the basement, tell them to talk to Sun again
if Game.GetPlayer().GetItemCount(pSurgeryKey) == 0 && !self.GetStageDone(40)
  SetObjectiveDisplayed(35, 1)
else  
  SetObjectiveCompleted(20, 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10, 1)
SetObjectiveCompleted(15, 1)
SetObjectiveCompleted(20, 1)

SetObjectiveDisplayed(30, 1)

;If player doesn't already have key to cellar, tell them to find one
if Game.GetPlayer().GetItemCount(pSurgeryKey) == 0
  SetObjectiveDisplayed(35, 1)  
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
SetObjectiveCompleted(35, 1)

;If the player knows to head into the cellar already, close out Search obj
if GetStageDone(40) || GetStageDone(30)
  SetObjectiveCompleted(20, 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Kick off music
MUSDread01b.Add()

;Have Crocker start muttering to himself and clear out other objectives
p003_MS07aDocCrockerScene01.Start()
SetObjectiveCompleted(10, 1)
SetObjectiveCompleted(15, 1)
SetObjectiveCompleted(20, 1)
SetObjectiveCompleted(35, 1)

;If player bypassed other objectives to get here, tell them to approach Crocker
if !IsObjectiveDisplayed(30)
  SetObjectiveDisplayed(30, 1)
endif

Alias_BloodTracksTrigger.GetRef().Disable()

;Remove crime/settlement factions from Doc Crocker
Alias_DocProctor.GetActorRef().RemoveFromFaction(CrimeDiamondCity)
Alias_DocProctor.GetActorRef().RemoveFromFaction(SettlementDiamondCity)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0053_Item_00
Function Fragment_Stage_0053_Item_00()
;BEGIN CODE
Alias_DocProctor.GetactorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE MS07aScript
Quest __temp = self as Quest
MS07aScript kmyQuest = __temp as MS07aScript
;END AUTOCAST
;BEGIN CODE
;put Crocker into combat
Alias_DocProctor.GetActorRef().SetValue(pAggression, 2)

;if player hasn't walked away, mark player choice for aggression (used for companion interjections)
if !self.GetStageDone(57)
  kmyQuest.iPlayerThreatenedCrocker = 1
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0062_Item_00
Function Fragment_Stage_0062_Item_00()
;BEGIN CODE
;put Crocker into combat
Alias_DocProctor.GetActorRef().SetValue(pAggression, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Have Crocker put away his weapon, and play the "Use Psycho" idle
Alias_DocProctor.GetActorRef().EvaluatePackage()
Utility.Wait(0.25)
Alias_DocProctor.GetActorRef().PlayIdle(UsePsychoIdle)
CrockerDeathLine.Start()
;self.SetStage(72)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0072_Item_00
Function Fragment_Stage_0072_Item_00()
;BEGIN CODE
;Then have Crocker die
;Utility.Wait(6.0)
Alias_DocProctor.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Play Earl's body scene
pEarlsBodyScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_02
Function Fragment_Stage_0100_Item_02()
;BEGIN CODE
SetObjectiveCompleted(30, 1)

;If Nick hates player, don't point back to Ellie
if !pMS07.GetStageDone(500)
  SetObjectiveDisplayed(40, 1)
else
  SetObjectiveDisplayed(50, 1)
endif

;If Doctor Sun is alive, move him to his marker trigger his scene and packages
If Alias_DoctorSun.GetActorRef().IsDead() == False
  Alias_DoctorSun.getRef().moveto(pPlayerDebugMarker)
  p005_MS07aSunScene.Start()
EndIf

;If Nick Valentine was with the Player, set stage 90 for dialogue tracking
If Alias_Nick.GetActorRef().GetCurrentLocation() == pDiamondCitySurgeryCellarLocation
  SetStage(90)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;If Nick hates player, end quest here
if pMS07.GetStageDone(500)
  self.setstage(210)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
p004b_MS07aCompanionInterjects.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
;If Nick was present, play scene upon entering Agency
if self.GetStageDone(90)
  Utility.Wait(1.5)
  p007b_MS07aNickReturnsScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;reward player with money
Game.GetPlayer().AddItem(pCapsLevels, 1)
CompleteAllObjectives()

;setup the connection to the next quest
pMS07.SetStage(50)

;Doctor Sun no longer essential
Alias_DoctorSun.getActorRef().getActorBase().setEssential(false)

;Ellie is not happy anymore
Alias_Ellie.GetActorRef().ChangeAnimArchetype(none)
Alias_Ellie.GetActorRef().ChangeAnimFaceArchetype(none)

;Send affinity event for Nick
FollowersScript.SendAffinityEvent(self, CA_CustomEvent_ValentineLikes)

;Turn off blood stains/bodies at Mega Surgery
Alias_BloodTracks.GetRef().Disable()
Alias_EarlBody.GetRef().Disable()
BloodStainEnableMarker.Disable()
Alias_DocProctor.GetRef().Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;reward player with money
CompleteAllObjectives()

;setup the connection to the next quest
pMS07.SetStage(50)

;Doctor Sun no longer essential
Alias_DoctorSun.getActorRef().getActorBase().setEssential(false)

;Ellie is not happy anymore
Alias_Ellie.GetActorRef().ChangeAnimArchetype(none)
Alias_Ellie.GetActorRef().ChangeAnimFaceArchetype(none)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;Turn off blood stains/bodies at Mega Surgery
Alias_BloodTracks.GetRef().Disable()
Alias_EarlBody.GetRef().Disable()
BloodStainEnableMarker.Disable()
Alias_DocProctor.GetRef().Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_DocProctor Auto Const ; Legacy alias property

Key Property pDmndEarlKey Auto Const

ReferenceAlias Property Alias_BloodTracks Auto Const

Scene Property p003_MS07aDocCrockerScene01 Auto Const

ReferenceAlias Property Alias_DoctorSun Auto Const

Scene Property p005_MS07aSunScene Auto Const

Location Property pDiamondCitySurgeryCellarLocation Auto Const

ReferenceAlias Property Alias_Nick Auto Const

Quest Property pMS07 Auto Const

ReferenceAlias Property Alias_BloodTracksTrigger Auto Const

ReferenceAlias Property Alias_EarlBody Auto Const

ActorValue Property pAggression Auto Const

ReferenceAlias Property Alias_ReceiptBook Auto Const

Scene Property pBloodTracksScene Auto Const

Scene Property pEarlsBodyScene Auto Const

LeveledItem Property pCapsLevels Auto Const

ReferenceAlias Property Alias_Vadim Auto Const

Scene Property p004b_MS07aCompanionInterjects Auto Const

Scene Property p001b_MS07aPlayerAcquiresReceipt Auto Const

Scene Property p001a_MS07aNickEntersEarlsPlace Auto Const

Scene Property p007b_MS07aNickReturnsScene Auto Const

Keyword Property pAnimArchetypeNeutral Auto Const

ReferenceAlias Property Alias_Ellie Auto Const

ObjectReference Property pPlayerDebugMarker Auto Const

Key Property pSurgeryKey Auto Const

Cell Property DmndEarlsHouse01 Auto Const

Faction Property PlayerFaction Auto Const

ObjectReference Property pCrockerMarker Auto Const

Scene Property NickEntersDugoutScene Auto Const

Idle Property UsePsychoIdle Auto Const

Scene Property CrockerDeathLine Auto Const

Faction Property CrimeDiamondCity Auto Const

Faction Property SettlementDiamondCity Auto Const

Scene Property DoctorGreetScene Auto Const

Scene Property DoctorMedicineScene02_Exam Auto Const

Scene Property DoctorMedicineScene03_AllDone Auto Const

MusicType Property MUSDread01b Auto Const

ObjectReference Property BloodStainEnableMarker Auto Const

Keyword Property CA_CustomEvent_ValentineLikes Auto Const
