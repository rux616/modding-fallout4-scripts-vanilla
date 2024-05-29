Scriptname DN079QuestScript extends Quest Conditional

GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property DN079_PayoutDay Auto
GlobalVariable Property DN079_PayoutAmount Auto

ObjectReference Property DN079_ExplosiveTrigger Auto

Float Property DaysBeforePayout = 5.0 auto
{Default = 5.0}

Float Property MaxPayoutsStored = 4.0 auto
{Default = 4.0}

int property minPayout = 20 auto
int property maxPayout = 70 auto

MiscObject Property Caps001 Auto

Bool Property SalesmanIsHostile = false auto conditional

;Set the Payout amount and give it to the player
Function Payout()
	float CurrentPayouts
	
	;Divide the days since payout day by the days per payout
	CurrentPayouts = (GameDaysPassed.getValue() - DN079_PayoutDay.getValue()) / DaysBeforePayout

	;if the current payouts is greater than the max, set it to the max
	if CurrentPayouts > MaxPayoutsStored 
		CurrentPayouts = MaxPayoutsStored 
	endif

	int Payout = 0
	While CurrentPayouts > 0
		Payout 	+= Utility.randomInt (minPayout, maxPayout)
		CurrentPayouts -= 1.0
	endWhile
	
	Game.GetPlayer().AddItem(Caps001, Payout)
	SetNewPayoutDay()
EndFunction


Function SetNewPayoutDay()
	Float NewDay

	NewDay = GameDaysPassed.GetValue() + DaysBeforePayout
	DN079_PayoutDay.SetValue(NewDay)

EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function BombTheRamp()
	float afStrength
	float afRightStrength 
	float afLeftStrength 
	float afDuration  

	;Camera Shake Properties
	afStrength  = 0.6

	;Controller Shake Properties
	afRightStrength = 0.6
	afLeftStrength = 0.6

	afDuration  = 2.0

	DN079_ExplosiveTrigger.Activate(DN079_ExplosiveTrigger)
	utility.wait(1.0)
	DN079_BridgeEnableParent.PlaceAtMe(CarExplosion)
	FXExplosionCarNuke2D.Play(DN079_BridgeEnableParent)
	game.ShakeCamera(akSource = None, afStrength = afStrength, afDuration = afDuration)
	game.ShakeController(afLeftStrength, afRightStrength, afDuration)
	DN079_BridgeEnableParent.Disable()
EndFunction

Sound Property FXExplosionCarNuke2D auto
ObjectReference Property DN079_BridgeEnableParent auto
Explosion Property CarExplosion auto
