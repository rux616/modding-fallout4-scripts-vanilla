;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Site04_RobotConversation_001476F6 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN AUTOCAST TYPE MQ106InvestigationsScript
MQ106InvestigationsScript kmyQuest = GetOwningQuest() as MQ106InvestigationsScript
;END AUTOCAST
;BEGIN CODE
site04_JabberingRobot.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_Begin
Function Fragment_Phase_07_Begin()
;BEGIN CODE
if player.GetActorRef().PlayIdleWithTarget(PairedDogmeatHumanInspectObject, Dogmeat.GetActorRef())
  debug.trace(self + "Player/Dogmeat anim SUCCESSFUL")
Else
  debug.trace(self + "Player/Dogmeat anim FAILED")
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Player Auto Const

ReferenceAlias Property Dogmeat Auto Const

Idle Property PairedDogmeatHumanInspectObject Auto Const

Scene Property Site04_JabberingRobot Auto Const
