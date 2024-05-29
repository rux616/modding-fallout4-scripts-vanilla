Scriptname MS08GameScript extends Quest Conditional

Actor Property PlayerRef const auto
ReferenceAlias Property Target const auto

float Property Distance auto conditional hidden
float Property Heading auto conditional hidden

string Property sDirection const auto

bool Property isN auto conditional hidden
bool Property isE auto conditional hidden
bool Property isS auto conditional hidden
bool Property isW auto conditional hidden

message Property MS08DebugMsgDistance const auto

int TimerIDDistance = 1
int TimerIntervalDistance = 2


objectreference Property TestMS08HeadingMarker const auto


;Event OnTimer(int aiTimerID)
;	if aiTimerID == TimerIDDistance
;		SetDistance()
;		SetHeading()
;		SetDirectionBools()
;		ShowDistanceMessage()
;		StartDistanceTimer()
;
;		debug.trace("Heading:" + heading)
;		debug.trace("N: " + isN)
;		debug.trace("E: " + isE)
;		debug.trace("S: " + isS)
;		debug.trace("W: " + isW)
;
;	endif
;EndEvent

;Function StartDistanceTimer()
;	starttimer(TimerIntervalDistance, TimerIDDistance)
;EndFunction

function ProcessTargetVariables()

		SetDistance()
		SetHeading()
		SetDirectionBools()
		ShowDistanceMessage()

		debug.trace("Heading:" + heading)
		debug.trace("N: " + isN)
		debug.trace("E: " + isE)
		debug.trace("S: " + isS)
		debug.trace("W: " + isW)


endFunction


float Function GetTargetDistance()
	return PlayerRef.GetDistance(Target.GetReference())
EndFunction

Function ShowDistanceMessage()
	MS08DebugMsgDistance.show(distance, heading)
EndFunction

Function SetDistance()
	Distance = GetTargetDistance()
EndFunction

Function SetHeading()
	;THIS WILL BE REPLACED WITHA NEW FUNCTION TO GET CARDINAL DIRECTION TO TARGET
	TestMS08HeadingMarker.Moveto(PlayerRef)
	TestMS08HeadingMarker.setAngle(0,0,0)
	Heading = TestMS08HeadingMarker.GetHeadingAngle(Target.GetReference())
	FixHeadingTo360DegreeDirection()
EndFunction

Function SetDirectionBools()

	isN = false
	isE = false
	isS = false
	isW = false
	
	if heading >= 270 && heading <= 360
		isN = true
	endif

	if heading >= 0 && heading < 90
		isN = true
	endif

	if heading >= 90 && heading < 270
		isS = true
	endif

	if heading >= 0 && heading < 180
		isE = true
	endif

	if heading >= 180 && heading < 360
		isW = true
	endif

EndFunction



Function FixHeadingTo360DegreeDirection()
	;the GetHeadingAngle() Function returns things behind and to the left as negative values with directly behind you being -180 and directly ahead being 0
	;So before I get the function for cardinal direction in 360 degree notation, I'll need to fix up my numbers
	if heading < 0
		heading = heading + 360
	endif

EndFunction