Scriptname DN092_CowboyDeathScript extends ObjectReference

ObjectReference property pushRef auto Const
ObjectReference property idealPosition auto Const

quest property DN092 auto const
referenceAlias property victimAlias auto Const

explosion property FakeForce300Explosion auto Const
explosion property visibleExplosion auto Const

idle property deathAnim auto const

weapon property machineGun01 auto const
ammo property ammo556 auto const
ObjectReference property fakeGunfireSource auto Const

bool property useScene auto const

;EVENT OnCellAttach()
;	victim.enable()
;   (victim as actor).getActorBase().setInvulnerable()
;EndEvent

EVENT OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == game.getPlayer()
		if useScene
			DN092.setStage(5)
		else
			objectreference victim = victimAlias.getReference()

			float distCheck = idealPosition.getDistance(pushRef)
			if victim.getDistance(idealPosition) > distCheck
				victim.moveTo(idealPosition)
			endif

			;machineGun01.fire(fakeGunfireSource, ammo556)
			;utility.wait(0.05)
			;machineGun01.fire(fakeGunfireSource, ammo556)
			;utility.wait(0.05)
			;machineGun01.fire(fakeGunfireSource, ammo556)

			if (victim as actor).playIdle(deathAnim)
				debug.trace("DN092: Minuteman Redshirt is stumblin!")
				utility.wait(1.0)
			else
				debug.trace("DN092: Couldn't force minuteman to stumble.  =[ ")
			endif

			(victim as actor).getActorBase().setProtected(false)
			(victim as actor).kill()
		   	;pushRef.pushActorAway(victim as actor, 500)
		   	victim.placeatme(FakeForce300Explosion)
		   	utility.wait(0.05)
		   	;pushRef.placeatme(visibleExplosion)
		   	;pushRef.placeatme(FakeForce300Explosion)
		   	utility.wait(0.5)

		   	while(pushRef.getDistance(victim) < 256)
		   		debug.trace("DN092 - Dead Minuteman getting pushed again")
				;pushRef.pushActorAway(victim as actor, 500)
				;pushRef.placeatme(FakeForce300Explosion)
				utility.wait(0.4)   		
		   	endwhile
		endif

		disable()
	   	delete()
   endif
EndEVENT
