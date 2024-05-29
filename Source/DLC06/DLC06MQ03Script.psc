Scriptname DLC06:DLC06MQ03Script extends DLC06:DLC06OverseerDeskTrackingScript

ReferenceAlias property Alias_RadioBeacon auto const mandatory 

RefCollectionAlias property Alias_FeralGhouls auto const mandatory 

int property RadioBeaconStage = 400 auto const 
int property RadioBeaconObjective = 300 auto const 

int property InterviewTimerStage = 450 auto const 

float property interviewTimerGameHours = 2.0 auto const 
int property interviewTimerID = 1 auto const 

int property FeralGhoulStage = 110 auto const 

function CheckRadioBeaconStatus()
	debug.TraceStack(self + "CheckRadioBeaconStatus")
	WorkshopObjectScript radioBeaconRef = Alias_RadioBeacon.GetRef() as WorkshopObjectScript 
	; check if already on
	if ( radioBeaconRef.CanProduceForWorkshop() && radioBeaconRef.IsPowered() && radioBeaconRef.GetOpenState() == 3 ) ; closed = ON
		SetStage(RadioBeaconStage)
		; stop watching for activation on radio beacon
		UnregisterForRemoteEvent(radioBeaconRef, "OnActivate")
	else
		SetObjectiveDisplayed(RadioBeaconObjective)
		; watch for activation on radio beacon
		RegisterForRemoteEvent(radioBeaconRef, "OnActivate")
	endif
endFunction

function CheckFeralGhoulStatus()
	debug.trace(self + "CheckFeralGhoulStatus")
	int aliveCount = 0
	int i = 0
	while i < Alias_FeralGhouls.GetCount()
		Actor ghoul = Alias_FeralGhouls.GetAt(i) as Actor
		debug.trace(self + "  " + i + ": " + ghoul)
		if ghoul && ghoul.IsDead() == false 
			aliveCount += 1
		endif 
		i += 1
	endWhile 
	debug.trace(self + "	alivecount=" + alivecount)
	if aliveCount == 0
		SetStage(FeralGhoulStage)
	endif
endFunction 

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActionRef)
	debug.trace(self + " OnActivate from " + akSource)
	WorkshopObjectScript radioBeaconRef = Alias_RadioBeacon.GetRef() as WorkshopObjectScript 
	if radioBeaconRef == akSource 
		CheckRadioBeaconStatus()
	endif    
EndEvent

function StartInterviewTimer()
	StartTimerGameTime(interviewTimerGameHours, interviewTimerID)
endFunction

Event OnTimerGameTime(int aiTimerID)
    if aiTimerId == interviewTimerID
    	SetStage(InterviewTimerStage)
    endif
EndEvent
