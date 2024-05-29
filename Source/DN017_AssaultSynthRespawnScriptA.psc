Scriptname DN017_AssaultSynthRespawnScriptA extends defaultAliasRespawnScriptA
{Script for respawning this alias.  For use along with a quest that has the DefaultQuestRespawnScript attached to it.}

Group DN017_Properties
	DN017QuestScript property DN017 Auto Const Mandatory
	Spell property DN017_RocketDisintegration Auto Const Mandatory
EndGroup

Actor[] myActors


Event OnAliasInit()
	myActors = new Actor[0]
	Self.RegisterForCustomEvent(DN017, "DN017RocketFireDisintegrate")
	RegisterActor(Self.GetActorRef())
	Parent.OnAliasInit()
EndEvent

function RespawnIfDead()
 	;debug.trace(self + " RespawnIfDead")
	if GetActorRef().IsDead()
		defaultQuestRespawnScript myQuest = GetOwningQuest() as defaultQuestRespawnScriptA
		gotoState("respawning")
		myQuest.Respawn(self)
		RegisterActor(Self.GetActorRef())
		gotoState("normal")
	else
 		;debug.trace(self + "RespawnIfDead: I'm not dead - " + GetActorRef() + ".IsDead()=" + GetActorRef().IsDead())
	endif
endFunction

auto state normal
	Event OnDeath(Actor akKiller)
		;Debug.Trace("Respawning actor OnDeath")
		if bRespawningOn
			defaultQuestRespawnScript myQuest = GetOwningQuest() as defaultQuestRespawnScriptA
			gotoState("respawning")
			myQuest.TryToRespawn(self)
			RegisterActor(Self.GetActorRef())
			gotoState("normal")
		endif
	endEvent
endState

state respawning
	Event OnDeath(Actor akKiller)
	endEvent
endState


Function RegisterActor(Actor akActor)
	if ((akActor != None) && (myActors.Find(akActor) < 0))
		;Debug.Trace("DN017AssaultRespawn Registered: " + Self)
		myActors.Add(akActor)
	Else
		;Debug.Trace("DN017AssaultRespawn failed to Register: " + Self)
	EndIf
EndFunction

Event DN017QuestScript.DN017RocketFireDisintegrate(DN017QuestScript akSender, Var[] akArgs)
	int i = myActors.Length - 1
	While (i >= 0)
		;Debug.Trace("DN017AssaultRespawn wiped: " + Self)
		if ((myActors[i] != None) && (myActors[i].IsEnabled()))
			;Debug.Trace("Critting " + myActors[i])
			DN017_RocketDisintegration.Cast(myActors[i], myActors[i])
			Utility.Wait(Utility.RandomFloat(0, 0.3))
		EndIf
		i = i - 1
	EndWhile
	myActors.Clear()
EndEvent