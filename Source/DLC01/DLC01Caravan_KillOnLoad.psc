Scriptname DLC01:DLC01Caravan_KillOnLoad extends Actor Const
{Kills the reference on load. For an actor where StartsDead results in a broken pose.}

Event OnLoad()
	Self.Kill()
EndEvent