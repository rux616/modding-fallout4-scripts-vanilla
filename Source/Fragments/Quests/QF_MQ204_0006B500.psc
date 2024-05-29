;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ204_0006B500 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;swap memory loungers
MQ203LoungerInstantEnterEnableMarker.Disable()

;move Doctor Amari in position
Alias_DoctorAmari.GetActorRef().Moveto(MQ203DoctorAmariMarker)

;finish last quest and start this one, also moves the player
MQ203.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_Virgil.GetReference().Enable()

; KMK- moved here from end of MQ202
; WJS - this is now handled on the Quest Completed stage
;Game.RewardPlayerXP(XPActTwoFinal.GetValue() as int)

MQ203.SetStage(1100)
; KMK - added when moving MQ203 objective to MQ202
MQ202.SetObjectiveCompleted(110)
MQ202.SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
MQ204DoctorAmariWakeUpScene.Start()

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_MQ204Virgil)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
MQ202.SetStage(320)
SetObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
MQ202NickPostSurgery.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(15)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;SetObjectiveCompleted(20)
;SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()
MQ205.setStage(10)
;if player hasn't picked up Nick yet, advance the quest
If MQ202NickPostSurgery.GetStageDone(100) == 0
  MQ202NickPostSurgery.SetStage(95)
EndIf

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MQ204DoctorAmariScene Auto Const

ReferenceAlias Property Alias_DoctorAmari Auto Const

ObjectReference Property MQ203DoctorAmariMarker Auto Const

ObjectReference Property MQ203MemoryDenReturnMarker Auto Const

Quest Property MQ203 Auto Const

Scene Property MQ204DoctorAmariWakeUpScene Auto Const

ObjectReference Property GlowingSeaEdgeMapMarker Auto Const

ReferenceAlias Property Alias_Virgil Auto Const

Quest Property MQ205 Auto Const

GlobalVariable Property XPActTwoFinal Auto Const

Quest Property MQ202NickPostSurgery Auto Const

ObjectReference Property MQ203LoungerInstantEnterEnableMarker Auto Const

Quest Property MQ202 Auto Const

ActorValue Property COMQC_MQ204Virgil Auto Const
