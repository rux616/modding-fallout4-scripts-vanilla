Scriptname DLC03:DLC03CoAEntranceMaleDisableOnUnload extends Actor Const

Quest Property DLC03CoA_Kickout Auto Const Mandatory
{Children of Atom kick out quest}

Quest Property DLC03CoA_DialogueNucleusEntrance Auto Const Mandatory
{Nucleus Entrance quest}

Event OnUnload()
	;If I'm dead, the entrance quest is over, or the player's kicked out of the Children, disable me when I unload
	if IsDead() || DLC03CoA_Kickout.GetStageDone(700) || DLC03CoA_DialogueNucleusEntrance.GetStageDone(250)
		Disable()
	endif
EndEvent