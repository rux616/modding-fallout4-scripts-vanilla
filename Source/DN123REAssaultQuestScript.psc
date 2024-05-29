ScriptName DN123REAssaultQuestScript extends Quest
{A variant of REAssaultQuestScript, used for the DN123 Skylanes-specific assault encounter.}
;The Skylanes POI is normally set up to trigger a random REAssault encounter. But while the quest is active, it triggers
;this priority encounter instead, which has 10 enemies (instead of the usual 5), spawns a second wave of enemies on request, and has some special handling.


;Attacker and Defender Aliases and Actor objects.
ReferenceAlias[] property AttackerAliases auto const mandatory
ReferenceAlias[] property DefenderAliases auto const mandatory

Actor[] Attackers
Actor[] Defenders


ActorValue property REAssaultRole auto const mandatory
{0=Defender, 1=Attacker, 2=Attackers during Attack Run}
;In Assault REs, REAssaultRole indicates attacker/defender (0=Defender, 1=Attacker). When all defenders are dead, any surviving attackers become the new 'defenders'.

Faction property REAssaultFactionFriend auto const mandatory
{Temporary friend faction for the actors involved in the encounter. Standard on all REAssaults. Applied by their aliases, and removed by script below.}

ObjectReference property DN123SecondWaveSpawnMarker auto const mandatory
{A potential spawn point for the second wave of enemies. Link chained to other potential spawn points.}

Keyword property LinkCustom01 auto const mandatory
{LinkCustom01}

;Has this assault been completed?
bool assaultComplete = False


;REAssault: Called as part of the REAssault Stage 10 setup.
Function InitAssault()
	;Debug.Trace("Initializing assault.")

	;Safety check: Ignore calls to InitAssault once the assault has been completed (all attackers or defenders dead).
	if (!assaultComplete)
		;Store off actors.
		int i = 0
		Attackers = new Actor[AttackerAliases.Length]
		While (i < Attackers.Length)
			Attackers[i] = AttackerAliases[i].GetActorRef()
			i = i + 1
		EndWhile
		i = 0
		Defenders = new Actor[DefenderAliases.Length]
		While (i < Defenders.Length)
			Defenders[i] = DefenderAliases[i].GetActorRef()
			i = i + 1
		EndWhile

		;Initialize attackers.
		i = 0
		Actor a
		While (i < Attackers.Length)
			a = Attackers[i]
			if (a != None)
				a.SetValue(REAssaultRole, 1)
				a.EvaluatePackage()
			EndIf
			i = i + 1
		EndWhile

		;Initialize defenders.
		i = 0
		While (i < Defenders.Length)
			a = Defenders[i]
			if (a != None)
				a.SetValue(REAssaultRole, 0)
				a.EvaluatePackage()
			EndIf
			i = i + 1
		EndWhile
	EndIf
EndFunction


;REAssault: Called when the player moves in range of the trigger. Causes the attackers to begin their attack run.
;--For the Skylanes encounter, the usual radius trigger is disabled, and StartAssault is called manually when the quest is ready for it.
Function StartAssault()
	;Debug.Trace("Starting assault.")

	;Remove friend faction from attackers and update their AV to start the attack run.
	int i = 0
	Actor a
	While (i < Attackers.Length)
		a = Attackers[i]
		if (a != None)
			a.SetValue(REAssaultRole, 2)
			a.RemoveFromFaction(REAssaultFactionFriend)
			a.EvaluatePackage()
		EndIf
		i = i + 1
	EndWhile

	;Remove friend faction from defenders.
	i = 0
	While (i < Defenders.Length)
		a = Defenders[i]
		if (a != None)
			a.RemoveFromFaction(REAssaultFactionFriend)
			a.EvaluatePackage()
		EndIf
		i = i + 1
	EndWhile
EndFunction


;Finds a safe starting point for the second wave of enemies, moves them there, and enables them.
Function StartSecondWaveAssault()
	bool done = false
	int breakout = 0
	Actor player = Game.GetPlayer()
	ObjectReference mark = DN123SecondWaveSpawnMarker.GetLinkedRef()

	;Find a set of spawn points the player doesn't have LoS to.
	While ((!done) && (mark != None) && (breakout < 10))
	     if (player.HasDetectionLoS(mark))
			mark = mark.GetLinkedRef()
			breakout = breakout + 1
	     else
	          done = True
	     EndIf
	EndWhile
	;As a failsafe, we'll just use the first candidate point.
	if (mark == None)
	     mark = DN123SecondWaveSpawnMarker.GetLinkedRef()
	EndIf

	;Debug.Trace("Mark Chosen: " + mark)

	;Spawn the second wave of enemies.
	;Each of the candidate points is LinkCustom01 linked to four other nearby points to spawn the enemies at.
	int i = 5
	Actor a
	While (i < Defenders.Length)
		a = Defenders[i]
		;Debug.Trace("Starting " + a)
		if (a != None)
			a.MoveTo(mark)
			a.Enable()
			a.EvaluatePackage()
		EndIf
		mark = mark.GetLinkedRef(LinkCustom01)
		i = i + 1
	EndWhile
EndFunction


;REAssault: Called when all attackers or all defenders are dead. Records the assault as complete and switches the attackers to become the defenders (well, if they're alive).
Function CompleteAssault()
	;Debug.Trace("Completing assault.")

	;Record the assault as complete.
	assaultComplete = True

	;Switch the attackers to become the defenders.
	int i = 0
	Actor a
	While (i < Attackers.Length)
		a = Attackers[i]
		if (a != None)
			a.SetValue(REAssaultRole, 0)
			a.EvaluatePackage()
		EndIf
		i = i + 1
	EndWhile
EndFunction


;REAssault: Clear the local attacker and defender properties when the quest shuts down.
Function CleanupAssault()
	int i = 0
	Actor a
	While (i < Attackers.Length)
		Attackers[i] = None
		i = i + 1
	EndWhile
	i = 0
	While (i < Defenders.Length)
		Defenders[i] = None
		i = i + 1
	EndWhile
EndFunction