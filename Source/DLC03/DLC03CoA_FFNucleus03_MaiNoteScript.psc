Scriptname DLC03:DLC03CoA_FFNucleus03_MaiNoteScript extends ObjectReference Const

Quest Property DLC03CoA_QuestPointers Auto Const Mandatory
{Children of Atom pointer quest}

Quest Property DLC03CoA_Kickout Auto Const Mandatory
{Children of Atom kick out quest}

GlobalVariable Property DLC03CoA_PlayerJoinedCoA Auto Const Mandatory
{Global watching if player's joined CoA}

ActorBase Property DLC03CoA_SisterMai Auto Const Mandatory
{Base actor for the FFNucleus03 quest}

Quest Property DLC03MQ06_NukeHandling Auto Const Mandatory
{Quest to watch for Nuke launch}

Event OnRead()
	if DLC03CoA_PlayerJoinedCoA.GetValue() == 1 && !DLC03CoA_QuestPointers.GetStageDone(500) && !DLC03CoA_QuestPointers.GetStageDone(550) && !DLC03CoA_Kickout.GetStageDone(700) && DLC03CoA_SisterMai.GetDeadCount() <= 0 && !DLC03MQ06_NukeHandling.GetStageDone(100)
  		DLC03CoA_QuestPointers.SetStage(500)
	endif
EndEvent