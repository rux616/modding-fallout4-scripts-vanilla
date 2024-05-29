ScriptName REAssaultSC_FactionScript extends Quest
{Script for REAssaultSC_Faction quests.}

ReferenceAlias[] property Attackers Auto
{Array of Attacker aliases.}

ReferenceAlias[] property Defenders Auto
{Array of Defender aliases.}

int property MinActorsAttackers = 3 Auto Const
{Minimum number of attackers.}

int property MinActorsDefenders = 3 Auto Const
{Minimum number of defenders.}

int property MaxTotalActors = 8 Auto Const
{Maximum number of total actors.}


Function ResolveActors()
	if ((Attackers != None) && (Defenders != None))
		;Figure out how many attackers and defenders to remove.
		int initialAttackers = Attackers.Length
		int initialDefenders = Defenders.Length
		int initialTotalActors = initialAttackers + initialDefenders ;Usually 10

		int minToRemove = initialTotalActors - MaxTotalActors
		int maxToRemove = initialTotalActors - (MinActorsAttackers + MinActorsDefenders)
		int actorsToRemove = Utility.RandomInt(minToRemove, maxToRemove)

		int maxDefendersThatCouldBeRemoved = initialDefenders - MinActorsDefenders
		int minAttackersToRemove = actorsToRemove - maxDefendersThatCouldBeRemoved
		int maxAttackersToRemove = initialAttackers - MinActorsAttackers
		int attackersToRemove = Utility.RandomInt(minAttackersToRemove, maxAttackersToRemove)
		int defendersToRemove = actorsToRemove - attackersToRemove

		Debug.Trace("REAssaultSCFaction ResolveActors: " + actorsToRemove + ", " + attackersToRemove + ", " + defendersToRemove)

		;Remove the attackers and defenders we need to remove.
		if (attackersToRemove > 0)
			RemoveActors(Attackers, attackersToRemove)
		EndIf
		if (defendersToRemove > 0)
			RemoveActors(Defenders, defendersToRemove)
		EndIf

		;Enable the remaining attackers and defenders.
		int i = 0
		While (i < Attackers.Length)
			Actor next = Attackers[i].GetActorRef()
			if ((next != None) && ((next as TeleportActorScript) == None))
				next.EnableNoWait()
				next.EvaluatePackage()
			EndIf
			i = i + 1
		EndWhile
		i = 0
		While (i < Defenders.Length)
			Actor next = Defenders[i].GetActorRef()
			if ((next != None) && ((next as TeleportActorScript) == None))
				next.EnableNoWait()
				next.EvaluatePackage()
			EndIf
			i = i + 1
		EndWhile

		;Update REScript's count of attackers and defenders based on the actors that remain.
		((Self as Quest) as REScript).UpdateDeadCountGroupSize(1, Attackers.Length)
		((Self as Quest) as REScript).UpdateDeadCountGroupSize(0, Defenders.Length)
	ElseIf (Attackers != None)
		;Figure out how many attackers to remove.
		int initialAttackers = Attackers.Length
		int minToRemove = initialAttackers - MaxTotalActors
		int maxToRemove = initialAttackers - MinActorsAttackers
		int attackersToRemove = Utility.RandomInt(minToRemove, maxToRemove)
		Debug.Trace("REAssaultSCFaction ResolveActors (Attackers ONLY): " + attackersToRemove)

		;Remove the defenders we need to remove.
		if (attackersToRemove > 0)
			RemoveActors(Attackers, attackersToRemove)
		EndIf
		int i = 0
		While (i < Attackers.Length)
			Actor next = Attackers[i].GetActorRef()
			if ((next != None) && ((next as TeleportActorScript) == None))
				next.EnableNoWait()
				next.EvaluatePackage()
			EndIf
			i = i + 1
		EndWhile

		;Update REScript's count of attackers and defenders based on the actors that remain.
		((Self as Quest) as REScript).UpdateDeadCountGroupSize(0, Attackers.Length)
	ElseIf (Defenders != None)
		;Figure out how many defenders to remove.
		int initialDefenders = Defenders.Length
		int minToRemove = initialDefenders - MaxTotalActors
		int maxToRemove = initialDefenders - MinActorsDefenders
		int defendersToRemove = Utility.RandomInt(minToRemove, maxToRemove)
		Debug.Trace("REAssaultSCFaction ResolveActors (Defenders ONLY): " + defendersToRemove)

		;Remove the defenders we need to remove.
		if (defendersToRemove > 0)
			RemoveActors(Defenders, defendersToRemove)
		EndIf
		int i = 0
		While (i < Defenders.Length)
			Actor next = Defenders[i].GetActorRef()
			if ((next != None) && ((next as TeleportActorScript) == None))
				next.EnableNoWait()
				next.EvaluatePackage()
			EndIf
			i = i + 1
		EndWhile

		;Update REScript's count of attackers and defenders based on the actors that remain.
		((Self as Quest) as REScript).UpdateDeadCountGroupSize(0, Defenders.Length)
	EndIf
EndFunction

Function RemoveActors(ReferenceAlias[] actors, int countToRemove)
	int i = 0
	While (i < countToRemove)
		int index = Utility.RandomInt(0, actors.Length - 1)
		actors[index].GetActorRef().Delete()
		actors[index].Clear()
		actors.Remove(index)
		Debug.Trace("REAssaultSCFaction RemoveActors: " + actors + ": " + index)
		i = i + 1
	EndWhile
EndFunction

;Called on request by the InstRelay Assaults.
Function TeleportIn(ReferenceAlias[] Synths)
	int i = 0
	While (i < Synths.Length)
		TeleportActorScript a = Synths[i].GetActorRef() as TeleportActorScript
		if (a != None)
			Debug.Trace("Relaying " + a + " in.")
			a.EnableNoWait()
			Utility.Wait(Utility.RandomFloat(0.5, 2))
		EndIf
		i = i + 1
	EndWhile
EndFunction

;Called on request by the InstRelay Assaults.
Function TeleportOut(ReferenceAlias[] Synths)
	int i = 0
	While (i < Synths.Length)
		TeleportActorScript a = Synths[i].GetActorRef() as TeleportActorScript
		if ((a != None) && (!a.IsDead()))
			a.TeleportOut()
			Utility.Wait(Utility.RandomFloat(0.5, 1.5))
		EndIf
		i = i + 1
	EndWhile
EndFunction