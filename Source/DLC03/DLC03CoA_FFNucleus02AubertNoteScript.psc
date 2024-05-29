Scriptname DLC03:DLC03CoA_FFNucleus02AubertNoteScript extends ReferenceAlias

GlobalVariable Property DLC03CoA_PlayerKickedOutofCoA Auto Const Mandatory
{Used to determine if player's been kicked from CoA}

GlobalVariable Property DLC03CoA_PlayerJoinedCoA Auto Const Mandatory
{Used to determine if player's joined the CoA}

GlobalVariable Property DLC03MQ06a_ConfessorUnavailable Auto Const Mandatory
{Used to determine if player's been kicked from CoA}

Quest Property DLC03CoA_FFNucleus02 Auto Const Mandatory
{Quest to set stage on when this note is read}

Quest Property DLC03MQ06_NukeHandling Auto Const Mandatory
{Quest to watch for Nuke launch}

int Property iStageToSet = 200 Auto Const
{Set to set in FFNucleus02 when note is read}

Event OnRead()
	;If the player hasn't been kicked out of the CoA and the High Confessor hasn't been replaced,
	;set the appropriate stage
	if DLC03CoA_PlayerJoinedCoA.GetValue() == 1 && DLC03CoA_PlayerKickedOutofCoA.GetValue() < 1 && DLC03MQ06a_ConfessorUnavailable.GetValue() < 1 && !DLC03MQ06_NukeHandling.GetStageDone(100)
		DLC03CoA_FFNucleus02.SetStage(iStageToSet)
	endif
EndEvent