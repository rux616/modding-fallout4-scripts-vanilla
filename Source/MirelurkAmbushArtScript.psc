Scriptname MirelurkAmbushArtScript extends Actor
{DynamicallyPlaces FX art during ambush.}

Group All_Properties CollapsedOnRef
  Explosion Property Furnituremirelurkexplosion Auto Const

  Formlist Property MirelurkAmbushEffectShaderFL Auto Const
  ;EffectShader[] Property EffectShaderParticles Auto

  Formlist Property MirelurkAmbushArmorFL Auto Const
  ;Armor[] Property MirelurkSkin Auto

endGroup


Group Water_Ambush_Properties CollapsedOnRef
;Water Ambush properties
  EffectShader Property WaterSplashParticles Auto
  Explosion Property FurnitureMirelurkWaterExplosion Auto Const
  keyword Property MirelurkAmbushWaterKeyword Auto 
  Explosion Property FurnitureMirelurkSiltExplosion Auto Const

endGroup

Group UnderTheHood CollapsedOnRef

  Float Property WaitToSplash = 0.4 Auto Const
  Keyword Property LinkAmbushFurniture auto const
  Keyword Property AnimFurnMirelurkAmbushDefault Auto Const
  Keyword Property AnimFurnMirelurkAmbushRiverbedRocks Auto Const
  Keyword Property AnimFurnMirelurkAmbushCaveMud Auto Const
  Keyword Property AnimFurnMirelurkAmbushNestMud Auto Const
  Keyword Property AnimFurnMirelurkAmbushRiverbedrocksSand01 Auto Const
  Keyword Property AnimFurnMirelurkAmbushRiverbedRocksWet01 Auto Const
  Keyword Property AnimFurnMirelurkAmbushRiverbedRocksWet02 Auto Const

endGroup


int EffectIndex
int ArmorIndex

ObjectReference myFurnitureMarker
ObjectReference myWaterLevelMarker
EffectShader myEffectShaderParticles
Armor myMirelurkSkin



Event OnLoad()
  ;get linked refs
  myWaterLevelMarker = GetLinkedRef(MirelurkAmbushWaterKeyword)
  myFurnitureMarker = GetLinkedRef(LinkAmbushFurniture)

	RegisterForAnimationEvent(self, "Open")
  
  ;establish indexs for MirelurkAmbushEffectShaderFL and MirelurkAmbushArmorFL
  ;based on keywords on ambush furniture (myFurnitureMarker)
  if (myWaterLevelMarker)
    EffectIndex = 0
    ArmorIndex = 0
  elseif (myFurnitureMarker.HasKeyword(AnimFurnMirelurkAmbushDefault))
    debug.trace(self + " has keword AnimFurnMirelurkAmbushDefault")
    EffectIndex = 1
    ArmorIndex =1
  elseif (myFurnitureMarker.HasKeyword(AnimFurnMirelurkAmbushRiverbedRocks))
    debug.trace(self + " has keword AnimFurnMirelurkAmbushRiverbedRocks")
    EffectIndex = 1
    ArmorIndex =2
  elseif (myFurnitureMarker.HasKeyword(AnimFurnMirelurkAmbushCaveMud))
    debug.trace(self + " has keword AnimFurnMirelurkAmbushCaveMud")
    EffectIndex = 2
    ArmorIndex =3
  elseif (myFurnitureMarker.HasKeyword(AnimFurnMirelurkAmbushNestMud))
    debug.trace(self + " has keword AnimFurnMirelurkAmbushNestMud")
    EffectIndex = 2
    ArmorIndex =4
  elseif (myFurnitureMarker.HasKeyword(AnimFurnMirelurkAmbushRiverbedRocksWet01))
    debug.trace(self + " has keword AnimFurnMirelurkAmbushRiverbedRocksWet01")
    EffectIndex = 2
    ArmorIndex =5
  elseif (myFurnitureMarker.HasKeyword(AnimFurnMirelurkAmbushRiverbedRocksWet02))
    debug.trace(self + " has keword AnimFurnMirelurkAmbushRiverbedRocksWet02")
    EffectIndex = 2
    ArmorIndex =6
  elseif (myFurnitureMarker.HasKeyword(AnimFurnMirelurkAmbushRiverbedrocksSand01))
    debug.trace(self + " has keword AnimFurnMirelurkAmbushRiverbedrocksSand01")
    EffectIndex = 2
    ArmorIndex =7
  else
    debug.trace(self + " has no keyword, going to default")
    EffectIndex = 1
    ArmorIndex = 1
  endif
  
  ;set effects and armor based on previos index
  myEffectShaderParticles = MirelurkAmbushEffectShaderFL.GetAt(EffectIndex) as EffectShader
  debug.trace(self + " has EffectShader " + myEffectShaderParticles)
  debug.trace(self + " has Armor " + myMirelurkSkin)

  myMirelurkSkin = MirelurkAmbushArmorFL.GetAt(ArmorIndex) as Armor

  ;equip dirt skin to match ambush furn art
  equipitem(myMirelurkSkin)
EndEvent

Event OnAnimationEvent(ObjectReference source, string eventName)
  if (eventName == "Open")
    ;Play anim on dirt skin
    PlaySubGraphAnimation("stage2")
    ;Playdirt or mud particle to match ground fx


    ;if underwater is set do one thing else do another
    if myWaterLevelMarker 
      if FurnitureMirelurkWaterExplosion
        myWaterLevelMarker.PlaceAtMe(FurnitureMirelurkSiltExplosion)
      endIf
      utility.wait(WaitToSplash)
      if FurnitureMirelurkWaterExplosion
        myWaterLevelMarker.PlaceAtMe(FurnitureMirelurkWaterExplosion)
      endIf

      if myWaterLevelMarker
        WaterSplashParticles.Play(self)
      endIf
      if myEffectShaderParticles
        myEffectShaderParticles.Play(self)
      endIf
    ;not in water
    else
      if myEffectShaderParticles
        myEffectShaderParticles.Play(self)
      endIf
      if (!myWaterLevelMarker)
      PlaceAtMe(Furnituremirelurkexplosion)
      endIf
    endif
  endif

  ;clean up splash particle fx
  if myWaterLevelMarker
    utility.wait(1.0)
    WaterSplashParticles.Stop(self)
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
