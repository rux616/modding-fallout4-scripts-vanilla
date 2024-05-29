Scriptname POIDL018_Script extends ObjectReference Conditional


Explosion Property POIDL018Nuke Auto Const

bool property isFiring Auto Conditional

Float Property CountDown = 10.0 Auto

Float Property turnOnDuration = 10.0 Auto Const
Float Property turnOnIntensity = 0.7 Auto Const
Keyword Property LinkCustom01 Auto Const
bool destroyed

Event OnActivate(ObjectReference AkActivator)
	Debug.Trace(self + ": OnActivate")
	isFiring = true
	GetLinkedRef().Activate(GetLinkedRef())
	StartTimer(CountDown, 99)
	StartTimer(3.0)
	game.shakeCamera(game.getPlayer(), turnOnIntensity)
	game.shakeController(turnOnIntensity, turnOnIntensity, turnOnDuration)
	RegisterForRemoteEvent(GetLinkedRef(LinkCustom01), "OnDestructionStageChanged")
EndEvent


Event OnTimer(int aiTimerID)
	if aiTimerID == 99
		destroyed = True
		;placeAtMe(POIDL018Nuke)
		GetLinkedRef(LinkCustom01).damageObject(95)
		
		CancelTimer()
		;self.Disable()
	elseif !destroyed
		StartTimer(3.0)
		game.shakeCamera(game.getPlayer(), turnOnIntensity)
		game.shakeController(turnOnIntensity, turnOnIntensity, 4.0)
	endif
EndEvent

Event ObjectReference.OnDestructionStageChanged(ObjectReference akSender, int aiOldStage, int aiCurrentStage)
	UnRegisterForRemoteEvent(GetLinkedRef(LinkCustom01), "OnDestructionStageChanged")
	self.Disable()
	DisableLinkChain()
EndEvent