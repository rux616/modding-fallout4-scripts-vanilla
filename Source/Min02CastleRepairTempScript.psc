Scriptname Min02CastleRepairTempScript extends ObjectReference
{temp script for repairing castle radio transmitter
(until power bug is fixed)
}

Quest Property Min02 auto const

MinutemenCentralScript Property MinutemenCentralQuest auto const

Event OnLoad()
	; TEMP - for current (broken) way of doing this where you have to build this object to "repair" the radio transmitter
	Min02.SetStage(570)
EndEvent

Event OnUnload()
	MinutemenCentralQuest.UpdateRadioStationStatus()
EndEvent

; TEMP:
Event OnPowerOn(ObjectReference akPowerGenerator)
	debug.trace(self + " OnPowerOn akPowerGenerator=" + akPowerGenerator)
	Min02.SetStage(580)
	; 
	MinutemenCentralQuest.UpdateRadioStationStatus()
EndEvent

Event OnPowerOff()
	debug.trace(self + " OnPowerOff")
	MinutemenCentralQuest.UpdateRadioStationStatus()
EndEvent
