Scriptname DN015_EmitterInputScript extends ObjectReference Const

MiscObject Property DN015_PuzIsotopeSample Auto Const
MiscObject Property DN015_PuzNanoweaveSample Auto Const

Message Property DN015_PuzMessageIsotopeRequired Auto Const
Message Property DN015_PuzMessageNanoweaveRequired Auto Const

Bool Property isIsotopeActivator Auto Const

Event onActivate(objectReference akActivator)
	DN015_EmitterActivatorScript myEmitterActivator = (GetLinkedRef() as DN015_EmitterActivatorScript)
	if akActivator == game.getPlayer()

		;if this is the PZT activator and the player has PZT
		if isIsotopeActivator
			if game.GetPlayer().GetItemCount(DN015_PuzIsotopeSample) > 0
				myEmitterActivator.addComponent(isIsotope = True)
				self.disable()
			else
				DN015_PuzMessageIsotopeRequired.Show()
			endif
		else	
			;If this is the gold activator and the player has gold
			if game.getPlayer().GetItemCount(DN015_PuzNanoweaveSample) > 0
				myEmitterActivator.AddComponent(isIsotope = False)
				self.disable()
			else
				DN015_PuzMessageNanoweaveRequired.Show()
			endif
		endif
	endif

EndEvent