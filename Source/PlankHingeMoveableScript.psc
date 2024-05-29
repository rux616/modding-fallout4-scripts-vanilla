Scriptname PlankHingeMoveableScript extends ObjectReference Hidden

Float Property StartingXPos Auto
Float Property StartingYPos Auto
Float Property StartingZPos Auto
Float Property StartingXAngle Auto
Float Property StartingYAngle Auto
Float Property StartingZAngle Auto

int ResetTimer = 10


Event OnInit()
    StartingXPos = GetPositionX()
    StartingYPos = GetPositionY()
    StartingZPos = GetPositionZ()
    StartingXAngle = GetAngleX()
    StartingYAngle = GetAngleY()
    StartingZAngle = GetAngleZ()
EndEvent


Event OnLoad()
    StartTimer(5, ResetTimer)
EndEvent


Event OnTimer(int aiTimerID)
    if aiTimerID == ResetTimer
    	if Is3DLoaded()
    		if !Game.GetPlayer().HasDetectionLOS(self)
    			debug.Trace(self + "Player CANNOT see me, resetting position and starting timer")
    			ResetPlank()	
    		endif
    		StartTimer(5, ResetTimer)
   		endif
    endif
EndEvent


Function ResetPlank()
	SetAngle(StartingXAngle, StartingYAngle, StartingZAngle)
	SetPosition(StartingXPos, StartingYPos, StartingZPos + 16)
EndFunction


Event OnUnload()
    CancelTimer(ResetTimer)
EndEvent