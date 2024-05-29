Scriptname DN170_LightFlicker extends ObjectReference Const

float property randomMaxTime = 0.5 auto Const
int property randomMaxFlickers = 4 auto Const


Event OnActivate(ObjectReference akActionRef)
	utility.wait(0.5)
	Game.GetPlayer().RampRumble()
	utility.wait(utility.RandomFloat(0.01, randomMaxTime))
	int maxFlickers = utility.RandomInt(1, randomMaxFlickers)
	int flickerCount
	while flickerCount < maxFlickers
		disable()
		utility.wait(utility.RandomFloat(0.01, 0.06))
		enable()

		flickerCount += 1
	endWhile

endEvent
