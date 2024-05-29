Scriptname PortaDinerScript extends ObjectReference

Potion Property Pie Auto Const
;Pie Item

Potion Property MoldyFood Auto Const
;Moldy Food Item

ObjectReference Property PortaDinerContainerRef Auto Const
;ObjectReference for PortaDiner door container.

Float Property fSuccessMod = 1.0 Auto Const
;Highest % chance is = iSuccessMod + LuckValue

int Property RandomMax = 1000 auto Const
;Maximum range of random int.

ActorValue Property LuckAV Auto Const
; Players LuckValue

Bool Property PieSuccess = False Auto
;Bool for tracking whether the Pie has been retrieved

Bool Property ForcePieSuccess = False Auto

int Property Attempts auto
;Number of attempts to get the pie.



auto state Waiting

	Event OnActivate(ObjectReference akActionRef)
		GoToState("Busy")

		debug.trace("Activated")
		Float fSuccessPlusLuck = ((1 + fSuccessMod) * Game.GetPlayer().GetValue(LuckAV)) + (Attempts/2)
		debug.trace("Pie % Chance " + ((fSuccessPlusLuck/RandomMax)*100))

		if !PieSuccess
			Attempts += 1
			debug.trace("Attempt number " + Attempts)
			int random = Utility.RandomInt(1, RandomMax)
			debug.trace("Random number is " + random)

			if (random <= fSuccessPlusLuck) || ForcePieSuccess
				debug.trace("Success!")
				self.PlayAnimationAndWait("Succeed", "TransitionComplete")
				debug.trace("Fin.")
				PortaDinerContainerRef.additem(Pie, 1)
				PieSuccess = True

			else
				debug.trace("Failure.")
				self.PlayAnimationAndWait("Fail01", "Reset")
				debug.trace("Fin.")

			endif

		else
			debug.trace("Already succeeded. Playing empty claw.")
			self.PlayAnimationAndWait("Succeed", "TransitionComplete")

		endif

		GoToState("Waiting")

	endEvent

endState

state Busy
;do nothing
endState