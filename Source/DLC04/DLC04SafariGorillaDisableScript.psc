Scriptname DLC04:DLC04SafariGorillaDisableScript extends RefCollectionAlias

quest property DLC04SafariAdventureQuest auto

Event OnPlayerTeleport()
    if DLC04SafariAdventureQuest.getstageDone(176) == 1
    	self.disableall()
    endif
EndEvent