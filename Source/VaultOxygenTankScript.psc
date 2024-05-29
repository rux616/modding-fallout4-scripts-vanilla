Scriptname VaultOxygenTankScript extends ObjectReference 
{Handles the local destruction for the vault tank}


int  myDamage = 0 
;{Set above 0 if you want damage to pass to linked ref}
int  timesToFire = 10
;{Number of times to fire wep}
bool damageAtEnd = false  
float refireRate = 0.1 
;{Time to wait between shots}
string animToPlayR = "CharFXBurstA"
;{Set to anim name to play on damage stage swap} RIGHT
string animToPlayL = "CharFXBurstB"
;{Set to anim name to play on damage stage swap} LEFT

;Explosion Property VaultOxygenTankExplosion Auto



Weapon Property OxygenTankTrap Auto

Ammo Property AmmoOxygenTrap Auto

int count = 0

bool tanksAreFull = true


Event OnLoad()
	if Is3dLoaded()
    	RegisterForHitEvent(self)
    endIf
EndEvent

Event OnUnload()
    UnregisterForAllHitEvents()
EndEvent

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
    
EndEvent


Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	
	if apMaterial == "Metal" && tanksAreFull == true
		;RegisterForHitEvent(self)
		debug.trace("Left nozzle hit")
		hitNozzle(animToPlayL)
		tanksAreFull = false
	elseif apMaterial == "MetalSolid" && tanksAreFull == true
		;RegisterForHitEvent(self)
		debug.trace("Right nozzle hit")
		hitNozzle(animToPlayR)
		tanksAreFull = false
	elseif apMaterial == "MetalHeavy" && tanksAreFull == true
		debug.trace(apMaterial)
		self.DamageObject(1000)
   	endif
   	
EndEvent


function hitNozzle(string akAnimName)
		;play anim on linked ref
		self.playAnimation(akAnimName)
		while count < timesToFire
			OxygenTankTrap.Fire(self, AmmoOxygenTrap)
			utility.wait(refireRate)
			count= count +1
		endWhile
EndFunction