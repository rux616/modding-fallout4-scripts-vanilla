Scriptname MirelurkQueenAcidScript extends Actor 

Weapon Property PWeapMirelurkQueenLeft Auto Const

Ammo Property PAmmoMirelurkQueen Auto Const
ImpactDataSet Property PMirelurkQueenSpitImpact Auto Const

int doIt = 0
Event OnLoad()
	RegisterForAnimationEvent(self, "WeaponFire")
	
		debug.trace("Queen firing*********************")
    PlayImpactEffect(PMirelurkQueenSpitImpact, "SpitImpact", Utility.RandomFloat(-0.8, 0.8), Utility.RandomFloat(-0.75, 0.75), -1.0, 512, false, false)
    

EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	
    PlayImpactEffect(PMirelurkQueenSpitImpact, "SpitImpact", Utility.RandomFloat(-0.8, 0.8), Utility.RandomFloat(-0.75, 0.75), -1.0, 512, false, false)
EndEvent
