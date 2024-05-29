Scriptname DLC03:DLC03MQ06aOnUnloadAliasScript extends ReferenceAlias

Quest Property DLC03MQ06a Auto Const Mandatory

Event OnUnload()
	;If the player has convinced this character to flee the Nucleus, and hasn't attacked, disable them on unload
	if DLC03MQ06a.GetStageDone(255) && !DLC03MQ06a.GetStageDone(95)
		GetRef().Disable()
	endif
EndEvent