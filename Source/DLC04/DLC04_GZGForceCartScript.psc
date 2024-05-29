Scriptname DLC04:DLC04_GZGForceCartScript extends PowerLiftMiniCartScript

float fudge = 0.7 const

Function MoveCart()
	ObjectReference Cart = GetLinkedRef()
	Debug.Trace("Elevator")
	if Cart.GetAnimationVariableFloat("fvalue") == TopLevelOverride
		ShakeItUp()
		Cart.SetAnimationVariableFloat("fvalue", 0.14)
		Cart.SetAnimationVariableFloat("fspeed", 1.25+fudge)
		Cart.PlayAnimationAndWait("Play01", "Done")
		Utility.Wait(0.1)

		ShakeItUp()
		Cart.SetAnimationVariableFloat("fvalue", 0.005)
		Cart.SetAnimationVariableFloat("fspeed", 2+fudge)
		Cart.PlayAnimationAndWait("Play01", "Done")
		Utility.Wait(0.15)

		ShakeItUp()
		Cart.SetAnimationVariableFloat("fvalue", 0.075)
		Cart.SetAnimationVariableFloat("fspeed", 0.6+fudge)
		Cart.PlayAnimationAndWait("Play01", "Done")
		Utility.Wait(0.1)
		
		ShakeItUp()
		Cart.SetAnimationVariableFloat("fvalue", 0.153)
		Cart.SetAnimationVariableFloat("fspeed", 0.3+fudge)
		Cart.PlayAnimationAndWait("Play01", "Done")
		Utility.Wait(0.1)

		ShakeItUp()
		Cart.SetAnimationVariableFloat("fvalue", 0.02)
		Cart.SetAnimationVariableFloat("fspeed", 2+fudge)
		Cart.PlayAnimationAndWait("Play01", "Done")
		Utility.Wait(0.15)

		ShakeItUp()
		Cart.SetAnimationVariableFloat("fvalue", 0.17)
		Cart.SetAnimationVariableFloat("fspeed", 1+fudge)
		Cart.PlayAnimationAndWait("Play01", "Done")
		Utility.Wait(0.1)

		ShakeItUp()
		Cart.SetAnimationVariableFloat("fvalue", 0.18325)
		Cart.SetAnimationVariableFloat("fspeed", 2+fudge)
		Cart.PlayAnimationAndWait("Play01", "Done")

	elseif Cart.GetAnimationVariableFloat("fvalue") == BottomLevelOverride
		ShakeItUp()
		Cart.SetAnimationVariableFloat("fvalue", TopLevelOverride)
		Cart.SetAnimationVariableFloat("fspeed", 5)
		Cart.PlayAnimationAndWait("Play01", "Done")
		ShakeItUp()
	EndIf
EndFunction


Function ShakeItUp()
	Debug.Trace("Shake Shake Shake")
	ObjectReference ShakePoint = GetLinkedRef(LinkCustom04)
	if Game.GetPlayer().GetDistance(ShakePoint) < 512
		game.ShakeCamera(ShakePoint, 0.2, 0.5)
		game.ShakeController(0.1, 0.1, 0.5)
	endif
EndFunction