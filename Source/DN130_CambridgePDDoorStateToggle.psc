Scriptname DN130_CambridgePDDoorStateToggle extends ObjectReference Hidden
{Makes sure the Cambridge PD's garage door is set to the correct state each time it loads to avoid interfering with NPC patrol routes.}

Quest property DN130 Auto
{DN130 - Police Station}

int property myStage Auto
{Stage to watch for.}

bool property ShouldSetOpen Auto
{Should the door be set to open or closed?}

Event OnLoad()
	if (DN130.GetStageDone(myStage))
		SetOpen(ShouldSetOpen)
	EndIf
EndEvent