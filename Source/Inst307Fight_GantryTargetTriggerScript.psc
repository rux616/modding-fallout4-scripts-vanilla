Scriptname Inst307Fight_GantryTargetTriggerScript extends ObjectReference Hidden
{Inst307 Fight, Phase 3: Script for a trigger at the top of Liberty Prime's Gantry.}
;
;By default, the Virus Synth is a low combat priority, since it's weak, has no weapons, and is using furniture.
;This means that BoS soldiers who make it to the top of the Gantry rarely get around to attacking it.
;This script periodically tries to find a BoS soldier at the top of the gantry and make the virus synth
;his priority combat target, which results in the Virus getting killed a lot more often.


ReferenceAlias property Alias_Virus Auto Const Mandatory
{Virus Synth alias on Inst307Fight.}

Faction property BrotherhoodOfSteelFaction Auto Const
{Brotherhood of Steel faction.}

Actor[] gantryTargetTriggerActors	;Actors in the trigger.


Event OnLoad()
	gantryTargetTriggerActors = new Actor[0]
	StartTimer(5, 1)
EndEvent

Event OnUnload()
	gantryTargetTriggerActors = None
	CancelTimer(1)
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	UpdateArray(akActionRef as Actor, true)
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	UpdateArray(akActionRef as Actor, false)
EndEvent

Event Actor.OnDeath(Actor source, Actor akKiller)
	;Debug.Trace("Gantry Trigger: Death Event for " + source)
	UpdateArray(source, false)
EndEvent

Function UpdateArray(Actor a, bool isEnterEvent)
	int index = gantryTargetTriggerActors.Find(a)
	if (isEnterEvent && (index < 0))
		gantryTargetTriggerActors.Add(a)
		RegisterForRemoteEvent(a, "OnDeath")
		;Debug.Trace("Gantry Trigger added " + a)
	ElseIf (!isEnterEvent && (index >= 0))
		gantryTargetTriggerActors.Remove(index)
		UnRegisterForRemoteEvent(a, "OnDeath")
		;Debug.Trace("Gantry Trigger removed " + a)
	EndIf
EndFunction


;Every 5s or so, if the Virus is alive and the trigger is loaded, poll the actors in the trigger about
;their combat targets, and throw the first one who's not otherwise busy at the virus.
Event OnTimer(int timerID)
	Actor virus = Alias_Virus.GetActorRef()
	if (!virus.IsDead())
		int i = 0
		Actor player = Game.GetPlayer()
		While (i < gantryTargetTriggerActors.Length)
			Actor current = gantryTargetTriggerActors[i]
			Actor currentTarget = current.GetCombatTarget()
			;Debug.Trace("Gantry Trigger testing: " + current)
			if (currentTarget == virus)
				;Debug.Trace("Gantry Trigger testing: " + current + " is targeting virus. Exiting.")
				i = gantryTargetTriggerActors.Length
			;ElseIf (currentTarget == player)
				;Debug.Trace("Gantry Trigger testing: " + current + " is targeting player. Skipping.")
			;ElseIf ((currentTarget != None) && (current.GetDistance(currentTarget) < 768))
				;Debug.Trace("Gantry Trigger testing: " + current + " is targeting nearby enemy. " + currentTarget + "; Skipping.")
			;ElseIf (current.GetDistance(virus) >= current.GetDistance(player))
				;Debug.Trace("Gantry Trigger testing: " + current + " is closer to player. Skipping.")
			ElseIf ((currentTarget != player) && ((currentTarget == None) || (current.GetDistance(currentTarget) > 768)) && \
				(current.GetDistance(virus) < current.GetDistance(player)))
				;Debug.Trace("Gantry Trigger testing: " + current + " TARGETS VIRUS.")	
				current.StartCombat(virus, True)
				i = gantryTargetTriggerActors.Length
			EndIf
			i = i + 1
		EndWhile
	EndIf
	StartTimer(5, 1)
EndEvent