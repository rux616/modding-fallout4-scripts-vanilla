Scriptname TestPowerPuzzleActor extends Actor Hidden

Message Property TestPowerPuzzleSwitchMessageEscortMe Auto

Event OnActivate(ObjectReference akActionRef)
    ;SetAV("Variable10", 1)
    EvaluatePackage()
    TestPowerPuzzleSwitchMessageEscortMe.Show()
EndEvent