Scriptname DN015_CentrifugeInputScript extends ObjectReference Const


MiscObject Property DN015_PuzGoldSample Auto Const
MiscObject Property DN015_PuzLiHSample Auto Const

Message Property DN015_PuzMessageLiHRequired Auto Const
Message Property DN015_PuzMessageGoldRequired Auto Const

Bool Property isGoldActivator Auto Const
Bool Property isCorrectCentrifuge Auto Const

Event onActivate(objectReference akActivator)
	DN015_CentrifugeActivatorScript myCentrifugeActivator = (GetLinkedRef() as DN015_CentrifugeActivatorScript)
	if akActivator == game.getPlayer()

		;if this is the Lithium Hydride activator and the player has LiH
		if !isGoldActivator && game.GetPlayer().GetItemCount(DN015_PuzLiHSample) > 0
			;Check if this is the correct centrifuge - the one in the ventilated chamber
			if isCorrectCentrifuge
				myCentrifugeActivator.AddLiH(true)
			else
				myCentrifugeActivator.AddLiH(false)
			endif
			self.disable()
		elseif !isGoldActivator
			DN015_PuzMessageLiHRequired.Show()
		endif

		;If this is the gold activator and the player has gold
		if isGoldActivator && game.getPlayer().GetItemCount(DN015_PuzGoldSample) > 0
			myCentrifugeActivator.AddGold()
			self.disable()
		elseif isGoldActivator
			DN015_PuzMessageGoldRequired.Show()
		endif
		
	endif

EndEvent
