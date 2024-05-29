Scriptname Test_TrailerOnly_TurnOffDustScript extends ObjectReference Const

Event OnLoad()
	debug.trace(self + "TURN OFF AMBIENT PARTICLES")
	Weather.EnableAmbientParticles(false)
EndEvent