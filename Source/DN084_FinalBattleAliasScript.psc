Scriptname DN084_FinalBattleAliasScript extends ReferenceAlias Const Hidden
{Script for aliases in the DN084 Final Battle.}
;
;This script increases the confidence of the final battle actors and attempts to push them into combat with the
;other faction as soon as they load. It also reports corpses to DN084_FinalBattleQuestScript for later cleanup.

Group Required_Properties
	ReferenceAlias property FinalBattleEnemy Auto Const Mandatory
	{A sample enemy to start combat on.}
EndGroup

Event OnLoad()
	Actor selfRef = Self.GetActorRef()

	;Set Confidence to Foolhardy.
	selfRef.SetValue(Game.GetConfidenceAV(), 4)

	;Start combat with the enemy in the other alias.
	Actor target = FinalBattleEnemy.GetActorRef()
	if ((target != None) && (!target.IsDead()))
		selfRef.StartCombat(target)
	EndIf
	selfRef.EvaluatePackage()
EndEvent

Event OnDying(Actor akKiller)
	(GetOwningQuest() as DN084_FinalBattleQuestScript).AddCorpse(Self.GetReference())
EndEvent