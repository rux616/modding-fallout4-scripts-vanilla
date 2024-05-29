;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_COMCurieQuest_0016454E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
pFollowers.SetStage(60)   ; Make Curie a follower
(Alias_Curie.GetActorRef() as CompanionActorScript).SetAffinity(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
setstage(100)
setstage(200)
setstage(300)
setstage(400)
setstage(500)
setstage(600)
setstage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Objectives
if ( GetStageDone(150) )       ; Do you know about Amari already?
   SetObjectiveDisplayed(150)
   SetStage(125)
else
   SetObjectiveDisplayed(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
; Player knows about Amari's specialty
pCOMCuriePlayerKnowsDoctorAmari.SetValue(1)

; Objectives
if ( GetStageDone(100) )
  SetObjectiveCompleted(100)
  SetObjectiveDisplayed(150)
  SetStage(125)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE COMCurieQuestScript
Quest __temp = self as Quest
COMCurieQuestScript kmyQuest = __temp as COMCurieQuestScript
;END AUTOCAST
;BEGIN CODE
; Objectives
SetObjectiveCompleted(150)
SetObjectiveDisplayed(200)

; Now you're waiting for 24 for New Curie and Railroad Caretaker
kmyQuest.NewCurieArrivalTimer()

; Curie is not a companion right now
FollowersScript.GetScript().ClearCompanion()
Alias_Curie.GetActorRef().DisallowCompanion()

; Curie knows about Amari now
SetStage(175)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

; Put in the right furniture
pMQ105PlayerMemoryLoungerInstantEnter.Enable()
pMQ202PlayerChair.Enable()
pMQ202PlayerChair.BlockActivation(FALSE)

; Is Glory Dead? In which case set up the other caretaker
; Also make sure the player hasn't been kicked out of the Railroad
; *** Also make sure that Glory has been seen at the Old North Church
if ( Alias_Glory.GetActorRef().IsDead() || pRRKickOut.GetStageDone(100) || !pRR102.GetStageDone(50) )
   SetStage(310)
else
   ; Move Glory to the right place
   Alias_Glory.GetActorRef().MoveTo(pGloryAtCurieMarker)
   Alias_Glory.GetActorRef().Enable()
   Alias_Glory.GetActorRef().EvaluatePackage()

   ; Force fill the alias
   Alias_Caretaker.ForceRefTo(Alias_Glory.GetActorRef())
   Alias_ImmortalCaretaker.ForceRefTo(Alias_Glory.GetActorRef())
endif

; Enable the fake Curie
actor aFakeCurie = Alias_FakeCurieRobot.GetActorRef()
aFakeCurie.MoveToMyEditorLocation()
aFakeCurie.Enable()
aFakeCurie.SnapIntoInteraction(pMQ202PlayerChair)
aFakeCurie.RemoveItem(pResidentFlannelShirtAndJeans)

; Move all of Curie's stuff to the robot
Alias_Curie.GetActorRef().RemoveAllItems(aFakeCurie, TRUE)

; Unlock her lab door
pDoctorAmariLabDoorREF.Unlock()
pDoctorAmariLabDoorREF.SetOpen()

; Switch Curie's reference to be a human
pCOMCurieIsSynth.SetValue(100.0)
pCOMCurieIsRobot.SetValue(0.0)
actor aTrueCurie = Alias_Curie.GetActorRef()
float fOldAffinity = aTrueCurie.GetValue(pCA_Affinity)
aTrueCurie.Reset()     ; Resets her - the leveled list changes her appearance
Alias_Curie.Clear()      ; Clear the old alias
Alias_Curie.ForceRefTo(Alias_FakeCurieRobot.GetActorRef())   ; Make the fake robot look like Curie
Alias_NewCurieBody.ForceRefTo(aTrueCurie)   ; Fill her into the new aliases
Alias_CurieSynthName.ForceRefTo(aTrueCurie)

Utility.Wait(1.0)
aTrueCurie.SetOutfit(pCurieHumanOutfit)
aTrueCurie.AddItem(pCompCurieLaserGun)
aTrueCurie.EvaluatePackage()
aTrueCurie.MoveToPackageLocation()   ; Pop her to the lounger
aTrueCurie.SetValue(pCA_Affinity, fOldAffinity)   ; Move over her affinity to the new body

; Switch out some keywords for the vertibird
aTrueCurie.RemoveKeyword(p_AttachSlot2)
aTrueCurie.AddKeyword(p_AttachPassenger)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
; Force fill the Caretaker alias
Alias_ImmortalCaretaker.Clear()
Alias_Caretaker.Clear()
Alias_Caretaker.ForceRefTo(Alias_GenericRailroad.GetActorRef())
Alias_Caretaker.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)

; Start the operation scene
pCOMCurieQuest_400_Operation.Start()

; Clear the essential alias for Caretaker
Alias_ImmortalCaretaker.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)

