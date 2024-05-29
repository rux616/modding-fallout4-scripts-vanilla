Scriptname DLC04:DLC04MS02PlaceableObjectTriggerScript extends ObjectReference

DLC04:DLC04MS02Script Property DLC04MS02 Auto Const Mandatory

Message Property myMessage Auto Const Mandatory
Form Property myRequiredItem Auto Const Mandatory
Bool Property isDistributor = false Auto Const

Event OnCellAttach()
	if GetLinkedRef().IsEnabled()
		Disable()
	Endif
EndEvent

Event OnActivate(ObjectReference AkActivator)
	if AkActivator == Game.GetPlayer()
		if myMessage.Show() == 0
			Game.GetPlayer().RemoveItem(myRequiredItem)
			GetLinkedRef().EnableNoWait()
			DisableNoWait()
			if isDistributor
				DLC04MS02.SetHasPowerDistributor()
			else
				DLC04MS02.SetCoreInPlace()
			endif
		endif
	endif
EndEvent