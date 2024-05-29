Scriptname VertibirdRaceFXScript extends ActiveMagicEffect
{Handles vertibird race wide fx}

Explosion Property DeathExplosion Auto Const
{Plays on death.}
Explosion Property vertibirdPropellerExplosion Auto Const
{Plays on death.}

Group flyby_Properties
	int Property flybySlowSpeed = 50 Auto Const
	{speed above which to play flyby slow fx}
	int Property flybyFastSpeed = 400 Auto Const
	{speed above which to play flyby fast fx}
	Sound Property OBJVertibirdFlybySpeedHigh Auto const
	{Sound to play for fast flyby}
	Sound Property OBJVertibirdFlybySpeedLow Auto const
	{Sound to play for slow flyby}
endgroup

bool hasBlownUp = False

Event OnEffectStart(Actor akTarget, Actor akCaster)
    RegisterForAnimationEvent(akCaster, "KillActor" )
    RegisterForAnimationEvent(akCaster, "VertibirdPassByEffect" )
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
   ;Break any registration to events so I can delete them
	unregisterForAllEvents()
EndEvent

Event OnDying(Actor akKiller)
	actor selfRef = GetTargetActor()
    UnregisterForAnimationEvent(selfRef, "KillActor" )
    if (!hasBlownUp)
		blowUp(selfRef)
	EndIf
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	actor selfRef = GetTargetActor()
	if (asEventName == "KillActor")
		UnregisterForAnimationEvent(selfRef, "KillActor" )
		debug.trace("vbird got KillActor")
		if (!hasBlownUp)
			blowUp(selfRef)
		endIf
	endIf
	
	;fast flyby test 
;	if (asEventName == "VertibirdPassByEffect" && selfRef.GetAnimationVariableFloat("Speed") > flybyFastSpeed && game.getPlayer().IsOnMount() == false)
;		debug.trace("vbird got VertibirdPassByEffect fast")
;		;playsound
;		OBJVertibirdFlybySpeedHigh.play(selfRef)
;		;give sound time to play before you feel it
;		utility.wait(0.01)
;		Game.ShakeCamera(game.getPlayer(),0.1, 1.0)
;  	Game.ShakeController(0.2, 0.2, 1.0)
   	;slow flyby test
;	elseif (asEventName == "VertibirdPassByEffect" && selfRef.GetAnimationVariableFloat("Speed") > flybySlowSpeed && game.getPlayer().IsOnMount() == false)
;		debug.trace("vbird got VertibirdPassByEffect slow")
;		OBJVertibirdFlybySpeedLow.play(selfRef)
;		;give sound time to play before you feel it
;		utility.wait(0.01)
;		Game.ShakeCamera(game.getPlayer(),0.5, 0.5)
;   	Game.ShakeController(0.1, 0.1, 0.5)
;	endIf

EndEvent

function blowUp(Actor selfRef)
	hasBlownUp = True
debug.trace("vvvvvvvvvvvvvbird blew upppppppppppppppppppppppp")
	selfRef.PlaceAtNode("COM", DeathExplosion)
	selfRef.PlaceAtNode("RightPropeller", vertibirdPropellerExplosion)
	selfRef.PlaceAtNode("LeftPropeller", vertibirdPropellerExplosion)
	selfRef.Dismember("Head2", True, False)
	;selfRef.Dismember("LeftArm1", True, False)
	;selfRef.Dismember("RightArm1", True, False)
	selfRef.Dismember("Torso", True, False)
	utility.wait(0.2)
	selfRef.disable()
	debug.trace("vvvvvvvvvvvvvbird DISABLEEEEEEEEEEEEEEEEEEEEEEEEEEEEE")
	selfRef.delete()
endFunction