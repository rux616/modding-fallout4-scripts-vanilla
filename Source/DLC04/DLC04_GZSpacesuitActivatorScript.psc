Scriptname DLC04:DLC04_GZSpacesuitActivatorScript extends ObjectReference Const
{To be cleaned up.}

DLC04:DLC04GZTrackingQuestScript property DLC04GZTrackingQuest Auto Const Mandatory


Event OnActivate(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		;Disable the costume.
		Self.Disable()

		;Release the underlying mannequin to Havok.
		(Self.GetLinkedRef() as DefaultDisableHavokOnLoad).ReleaseToHavok()

		;Update MS04, which gives the player the actual costume.
		DLC04GZTrackingQuest.GiveSpacesuit()
	EndIf
EndEvent