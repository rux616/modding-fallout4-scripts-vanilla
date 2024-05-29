Scriptname DLC01:DLC01MQ01Script extends Quest

;ReferenceAlias property Alias_Robot auto const mandatory
;ReferenceAlias property Alias_CenterMarker auto const mandatory
;ReferenceAlias property Alias_Trigger auto const mandatory
;ReferenceAlias Property Alias_Robot01 Auto Const
;ReferenceAlias Property Alias_Robot02 Auto Const
;Keyword property DLC01MQRadiantKeyword auto const mandatory

;function MoveRobot(ObjectReference newCenterMarker, ObjectReference newTrigger);
;	; update aliases and move robots to new spot
;	if newCenterMarker && newTrigger
;		debug.trace(self + " moving robot to new marker " + newCenterMarker)
;		Alias_CenterMarker.ForceRefTo(newCenterMarker)
;		Alias_Trigger.ForceRefTo(newTrigger)
;	
;		Actor Robot01 = Alias_Robot01.GetActorRef()
;		if Robot01.Is3DLoaded() == false && Robot01.IsDead() == false
;			Robot01.MoveTo(newCenterMarker, 250, 0, 0, false)
;			Robot01.EvaluatePackage(true)
;		endif
;		Actor Robot02 = Alias_Robot02.GetActorRef()
;		if Robot02.Is3DLoaded() == false && Robot02.IsDead() == false
;			Robot02.MoveTo(newCenterMarker, -250, 0, 0, false)
;			Robot02.EvaluatePackage(true)
;		endif
;		Actor Robot = Alias_Robot.GetActorRef()
;		if Robot.Is3DLoaded() == false && robot.IsDead() == false
;			Robot.MoveTo(newCenterMarker)
;			Robot.EvaluatePackage(true)
;		endif
;	endif
;endFunction


