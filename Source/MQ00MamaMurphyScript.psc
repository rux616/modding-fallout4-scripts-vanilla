Scriptname MQ00MamaMurphyScript extends Quest Conditional

;tracker for when the Sight is unavailable
int property var_SightRest Auto Conditional

;tracker for when Mama Murphy is in the chair
int property var_MamaInChair Auto Conditional

;tracker for when Mama Murphy will talk about going off chems again
int property var_GoingCleanAttempt Auto Conditional

WorkshopParentScript Property WorkshopParent Auto Const

ReferenceAlias Property MamaMurphy Auto

Furniture Property NPCChairMamaMurphy Auto

int UsedSightTimerID = 10
int GoCleanTimerID = 20

;Sight is unavailable for a while after using it
Function UsedSight()
	var_SightRest = 1
	StartTimerGameTime(8, UsedSightTimerID)
EndFunction

Function GoCleanAttempt()
	var_GoingCleanAttempt = 1
	StartTimerGameTime(8, GoCleanTimerID)
EndFunction

Event OnTimerGameTime(int aiTimerID)
	if aiTimerID == UsedSightTimerID
		var_SightRest = 0
	EndIf

	if aiTimerID == GoCleanTimerID
		var_GoingCleanAttempt = 0
	EndIf
EndEvent

Event Actor.OnSit(Actor akSender, ObjectReference akFurniture)
	If akSender == MamaMurphy.GetActorRef()
		If (akFurniture.GetBaseObject() as Furniture) == NPCChairMamaMurphy
			var_MamaInChair = 1
		EndIf
	EndIf
EndEvent

Event Actor.OnGetup(Actor akSender, ObjectReference akFurniture)
	If akSender == MamaMurphy.GetActorRef()
		If (akFurniture.GetBaseObject() as Furniture) == NPCChairMamaMurphy
			var_MamaInChair = 0
		EndIf
	EndIf
EndEvent

function AssignToChair(WorkshopObjectScript theChair)
	debug.trace(self + " AssignToChair " + theChair)
	WorkshopNPCScript mama = MamaMurphy.GetRef() as WorkshopNPCScript
	if theChair
		; Mama Murphy not commandable any more
		mama.SetCommandable(false)
		; assign Mama Murphy to the chair
		WorkshopParent.AssignActorToObjectPUBLIC(mama, theChair)		

		;need to know whenever Mama Murphy finishes sitting or leaves
		RegisterForRemoteEvent(MamaMurphy.GetActorRef(), "OnSit")
		RegisterForRemoteEvent(MamaMurphy.GetActorRef(), "OnGetup")
	else
		; Mama Murphy not commandable any more
		mama.SetCommandable(true)
		;clear registration
		UnRegisterForRemoteEvent(MamaMurphy.GetActorRef(), "OnSit")
		UnRegisterForRemoteEvent(MamaMurphy.GetActorRef(), "OnGetup")
	endif
endFunction

