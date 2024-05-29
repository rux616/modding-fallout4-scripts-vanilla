Scriptname testVaultExitElevatorSCRIPT extends ObjectReference

FLOAT PROPERTY doorOpenWait AUTO 
{time before we start opening the blast doors}
FLOAT PROPERTY beamWait AUTO 
{time before we start the beam}
FLOAT PROPERTY blindWait AUTO 
{time before we play the blind effect}
FLOAT PROPERTY elevatorMoveWait AUTO 
{time before the elevator starts moving}

OBJECTREFERENCE PROPERTY blastDoorLeftMover AUTO
OBJECTREFERENCE PROPERTY blastDoorRightMover AUTO
OBJECTREFERENCE PROPERTY spotRef AUTO
IMAGESPACEMODIFIER PROPERTY blindISFX AUTO
OBJECTREFERENCE PROPERTY elevatorRef AUTO

; the lights that climb up the shaft
OBJECTREFERENCE PROPERTY light0Ref AUTO
OBJECTREFERENCE PROPERTY light1Ref AUTO
OBJECTREFERENCE PROPERTY light2Ref AUTO

; the light beam that shoots down
OBJECTREFERENCE PROPERTY shaftBeam AUTO

EVENT OnACTIVATE(OBJECTREFERENCE obj)

	; pop the lights on up the elevator shaft
	utility.wait(2)
	light0Ref.enable()

	utility.wait(1.25)
	light1Ref.enable()
	
	utility.wait(1.25)
	light2Ref.enable()

	; wait before the door opens and light starts pouring in
	utility.wait(doorOpenWait)
	blastDoorLeftMover.Activate(game.GetPlayer())
	blastDoorRightMover.Activate(game.GetPlayer())

	; wait x seconds before playing the blinding ISFX
	utility.wait(beamWait)
	shaftBeam.playAnimation("stage2")
	
	utility.wait(blindWait)
	blindISFX.apply(1)
	spotRef.enable()

	; wait for X seconds and then start the elevator moving
	utility.wait(elevatorMoveWait)
	elevatorRef.Activate(SELF)

ENDEVENT