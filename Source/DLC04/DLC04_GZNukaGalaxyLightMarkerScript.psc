Scriptname DLC04:DLC04_GZNukaGalaxyLightMarkerScript Extends ObjectReference

Keyword property LinkCustom01 Auto Const Mandatory
Keyword property LinkCustom02 Auto Const Mandatory
Keyword property LinkCustom03 Auto Const Mandatory
Keyword property LinkCustom04 Auto Const Mandatory

MusicType property MusicCue Auto Const Mandatory

bool property shouldFadeOn = False Auto Const
int property lightDurationTimerID = 1 Auto Const
float property lightDuration = 8.0 Auto Const

ObjectReference[] triggerChain
ObjectReference[] turretChain
ObjectReference[] myLinkedLights 
ObjectReference[] myLinkedUFOs 

Event OnCellLoad()
	Self.DisableNoWait()
	triggerChain = Self.GetLinkedRefChain(LinkCustom01)
	turretChain = Self.GetLinkedRefChain(LinkCustom02)
	myLinkedLights = Self.GetLinkedRefChain(LinkCustom03)
	myLinkedUFOs = Self.GetLinkedRefChain(LinkCustom04)
	int i = 0
	While (i < triggerChain.Length)
		Debug.Trace("LIGHTMARKER " + Self + " registered for OnTriggerEnter " + triggerChain[i])
		Self.RegisterForRemoteEvent(triggerChain[i], "OnTriggerEnter")
		i = i + 1
	EndWhile
EndEvent

Event OnCellDetach()
	Self.UnregisterForAllEvents()
	SetTurretChainUnconscious(True)
EndEvent




Function SetTurretChainUnconscious(bool shouldBeUnconscious)
	int i = 0
	turretChain = Self.GetLinkedRefChain(LinkCustom02)
	if (turretChain != None)
		While (i < turretChain.Length)
			Actor nextTurret = turretChain[i] as Actor
			if (nextTurret != None)
				nextTurret.SetUnconscious(shouldBeUnconscious)
				if (!shouldBeUnconscious)
					Utility.Wait(Utility.RandomFloat(0, 0.1))
				EndIf
			EndIf
			i = i + 1
		EndWhile
	EndIf
EndFunction


Event ObjectReference.OnTriggerEnter(ObjectReference source, ObjectReference akActivator)
	Debug.Trace("LIGHTMARKER " + Self + " trigger entered " + Self.IsDisabled() + "," +akActivator)
	if ((Self.IsDisabled()) && (akActivator == Game.GetPlayer()))
		TurnOn(True)
	EndIf
EndEvent

Function TurnOn(bool remainOn, bool enableTurrets=True)
	TurnOnTurrets(remainOn, enableTurrets)
	TurnOnLights(remainOn, enableTurrets)
EndFunction

Function TurnOnTurrets(bool remainOn, bool enableTurrets=True)
	Debug.Trace("A")
	if (enableTurrets)
		SetTurretChainUnconscious(False)
		Debug.Trace("TURN ON TURRETS: " + Self)
	EndIf
	Debug.Trace("B")
EndFunction

Function TurnOnLights(bool remainOn, bool enableTurrets=True)
	Debug.Trace("C")
	CancelTimer(lightDurationTimerID)
	Self.EnableNoWait(shouldFadeOn)
	int i = 0
	While (i < myLinkedLights.Length)
		myLinkedLights[i].EnableNoWait(shouldFadeOn)
		i = i + 1
	EndWhile
	i = 0
	While (i < myLinkedUFOs.Length)
		myLinkedUFOs[i].PlayAnimation("StartOn01")
		Debug.Trace("UFO_TurnOn for " + myLinkedUFOs[i])
		i = i + 1
	EndWhile
	if (!remainOn)
		StartTimer(lightDuration, lightDurationTimerID)
	EndIf
	Debug.Trace("D")
	MusicCue.Add()
	Debug.Trace("TURN ON LIGHTMARKER: " + Self)
EndFunction



Function TurnOff()
	CancelTimer(lightDurationTimerID)
	Self.DisableNoWait()
	int i = 0
	While (i < myLinkedLights.Length)
		myLinkedLights[i].DisableNoWait()
		i = i + 1
	EndWhile
	i = 0
	While (i < myLinkedUFOs.Length)
		myLinkedUFOs[i].PlayAnimation("StartOff01")
		Debug.Trace("UFO_TurnOff for " + myLinkedUFOs[i])
		i = i + 1
	EndWhile
	SetTurretChainUnconscious(True)
	Debug.Trace("TURN OFF LIGHTMARKER: " + Self)
EndFunction

Event OnTimer(int timerID)
	if (timerID == lightDurationTimerID)
		Debug.Trace("Light timer for " + Self + " expired. Turning off.")
		TurnOff()
	EndIf
EndEvent