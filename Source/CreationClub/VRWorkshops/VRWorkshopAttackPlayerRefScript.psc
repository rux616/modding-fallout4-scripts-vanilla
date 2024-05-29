Scriptname CreationClub:VRWorkshops:VRWorkshopAttackPlayerRefScript extends ReferenceAlias
{Monitors the player to revive them when they're downed and fail the attack quest. Healing methods borrowed from GenericDoctorsScript.psc}

CreationClub:VRWorkshops:VRWorkshopAttacksQuestScript Property AttackQuest Auto Const Mandatory

Event OnEnterBleedout()
	debug.trace("VR WORKSHOPS: " + " Player entered bleedout, clear out enemies, heal, and stop attacks.")
	AttackQuest.FailVRAttack() ;Stop the attack and cleanup
EndEvent
