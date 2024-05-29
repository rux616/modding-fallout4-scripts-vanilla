
;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Site04_Cigar_00157F8B Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN AUTOCAST TYPE MQ106InvestigationsScript
MQ106InvestigationsScript kmyQuest = GetOwningQuest() as MQ106InvestigationsScript
;END AUTOCAST
;BEGIN CODE
if player.GetActorRef().PlayIdleWithTarget(pairedAnim, Dogmeat.GetActorRef())
  debug.trace(self + "Player/Dogmeat anim SUCCESSFUL")
Else
  debug.trace(self + "Player/Dogmeat anim FAILED")
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property PairedAnim Auto Const

ReferenceAlias Property Dogmeat Auto Const

ReferenceAlias Property Player Auto Const
