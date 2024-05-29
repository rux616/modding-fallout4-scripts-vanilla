scriptName TestMovement extends Actor

import FormList
import Debug
import Utility

float initialPosX = 0.0;
float initialPosY = 0.0;
float initialPosZ = 0.0;
float timeToWaitBetweenMotions = 2.5;
float additionalTimeToWaitToUTurn = 1.0;
float timeToWaitUntilGivingControlBack = 3.0;
float timeToWaitForStop = 1.25;
float waitForNextTest = 0.5;

Event OnInit()
	Notification("Initializing Position")
	initialPosX = GetPositionX()
	initialPosY = GetPositionY()
	initialPosZ = GetPositionZ()
EndEvent

Function RunAllTests()
	Notification("Starting Movement Stress Test")

	Notification("No Strafe Walk Test")
	ResetActor()
	NonStrafeTest( 1.0 )
	Notification("No Strafe Walk Test Complete")

	Wait( waitForNextTest )
	
	Notification("No Strafe FastWalk Test")
	ResetActor()
	NonStrafeTest( 1.25 )
	Notification("No Strafe FastWalk Test Complete")

	Wait( waitForNextTest )

	Notification("No Strafe Jog Test")
	ResetActor()
	NonStrafeTest( 1.5 )
	Notification("No Strafe Jog Test Complete")

	Wait( waitForNextTest )

	Notification("No Strafe Run Test")
	ResetActor()
	NonStrafeTest( 2.0 )
	Notification("No Strafe Run Test Complete")

	Wait( waitForNextTest )

	Notification("Strafe Walk Test")
	ResetActor()
	StrafeTest( 1.0 )
	Notification("Strafe Walk Test Complete")

	Wait( waitForNextTest )
	
	Notification("Strafe FastWalk Test")
	ResetActor()
	StrafeTest( 1.25 )
	Notification("Strafe FastWalk Test Complete")

	Wait( waitForNextTest )

	Notification("Strafe Jog Test")
	ResetActor()
	StrafeTest( 1.5 )
	Notification("Strafe Jog Test Complete")

	Wait( waitForNextTest )

	Notification("Strafe Run Test")
	ResetActor()
	StrafeTest( 2.0 )
	Notification("Strafe Run Test Complete")

	Wait( waitForNextTest )
	
	if ( CanMoveVertical() )
	  	ResetActor()
		Notification("Vertical test")
		VerticalTest()
		Notification("Vertical test complete.")
	endif	
	Notification("Stress Test Complete")
	Wait( timeToWaitUntilGivingControlBack )	
	ClearForcedMovement()
EndFunction

Function ResetActor()
	Notification("Resetting Actor")
	ForceTargetSpeed(0.0)
	MoveForward()
	SetPosition( initialPosX, initialPosY, initialPosZ )
	SetAngle( 0.0, 0.0, 0.0 )
EndFunction

Function NonStrafeTest( float fNormalizedSpeed )
	ForceTargetSpeed( fNormalizedSpeed )
	MoveForward()
	MoveBackward()
	Wait( additionalTimeToWaitToUTurn )
	MoveLeft()
	Wait( additionalTimeToWaitToUTurn )
	MoveRight()
	Wait( additionalTimeToWaitToUTurn )
	Stop()
EndFunction

Function StrafeTest( float fNormalizedSpeed )
	ForceTargetSpeed( fNormalizedSpeed )
	ForceTargetAngle( 0.0, 0.0, 180.0 )
	if ( !CanStrafe() )
		Wait( additionalTimeToWaitToUTurn )
	endif
	MoveForward()
	ForceTargetAngle( 0.0, 0.0, 0.0 )
	if ( !CanStrafe() )
		Wait( additionalTimeToWaitToUTurn )
	endif
	MoveBackward()
	MoveForward()
	Stop()
	ForceTargetSpeed( fNormalizedSpeed )
	MoveLeft()
	MoveRight()
	MoveLeft()
	Stop()
EndFunction

Function VerticalTest()
	ForceTargetSpeed(1.0)
	Notification("Hover Up, then up/Backward")
	ForceTargetDirection( -90.0, 0.0, 0.0 )
	Wait( timeToWaitBetweenMotions )
	ForceTargetDirection( -45.0, 0.0, 180.0 )
	Wait( timeToWaitBetweenMotions )
	Notification("Hover Down, then down/forward")
	ForceTargetDirection( 45.0, 0.0, 180.0 )
	Wait( timeToWaitBetweenMotions )
	ForceTargetDirection( 90.0, 0.0, 0.0 )
	Wait( timeToWaitBetweenMotions )
	Notification("Moving Forward Up")
	ForceTargetDirection( -45.0, 0.0, 0.0 )
	Wait(timeToWaitBetweenMotions)
	Notification("Moving Backward Down")
	ForceTargetDirection( 45.0, 0.0, 180.0 )
	Wait( timeToWaitBetweenMotions+additionalTimeToWaitToUTurn )
	Stop()
EndFunction

Function MoveForward()
	Notification("Moving Forward")
	ForceTargetDirection( 0.0, 0.0, 0.0 )
	Wait(timeToWaitBetweenMotions)
EndFunction

Function MoveBackward()
	Notification("Moving Backward")
	ForceTargetDirection(0.0, 0.0, 180.0)
	Wait(timeToWaitBetweenMotions)
EndFunction

Function MoveLeft()
	Notification("Moving Left")
	ForceTargetDirection(0.0, 0.0, -90.0)
	Wait(timeToWaitBetweenMotions)
EndFunction

Function MoveRight()
	Notification("Moving Right")
	ForceTargetDirection(0.0, 0.0, 90.0)
	Wait(timeToWaitBetweenMotions)
EndFunction

Function Stop()
	ForceTargetSpeed(0.0)
	Wait( timeToWaitForStop )
EndFunction





