Scriptname DN045_MonorailScript extends ObjectReference 


Keyword Property DN045_ButtonA auto
Keyword Property DN045_ButtonB auto
Keyword Property DN045_ButtonC auto
Keyword Property DN045_ButtonX auto
Keyword Property DN045_ButtonY auto
Keyword Property DN045_ButtonZ auto

Keyword Property DN045_SoundMarkerA auto
Keyword Property DN045_SoundMarkerB auto
Keyword Property DN045_SoundMarkerC auto

Float Property Speed = 5.0 auto 
Float Property StartPosition = 0.0 auto
{Please enter 0, 0.5, or 1}

ObjectReference CallButtonA
ObjectReference CallButtonB
ObjectReference CallButtonC
ObjectReference CallButtonX
ObjectReference CallButtonY
ObjectReference CallButtonZ

int PositionA
int PositionB
int PositionC

int instanceID

Sound Property OBJTrainMoveLPM Auto const


Event OnCellAttach()

	CallButtonA = getlinkedref(DN045_ButtonA)
	CallButtonB = getlinkedref(DN045_ButtonB)
	CallButtonC = getlinkedref(DN045_ButtonC)
	CallButtonX = getlinkedref(DN045_ButtonX)
	CallButtonY = getlinkedref(DN045_ButtonY)
	CallButtonZ = getlinkedref(DN045_ButtonZ)

	RegisterForRemoteEvent(CallButtonA, "OnActivate")
	RegisterForRemoteEvent(CallButtonB, "OnActivate")
	RegisterForRemoteEvent(CallButtonC, "OnActivate")
	RegisterForRemoteEvent(CallButtonX, "OnActivate")
	RegisterForRemoteEvent(CallButtonY, "OnActivate")
	RegisterForRemoteEvent(CallButtonZ, "OnActivate")


	RegisterforAnimationEvent(Self, "done")

	StartTrain(StartPosition)

	if (StartPosition == 0.0)
		PositionA = 1
		PositionB = 0
		PositionC = 0
	elseif (StartPosition == 0.5)	
		PositionA = 0
		PositionB = 1
		PositionC = 0
	elseif (StartPosition == 1.0)
		PositionA = 0
		PositionB = 0
		PositionC = 1
	endif

EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	debug.Trace("Activated by " + AkSender)
	if (akSender == CallButtonA) || (akSender == CallButtonX)
		Self.SetAnimationVariableFloat("fvalue", 0)
		BlockButtons()
		if (PositionA == 0)
			instanceID = OBJTrainMoveLPM.play(getlinkedref(DN045_SoundMarkerA))    ; play myLoopingSFX sound from my self 		
			PositionA = 1
			PositionB = 0
			PositionC = 0
		endif
		if (self.playanimationandwait("Play01", "done") == TRUE)
			Sound.StopInstance(instanceID)
		endif
	elseif (AkSender == CallButtonB) || (akSender == CallButtonY)
		Self.SetAnimationVariableFloat("fvalue", 0.5)
		BlockButtons()
		if (PositionB == 0)
			instanceID = OBJTrainMoveLPM.play(getlinkedref(DN045_SoundMarkerB))    ; play myLoopingSFX sound from my self 		
			PositionA = 0
			PositionB = 1
			PositionC = 0
		endif
		if (self.playanimationandwait("Play01", "done") == TRUE)
			Sound.StopInstance(instanceID)
		endif
	elseif (AkSender == CallButtonC) || (akSender == CallButtonZ)
		Self.SetAnimationVariableFloat("fvalue", 1)
		BlockButtons()
		if (PositionC == 0)
			instanceID = OBJTrainMoveLPM.play(getlinkedref(DN045_SoundMarkerC))    ; play myLoopingSFX sound from my self 		
			PositionA = 0
			PositionB = 0
			PositionC = 1
		endif
		if (self.playanimationandwait("Play01", "done") == TRUE)
			Sound.StopInstance(instanceID)
		endif
	endif

EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if (akSource == self) && (asEventName == "done")
    	debug.Trace(aksource + " is " + asEventName)
    	BlockButtons(False)
    endif
EndEvent

Function BlockButtons( bool ShouldBlock = True)

	if ShouldBlock == True
		CallButtonA.BlockActivation(True, True)
		CallButtonB.BlockActivation(True, True)
		CallButtonC.BlockActivation(True, True)
		CallButtonX.BlockActivation(True, True)
		CallButtonY.BlockActivation(True, True)
		CallButtonZ.BlockActivation(True, True)
	else
		CallButtonA.BlockActivation(FALSE)
		CallButtonB.BlockActivation(FALSE)
		CallButtonC.BlockActivation(FALSE)
		CallButtonX.BlockActivation(FALSE)
		CallButtonY.BlockActivation(FALSE)
		CallButtonZ.BlockActivation(FALSE)
	endif

EndFunction

Function StartTrain(float akValue)
	self.SetAnimationVariableFloat("fvalue", akValue)
	BlockButtons()
	self.playanimationandwait("Play01", "done")
EndFunction
