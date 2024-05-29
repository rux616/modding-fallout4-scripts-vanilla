Scriptname Inst307Fight_PlayerAliasScript extends ReferenceAlias Const Hidden
{Inst307 Fight - Player script. Reports hit events on the player to the quest script for use by BreakoffPerimeterCombat.}

Inst307FightQuestScript property Inst307Fight Auto Const
{Inst307Fight}

Faction property BrotherhoodOfSteelFaction Auto Const
{Brotherhood of Steel Faction}

Event OnAliasInit()
	RegisterForHitEvent(Self, BrotherhoodOfSteelFaction)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	Inst307Fight.ReportPerimeterEnemyHit()
	RegisterForHitEvent(Self, BrotherhoodOfSteelFaction)
EndEvent