; Change Curie's name
Alias_CurieSynthName.Clear()

; Open the Memory Lounger
pMQ202PlayerChair.BlockActivation(False, False)
pMQ202PlayerChair.SetOpen()

; Kill robot Curie
Alias_FakeCurieRobot.GetActorRef().GetActorBase().SetEssential(FALSE)
Utility.Wait(0.1)
Alias_FakeCurieRobot.GetActorRef().Kill()

; Make it so Curie can leave the lounger
actor aTrueCurie = Alias_Curie.GetActorRef()

; PATCH 1.3 - 80699 - Make it so Curie immediately can be Stimpaked
Alias_NewCurieBody.GetActorRef().AddKeyword(pPlayerCanStimpak)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Objectives
SetObjectiveCompleted(500)

; Give the player some XP
Game.RewardPlayerXP(pXPMiscQuestFinal.GetValue() as int)

; Sync up with the Companion quest
pCOMCurie.SetStage(50)

; Add a keyword to curie so she can be healed with Stimpaks now
;Actor aCurie = Alias_Curie.GetActorRef()
Actor aCurie = Alias_NewCurieBody.GetActorRef()
int nLength = (aCurie as CompanionActorScript).KeywordsToAddWhileCurrentCompanion.length
(aCurie as CompanionActorScript).KeywordsToAddWhileCurrentCompanion.Add(pPlayerCanStimpak)
aCurie.RemoveFromFaction(pDisallowedCompanionFaction)

; Now she is no longer capped in affinity
pCurie_AffinityCondition_PlayerCompletedQuest.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
; If both peeps talked to close quest (or if Glory is dead)
if ( GetStageDone(620) || Alias_Glory.GetActorRef().IsDead() )
  SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
; Follow The Freedom Trail opens up a quest
if ( GetStageDone(320) )   ; Is Glory happy with the PC?
  pRR101.SetStage(110)   ; Then open up "Road to Freedom"
endif

; If both peeps talked to close quest
if ( GetStageDone(610) )
  SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pMQ105 Auto Const

ReferenceAlias Property Alias_Glory Auto Const

ObjectReference Property pGloryAtCurieMarker Auto Const

ReferenceAlias Property Alias_Caretaker Auto Const

ReferenceAlias Property Alias_GenericRailroad Auto Const

ReferenceAlias Property Alias_NewCurieBody Auto Const

GlobalVariable Property pXPMiscQuestFinal Auto Const

ReferenceAlias Property Alias_CurieSynthName Auto Const

Quest Property pRR101 Auto Const

Scene Property pCOMCurieQuest_400_Operation Auto Const

ObjectReference Property pDoctorAmariLabDoorREF Auto Const

ObjectReference Property pMQ202PlayerChair Auto Const

Quest Property pCOMCurie Auto Const

Quest Property pRRKickOut Auto Const

ReferenceAlias Property Alias_Curie Auto Const

GlobalVariable Property pCOMCurieIsSynth Auto Const

GlobalVariable Property pCOMCurieIsRobot Auto Const

ReferenceAlias Property Alias_FakeCurieRobot Auto Const

Quest Property pFollowers Auto Const

GlobalVariable Property PCOMCuriePlayerKnowsDoctorAmari Auto Const

Outfit Property pResidentFlannelShirtAndJeans Auto Const

Keyword Property pPlayerCanStimpak Auto Const

ActorValue Property pCA_Affinity Auto Const

GlobalVariable Property pCurie_AffinityCondition_PlayerCompletedQuest Auto Const

Keyword Property p_AttachSlot2 Auto Const

Keyword Property p_AttachPassenger Auto Const

Faction Property pDisallowedCompanionFaction Auto Const

ReferenceAlias Property Alias_ImmortalCaretaker Auto Const

Weapon Property PCompCurieLaserGun Auto Const Mandatory

Outfit Property pCurieHumanOutfit Auto Const Mandatory

ObjectReference Property pMQ105PlayerMemoryLoungerInstantEnter Auto Const Mandatory

Quest Property pRR102 Auto Const Mandatory
