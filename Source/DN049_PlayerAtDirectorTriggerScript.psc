Scriptname DN049_PlayerAtDirectorTriggerScript extends ObjectReference Hidden Conditional
{Script for the Director's trigger in DN049. Like the store triggers, but performs some different operations.}

Quest property DN049 Auto Const Mandatory
{DN049}

ReferenceAlias property Director Auto Const Mandatory
{The DN049 Director.}

Scene property DN049_Director_800_Radio Auto Const Mandatory
{The DN049 Director's PA scene.}

ObjectReference property DN049_HandyAccessPanel Auto Const Mandatory
{The access panel on the Mr. Handy statue.}

ObjectReference property DN049_GenAtomicsGiantHandyLift Auto Const Mandatory
{The lift elevator.}

ObjectReference property DN049_GenAtomicsGiantHandyLiftTrackingMarker Auto Const Mandatory
{Marker that moves along with the lift elevator. Used to perform the height checks, since the lift itself is attachref'd and its position doesn't change.}

Event OnCellAttach()
	;Debug.Trace("OnCellAttach Received")
	StartTimer(0.5, 1)
EndEvent

Event OnCellDetach()
	;Debug.Trace("OnCellDetach Received")
	CancelTimer(1)
EndEvent

Event OnTimer(int timerID)
	if (timerID == 1)
		UpdateAccessPanel()
		StartTimer(0.5, 1)
	EndIf
EndEvent

Function UpdateAccessPanel()
	;DN049_GenAtomicsGiantHandyLiftTrackingMarker.MoveToNode(DN049_GenAtomicsGiantHandyLift, "REF_ATTACH_NODE")
	;Debug.Trace("Elevator Marker Position: " + DN049_GenAtomicsGiantHandyLiftTrackingMarker.GetPositionZ() + ", " + Self.GetTriggerObjectCount() + ", " + DN049_HandyAccessPanel.GetOpenState())
	if ((DN049_GenAtomicsGiantHandyLiftTrackingMarker.GetPositionZ() > 2215) && (DN049_HandyAccessPanel.GetOpenState() == 3))
		DN049_HandyAccessPanel.SetOpen(True)
	ElseIf ((DN049_GenAtomicsGiantHandyLiftTrackingMarker.GetPositionZ() <= 2215) && (Self.GetTriggerObjectCount() == 0) && (DN049_HandyAccessPanel.GetOpenState() == 1))
		DN049_HandyAccessPanel.SetOpen(False)
	EndIf
EndFunction

Event OnTriggerEnter(ObjectReference akActionRef)
	DN049_Director_800_Radio.Stop()
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if (!Director.GetActorRef().IsDead())
		DN049_Director_800_Radio.Start()
	EndIf
	UpdateAccessPanel()
EndEvent