Scriptname PowerArmorFXScript extends ActiveMagicEffect
{Handles the fx that play for the Power Armor!!}
ObjectReference selfRef
ImpactDataSet  Property PowerArmorHeavyImpactSet Auto
Explosion Property myImpactLandExplosion Auto
Explosion Property PA_ExplosiveVentExplosion Auto Const
ActorValue Property PowerArmorVent Auto Const
ActorValue Property PABatteryDamageRate Auto Const
ActorValue Property PowerArmorBattery Auto
IdleMarker Property ExplosionSpawnMarker Auto
Keyword Property DisableImpactLandExplosionKeyword Auto Const
Spell Property SpellPA_ImpactLandingAggro Auto Const

int fired

Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.trace("POWER ARMOR: Impact script started")
	selfRef = akCaster
	; this effect starts before the suit wearer's 3d gets reload, which results in unregistering us for the impact land
	; to try and register after the 3d reload, we'll try to wait until the 3d is loaded
	if( selfRef.WaitFor3DLoad() )
		RegisterForAnimationEvent(selfRef, "ImpactLand")
	endIf
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if (asEventName == "ImpactLand")
    	debug.trace("POWER ARMOR: ImpactLand event detected. (fired:"+fired+")")
        ;game.shakeCamera(selfRef, 1)
        ;game.shakeController(95, 95, 2)
        selfRef.rampRumble()
		; the wearer's root is often below the ground slightly on the frame we get the impact land event
		; we need to spawn the explosion above ground or it will never hit anything
		; we can't just move the wearer up because if it is the player they will fade to black
		; so instead place a blank marker there, spawn the explosion at it, and then delete it
		ObjectReference marker = selfRef.PlaceAtMe(ExplosionSpawnMarker)
		if ( marker != None )
			float fXPos = marker.GetPositionX()
			float fYPos = marker.GetPositionY()
			float fZPos = marker.GetPositionZ() + 4.0
			marker.SetPosition(fXPos, fYPos, fZPos)
			debug.trace("POWER ARMOR: Impact Explosion marker at " + fXPos + " " + fYPos + " " + fZPos )
			marker.PlayImpactEffect(PowerArmorHeavyImpactSet, "Root", 0, 0, -1, 4096)
			if( !selfRef.HasKeyword(DisableImpactLandExplosionKeyword) )
				Explosion myExplosion
				if ( selfRef.GetValue(PowerArmorVent) == 0.0 )
					myExplosion = myImpactLandExplosion
				elseif ( selfRef.GetValue(PowerArmorVent) >= 1.0 )
					myExplosion = PA_ExplosiveVentExplosion
				endif
				debug.trace("POWER ARMOR: Firing Impact explosion " + myExplosion + "!")
				marker.PlaceAtMe(myExplosion)
				;Use spell to attribute ownership and aggro
				debug.trace("POWER ARMOR: Casting Aggro SPELL " + selfRef)
				SpellPA_ImpactLandingAggro.Cast(selfRef, selfRef)
			else
				debug.trace("POWER ARMOR: NOT firing impact land explosion for " + selfRef)
			endIf
			marker.Delete()
			fired = fired +1
			debug.trace("POWER ARMOR: Impact Land Complete. (fired:"+fired+")")
			;debug.trace("POWER ARMOR: my explosion ref ("+myExplosion+") is enabled? "+myExplosion.isenabled())
			; now drain the battery accordingly
			float fbatteryDrain = Game.GetGameSettingFloat("fPowerArmorPowerDrainPerImpactLand")
			If( PABatteryDamageRate )
				fbatteryDrain *= selfRef.GetValue(PABatteryDamageRate)
			EndIf
			If( fBatteryDrain > 0.0 )
				selfRef.ModValue( PowerArmorBattery, -fbatteryDrain )
			EndIf
		endIf
    endIf
EndEvent
