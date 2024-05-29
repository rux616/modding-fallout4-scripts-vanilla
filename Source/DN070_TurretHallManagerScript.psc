Scriptname DN070_TurretHallManagerScript extends ObjectReference Hidden Conditional
{Script that manages the Jamaica Plain Turret Hall event.}

Group QuestAndScenes
	Quest property DN070 Auto Const Mandatory
	{DN070}

	Scene property DN070_TurretHallIntroScene Auto Const Mandatory
	{Scene played when the player approaches the turret hall.}

	Scene property DN070_TurretHallIDRejected Auto Const Mandatory
	{Scene played when the Turret Hall rejects the Janitor's ID Card.}

	Scene property DN070_TurretHallIDAccepted Auto Const Mandatory
	{Scene played when the Turret Hall accepts the Mayor's ID Card.}

	Scene property DN070_TurretHallAlarmScene Auto Const Mandatory
	{Scene played when the player sets off the turret hall alarm.}
EndGroup

Group ReferencesAndLinks
	ObjectReference property DN070_TurretHallButton Auto Const Mandatory
	{The Button that toggles the security system on or off.}

	DN070_TurretHallIDCardReaderScript property DN070_TurretHallIDCardReader Auto Const Mandatory
	{The ID Card Reader for the turret hall.}

	Default2StateActivator property DN070_TurretHallDoor Auto Const Mandatory
	{The turret hall security door.}

	Keyword property LinkCustom01 Auto Const Mandatory
	{Transient linkedref chain of tripwires.}

	Keyword property LinkCustom02 Auto Const Mandatory
	{Transient linkedref chain of turrets.}
EndGroup

Group OtherProperties
	Sound property OBJSwitchGenericFail Auto Const Mandatory
	{Sound to play when the button activation fails.}

	bool property laserGridEnabled = True Auto Conditional
	{Are the lasers enabled?}

	bool property combatTriggered = False Auto Conditional
	{Has the player triggered the combat here?}
EndGroup


;---------------
;Event Handling
;---------------

;When the cell loads, determine what state the lasers should be in.
Event OnCellLoad()
	if (laserGridEnabled)
		EnableLasers()
		EnableIDCardReader()
	Else
		DisableLasers()
		DisableIDCardReader()
	EndIf
	if (combatTriggered)
		EnableTurrets()
	Else
		DisableTurrets()
	EndIf
EndEvent

Auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		GoToState("Busy")
		if (akActivator == DN070_TurretHallButton)
			ButtonPressed()
		Else ;Tripwire tripped or Turret attacked.
			TriggerTurretHall()
		EndIf
		GoToState("Waiting")
	EndEvent
EndState

State Busy
	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState


;When the player presses the button, toggle the defense grid.
Function ButtonPressed()
	if (combatTriggered)
		if (CheckAllTurretsDead())
			combatTriggered = False
			DN070_TurretHallDoor.SetOpenNoWait(True)
		Else
			OBJSwitchGenericFail.Play(DN070_TurretHallButton)
		EndIf
	ElseIf (laserGridEnabled)
		DisableLasers()
		DisableIDCardReader()
		DN070_TurretHallDoor.SetOpenNoWait(True)
	Else
		EnableLasers()
		EnableIDCardReader()
		DN070_TurretHallDoor.SetOpenNoWait(False)
	EndIf
EndFunction


;When the player swipes the ID Card, play the appropriate scene.
Function IDCardSwiped(bool isMayorsID)
	;Debug.Trace("Swiped")

	if (isMayorsID)
		;Play the ID Accepted scene.
		DN070_TurretHallIntroScene.Stop()
		DN070_TurretHallIDAccepted.Stop()
		DN070_TurretHallIDRejected.Stop()
		DN070_TurretHallAlarmScene.Stop()
		DN070_TurretHallIDAccepted.Start()

		;Disarm the turret hall.
		DisableLasers()
		DisableTurrets()
		DisableIDCardReader()
		DN070_TurretHallDoor.SetOpenNoWait(True)
	Else
		;Play the ID Rejected scene.
		DN070_TurretHallIntroScene.Stop()
		DN070_TurretHallIDAccepted.Stop()
		DN070_TurretHallIDRejected.Stop()
		DN070_TurretHallAlarmScene.Stop()
		DN070_TurretHallIDRejected.Start()

		;Reset the ID Card Reader.
		EnableIDCardReader()
	EndIf
EndFunction


;Stop any running scenes, play the alarm, and trigger the combat.
Function TriggerTurretHall()
	Debug.Trace("DN070 Triggered")
	if (laserGridEnabled)
		;Combat has started.
		combatTriggered = True

		;Play the Alarm scene.
		DN070_TurretHallIntroScene.Stop()
		DN070_TurretHallIDAccepted.Stop()
		DN070_TurretHallIDRejected.Stop()
		DN070_TurretHallAlarmScene.Stop()
		DN070_TurretHallAlarmScene.Start()

		;Start the turret hall combat.
		EnableTurrets()
		DisableLasers()
		DisableIDCardReader()
	EndIf
EndFunction


;-------
;Lasers
;-------

;Turn on all of the laser tripwires.
Function EnableLasers()
	laserGridEnabled = True
	;Assemble an array of lasers to cycle through.
	ObjectReference linkLasers = Self.GetLinkedRef(LinkCustom01)
	ObjectReference[] lasers = linkLasers.GetLinkedRefChain()
	lasers.Insert(linkLasers, 0)
	int i = 0
	While (i < lasers.Length)
		(lasers[i] as DN070_TrapTripwire).EnableTripwire()
		i = i + 1
	EndWhile
EndFunction

;Turn off all of the laser tripwires.
;This is done in two loops because one loop is too slow-- the last
;laser triggers may not get a chance to disable before the player hits them.
Function DisableLasers()
	laserGridEnabled = False
	;Assemble an array of lasers to cycle through.
	ObjectReference linkLasers = Self.GetLinkedRef(LinkCustom01)
	ObjectReference[] lasers = linkLasers.GetLinkedRefChain()
	lasers.Insert(linkLasers, 0)
	int i = 0
	While (i < lasers.Length)
		(lasers[i] as DN070_TrapTripwire).DeactivateTripwire()
		i = i + 1
	EndWhile
	i = 0
	While (i < lasers.Length)
		(lasers[i] as DN070_TrapTripwire).DisableTripwire()
		i = i + 1
	EndWhile
EndFunction


;--------
;Turrets
;--------

;Enable combat with the turrets.
Function EnableTurrets()
	;Assemble an array of turrets to cycle through.
	ObjectReference linkTurrets = Self.GetLinkedRef(LinkCustom02)
	ObjectReference[] turrets = linkTurrets.GetLinkedRefChain()
	turrets.Insert(linkTurrets, 0)
	int i = 0
	Actor turretActor
	While (i < turrets.Length)
		turretActor = turrets[i] as Actor
		if ((turretActor != None) && (!turretActor.IsDead()))
			turretActor.SetUnconscious(False)
			turretActor.StartCombat(Game.GetPlayer())
		EndIf
		i = i + 1
	EndWhile
EndFunction

;Disable combat with the turrets.
Function DisableTurrets()
	;Assemble an array of turrets to cycle through.
	ObjectReference linkTurrets = Self.GetLinkedRef(LinkCustom02)
	ObjectReference[] turrets = linkTurrets.GetLinkedRefChain()
	turrets.Insert(linkTurrets, 0)
	int i = 0
	Actor turretActor
	While (i < turrets.Length)
		turretActor = turrets[i] as Actor
		if ((turretActor != None) && (!turretActor.IsDead()))
			turretActor.StopCombat()
			turretActor.SetUnconscious(True)
		EndIf
		i = i + 1
	EndWhile
EndFunction

bool Function CheckAllTurretsDead()
	;Assemble an array of turrets to cycle through.
	ObjectReference linkTurrets = Self.GetLinkedRef(LinkCustom02)
	ObjectReference[] turrets = linkTurrets.GetLinkedRefChain()
	turrets.Insert(linkTurrets, 0)
	bool allDead = True
	int i = 0
	Actor turretActor
	While (i < turrets.Length)
		turretActor = turrets[i] as Actor
		Debug.Trace("I am " + turretActor + ", " + !turretActor.IsDead() + ", " + !turretActor.IsDestroyed())
		if ((turretActor != None) && (!turretActor.IsDead()) && (!turretActor.IsDestroyed()))
			allDead = False
		EndIf
		i = i + 1
	EndWhile
	Debug.Trace("allDead is " + allDead)
	return allDead
EndFunction


;---------------
;ID Card Reader
;---------------

Function DisableIDCardReader()
	DN070_TurretHallIDCardReader.LockdownIDCardReader(True)
EndFunction

Function EnableIDCardReader()
	DN070_TurretHallIDCardReader.LockdownIDCardReader(False)
EndFunction