ScriptName DN035_RacingRobotsScript extends RefCollectionAlias Const Hidden
{Script on the DN035 Racing Robots.}
;
;This script handles the racing robots' special combat behavior; they are unaggressive and ignore combat unless attacked (by anyone).
;After being attacked, their Aggression switches to 2, causing them to fall out of their ignore combat package and begin fighting normally.
;
;Additionally, when a robot is killed, we check to see if it's one of the Reserve Racers, and if necessary, update the global
;that counts how many of them are alive for display on the reprogramming terminals.

DN035QuestScript property DN035 Auto Const Mandatory
{DN035}

LocationRefType property AutofillGeneric03 Auto Const Mandatory
{RefType that designates a Reserve Racer.}

ActorValue property Aggression Auto Const Mandatory
{The Aggression AV.}


;----------------
;Combat Behavior
;----------------

Function RegisterRobotsForHitEvents()
	int i = 0
	While (i < Self.GetCount())
		RegisterForHitEvent(Self.GetAt(i))
		i = i + 1
	EndWhile
EndFunction

Function RegisterForHitEvents(ObjectReference akSenderRef)
	;Register for hit events if not unconscious and not already aggressive.
	Actor akActor = akSenderRef as Actor
	if ((!akActor.IsUnconscious()) && (akActor.GetValue(Aggression) == 0))
		;Debug.Trace("DN035: " + akActor + " registered for Hit")
		akActor.UnregisterForAllHitEvents()
		akActor.RegisterForHitEvent(akActor)
	EndIf
EndFunction

Event OnConsciousnessStateChanged(ObjectReference akSenderRef, bool abUnconscious)
	if (abUnconscious)
		;If unconscious, ignore further hit events and reset aggression.
		akSenderRef.UnregisterForAllHitEvents()
		akSenderRef.SetValue(Aggression, 0)
	ElseIf (akSenderRef.GetValue(Aggression) == 0)
		;If conscious and not already aggressive, register for hit events. 
		akSenderRef.RegisterForHitEvent(akSenderRef)
	EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	Actor akActor = akTarget as Actor
	;Debug.Trace("DN035: " + akActor + " was hit!")
	if ((akActor != None) && (!akActor.IsUnconscious()))
		;Debug.Trace("DN035: " + akActor + " became aggressive.")
		;If the robot is hit, set them aggressive; their ignore combat package is conditioned to fail out
		;once their aggression changes, so they will now enter combat normally.
		akActor.SetValue(Aggression, 2)
		akActor.EvaluatePackage()
	EndIf
EndEvent


;----------------
;Death Reporting
;----------------

Event OnDeath(ObjectReference akSenderRef, Actor akKiller)
	if (akSenderRef.HasRefType(AutofillGeneric03))
		DN035.UpdateReserveRacerCount()
	EndIf
EndEvent