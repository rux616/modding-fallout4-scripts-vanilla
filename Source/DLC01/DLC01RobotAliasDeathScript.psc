Scriptname DLC01:DLC01RobotAliasDeathScript extends ReferenceAlias

Event OnDeath(Actor akKiller)

	Debug.Trace("DLC01 ROBOT ACTOR DIED CLEAR ALIAS")
	;Followers.DismissCompanion(GetActorRef(), ShowLocationAssignmentListIfAvailable = false, SuppressDismissMessage = true)

	Clear()

EndEvent