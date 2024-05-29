;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ103_000229E5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
If GetStageDone(30) == 0
  SetObjectiveDisplayed(10, 1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
If (GetStageDone(30) == 0) && (GetStageDone(100) == 0)
  SetObjectiveCompleted(10, 1)
  SetObjectiveDisplayed(20, 1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
MQ103DetectiveSignScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
If (GetStageDone(100) == 0)
  SetObjectiveCompleted(20, 1)
  SetObjectiveDisplayed(30, 1)
EndIf

;Reward XP
;Game.RewardPlayerXP(XPActOneSmall.GetValue() as int)

Alias_DetectiveSign01.GetRef().Disable()
Alias_DetectiveSign02.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()
pMQ104.SetStage(10)

;make sure all prior stages are set
SetStage(20)
SetStage(30)

;RewardXP
;Game.RewardPlayerXP(XPActOneFinal.GetValue() as int)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_DetectiveSign01.GetRef().Disable()
Alias_DetectiveSign02.GetRef().Disable()

;did the player skip over Codsworth?
If MQ102.GetStageDone(50) == 0
  MQ102SkippedCodsworth.SetValue(1.0)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pMQ104 Auto Const

ReferenceAlias Property Alias_Ellie Auto Const

Quest Property MQ102 Auto Const

Scene Property MQ103DetectiveSignScene Auto Const

ReferenceAlias Property Alias_DetectiveSign01 Auto Const

ReferenceAlias Property Alias_DetectiveSign02 Auto Const

GlobalVariable Property MQ102SkippedCodsworth Auto Const
