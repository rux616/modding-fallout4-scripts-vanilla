Scriptname FortuneFinder04Script extends Perk

String Property SwfName Auto Const
Sound Property UIPerkFortuneFinder Auto Const

Event OnEntryRun(int auiEntryID, ObjectReference akTarget, Actor akOwner)
	game.ShowPerkVaultBoyOnHUD(SwfName, UIPerkFortuneFinder)
EndEvent
