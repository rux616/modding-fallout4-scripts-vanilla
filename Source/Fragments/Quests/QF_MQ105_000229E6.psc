;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ105_000229E6 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;move Nick into position
Alias_NickValentine.GetActorRef().MoveTo(MQ104NickEscortMarker08)

;clean up diamond city
DialogueDiamondCityEntrance.SetStage(50)
DialogueDiamondCityEntrance.SetStage(55)
DialogueDiamondCityEntrance.SetStage(1000)
MQ104.Setstage(110)
MQ104.Setstage(120)
;add Dogmeat
;pDogmeatQuest.SetStage(1)
;Alias_Dogmeat.GetActorRef().EvaluatePackage()
;Alias_Dogmeat.GetActorRef().Moveto(MQ105DogmeatMoveToMarker)

;move Piper
Alias_Piper.GetActorRef().MoveTo(MQ105PiperTravelMayorMarker01)

Game.GetPlayer().moveto(MQ105PlayerStartMarker)

;SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

MQ105_001_NickEscortToDiamondCity.Start()

;Alias_NickValentine.GetActorRef().SetPlayerTeammate(abCanDoFavor=False)

;scene with Nick and Ellie can now play
MS07Intro.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Alias_NickValentine.GetActorRef().SetPlayerTeammate(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(15)

Alias_NickValentine.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0027_Item_00
Function Fragment_Stage_0027_Item_00()
;BEGIN CODE
MUSSpecialMQ201PiperNick.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(15)
SetObjectiveDisplayed(20)


Alias_Ellie.GetActorRef().EvaluatePackage()
Alias_NickValentine.GetActorRef().EvaluatePackage()

;if player is already sitting, advance quest
If (Alias_Player as MQ105PlayerScript).PlayerInInterviewChair==1
  SetStage(40)
  SetStage(42)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0042_Item_00
Function Fragment_Stage_0042_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

MQ105_002_NickInterview01.Start()

SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
; if player has also described kidnappers, move forward
If GetStageDone(47) == 1
  SetStage(50)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0047_Item_00
Function Fragment_Stage_0047_Item_00()
;BEGIN CODE
; if player has also described Shaun, move forward
If GetStageDone(45) == 1
  SetStage(50)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)

;Nick starts escorting to house
MQ105_003_NickEscortHouse.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0062_Item_00
Function Fragment_Stage_0062_Item_00()
;BEGIN CODE
;make sure Nick isn't in the way
Alias_NickValentine.GetActorRef().moveto(MQ105NickOutsideHisOfficeMarker)

;make sure the Mayor isn't still waiting for the speech
If DialogueDiamondCityMayorWallSpeech.IsRunning()
  DialogueDiamondCityMayorWallSpeech.SetStage(100)
EndIf

