Scriptname PrydwenMoleratTeleportScript extends Actor Const

Cell Property PrydwenHull01 Auto Const

Event OnUnload()
	if !self.IsDead() && Game.GetPlayer().GetParentCell() != PrydwenHull01
		self.MoveToMyEditorLocation()
		;vdebug.trace(self + "Returned to editor loc")
	endif
EndEvent