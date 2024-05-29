Scriptname DN151_CircuitBreakerScript extends DN151_WaterObject Hidden
{Script for the DN151 water puzzle circuit breaker controller.}
;
;All DN151_CircuitBreakerScripts live on the same object as a CircuitBreakerMasterScript. They allow the CircuitBreakerMasterScript to manage the 
;breaker state as usual, and provide special handling specific to this dungeon-- toggling circuit breaker states based on
;the water level, calling quest functions when the player presses uses the breaker, etc.

Group Required_Properties
	int property DeactivateIfAboveThisHeight = -1 Auto Const
	{If >=0, set the circuit breaker to inactive if the water is above this height. Set it active when the water falls below this height.}

	Keyword property LinkCustom05 Auto Const Mandatory
	{Link to the circuit breaker's sparks vfx.}
EndGroup

Group Pump_Properties
	DN151_TrackingQuestScript property DN151_Tracking Auto Const Mandatory
	{DN151 Tracking Quest}

	ObjectReference property myPump Auto Const Mandatory
	{The associated water pump.}

	int property myPumpID Auto Const Mandatory
	{The associated water pump's ID. 1-4 for flood pumps, 5 for main.}
EndGroup
bool pumpIsActive	;Has the player activated this pump?

CircuitBreakerMasterScript myCircuitBreaker ;Self cast to a CircuitBreakerMasterScript.


Event OnInit()
	myCircuitBreaker = (Self as ObjectReference) as CircuitBreakerMasterScript
EndEvent

Function PerformWaterUpdateActions(int waterStage, float waterZ)
	;In this context, 'DenyOnPosition' is used when the breaker is submerged.
	if ((waterZ > DeactivateIfAboveThisHeight) && !myCircuitBreaker.DenyOnPosition && !pumpIsActive)
		myCircuitBreaker.DenyOnPosition = True
		Self.GetLinkedRef(LinkCustom05).Disable()
	ElseIf ((waterZ <= DeactivateIfAboveThisHeight) && myCircuitBreaker.DenyOnPosition && !pumpIsActive)
		myCircuitBreaker.DenyOnPosition = False
		Self.GetLinkedRef(LinkCustom05).Enable()
	EndIf
EndFunction

;Activate the water pump associated with this breaker.
Function ActivatePump()
	pumpIsActive = True
	DN151_Tracking.ActivatePump(myPump, myPumpID)
	Self.GetLinkedRef(LinkCustom05).Disable()
EndFunction