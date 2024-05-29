Scriptname DN049_ChampOnHitAliasScript extends ReferenceAlias Const Hidden
{The DN049 Champ's Alias scriptm, replacing the usual DefaultAliasOnHit script for him. Cares about legal/illegal weapons during the fight.}

Quest property DN049 Auto Const Mandatory
{DN049}

Weapon[] property LegalWeapons Auto Const Mandatory
{After Stage fightStartStage, hits from these weapons are 'legal' and do not trigger the stage to be set.}

int property fightStartStage Auto Const Mandatory
{Stage at which the fight starts, and we begin to care about legal or illegal hits.}

int property turnOffStage Auto Const Mandatory
{Stage at which this script no longer sets further stages.}

int property stageToSetOnHitNormally Auto Const Mandatory
{Before Stage fightStartStage, stage to set if hit by anything.}

int property illegalHitStageToSet Auto Const Mandatory
{After Stage fightStartStage, stage to set if an illegal hit occurs.}

int property legalDeathStageToSet Auto Const Mandatory
{After Stage fightStartStage, stage to set if the actor dies without any illegal hits occuring.}


Event OnAliasInit()
	RegisterForHitEvent(Self, Game.GetPlayer())
EndEvent

Event OnDying(Actor akKiller)
	if (DN049.GetStageDone(fightStartStage) && !DN049.GetStageDone(illegalHitStageToSet) && !DN049.GetStageDone(turnOffStage))
		DN049.SetStage(legalDeathStageToSet)
	EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	if (!DN049.GetStageDone(turnOffStage) && !Self.GetActorRef().IsDead())
		if (DN049.GetStageDone(fightStartStage))
			;Was this a legal hit?
			bool wasLegalHit = False
			int i = 0
			While (!wasLegalHit && (i < LegalWeapons.Length))
				if (akSource == LegalWeapons[i])
					wasLegalHit = True
				Endif
				i = i + 1
			EndWhile

			if (!wasLegalHit)
				Debug.Trace("Illegal hit.")
				DN049.SetStage(illegalHitStageToSet)
			Else
				Debug.Trace("Legal hit; ignored.")
			EndIf
		Else
			DN049.SetStage(stageToSetOnHitNormally)
		EndIf
		RegisterForHitEvent(Self, Game.GetPlayer())
	EndIf
EndEvent