Scriptname DialogueDiamondCityScript extends Quest Conditional

Int Property NatTalk Auto Conditional
{1 = Positive, 2 = Negative, 3 = Neutral, 4 = Question, 5 = Walkaway}

ObjectReference Property StartBase Auto
ObjectReference Property FirstBase Auto
ObjectReference Property SecondBase Auto
ObjectReference Property ThirdBase Auto
ObjectReference Property HomeBase Auto

;Timer ID for base running
Int BaseRunTimerID = 5 

;Timer value
Int BaseRunMaxTime = 60

;variable - how many times did the player pass the Reward speech challenge?
Int Property EllieSP_Var Auto Conditional

Int Property WorldSeriesBatSP Auto Conditional
{variable to track how much money to give for the bat}


Function BatterUp()
	debug.trace(self + "Batter Up!")

	;Player up to bat, start the run
	FirstBase.Enable()
	SecondBase.Disable()
	ThirdBase.Disable()
	HomeBase.Disable()

	CancelTimer(BaseRunTimerID)
	StartTimer(BaseRunMaxTime, BaseRunTimerID)
EndFunction


Function RoundingThird()
	;need to disable the start base trigger and enable the homerun trigger
	HomeBase.Enable()
	StartBase.Disable()
EndFunction

Function Homerun()	
	debug.trace(self + "Homerun!")
	CancelTimer(BaseRunTimerID)
	Game.AddAchievement(42)

	;disable all triggers
	HomeBase.Disable()
	ThirdBase.Disable()
	SecondBase.Disable()
	FirstBase.Disable()
	StartBase.Disable()
EndFunction


Event OnTimer(int aiTimerID)

	if aiTimerID == BaseRunTimerID
		debug.trace(self + "Timer has expired")
		;reset all the triggers
		HomeBase.Disable()
		ThirdBase.Disable()
		SecondBase.Disable()
		FirstBase.Disable()
		StartBase.Enable()
	EndIf

EndEvent