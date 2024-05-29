Scriptname drinkFromFountainScript extends ObjectReference
{Handles drink on activate for water fountains}

sound Property drinkingSound Auto Const
{plays each drink}
sound Property FountainStart Auto Const
{sound for fountian starting}
sound Property ahhhSoundMale Auto Const
sound Property ahhhSoundFemale Auto Const
{Plays after drinking when the button is pressed just the right amount}
sound Property chockingSoundMale Auto Const
sound Property chockingSoundFemale Auto Const
{Plays after drinking when the button is spammed too much}
SPELL Property spellOnDrink Auto Const
{Spell fx plays each drink}
Quest Property Tutorial Auto Const
{Tutorial Quest reference}


int drinkTime
;counter for number of drinks based on activate button presses
int amountDrunk
;stores the max number of button presses in one drink and controls what sound is played after drinking
int maxDrinkTime = 5 Const
;max number of drinks that can be taken in a row so spamming doesn't turn fountain on forever
actor myPlayer

Auto State waiting
	;turn off fountain (slow) when entering the waiting state
	Event OnBeginState(string asOldState)
		debug.trace(self + " OnBeginState waiting, from " + asOldState)
		BeginDrinking()
	EndEvent
	;On activate start drinking
	Event OnActivate(ObjectReference akActionRef)
		debug.trace(self + " OnActivate: WAITING")
		If akActionRef == Game.GetPlayer()
			myPlayer = game.getPlayer()
			drinkTime = 1
			amountDrunk = 1
		    GotoState("drinking")
		EndIf
	EndEvent
endState

State drinking
	Event OnBeginState(string asOldState)
		debug.trace(self + " OnBeginState drinking, from " + asOldState)
	;turn on fountain (fast)	    
		SetAnimationVariableFloat("fDampRate", 0.08)
		SetAnimationVariableFloat("fToggleBlend", 1.0)
		;wait for water flow
		FountainStart.play(self)
		utility.wait(0.25)
		;drink for 1 sec (1 drinktime)
		;drinkingSound.play(self)  
		while drinkTime > 0
			utility.wait(1.0)
			;add spell fx for each drink
			spellOnDrink.Cast(myPlayer)
			;play drinking sound
			drinkingSound.play(self) 
			;decrement drinktime
			drinkTime = drinkTime-1
		endWhile
		utility.wait(0.5)
		Tutorial.SetStage(500)

		; if this is furniture, loop while in it
		if GetBaseObject() is furniture && IsFurnitureInUse()
			GotoState("looping")
		else
			GotoState("waiting")
		endif
	EndEvent
	;if you spam the button while drinking...
	Event OnActivate(ObjectReference akActionRef)
		debug.trace(self + " OnActivate: DRINKING")
		If akActionRef == Game.Getplayer()
			DrinkAgain()
		EndIf
	EndEvent
endState

State looping
	Event OnBeginState(string asOldState)
		debug.trace(self + " OnBeginState looping, from " + asOldState)
		DrinkAgain()
		BeginDrinking()
		gotoState("drinking")
	endEvent
endState

Event OnExitFurniture(ObjectReference akActionRef)
	debug.trace(self + " OnExitFurniture: DEFAULT")
EndEvent

function DrinkAgain()
	;keep fountain on
    SetAnimationVariableFloat("fToggleBlend", 1.0) 
    ;keep player from spamming too much
    if drinkTime < maxDrinkTime
    	drinkTime = drinkTime+1
    endIf
    ;incriment amountDrunk without limit
    amountDrunk = amountDrunk + 1
endFunction

function BeginDrinking()
	SetAnimationVariableFloat("fDampRate", 0.03)
	SetAnimationVariableFloat("fToggleBlend", 0.0) 
	;if theis begin state comes after a drink play sounds
	if amountDrunk > 1 && amountDrunk < 6
		; player drinks the right amount
		If (Game.GetPlayer().GetBaseObject() as ActorBase).GetSex() == 1
			ahhhSoundFemale.play(myPlayer) 
		else
			ahhhSoundMale.play(myPlayer) 
		EndIf
		;reset amount drunk
		amountDrunk = 0
	elseIf amountDrunk >= 6
		; player drinks too much and chokes on the water
		If (Game.GetPlayer().GetBaseObject() as ActorBase).GetSex() == 1
			chockingSoundFemale.play(myPlayer) 
		else
			chockingSoundMale.play(myPlayer) 
		EndIf
		;myPlayer.DamageObject(5.0)
		;reset amount drunk
		amountDrunk = 0
	elseIf amountDrunk <= 1
		;just a sip nothing happens
		amountDrunk = 0
	endif
endFunction