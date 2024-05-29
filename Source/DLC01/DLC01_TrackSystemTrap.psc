ScriptName DLC01:DLC01_TrackSystemTrap extends DLC01:DLC01_TrackSystemTrapBase
{Part of the DLC01 Track System. Script on the Tank and Mine traps.}
;
;The Tank and Mine traps are Destructible MovableStatics while they're on the track. Their destruction state handles the player shooting them during this time.
;When the track system wants to drop them, it calls OnActivate. We then swap the MovableStatic for the corresponding Projectile object.
;It would be simpler to just use the Projectile directly, but Projectiles have different physics behavior, and jitter uncontrollably when moved on platforms like this.

Projectile property myProjectile Auto Const Mandatory
{The projectile we swap for this object when the object is activated.}

Sound property mySound Auto Const Mandatory
{Sound to play when the swap occurs.}


;When the Track System wants to drop the trap, it activates them.
;Make sure we only spawn the projectile version of the trap if the MovableStatic hasn't already been destroyed.
Event OnActivate(ObjectReference akActivator)
	if (!Self.IsDestroyed())
		ObjectReference p = Self.PlaceAtMe(myProjectile)
		Self.DisableNoWait()
		mySound.Play(p)
		Self.Delete()
	EndIf
EndEvent