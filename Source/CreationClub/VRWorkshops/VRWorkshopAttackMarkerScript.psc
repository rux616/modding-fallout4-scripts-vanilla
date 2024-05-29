Scriptname CreationClub:VRWorkshops:VRWorkshopAttackMarkerScript extends ObjectReference

ActorBase Property VRWorkshop_EnemyType Auto Const Mandatory
{Defines what enemy is spawned at this spawn point. Attack Quest reads this property to know what to spawn.}

Message Property VRWorkshop_TutorialMessage_AttackMarker Auto Const Mandatory
{Tutorial message displayed to user first time they use an attack marker.}

GlobalVariable Property VRWorkshop_TutorialShown_VRAttackMarker Auto Const Mandatory
{Global variable flipped so we don't show the tutorial again for any VR creation.}

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	If(VRWorkshop_TutorialShown_VRAttackMarker.GetValue() == 0)
		VRWorkshop_TutorialShown_VRAttackMarker.SetValue(1)
		VRWorkshop_TutorialMessage_AttackMarker.Show()
	EndIf
EndEvent

ObjectReference Function SpawnEnemyAtMarker()
	ObjectReference enemyToSpawn = PlaceAtMe(VRWorkshop_EnemyType)
	return enemyToSpawn
EndFunction