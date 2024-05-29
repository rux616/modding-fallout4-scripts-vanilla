Scriptname COMX688TalkPlayerAliasScript extends ReferenceAlias
;This script tracks the player's lcoation changing and re-enables X6 after he gets disabled by the teleport

Location Property InstituteLocation Auto Const
GlobalVariable Property CompanionX6Disabled Auto Const
GlobalVariable Property CompanionX6TeleportDestination Auto Const
ReferenceAlias Property Alias_X6 Auto
Quest Property COMX688Talk Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	; If the player enters a location that's a child of InstituteLocation while the "CompanionX6TeleportDestination" 
	; global value is set to 1 (meaning X6 teleported to the Institute when dismissed)...
	debug.trace("Player's location changed: "+aknewloc)
	if InstituteLocation.IsChild(aknewloc) && CompanionX6TeleportDestination.GetValue() == 1
	    	;Set stage 20, which enables X6 and sets the global variable back to zero
	   		COMX688Talk.SetStage(20)
	;If the player enters a location that's not a child of InstituteLocation... 
	;while the "CompanionX6TeleportDestination" global value is set to 2 (meaning X6 teleported to the surface when dismissed)...
	elseif !InstituteLocation.IsChild(aknewloc) && CompanionX6TeleportDestination.GetValue() == 2
			;Set stage 20, which enables X6 and sets the global variable back to zero
			COMX688Talk.SetStage(20)
	endif
endevent