Scriptname DLC04:DLC04SafariDisableCitoAndFamilyScript extends ReferenceAlias

quest property DLC04SafariAdventureQuest auto

Event OnPlayerTeleport()
    if DLC04SafariAdventureQuest.getstageDone(176) == 1
    	self.getReference().Disable()
    endif
EndEvent