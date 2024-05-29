Scriptname DN017_PrototypeLabDoorScript extends Default2StateActivator
{Script for the DN017 Prototype Lab Door. Intercepts a SetOpenNoWait function call coming from a native terminal, enables some enemies first, and then allows the door to open.}

Quest property DN017 Auto Const Mandatory
{DN017}

Keyword property LinkCustom01 Auto Const Mandatory

bool property hasOpenedDoor Auto

Function SetOpenNoWait(bool abOpen = true)
	;Enable the enemies.
	DN017.SetStage(40)
	;Allow Default2StateActivator to handle the door as usual.
	Parent.SetOpenNoWait(abOpen)
EndFunction

Function SetOpen(bool abOpen = true)
	;Activate the music activator.
	if (!hasOpenedDoor)
		hasOpenedDoor = True
		StartTimer(1, 100)
	EndIf
	;Start Danse's scene.
	DN017.SetStage(41)
	;Allow Default2StateActivator to handle the door as usual.
	Parent.SetOpen(abOpen)
EndFunction

Event OnTimer(int timerID)
	if (timerID == 100)
		Self.GetLinkedRef(LinkCustom01).Activate(Self)
	EndIf
	Parent.OnTimer(timerID)
EndEvent