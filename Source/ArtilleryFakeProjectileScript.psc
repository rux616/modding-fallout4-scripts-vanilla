ScriptName ArtilleryFakeProjectileScript Extends ObjectReference
{This script is on the fake projectile}

;Explosion Property MinArtilleryExplosion Auto Const
Weapon Property WorkShopArtilleryWeapon Auto Const
Sound Property FXExplosionArtilleryMinutemen Auto Const
;Form Property SignMenWorking01 Auto Const

bool hasFired

Event onLoad()
	ObjectReference objSelf = self as ObjectReference
	if !hasFired
		hasFired = True
		self.SetActorCause(Game.GetPlayer())
		SetActorRefOwner(game.GetPlayer())
		Debug.Trace(self + ": Has called OnLoad")
		if FXExplosionArtilleryMinutemen
			FXExplosionArtilleryMinutemen.Play(objSelf)
		endif
		Self.SetAngle(0.0, 0.0, self.GetAngleZ())
		;NewStuff
		;ObjectReference objSelf = Self as ObjectReference
		;objectReference TestMarker = objSelf.PlaceAtMe(SignMenWorking01)
		WorkShopArtilleryWeapon.Fire(objSelf)
		;utility.Wait(3.0)
		;TestMarker.Delete()
		utility.wait(3.0)
		objSelf.delete()
	else
		objSelf.delete()
	endif
EndEvent

;/
Event onInit()
	
EndEvent
/;