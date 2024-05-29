Scriptname CZ_CombatantTeleportOnLoad extends ReferenceAlias

ObjectReference Property Marker Auto Const
Quest Property CZ Auto Const

Event OnLoad()
	if !self.GetActorRef().IsDead() && !CZ.GetStageDone(150) && !CZ.GetStageDone(200) && !CZ.GetStageDone(250)
		;debug.trace("Moving " + self + "to marker.")
		self.GetRef().MoveTo(Marker)
	endif
EndEvent