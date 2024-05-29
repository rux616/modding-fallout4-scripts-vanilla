Scriptname BoSM02CleanupQuestActorsOnUnload extends Actor Const Hidden
{Script on Gavil, Lucia, and Clarke's refs. If the player is kicked from the Brotherhood, they disable when they next unload to minimize the chance of odd behaviors.}

Quest property BoSM02 Auto Const Mandatory
{BoSM02}

Event OnUnload()
	if (BoSM02.GetStageDone(11))
		Self.DisableNoWait()
	EndIf
EndEvent