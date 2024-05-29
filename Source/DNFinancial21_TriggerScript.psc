Scriptname DNFinancial21_TriggerScript extends ObjectReference Hidden
{Trigger script for the DNFinancial21 alarm event.}

ObjectReference property DNFinancial21_PowerArmor Auto Const Mandatory

ObjectReference property DNFinancial21_LeftKlaxon Auto Const Mandatory
ObjectReference property DNFinancial21_RightKlaxon Auto Const Mandatory

Default2StateActivator property DNFinancial21_LeftDoor Auto Const Mandatory
Default2StateActivator property DNFinancial21_RightDoor Auto Const Mandatory

Keyword property LinkCustom01 Auto Const Mandatory

Auto State Waiting
	Event OnTriggerEnter(ObjectReference akActivator)
		if (akActivator == Game.GetPlayer())
			GoToState("Done")

			;Reset the Power Armor.
			DNFinancial21_PowerArmor.Reset()

			;Activate the Klaxons.
			DNFinancial21_LeftKlaxon.Activate(Self)
			DNFinancial21_RightKlaxon.Activate(Self)

			;Wait for it...
			Utility.Wait(5)

			;Open the doors.
			DNFinancial21_LeftDoor.SetOpenNoWait(True)
			DNFinancial21_RightDoor.SetOpen(True)

			;Activate the enemies.
			ObjectReference[] objs = Self.GetLinkedRefChain(LinkCustom01)
			int i = 0
			While (i < objs.Length)
				Actor a = objs[i] as Actor
				if (a != None)
					a.SetUnconscious(False)
					a.EvaluatePackage()
				EndIf
				i = i + 1
			EndWhile
		EndIf
	EndEvent
EndState

State Done
	Event OnTriggerEnter(ObjectReference akActivator)
	EndEvent	
EndState