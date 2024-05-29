;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFGoodneighbor01_00108EC0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Alias_Irma.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

Alias_PlayerMemoryLounger.GetRef().BlockActivation(True, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE FFGoodneighbor01Script
Quest __temp = self as Quest
FFGoodneighbor01Script kmyQuest = __temp as FFGoodneighbor01Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)

;ghost Doctor Amari
Alias_DoctorAmari.GetActorRef().SetGhost()

;ghost Irma
Alias_Irma.GetActorRef().SetGhost()

;lock controls
Alias_PlayerMemoryLounger.GetRef().BlockActivation(True, True)
kmyquest.myEnableLayer = InputEnableLayer.Create()
kmyquest.myEnableLayer.DisablePlayerControls()

Alias_PlayerMemoryLounger.GetRef().Activate(Game.GetPlayer(), True)

;enable preloader doors
FFGoodneighbor01MemorySequence.SetStage(5)

FFGoodneighbor01_02_LoungerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;set global value that the player is skipping ahead to MQ105
MQ105SkippedToDen.SetValueInt(1)
FFGoodneighbor01MemorySequence.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN AUTOCAST TYPE FFGoodneighbor01Script
Quest __temp = self as Quest
FFGoodneighbor01Script kmyQuest = __temp as FFGoodneighbor01Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;delete the input layer so we aren't locking any controls
kmyquest.myEnableLayer = None

;unghost people
;ghost Doctor Amari
Alias_DoctorAmari.GetActorRef().SetGhost(False)

;ghost Irma
Alias_Irma.GetActorRef().SetGhost(False)

Alias_Irma.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
FFGoodneighbor01_03_MemoryWakeup.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;push player out of furniture
Alias_MemoryDenInstantEnterLounger.GetRef().Activate(Game.GetPlayer(), True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

;no longer need Memory quest running; disable preloader doors; enable player controls
FFGoodneighbor01MemorySequence.Stop()

;make sure we kick the player out
SetStage(70)

;Irma Forcegreets
Alias_Irma.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Caps001, 100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;Game.RewardPlayerXP(XPActOneFinal.GetValue() as int)

MQ103.SetStage(30)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE FFGoodneighbor01Script
Quest __temp = self as Quest
FFGoodneighbor01Script kmyQuest = __temp as FFGoodneighbor01Script
;END AUTOCAST
;BEGIN CODE
;if we stop this quest for any reason, pull the objectives
SetObjectiveDisplayed(10, abDisplayed = False)

;delete the input layer so we aren't locking any controls
kmyquest.myEnableLayer = None
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ105 Auto Const

GlobalVariable Property MQ105SkippedToDen Auto Const

ReferenceAlias Property Alias_PlayerMemoryLounger Auto Const

Scene Property FFGoodneighbor01_02_LoungerScene Auto Const

ReferenceAlias Property Alias_Irma Auto Const

GlobalVariable Property XPActOneSmall Auto Const

GlobalVariable Property XPActOneFinal Auto Const

Quest Property FFGoodneighbor01MemorySequence Auto Const

ReferenceAlias Property Alias_MemoryDenInstantEnterLounger Auto Const

Scene Property FFGoodneighbor01_03_MemoryWakeup Auto Const

MiscObject Property Caps001 Auto Const

Quest Property MQ103 Auto Const

ReferenceAlias Property Alias_DoctorAmari Auto Const Mandatory
