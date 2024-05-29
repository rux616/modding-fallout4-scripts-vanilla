Scriptname TestConsciousnessChanged extends Actor Hidden

Event OnConsciousnessStateChanged(bool abUnconscious)
	Self.Kill()
EndEvent
