;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSM04_000ADCE5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Call Stage 1 to handle the debug setup. This is broken out so Stage 0 works as typically expected.
SetStage(1)

;Move the player to the bridge of the Prydwen.
Game.GetPlayer().MoveTo(BoSMQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Debug quest start.
;Skip BoS100 (Fire Support) and 101 (Call to Arms)
BoS100Fight.SetStage(2)
BoS100.SetStage(255)
BoS101.SetStage(255)
;Skip BoS200 (Training) and BoS201 (Shadow of Steel)
BoS200.SetStage(10)
BoS200.SetStage(20)
BoS200.SetStage(40)
BoS200.SetStage(100)
BoS200.SetStage(200)
BoS200.SetStage(255)
BoS201.SetStage(170)
BoS201.SetStage(255)
BoS202.SetStage(255)
BoS301.SetStage(90)
;Skip the BoSM00 Intro
BoSM00.Start()
BoSM00.SetStage(20)
;Skip BoSM01 and BoSM02
MQ102.SetStage(15)
BoSM01.SetStage(200)
BoSM02.SetStage(12)
BoSM02.SetStage(30)
BoSM02.SetStage(430)
BoSM02.SetStage(430)

;Player in BoS; Training missions, if any, done.
BoSTraining.SetValue(1)
BoSJoined.SetValue(1)
BoSPrydwenArrived.SetValue(1)
BoSPlayerRank.SetValue(2)
BoSKellsIntroDone.SetValue(1)
BoSEnable.SetStage(10)
BoSEnable.SetStage(15)

;Turn on Virgil's Act III dialogue and packages.
MQ206.SetStage(1200)
MQ206.SetStage(2000)

;Move Kells into position.
Actor Kells = Alias_BoSCaptainKells.GetActorRef()
Kells.EvaluatePackage()
Kells.MoveToPackageLocation()

;Move Virgil into position.
Actor Virgil = Alias_Virgil.GetActorRef()
Virgil.Enable()
Virgil.GetActorBase().SetEssential(False)
Virgil.MoveTo(MQ204VirgilInteriorMarkerRef)
Virgil.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Call Stage 1 to handle the debug setup.
SetStage(1)

;Debug warp to Virgil.
Game.GetPlayer().MoveTo(BoSM04VirgilQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
;Call Stage 1 to handle the debug setup.
SetStage(1)

;Debug warp to Virgil.
Game.GetPlayer().MoveTo(BoSM04VirgilQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
;Call Stage 1 to handle the debug setup.
SetStage(1)

;Debug warp to Kells
Game.GetPlayer().MoveTo(BoSMQuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;If this quest is running when the player is kicked out of the Brotherhood, fail and shut down.

;Fail all objectives.
FailAllObjectives()

;Fail the quest (but only if it was visible to the player).
if (GetStage() >= 15)
     SetStage(254)
EndIf

;Quest shuts down.
SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Display 'Speak to Captain Kells'.
SetObjectiveDisplayed(15)

;EVP Kells to stop his forcegreet package before he greets again.
Alias_BoSCaptainKells.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Complete 'Speak to Captain Kells'.
SetObjectiveCompleted(15)

;Display 'Kill Virgil'.
SetObjectiveDisplayed(30)

;EVP Kells to stop his forcegreet package before he greets again.
Alias_BoSCaptainKells.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Switch 'Kill Virgil' to optional.
SetObjectiveDisplayed(30, False)
SetObjectiveDisplayed(80)

;Display 'Report to Captain Kells'.
SetObjectiveDisplayed(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;Complete 'Kill Virgil' or 'Optional: Kill Virgil'
SetObjectiveCompleted(30)
SetObjectiveCompleted(80)

;Display or redisplay 'Report to Captain Kells'.
SetObjectiveDisplayed(90, True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
;EVP Kells to stop his forcegreet package before he greets again.
Alias_BoSCaptainKells.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Give the player their reward.
if (BoSPlayerRank.GetValue() == 2)
     CustomItemQuest.SetStage(200)
ElseIf (BoSPlayerRank.GetValue() == 3)
     CustomItemQuest.SetStage(210)
Else
     CustomItemQuest.SetStage(220)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
;Complete 'Report to Kells'
SetObjectiveCompleted(90)

;Hide 'Kill Virgil (Optional)' if he's not dead.
if (!IsObjectiveCompleted(80))
     SetObjectiveDisplayed(80, False)
EndIf

;Stop Kells from forcegreeting after the conversation is over.
SetStage(95)

;Quest is complete.
CompleteAllObjectives()
CompleteQuest()
SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Cleanup
;Remove Virgil from BoSReservations and allow the game to clean him up when relevant.
BoSRVirgil.Clear()

;Shut down DN053 if Virgil is dead at this point.
if (DN053.GetStageDone(100))
     DN053.SetStage(255)
EndIf

;Shut down.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property BoSRVirgil Auto Const

ReferenceAlias Property Alias_Virgil Auto Const

ReferenceAlias Property Alias_BoSCaptainKells Auto Const

ObjectReference Property BoSMQuickstartMarker Auto Const

GlobalVariable Property BoSKellsIntroDone Auto Const

Quest Property BoSDialogue Auto Const

Faction Property PlayerFaction Auto Const

Faction Property VirgilFaction Auto Const

ObjectReference Property BoSM04VirgilQuickstartMarker Auto Const

Quest Property DN053 Auto Const

Quest Property BoSM00 Auto Const

Quest Property BoS100 Auto Const

Quest Property BoS101 Auto Const

Quest Property BoS200 Auto Const

Quest Property BoS201 Auto Const

GlobalVariable Property BoSTraining Auto Const

GlobalVariable Property BoSJoined Auto Const

GlobalVariable Property BoSPrydwenArrived Auto Const

GlobalVariable Property BoSPlayerRank Auto Const

Quest Property BoS100Fight Auto Const

LeveledItem Property BoSM04_KellsRewardArmor Auto Const

ObjectReference Property MQ204VirgilInteriorMarkerRef Auto Const

Quest Property BoSM04Postquest Auto Const

Quest Property MQ206 Auto Const

Quest Property BoSM01 Auto Const

Quest Property BoSM02 Auto Const

Quest Property BoSEnable Auto Const

LeveledItem Property BoSM04_KellsRewardArmorKnight Auto Const

LeveledItem Property BoSM04_KellsRewardArmorSentinel Auto Const

LeveledItem Property BoSM04_KellsRewardArmorPaladin Auto Const

Quest Property MQ102 Auto Const

Quest Property BoS202 Auto Const

Quest Property BoS301 Auto Const

Quest Property CustomItemQuest Auto Const Mandatory
