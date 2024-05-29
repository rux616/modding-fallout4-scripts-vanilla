Scriptname InstituteTeleportQuestAliasScript extends ReferenceAlias Conditional

SPELL Property TeleportSpell Auto Const




Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	Debug.Trace(Self + "Change location" + AkOldLoc + ", " + AkNewLoc)
	if (akOldLoc == InstituteLocation) || (InstituteLocation.IsChild(AkOldLoc))
		if akNewLoc == InstituteLocation  || (InstituteLocation.IsChild(AkNewLoc))
			;do nothing
			Debug.Trace("Change loc, no teleport effect")
		else
			Debug.Trace("Change loc, teleport me!")
			Game.GetPlayer().AddSpell(TeleportSpell, abVerbose=False)
		endif
	elseif (akNewLoc == InstituteLocation) || (InstituteLocation.IsChild(AkNewLoc))
		if (akOldLoc == InstituteLocation) || (InstituteLocation.IsChild(AkOldLoc))
			;do nothing
			Debug.Trace("Change loc, no teleport effect")

		else
			Debug.Trace("Change loc, teleport me!")
			Game.GetPlayer().AddSpell(TeleportSpell, abVerbose=False)
			GetOwningQuest().SetStage(10)
		endif
	endif


endEvent

Location Property InstituteLocation Auto Const
