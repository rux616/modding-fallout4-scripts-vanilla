Scriptname DN057_FortHagenExtDoorScript extends ObjectReference Hidden
{Script listens for onOpen event and sets a stage}

Quest Property myQuest Auto Const Mandatory
{Quest to set stage on}

Int Property myStage Auto Const Mandatory
{Stage to set when door is opened}

Default2StateActivator myDoor

;**********************************************************

Event OnInit()
    ;myLink = GetLinkedRef()
    myDoor = getLinkedRef() as Default2StateActivator
EndEvent
;**********************************************************

Event OnLoad()
	;RegisterForAnimationEvent(myDoor, "done")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    ;do nothing
EndEvent

;**********************************************************

Auto State Waiting

	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		;received the onOpen event, set the stage
		if(akSource == myDoor && asEventName == "done") && (myDoor.isOpen == true)
			GoToState("DoNothing")
			myQuest.setStage(myStage)
		endif
	EndEvent
EndState

;**********************************************************

State DoNothing
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		;do nothing
	EndEvent
EndState

;**********************************************************