Scriptname DN015_ExtruderInputScript extends ObjectReference Const

MiscObject Property DN015_PuzCompoundSample Auto Const
MiscObject Property DN015_PuzPZTSample Auto Const

Message Property DN015_PuzMessageCompoundRequired Auto Const
Message Property DN015_PuzMessagePZTRequired Auto Const

Bool Property isPZTActivator Auto Const

Event onActivate(objectReference akActivator)
	DN015_ExtruderActivatorScript myExtruderActivator = (GetLinkedRef() as DN015_ExtruderActivatorScript)
	if akActivator == game.getPlayer()

		;if this is the PZT activator and the player has PZT
		if isPZTActivator
			if game.GetPlayer().GetItemCount(DN015_PuzPZTSample ) > 0
				myExtruderActivator.addComponent(isPZT = True)
				self.disable()
			else
				DN015_PuzMessagePZTRequired.Show()
			endif
		else	
			;If this is the experimental compound activator and the player has experimental compound
			if game.getPlayer().GetItemCount(DN015_PuzCompoundSample) > 0
				myExtruderActivator.AddComponent(isPZT = False)
				self.disable()
			else
				DN015_PuzMessageCompoundRequired.Show()
			endif
		endif
	endif

EndEvent