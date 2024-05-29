Scriptname DLC03:VR_ShootObjectsQuestScript extends Quest Const

function EvaluatePackages()
	int i = 0
	while i < Attackers.Length
		Attackers[i].TryToEvaluatePackage()
		i += 1
	endWhile
endFunction

ReferenceAlias[] Property Attackers Auto Const
