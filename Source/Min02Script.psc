Scriptname Min02Script extends WorkshopEventsQuestScript Conditional


bool initialized = false
WorkshopEventsQuestScript myWorkshopEvents

; called once by startup stage
function InitializeQuest()
	if initialized
		return
	endif

	myWorkshopEvents = (self as Quest) as WorkshopEventsQuestScript

	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	RegisterForRemoteEvent(Alias_PrestonGarvey.GetActorRef(), "OnLocationChange")
	RegisterForRemoteEvent(Alias_RadioTransmitter.GetRef(), "OnPowerOn")
endFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    if akSender == Game.GetPlayer()
    	if akNewLoc == TheCastleLocation && GetStageDone(50) == true && GetStageDone(70) == false
    		SetStage(70)
    	endif
    endif
EndEvent

Event ObjectReference.OnPowerOn(ObjectReference akSender, ObjectReference akPowerGenerator)
	debug.trace(self + " OnPowerOn")
	CheckRadioTransmitterStatus()
endEvent

; override parent event
Event WorkshopParentScript.WorkshopActorAssignedToWork(WorkshopParentScript akSender, Var[] akArgs)
	debug.trace(self + " WorkshopActorAssignedToWork")
	CheckRadioTransmitterStatus()
EndEvent

function CheckRadioTransmitterStatus()
	WorkshopObjectScript radioTransmitter = Alias_RadioTransmitter.GetRef() as WorkshopObjectScript

	; failsafe - if 570 has already happened, reassign radio operator first
	if GetStageDone(570)
		; assign radio operator
		WorkshopNPCScript npc = RadioOperator.GetRef() as WorkshopNPCScript
		debug.trace(self + " radioman=" + npc)
		debug.trace(self + " transmitter =" + radioTransmitter )
		debug.trace(self + " MIN02: assigning radioman " + npc + " to transmitter " + radioTransmitter)
		WorkshopParent.AssignActorToObjectPUBLIC(npc, radioTransmitter)
	endif

	CastleRadioTransmitterScript tempTransmitter = Alias_RadioTransmitter.GetRef() as CastleRadioTransmitterScript
	if radioTransmitter.CanProduceForWorkshop()
		setStage(600)
	endif
endFunction


ReferenceAlias Property Alias_PrestonGarvey Auto Const

ReferenceAlias Property Alias_RadioTransmitter Auto Const

GlobalVariable Property Min02BattlePlan Auto Const
GlobalVariable Property Min02PlanB Auto Const

Location Property TheCastleLocation Auto Const
ReferenceAlias Property RadioOperator Auto Const
