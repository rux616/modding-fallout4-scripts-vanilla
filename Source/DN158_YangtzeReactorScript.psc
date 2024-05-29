Scriptname DN158_YangtzeReactorScript extends ObjectReference Const
{This script controls turning on the reactor in the Yangtze}

globalVariable Property DN158_YangtzeReactorIsOn Auto Const
ObjectReference Property MS02ReactorLightsParent Auto Const
ObjectReference Property YangtzeEngineSoundParent Auto Const
Keyword Property LinkCustom01 Auto Const

Float Property turnOnDuration = 2.0 Auto Const
Float Property turnOnIntensity = 0.5 Auto Const

Float Property OverloadDuration = 3.0 Auto Const
Float Property OverloadIntensity = 1.0 Auto Const


Event onLoad()
	if DN158_YangtzeReactorIsOn.GetValue() == 0
		PlayGamebryoAnimation("IdlePowerOff01")
	else
		PlayGamebryoAnimation("IdlePowerOn01")
	endif
EndEvent


Function TurnReactorOn()
	;Turn on the reactor
	PlayAnimation("TurnOn01")
	game.shakeCamera(game.getPlayer(), turnOnIntensity)
	game.shakeController(turnOnIntensity, turnOnIntensity, turnOnDuration)
	utility.wait(0.7)
	MS02ReactorLightsParent.EnableNoWait()
	DN158_YangtzeReactorIsOn.SetValue(1)
	YangtzeEngineSoundParent.Enable()
EndFunction


Function OverloadReactor()
	;Turn on the reactor
	TurnReactorOn()

	utility.wait(2.0)
	;Here is when things go bad
	ActivateLinkedRefChain(LinkCustom01)
	game.shakeCamera(game.getPlayer(), OverloadIntensity)
	game.shakeController(OverloadIntensity, OverloadIntensity, OverloadDuration)
	StartTimer(OverloadDuration)
EndFunction


Function ActivateLinkedRefChain(keyword linkKeyword = none)
	ObjectReference currentRef = GetLinkedRef(linkKeyword)
	while currentRef
		currentRef.Activate(currentRef)
		currentRef = currentRef.GetLinkedRef(linkKeyword)
	endwhile
EndFunction


Event OnTimer(int aiTimerID)
	game.shakeCamera(game.getPlayer(), OverloadIntensity)
	game.shakeController(OverloadIntensity, OverloadIntensity, OverloadDuration)
	StartTimer(OverloadDuration)
EndEvent