Alias_MayorMcDonough.GetActorRef().moveto(MayorMcDonoughStandMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(60)

;move Piper unless she's a companion
Actor PiperREF = Alias_Piper.GetActorRef()
If PiperREF.IsInFaction(CurrentCompanionFaction) == 0
   PiperREF.MoveTo(MQ105PiperTravelMayorMarker01)
EndIf

;make sure elevator is on the ground
If (Alias_DmndElevatorController.GetRef() as DiamondCityElevatorScript).ElevatorAtTop == True
  (Alias_DmndElevatorController.GetRef() as DiamondCityElevatorScript).MoveElevatorDown()
EndIf

;if the player already has the key, jump forward
If Game.GetPlayer().GetItemCount(DmndKelloggKey) >= 1
  SetStage(300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
;start scene unless Piper is with you
Actor PiperREF = Alias_Piper.GetActorRef()
If PiperREF.IsInFaction(CurrentCompanionFaction) == 0
   pMQ105_003_GenevaScene.Start()
Else
  SetStage(170)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Alias_Piper.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
;Piper leaves
Alias_Piper.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0177_Item_00
Function Fragment_Stage_0177_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(pCaps001, 250)
Alias_Geneva.GetActorRef().AddItem(pCaps001, 250)
SetStage(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
;Game.GetPlayer().AddItem(pDmndKelloggKey)

;enable the copy on her desk
Alias_GenevaKeyCopy.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;If Hancock is your companion, do we want him to comment on McDonough
if Alias_Hancock.GetActorRef().IsInFaction(CurrentCompanionFaction) && COMHancockMcDComment.GetValue() == 0
  HancockCommentScene.SetStage(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(pDmndKelloggKey)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)

Alias_NickValentine.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
;warp Nick
Alias_NickValentine.GetActorRef().MoveTo(MQ105KelloggHouseNickMovetoMarker)

MQ105_003_NickEscortHouse.Stop()

pMQ105_013_KelloggHouseIntro.Start()

;enable items on table
MQ105KelloggItemsEnableMarker.Enable()

SetObjectiveCompleted(40)
SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)

;if the secret door is already open, move forward
ObjectReference secretDoor = Alias_KelloggSecretDoor.GetRef()
int openState = secretDoor.GetOpenState()
If (openState == 1) || (openState == 2)
  SetStage(320)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
ObjectReference MySecretDoor = Alias_KelloggSecretDoor.GetRef()
MySecretDoor.Lock(False)
MySecretDoor.SetOpen()

pMQ105_013_KelloggHouseIntro.Stop()
MQ105_014_SecretDoorOpened.Start()

;89791 - make sure Kellogg's desk doesn't stay blocked forever
Alias_KelloggDesk.GetRef().BlockActivation(false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
MQ105_014_SecretDoorOpened.Stop()
MQ105_015_PlayerSearchTable.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;trigger forcegreet
Alias_NickValentine.GetActorRef().EvaluatePackage()

;give player cigar
Game.GetPlayer().AddItem(Alias_KelloggItem08.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70)
SetObjectiveCompleted(75)
SetObjectiveDisplayed(80)

;clear up Dogmeat intro scene if we haven't already, DogmeatQuest allows repeated stages, so check them
If DogmeatQuest.GetStageDone(1) == 0
  DogmeatQuest.SetStage(1)
EndIf

;Dogmeat's name is known if it wasn't already
If DogmeatQuest.GetStageDone(2) == 0
  DogmeatQuest.SetStage(2)
EndIf

Actor DogmeatREF = Alias_Dogmeat.GetActorRef()

;Dogmeat is now dismissed until this quest is over
DogmeatREF.DisallowCompanion(SuppressDismissMessage=True)

;handle Dogmeat activation
DogmeatREF.SetActivateTextOverride(MQ105DogmeatActivationText)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_01
Function Fragment_Stage_0410_Item_01()
;BEGIN CODE
;if Dogmeat isn't following the player, move him outside
Alias_Dogmeat.GetActorRef().MoveTo(MQ106DogmeatIntroMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0415_Item_00
Function Fragment_Stage_0415_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70)
SetObjectiveDisplayed(75)

;if player doesn't have Dogmeat at this point, he goes to his MQ106 intro state
If (DogmeatQuest.GetStageDone(1) == 0) && (DogmeatQuest.GetStageDone(500) == 0)
  DogmeatQuest.SetStage(500)
EndIf

;move Dogmeat outside
Alias_Dogmeat.GetActorRef().EvaluatePackage()
Alias_Dogmeat.GetActorRef().MoveTo(MQ106DogmeatIntroMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
MQ105_019_DogmeatScene.Start()

Alias_Dogmeat.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
;Dogmeat is now a companion
;DogmeatQuest.SetStage(1)

;Dogmeat's name is known
;DogmeatQuest.SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
Alias_NickValentine.GetActorRef().SetAvailableToBeCompanion()
Alias_NickValentine.GetActorRef().EvaluatePackage()

;update objectives
SetStage(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
(pFollowers as FollowersScript).SetCompanion(Alias_NickValentine.GetActorRef())

;also set him to be available as a companion later
SetStage(510)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Actor DogmeatREF = Alias_Dogmeat.GetActorRef()
DogmeatREF.BlockActivation(False)
DogmeatREF.SetActivateTextOverride(None)
DogmeatREF.IgnoreFriendlyHits()

;quest end
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
MQ106.SetStage(10)

;make sure Nick is available to be a companion if for some reason we missed that
SetStage(510)

;Update Global for Radio News
RadioDCMQ105Ready.SetValue((GameDaysPassed.GetValue() + 1))

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Quest Property MQ106 Auto Const

ReferenceAlias Property Alias_NickValentine Auto Const

ObjectReference Property pMayorOfficeLockedDoorREF Auto Const

Scene Property pMQ105_003_GenevaScene Auto Const

ReferenceAlias Property Alias_Piper Auto Const

ReferenceAlias Property Alias_MayorMcDonough Auto Const

Key Property pDmndKelloggKey Auto Const

MiscObject Property pCaps001 Auto Const

Scene Property pMQ105_013_KelloggHouseIntro Auto Const

Faction Property pHasBeenCompanionFaction Auto Const

Quest Property pFollowers Auto Const

ReferenceAlias Property Alias_Dogmeat Auto Const

ObjectReference Property MQ105DogmeatMoveToMarker Auto Const

Quest Property DialogueDiamondCityEntrance Auto Const

ObjectReference Property MQ105PiperTravelMayorMarker01 Auto Const

Quest Property MQ104 Auto Const

Quest Property MQ103 Auto Const

Quest Property DogmeatQuest Auto Const

ObjectReference Property MQ106DogmeatIntroMarker Auto Const

Scene Property MQ105_019_DogmeatScene Auto Const

ReferenceAlias Property Alias_KelloggSecretDoor Auto Const

Scene Property MQ105_014_SecretDoorOpened Auto Const

Scene Property MQ105_015_PlayerSearchTable Auto Const

ReferenceAlias Property Alias_KelloggItem08 Auto Const

Quest Property MQ101KelloggSequence Auto Const

SPELL Property MQ203PlayerInvisibility Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property RadioDCMQ105Ready Auto Const

Key Property DmndKelloggKey Auto Const

Scene Property MQ105_001_NickEscortToDiamondCity Auto Const

ObjectReference Property MQ104NickEscortMarker08 Auto Const

ObjectReference Property MQ105PlayerStartMarker Auto Const

Quest Property MS07Intro Auto Const

ObjectReference Property NickOfficeMovetoMarker Auto Const

ReferenceAlias Property Alias_Ellie Auto Const

Faction Property CurrentCompanionFaction Auto Const

ObjectReference Property MQ105KelloggItemsEnableMarker Auto Const

ObjectReference Property MQ105KelloggHouseNickMovetoMarker Auto Const

Scene Property MQ105_003_NickEscortHouse Auto Const

ReferenceAlias Property Alias_DmndElevatorController Auto Const

MiscObject Property Caps001 Auto Const

ReferenceAlias Property Alias_Geneva Auto Const

ObjectReference Property MQ105NickOutsideHisOfficeMarker Auto Const

Scene Property MQ105_002_NickInterview01 Auto Const

ObjectReference Property MayorMcDonoughStandMarker Auto Const

Quest Property DialogueDiamondCityMayorWallSpeech Auto Const

Message Property MQ105DogmeatActivationText Auto Const

Scene Property MQ105_021_DogmeatScene Auto Const

ReferenceAlias Property Alias_Hancock Auto Const

Quest Property HancockCommentScene Auto Const

GlobalVariable Property COMHancockMcDComment Auto Const

ReferenceAlias Property Alias_Player Auto Const

Quest Property Followers Auto Const Mandatory

MusicType Property MUSSpecialMQ201PiperNick Auto Const Mandatory

ReferenceAlias Property Alias_GenevaKeyCopy Auto Const Mandatory

ReferenceAlias Property Alias_KelloggDesk Auto Const Mandatory
