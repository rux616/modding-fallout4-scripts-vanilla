Scriptname DN160_MannequinCostumeActivatorScript extends ObjectReference Hidden Const
{Script for the MS04 Silver Shroud Mannequin Costume Activator in HubrisComics01.}

Quest property MS04 Auto Const Mandatory
{MS04}

ObjectReference property DN160_CostumeMusicActivator Auto Const Mandatory
{Music activator.}

Event OnActivate(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		;Disable the costume.
		Self.Disable()

		;Trigger the reward music.
		DN160_CostumeMusicActivator.Activate(DN160_CostumeMusicActivator)

		;Release the underlying mannequin to Havok.
		(Self.GetLinkedRef() as DefaultDisableHavokOnLoad).ReleaseToHavok()

		;Update MS04, which gives the player the actual costume.
		MS04.SetStage(200)
	EndIf
EndEvent