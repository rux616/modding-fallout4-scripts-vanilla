Scriptname inst305RadioRackSlotScript extends ObjectReference conditional

Message Property Inst305RadioRackMessage Auto Const
		
objectReference property module0 auto const              
objectReference property module1 auto const
objectReference property module2 auto const

miscObject property inst305RackItem0 auto const
miscObject property inst305RackItem1 auto const
miscObject property inst305RackItem2 auto const

Message Property Inst305ThingWithDialsMSG Auto Const
Message Property Inst305ThingWithButtonsMSG Auto Const
Message Property Inst305ThingWithTubesMSG Auto Const

int property installedModule = 3 auto conditional   ; 3 == this slot is EMPTY
int property correctModule auto
GlobalVariable Property Inst305currentRadioSlotModule Auto Const

GlobalVariable Property Inst305radioBroadcastPower Auto Const

quest property Inst305 auto const
Scene Property Inst305PlayerRadioBarksScene Auto Const
scene property Inst305RadioSlotFillBarks auto const

sound property Inst305failSFX auto const
sound property Inst305goodSFX auto const
sound property Inst305winSFX auto const
Sound Property QSTInst305ComponentInsert Auto Const
Sound Property QSTInst305ComponentRemove Auto Const

referenceAlias Property inst305RackItemAlias0 auto const
referenceAlias Property inst305RackItemAlias1 auto const
referenceAlias Property inst305RackItemAlias2 auto const

keyword property linkCustom01 auto const
ActorValue Property Variable01 Auto Const
objectReference property offscreenDummy auto const

bool bBusy = FALSE
int spams = 0

; Thing 0 == Thing with the DIALS
; Thing 1 == Thing with the TUBES
; Thing 2 == Thing with the BUTTONS

Event Actor.OnPlayerLoadGame(actor akSender)
	debug.trace("Inst305: Player has loaded game.")
	checkConfiguration()
	updateLights()
endEvent

Event OnLoad()
	debug.trace("Inst305: Radio Parts Puzzle onLoad")
	; register for player load-game event.
	RegisterForRemoteEvent (game.getPlayer(), "OnPlayerLoadGame")
	; save/load protection: shut off all lights, then run a re-update
	getLinkedRef(linkCustom01).playGamebryoAnimation("IdleOff")
	getLinkedRef(linkCustom01).getNthLinkedRef(1).playGamebryoAnimation("IdleOff")
	getLinkedRef(linkCustom01).getNthLinkedRef(2).playGamebryoAnimation("IdleOff")
	getLinkedRef(linkCustom01).getNthLinkedRef(3).playGamebryoAnimation("IdleOff")
	getLinkedRef(linkCustom01).getNthLinkedRef(4).playGamebryoAnimation("IdleOff")
	checkConfiguration()
    updateLights()
EndEvent

Event OnCellAttach()
	debug.trace("Inst305: Radio Parts Puzzle OnCellAttach")
	; register for player load-game event.
	RegisterForRemoteEvent (game.getPlayer(), "OnPlayerLoadGame")
	; save/load protection: shut off all lights, then run a re-update
	getLinkedRef(linkCustom01).playGamebryoAnimation("IdleOff")
	getLinkedRef(linkCustom01).getNthLinkedRef(1).playGamebryoAnimation("IdleOff")
	getLinkedRef(linkCustom01).getNthLinkedRef(2).playGamebryoAnimation("IdleOff")
	getLinkedRef(linkCustom01).getNthLinkedRef(3).playGamebryoAnimation("IdleOff")
	getLinkedRef(linkCustom01).getNthLinkedRef(4).playGamebryoAnimation("IdleOff")
	checkConfiguration()
    updateLights()
EndEvent

Event OnTimer(int aiTimerID)
    bBusy = FALSE
	blockActivation(FALSE)
	setDestroyed(FALSE)
EndEvent

