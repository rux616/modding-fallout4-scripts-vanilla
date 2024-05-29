Scriptname DN049_DirectorPackageEvaluationScript extends ReferenceAlias Hidden
{Script on the DN049 Director. During a specific sequence, force-EVPs him frequently to make sure his forcegreet triggers as soon as possible.}

Quest property DN049 Auto Const Mandatory
{DN049}

Package property DN049_ForcegreetDirector Auto Const Mandatory
{The package the Director will be running while we force-EVP him.}

Function WaitForForcegreet()
	StartTimer(0.5, 1)
EndFunction

Event OnTimer(int timerID)
	if ((Self.GetActorRef().GetCurrentPackage() == DN049_ForcegreetDirector) && !(DN049.GetStageDone(810)))
		Self.TryToEvaluatePackage()
		StartTimer(0.5, 1)
	EndIf
EndEvent


