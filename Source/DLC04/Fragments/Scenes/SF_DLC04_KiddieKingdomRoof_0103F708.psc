;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04_KiddieKingdomRoof_0103F708 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN AUTOCAST TYPE DLC04:DLC04KiddieKingdomMainQuestScript
DLC04:DLC04KiddieKingdomMainQuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04KiddieKingdomMainQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetRoofElevatorDisabled()
game.StartDialogueCameraOrCenterOnTarget(Alias_Oswald.GetActorRef())
GetOwningQuest().SetStage(715)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Oswald Auto Const
