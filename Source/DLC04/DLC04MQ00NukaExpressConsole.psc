Scriptname DLC04:DLC04MQ00NukaExpressConsole extends ReferenceAlias

Message Property DLC04MQ00NukaExpressConsoleMessage Auto Const Mandatory
Int ButtonPressed = 0
Quest Property DLC04MQ00 Auto Const Mandatory
ObjectReference Property DLC04MQ00MoveToMarkerRef Auto Const Mandatory
Scene Property DLC04MQ00_510_NukaExpressAnnouncer Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
debug.trace("I am activating a the Nuka-Express button")
	If DLC04MQ00.GetStageDone(500) == 1
		ButtonPressed = DLC04MQ00NukaExpressConsoleMessage.Show()
		If ButtonPressed == 0
			Debug.Trace("Button 0 Pressed")
			DLC04MQ00_510_NukaExpressAnnouncer.Start()
			GetRef().BlockActivation(True, True)
		ElseIf ButtonPressed == 1
			Debug.Trace("Button 1 Pressed")
			;do nothing
		EndIf
	EndIf
EndEvent

