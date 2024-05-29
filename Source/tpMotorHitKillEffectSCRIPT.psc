Scriptname tpMotorHitKillEffectSCRIPT extends ActiveMagicEffect

FLOAT PROPERTY pushStr AUTO

EVENT OnEffectStart(Actor Target, Actor Caster)	

	;game.getPlayer().pushActorAway(target, pushStr)

	;utility.wait(1.0)

	target.Dismember( "Head1", true, false )
	target.Dismember( "LeftArm1", true, false )
	target.Dismember( "RightArm1", true, false )
	target.Dismember( "LeftLeg1", true, false )
	target.Dismember( "RightLeg1", true, false )
	target.Dismember( "LeftFoot", true, false )
	target.Dismember( "RightFoot", true, false )

	;target.kill(game.getPlayer())

ENDEVENT