;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueDiamondCityEntran_000190BC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;if MQ104 is complete, we must advance forward

If MQ104.GetStageDone(210) == 1
  Setstage(23)
EndIF
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
pDmndIntroSceneLong.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
;Piper has forcegreeted
Alias_PiperAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Piper forcegreet
Alias_PiperAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
SetStage(10)
SetStage(20)
SetStage(25)
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN CODE
SetStage(25)
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
;Piper forcegreet done
Alias_PiperAlias.GetActorRef().EvaluatePackage()

;door opens
Alias_Gate.GetRef().Lock(False)
Alias_Gate.GetRef().SetOpen()

;MQ103 starts up if it hasn't already
If GetStageDone(22) == 0
  pMQ103.SetStage(10)
EndIf

;set global variable for player reaching Diamond City
pPlayerProgressDiamondCity.SetValue(1)

;did the player skip over Codsworth?
If MQ102.GetStageDone(50) == 0
  MQ102SkippedCodsworth.SetValue(1.0)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Piper walks inside
Alias_PiperAlias.GetActorRef().EvaluatePackage()

;make sure stages are cleaned up
SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Player inside maingate
MayorIntroScene.Start()

;advance MQ103
pMQ103.SetStage(20)

;clear up prior stages

SetStage(10)
SetStage(20)
SetStage(25)
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;scene with mayor done
Alias_Mayor.GetActorRef().EvaluatePackage()

;Mayor wall scene starts up and waits unless the main quest is too far along
If MQ206.GetStageDone(2000) == 0
  DialogueDiamondCityMayorWallSpeech.SetStage(3)
Else
  DialogueDiamondCityMayorWallSpeech.SetStage(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0052_Item_00
Function Fragment_Stage_0052_Item_00()
;BEGIN CODE
pFFDiamondCity07.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
; Piper walks back home

;Set MQ103 stage 20 if we haven't already
pMQ103.SetStage(20)

;If the player convinced Mayor McDonough to talk, advance MQ103
If GetStageDone(27) == 1
  pMQ103.SetStage(30)
EndIf

SetStage(52)

;If Hancock is the player's companion and was present for the scene, fire off his comment line
if Alias_Hancock.GetActorRef().IsInFaction(CurrentCompanionFaction) && COMHancockMcDComment.GetValue() == 0
  HancockCommentScene.SetStage(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
; Piper starts her scene with Nat
If GetStageDone(97) == 0
  PiperNatScene.Start()
EndIf

;if player skipped mayor conversation, jump forward
If GetStageDone(50) == 0
  SetStage(400)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
Alias_FemaleNewsReader.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0097_Item_00
Function Fragment_Stage_0097_Item_00()
;BEGIN CODE
PiperNatScene.Stop()
DmndPiperNatScene02.Stop()
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Piper Nat scene done, trigger barks
SetStage(95)

;shut this quest down
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
pMQ103.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetStage(10)
SetStage(30)
SetStage(50)
SetStage(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE DiamondCityEntranceScript
Quest __temp = self as Quest
DiamondCityEntranceScript kmyQuest = __temp as DiamondCityEntranceScript
;END AUTOCAST
;BEGIN CODE
;clear up all the intro packages
SetStage(50)
pIntroSceneDiamondCitySalon.SetStage(100)
pIntroSceneDiamondCityUpperStands.SetStage(100)


;clear up all the intro triggers and open the gate
kmyquest.ClearUpEntrance()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MayorIntroScene  Auto Const  

Scene Property MayorIntroScene3  Auto Const  

Scene Property MayorIntroScene4  Auto Const  

Scene Property PiperNatScene  Auto Const  

ReferenceAlias Property Alias_PiperAlias Auto Const ; Legacy alias property
ReferenceAlias Property Alias_Gate Auto Const ; Legacy alias property
ReferenceAlias Property Alias_Mayor Auto Const ; Legacy alias property

Quest Property pMQ04 Auto Const

Scene Property pDmndIntroSceneLong Auto Const

Scene Property pDmndIntroSceneShort Auto Const

Quest Property pMQ103 Auto Const

Quest Property pFFDiamondCity07 Auto Const

ObjectReference Property pDmndGateREF Auto Const

GlobalVariable Property pPlayerProgressDiamondCity Auto Const

Scene Property p03DmndIntroSceneLoop Auto Const

Quest Property pIntroSceneDiamondCitySalon Auto Const

Quest Property pIntroSceneDiamondCityUpperStands Auto Const

ObjectReference Property pDmndEntrancePiperMoveMarker Auto Const

Quest Property DialogueDiamondCityMayorWallSpeech Auto Const

Quest Property MQ105 Auto Const

GlobalVariable Property MQ105SkippedDiamondCity Auto Const

GlobalVariable Property MQ105DiamondCityWalkaway Auto Const

MiscObject Property Caps001 Auto Const

ReferenceAlias Property Alias_FemaleNewsReader Auto Const

Quest Property MQ102 Auto Const

GlobalVariable Property MQ102SkippedCodsworth Auto Const

Quest Property MQ206 Auto Const

ReferenceAlias Property Alias_Companion Auto Const

ReferenceAlias Property Alias_Hancock Auto Const

Faction Property CurrentCompanionFaction Auto Const

Location Property DiamondCityLocation Auto Const

Quest Property HancockCommentScene Auto Const

GlobalVariable Property COMHancockMcDComment Auto Const

Scene Property DmndPiperNatScene02 Auto Const

Quest Property MQ104 Auto Const
