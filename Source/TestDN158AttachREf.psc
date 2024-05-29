Scriptname TestDN158AttachREf extends ObjectReference

Keyword Property LinkCustom01 auto

Event onLoad()
	MyPitchControl = getLinkedRef(LinkCustom01)
	MyRollControl = getLinkedRef()
EndEvent

Event OnActivate(objectReference akActivator)
	EvasiveManeuvers()
endEvent

bool property evasiveManeuversActive = false auto hidden

Function StartEvasiveManeuvers()
	evasiveManeuversActive = true
	EvasiveManeuvers()
endFunction

Function EndEvasiveManeuvers()
	evasiveManeuversActive = false
	TravelSway()
endFunction

Function EvasiveManeuvers()
	int ud
	int lr
	string newPitch
	string newRoll
	ud = utility.randomInt(-3, 3)
	lr = utility.randomInt(-6,6)
	newPitch = ud as string
	newRoll = lr as string
	SetBearing(NewPitch, NewRoll)
	if evasiveManeuversActive 
		StartTimer(utility.randomInt(3,7), 99)
	endif
endFunction

Function TravelSway()
	int ud
	int lr
	string newPitch
	string newRoll
	ud = utility.randomInt(-2, 1)
	lr = utility.randomInt(-3,3)
	newPitch = ud as string
	newRoll = lr as string
	SetBearing(NewPitch, NewRoll)
	if !evasiveManeuversActive 
		StartTimer(utility.randomInt(3,7), 98)
	endif
endFunction

ObjectReference property MyPitchControl auto
ObjectReference property MyRollControl auto
;ObjectReference property DN158NorthMarkerControl auto

string property CurrentPitch = "Level" auto hidden
string property CurrentRoll = "Straight" auto hidden

Function SetBearing(string NewPitch, string NewRoll)
	string pitchAnim
	string rollAnim
	debug.Trace(self + ": Bearing Changed >> " + NewPitch + " :: " + NewRoll)
	if NewPitch != CurrentPitch
		pitchAnim = PickTiltAnim(NewPitch)
		CurrentPitch = NewPitch
		MyPitchControl.PlayAnimation(pitchAnim)
	endif
	if NewRoll != CurrentRoll
		rollAnim = PickTiltAnim(NewRoll)
		CurrentRoll = NewRoll
		MyRollControl.PlayAnimation(rollAnim)
	endif
endFunction

string Function PickTiltAnim(string newTilt)
	if newTilt == "Level" || newTilt == "Straight" || newTilt == "0"
		return "0Deg"

	elseif newTilt == "Up1" || newTilt == "Right1" || newTilt == "1"
		return "1DegCW"
	elseif newTilt == "Up2" || newTilt == "Right2" || newTilt == "2"
		return "2DegCW"
	elseif newTilt == "Up3" || newTilt == "Right3" || newTilt == "3"
		return "3DegCW"
	elseif newTilt == "Up4" || newTilt == "Right4" || newTilt == "4"
		return "4DegCW"
	elseif newTilt == "Up5" || newTilt == "Right5" || newTilt == "5"
		return "5DegCW"
	elseif newTilt == "Up6" || newTilt == "Right6" || newTilt == "6"
		return "6DegCW"

	elseif newTilt == "Down1" || newTilt == "Left1" || newTilt == "-1"
		return "1DegCCW"
	elseif newTilt == "Down2" || newTilt == "Left2" || newTilt == "-2"
		return "2DegCCW"
	elseif newTilt == "Down3" || newTilt == "Left3" || newTilt == "-3"
		return "3DegCCW"
	elseif newTilt == "Down4" || newTilt == "Left4" || newTilt == "-4"
		return "4DegCCW"
	elseif newTilt == "Down5" || newTilt == "Left5" || newTilt == "-5"
		return "5DegCCW"
	elseif newTilt == "Down6" || newTilt == "Left6" || newTilt == "-6"
		return "6DegCCW"
	else
		debug.Trace(self + ": ERROR invalid Angle chosen>> " + newTilt)
	endif
endFunction