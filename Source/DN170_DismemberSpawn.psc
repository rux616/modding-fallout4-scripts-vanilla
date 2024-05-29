Scriptname DN170_DismemberSpawn extends Actor

ActorBase Property MirelurkSpawn Auto Const

auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
	    GoToState("Done")
	    FizzleNPop()

	EndEvent

endState

state Done
	Event OnActivate(ObjectReference akActionRef)
	;do nothing

	endEvent

endState

Function FizzleNPop()
	int twitches = 10
	float looptime = 1.0
	while twitches > 0
		if twitches != 1
			self.ApplyHavokImpulse(0.0, 0.0, 4.0, 45.0)

		else
			self.ApplyHavokImpulse(0.0, 0.0, 16.0, 200.0)

		endif

		utility.wait(looptime)
		looptime = looptime*0.75
		twitches -= 1
	endwhile

    Dismember("Head1", true, true)
    self.PlaceAtNode("Neck", MirelurkSpawn)


EndFunction
