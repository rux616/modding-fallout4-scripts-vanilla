ScriptName TEST_SwitchToPowerArmorTest Extends ObjectReference

bool inPowerArmor
Actor property myActor Auto Const
ObjectReference property myPowerArmor Auto Const

Event OnActivate(ObjectReference akActivator)
	if (!inPowerArmor)
		Debug.Trace("Putting " + myActor + " into " + myPowerArmor)
		myActor.SwitchToPowerArmor(myPowerArmor)
		inPowerArmor = True
	Else
		Debug.Trace("Removing " + myActor + " from " + myPowerArmor)
		myActor.SwitchToPowerArmor(None)
		inPowerArmor = False
	EndIf
EndEvent

