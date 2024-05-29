Scriptname TempConstitutionMoveScript extends ObjectReference Hidden


Keyword Property LinkCustom01 Auto Const
Keyword Property LinkCustom02 Auto Const
Keyword Property LinkCustom03 Auto Const
Keyword Property LinkCustom04 Auto Const

ObjectReference FirstMover
ObjectReference SecondMover
ObjectReference Ship
ObjectReference RotateMover



Event OnInit()
    FirstMover = GetLinkedRef(LinkCustom01)
    SecondMover = GetLinkedRef(LinkCustom02)
    Ship = GetLinkedRef(LinkCustom03)
    RotateMover = GetLinkedRef(LinkCustom04)
EndEvent


Function MoveShip()
	Ship.EnableNoWait()
	FirstMover.SetAnimationVariableFloat("fvalue", 1)
	SecondMover.SetAnimationVariableFloat("fvalue", 1)
	RotateMover.SetAnimationVariableFloat("fvalue", -13)
	RotateMover.SetAnimationVariableFloat("fspeed", 5)
	RotateMover.PlayAnimation("Play01")
	FirstMover.SetAnimationVariableFloat("fspeed", 13)
	SecondMover.SetAnimationVariableFloat("fspeed", 13)
	FirstMover.PlayAnimationAndWait("Play01", "done")
	SecondMover.PlayAnimationAndWait("Play01", "done")
	utility.Wait(10)
	Ship.DisableNoWait()
EndFunction