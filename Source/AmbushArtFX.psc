Scriptname AmbushArtFX extends Actor
{DynamicallyPlaces FX art during ambush.}


Explosion Property myExplosion Auto Const
Explosion Property myWaterExplosion Auto Const
EffectShader Property myEffectShaderParticles Auto 
EffectShader Property mySplashShaderParticles Auto 
keyword Property MirelurkAmbushWaterKeyword Auto 
Armor Property PSkinMirelurkDirtGravel Auto Const

ObjectReference Property myWaterLevelMarker Auto Const
Explosion Property FurnitureMirelurkSiltExplosion Auto Const

Float Property WaitToSplash = 0.4 Auto Const

Event OnLoad()
	RegisterForAnimationEvent(self, "Open")
  ;equip dirt skin to match ambush furn art
  equipitem(PSkinMirelurkDirtGravel)
EndEvent

Event OnAnimationEvent(ObjectReference source, string eventName)
  if (eventName == "Open")
    ;Play anim on dirt skin
    PlaySubGraphAnimation("stage2")
    ;Playdirt or mud particle to match ground fx


    ;if underwater is set do one thing else do another
    if myWaterLevelMarker 
      if myWaterExplosion
        myWaterLevelMarker.PlaceAtMe(FurnitureMirelurkSiltExplosion)
      endIf
      utility.wait(WaitToSplash)
      if myWaterExplosion
        myWaterLevelMarker.PlaceAtMe(myWaterExplosion)
      endIf

    if mySplashShaderParticles
      mySplashShaderParticles.Play(self)
    endIf
    if myEffectShaderParticles
      myEffectShaderParticles.Play(self)
    endIf
    ;not in water
  else
    if myEffectShaderParticles
      myEffectShaderParticles.Play(self)
    endIf
      if myExplosion && !myWaterLevelMarker
    	PlaceAtMe(myExplosion)
      endIf
    endif
  endif
  ;clean up splash particle fx
  if mySplashShaderParticles
      utility.wait(1.0)
      mySplashShaderParticles.Stop(self)
  endIf
EndEvent

Event OnDying(Actor akKiller)
  ;Remove dirt particles
      if myEffectShaderParticles
       myEffectShaderParticles.stop(self)
      endIf
    ;stop water fx on skin if wter based
    if myWaterLevelMarker 
      PlaySubGraphAnimation("reset")
    endif
EndEvent