Scriptname DLC03:DLC03CoA_MoveToLocationOnUnload extends ReferenceAlias Const

Quest Property DLC03AtomM01 Auto Const Mandatory
{Vision quest. Ensure that's done before moving Grand Zealot}

Quest Property DLC03AtomM02 Auto Const Mandatory
{The Heretic. Can turn of teleport once this is complete}

Quest Property DLC03MQ06_NukeHandling Auto Const Mandatory
{Nuke launch quest. Can turn of teleport once nuke is launched}

Quest Property DLC03CoA_Kickout Auto Const Mandatory
{Childern of Atom kick out quest. Don't need to move him any longer if player's been kicked out}

ObjectReference Property MoveToMarker Auto Const Mandatory
{The marker to move the GZ to}

Event OnUnload()
	;If the player's completed the vision quest
	;and hasn't launched the nuke, finished the Heretic Quest, or gotten kicked out of the children
	;Move Richter to his wait marker
	if DLC03AtomM01.GetStageDone(150) && !DLC03AtomM02.GetStageDone(700) && !DLC03CoA_Kickout.GetStageDone(700) && !DLC03MQ06_NukeHandling.GetStageDone(100)
		;debug.trace("Moving " + self + "to marker.")
		GetRef().Moveto(MoveToMarker)
	endif
EndEvent
