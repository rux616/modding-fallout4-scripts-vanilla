Scriptname Inst307QuestScript extends Quest Conditional Hidden

Int Property Generator1Disabled Auto Conditional	

Int Property Generator2Disabled Auto Conditional

Int Property Generator3Disabled Auto Conditional

InputEnableLayer Inst307Layer

Function ControlToggle(int togglevalue)

	if togglevalue == 0

		Inst307Layer = InputEnablelayer.Create()
		Inst307Layer.EnableFastTravel(False)
		Inst307Layer.DisablePlayerControls()


	elseif togglevalue == 1

		Inst307Layer.EnableFastTravel(True)
		Inst307Layer.Delete()
		Inst307Layer.EnablePlayerControls()

	endif

EndFunction

Function BeaconUpdate()

int Count

Count += 1
if Count >= 2
SetObjectiveCompleted(40)

endif



endFunction
Int Property PlayerRelayedToAirport Auto Conditional
