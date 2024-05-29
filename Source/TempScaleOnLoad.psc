Scriptname TempScaleOnLoad extends Actor Hidden Const

float Property ScaleToSet = 0.85 const auto

Event OnLoad()
	self.SetScale(ScaleToSet)
EndEvent