Event OnActivate(ObjectReference akActionRef)

	if Inst305.getStageDone(60) || !Inst305.getStageDone(50) || bBusy == TRUE
		; safety check - activators shouldn't be enabled except between these stages.
		; We also use this to make prevent spamming while busy
		spams += 1
    	debug.trace("Inst305: Player spammed "+spams+" times ("+self+")")
	else
		; store our installed Module var to a global so messagebox can test against it.
		Inst305currentRadioSlotModule.setValueInt(installedModule)

		if installedModule == 3 && game.getPlayer().getItemCount(inst305RackItem0) == 0 && game.getPlayer().getItemCount(inst305RackItem1) == 0 && game.getPlayer().getItemCount(inst305RackItem2) == 0
			; play a player line reinforcing quest objective.
			if !Inst305PlayerRadioBarksScene.isplaying()
				Inst305PlayerRadioBarksScene.start()
			endif
		else
			; first thing: mark myself as busy and start a brief lockout timer.
			spams = 0
			bBusy = TRUE
			blockActivation()
			setDestroyed()
			startTimer(1.5)
			; If player has equipment, start the interaction stuff.
		    if installedModule != 3
		    	debug.trace("Inst305: Uninstalling Radio part: "+installedModule)
		    	; remove the currently installed item
		    	; take an extra step to ensure newly-created objects are maintained in aliases
		    	QSTInst305ComponentRemove.play(self)
		    	if installedModule == 0
					objectReference newModule = offScreenDummy.placeatme(inst305RackItem0)
		    		inst305RackItemAlias0.forceRefTo(newModule)
		    		(game.getplayer() as objectReference).addItem(newModule)
		    	elseif installedModule == 1
		    		objectReference newModule = offScreenDummy.placeatme(inst305RackItem1)
		    		inst305RackItemAlias1.forceRefTo(newModule)
		    		(game.getplayer() as objectReference).addItem(newModule)
		    	elseif installedModule == 2
		    		objectReference newModule = offScreenDummy.placeatme(inst305RackItem2)
		    		inst305RackItemAlias2.forceRefTo(newModule)
		    		(game.getplayer() as objectReference).addItem(newModule)
		    	endif
		    	removeAllModules()
		    	installedModule = 3
		    else
		    	; I have nothing installed, so do the normal thing.
		    	; show message box, play the "let's try this one here" player line scene
			    int index = Inst305RadioRackMessage.show()

			    ; Play a voice line
			    Inst305RadioSlotFillBarks.start()
			    debug.trace("Inst305: Player installing module "+index+" in slot requiring module "+correctModule)
			    if index == 0 ; dials
			    	removeAllModules()
			    	installedModule = 0
		    		(game.getplayer() as objectReference).removeItem(inst305RackItem0)
			    	module0.enable()
			    	setActivateTextOverride(Inst305ThingWithDialsMSG)
			    	QSTInst305ComponentInsert.play(self)
			    elseif index == 1 ; tubes
			    	removeAllModules()
			    	installedModule = 1
			    	(game.getplayer() as objectReference).removeItem(inst305RackItem1)
			    	module1.enable()
			    	setActivateTextOverride(Inst305ThingWithTubesMSG)
			    	QSTInst305ComponentInsert.play(self)
			    elseif index == 2 ; buttons
			    	removeAllModules()
			    	installedModule = 2
			    	(game.getplayer() as objectReference).removeItem(inst305RackItem2)
			    	module2.enable()
			    	setActivateTextOverride(Inst305ThingWithButtonsMSG)
			    	QSTInst305ComponentInsert.play(self)
			    elseif index == 3 ; nevermind
			    	; do nothing here.
			    elseif index == 4; remove whatever is installed.
			    	removeAllModules()
			    	installedModule = 3
			    endif			

			    if installedModule == correctModule
			    	debug.trace("  Correct Installation - increase broadcast power from "+Inst305radioBroadcastPower.getValue()+" to "+Inst305radioBroadcastPower.getvalue()+20.0)
			    	; broadcast power goes up!
			    	;float newValue = ((getLinkedRef().getValue(Variable01))+20.0)
					;getLinkedRef().modValue(variable01, 20.0)
					Inst305radioBroadcastPower.setValue(Inst305radioBroadcastPower.getValue()+20)
					debug.trace("     Broadcast Power is: now "+ Inst305radioBroadcastPower.getValue())
			    	; turn on my green light
			    	;getLinkedRef(linkCustom01).playGamebryoAnimation("IdleOnGreen")
			    	updateLights()
			    	Inst305goodSFX.play(self)
			    endif

			checkConfiguration()

		    endif
	    endif
    endif

EndEvent

bool Function checkConfiguration()

	debug.trace("Inst305: Checking for win condition...")
	debug.trace("     Broadcast Power is: "+ Inst305radioBroadcastPower.getValue())

	if Inst305radioBroadcastPower.getValue() >= 100
	;if getLinkedRef().getvalue(variable01) >= 100
		; "signal power" is full, meaning all slots are filled correctly.
		Inst305winSFX.play(self)
		Inst305.setStage(60)
		return true
	else
		return false
	endif
endfunction

function updateLights()
	float broadcastPower = Inst305radioBroadcastPower.getValue()

	debug.trace("Inst305 lights update for broacast power of "+broadcastPower)
	debug.trace("Light chain is:")
	debug.trace("	1: "+getLinkedRef(linkCustom01))
	debug.trace("	2: "+getLinkedRef(linkCustom01).getNthLinkedRef(1))
	debug.trace("	3: "+getLinkedRef(linkCustom01).getNthLinkedRef(2))
	debug.trace("	4: "+getLinkedRef(linkCustom01).getNthLinkedRef(3))
	debug.trace("	5: "+getLinkedRef(linkCustom01).getNthLinkedRef(4))


	; 40% is the baseline power, so first two lights are always on.
	getLinkedRef(linkCustom01).playGamebryoAnimation("IdleOnGreen")
	getLinkedRef(linkCustom01).getNthLinkedRef(1).playGamebryoAnimation("IdleOnGreen")

	if broadcastPower >= 60
		getLinkedRef(linkCustom01).getNthLinkedRef(2).playGamebryoAnimation("IdleOnGreen")
	else
		getLinkedRef(linkCustom01).getNthLinkedRef(2).playGamebryoAnimation("IdleOff")
	endif
	if broadcastPower >= 80
		getLinkedRef(linkCustom01).getNthLinkedRef(3).playGamebryoAnimation("IdleOnGreen")
	else
		getLinkedRef(linkCustom01).getNthLinkedRef(3).playGamebryoAnimation("IdleOff")
	endif
	if broadcastPower >= 100
		getLinkedRef(linkCustom01).getNthLinkedRef(4).playGamebryoAnimation("IdleOnGreen")
	else
		getLinkedRef(linkCustom01).getNthLinkedRef(4).playGamebryoAnimation("IdleOff")
	endif
	
endFunction

Function removeAllModules()

	debug.trace("Inst305: Removing module #"+installedModule+" from slot requiring module #"+correctModule)

	if installedModule == correctModule
		;getLinkedRef().modValue(variable01, -20.0)
		Inst305radioBroadcastPower.setValue(Inst305radioBroadcastPower.getValue()-20)
		updateLights()
		;getLinkedRef(linkCustom01).playGamebryoAnimation("IdleOff")
		Inst305failSFX.play(self)
	endif

	installedModule = 3

	module0.disable()
	module1.disable()
	module2.disable()
	
	setActivateTextOverride(NONE)
endfunction
