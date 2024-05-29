ScriptName MS02FakeProjectileScript Extends ObjectReference
{This script is on the fake projectile}

;Explosion Property MinArtilleryExplosion Auto Const
Weapon Property MS02NukeMissileFar Auto Const
Sound Property BeaconSound Auto Const
;Form Property SignMenWorking01 Auto Const

Event onLoad()
	self.SetActorCause(Game.GetPlayer())
	SetActorRefOwner(game.GetPlayer())
	Debug.Trace(self + ": Has called OnLoad")
	ObjectReference objSelf = self as ObjectReference
	
	BeaconSound.Play(objSelf)

	Self.SetAngle(0.0, 0.0, self.GetAngleZ())
	Utility.Wait(5.0)
	;NewStuff
	;ObjectReference objSelf = Self as ObjectReference
	;objectReference TestMarker = objSelf.PlaceAtMe(SignMenWorking01)
	MS02NukeMissileFar.Fire(objSelf)
	utility.Wait(5.0)
	Self.Delete()
EndEvent

;/
Event onInit()
	
EndEvent
/;