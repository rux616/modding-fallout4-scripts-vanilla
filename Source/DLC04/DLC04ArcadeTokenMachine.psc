scriptName DLC04:DLC04ArcadeTokenMachine extends objectReference
;
;
;
;


auto state Waiting
	event onActivate(objectReference akActivator)
		Debug.Trace(self + ": onActivate")
		goToState("Busy")
		if akActivator == game.getPlayer() 
			if game.getPlayer().getItemCount(PrewarMoney) > 0
				Debug.Trace(self + ": Took your money")
				game.getPlayer().RemoveItem(PreWarMoney, 1)
				DLC04OBJArcadeTokenExchangeInsert.Play(Self)
				DispenseTokens()
			else
				;Debug.Trace(self + ": Requires money")
				;Debug.Notification("Requires Prewar Money")
				DLC04_Nukacade_TokenMessage.Show()
			endif
		endif
		goToState("Waiting")
	endEvent
endState


state Busy
endState

Function DispenseTokens()
	Debug.Trace(self + ": DispenseTokens")
	int tokens = 0
	objectReference objSelf = self as objectReference
	int playerLuck = (game.getPlayer().GetValue(Luck) as int)
	;Each point of player luck is 1% chance of getting an extra token
	if utility.RandomInt(1, 100) <= playerLuck
		Debug.Trace(self + ": LUCKY Extra token!")
		tokens = -1
	endif
	while tokens < TokensDispensed
		Debug.Trace(self + ": Dispense a token")
		DLC04OBJArcadeTokenExchangeDispense.play(self)
		placeAtNode(TokenDispenseNode, DLC04_Nukacade_Token01)
		utility.wait(0.1)
		tokens +=1
	endWhile
endFunction

ActorValue Property Luck Auto const mandatory
String Property TokenDispenseNode = "tokens" auto const
Message Property DLC04_Nukacade_TokenMessage Auto Const Mandatory
miscObject property PreWarMoney auto Const Mandatory
miscObject property DLC04_Nukacade_Token01 auto Const Mandatory
int property TokensDispensed = 3 auto Const
{This is the amount of tokens dispensed}
Sound Property DLC04OBJArcadeTokenExchangeInsert auto Const Mandatory
Sound Property DLC04OBJArcadeTokenExchangeDispense Auto Const Mandatory



