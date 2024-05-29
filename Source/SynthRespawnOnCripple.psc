Scriptname SynthRespawnOnCripple extends Actor 

weapon myWeapon
actorBase myActorBase
actor myPlacedActor

        ActorValue  property leftattackcondition Auto const
        ActorValue  property rightattackcondition Auto const
        ActorValue  property perceptioncondition Auto const
        ActorValue  property leftmobilitycondition Auto const
        ActorValue  property rightmobilitycondition Auto const
        ActorValue  property endurancecondition Auto const

EffectShader Property TeleportInFXS Auto const
EffectShader Property TeleportOutFXS Auto const
light Property TeleportInFXLight Auto const
Explosion Property TeleportFXExplosion Auto const
Explosion Property TeleportOutFXExplosion Auto const
Idle Property IdleSynthTeleportLandB Auto Const
Idle Property IdleSynthTeleportOut Auto Const

Event OnLoad()
   myActorBase = self.GetActorBase()
EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
    myWeapon = self.GetEquippedWeapon() 
EndEvent


Event OnCripple(ActorValue akActorValue, bool abCrippled)


        if self.GetEquippedWeapon() 
            ;donothing
            else
            Debug.Trace("No more WEPS") 
            ;explode
             utility.wait(4.5) 
             ;additem(myWeapon)
             teleportOut(self)

           ;  SetValue(leftattackcondition, 100)
            ; SetValue(rightattackcondition, 100)
            ; SetValue(perceptioncondition, 100)
            ; SetValue(leftmobilitycondition, 100)
            ; SetValue(rightmobilitycondition, 100)
            ; SetValue(endurancecondition, 100)

            utility.wait(1.5) 
            myPlacedActor = (self.placeAtMe(myActorBase)) as actor
            if myPlacedActor.WaitFor3DLoad()
  			; 3d loaded, do something with it
  				teleportIn(myPlacedActor)
			else
 			 ; 3d didn't load, so fallback here
			endIf
             

      endif
  


EndEvent


function teleportOut(Actor actorToTeleport)
	debug.trace(self + " teleportOut: " + actorToTeleport)
    
    ;Start the magic shader to fade the actor out
    TeleportOutFXS.play(actorToTeleport, 1.2)
    ;wait for the anim to play a bit
    utility.wait(0.5)
;play lading idle
    actorToTeleport.PlayIdle(IdleSynthTeleportOut)
    ;place the light individually to get the animation to work properly
    ObjectReference myLight =actorToTeleport.PlaceAtME(TeleportInFXLight)
    ;Place explosion that contains sound and art
    actorToTeleport.PlaceAtME(TeleportOutFXExplosion)

    ;Wait for fx to be all done
    utility.wait(0.5)
    ;clean up stuff that doesn't clean itself
    myLight.delete()
    actorToTeleport.disable()

endFunction

function teleportIn(Actor actorToTeleport)
	
	;actorToTeleport.enable()
    TeleportInFXS.play(actorToTeleport, 1.2)
    ;place the light individually to get the animation to work properly
    ObjectReference myLight =actorToTeleport.PlaceAtME(TeleportInFXLight)
    ;Place explosion that contains sound and art
    actorToTeleport.PlaceAtME(TeleportFXExplosion)
    ;wait for fx to play a bit
    utility.wait(0.25)
    ;play lading idle
    actorToTeleport.PlayIdle(IdleSynthTeleportLandB)
    ;Wait for fx to be all done
    utility.wait(1.0)
    ;clean up stuff that doesn't clean itself
    myLight.delete()
    self.delete()
endFunction