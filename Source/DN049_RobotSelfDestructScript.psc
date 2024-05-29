ScriptName DN049_RobotSelfDestructScript Extends Actor
{Script on the DN049 robot base actors to handle their individual self-destruct countdowns.}

Sound property ObjTurretAlarmWarning Auto Const Mandatory
{Alarm sound to play.}

Explosion property CarNuke Auto Const Mandatory
{Explosion to play when the robot self-destructs.}

ObjectReference property RobotSelfDestructerRef Auto Const Mandatory
{The Robot Self Destruct ref.}

int counter


Function InitiateSelfDestruct()
	if (Self.Is3DLoaded())
		;Delay briefly to make sure the robots don't all explode in too short of a time frame.
		Utility.Wait(0.3)
		;Play a countdown and have them explode.
		;StartTimer(Utility.RandomFloat(0, 3))
		Self.Activate(RobotSelfDestructerRef)
	Else
		;Otherwise, just kill them.
		Self.Kill()
	EndIf
EndFunction

Event OnTimer(int timerID)
	counter = counter + 1
	if (counter < 5)
		ObjTurretAlarmWarning.Play(Self)
		StartTimer(1)
	Else
		Self.PlaceAtMe(CarNuke)
		Self.Kill()
	EndIf
EndEvent