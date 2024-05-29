Scriptname FallingRocksandDustActivatorScript extends ObjectReference 

import debug
import utility
impactDataSet Property RockDustActivatorImpactSet auto 
Bool Property DoOnce = TRUE Auto Const
	{If you only want this to be activate once set to TRUE.  DEFAULT = TRUE}
Float Property fxCamShake = 0.2 auto
;Float Property resetDelay = 0.0 auto
sound property rockfallSound Auto

Auto State PreTriggerRocks
	 Event OnTriggerEnter( objectReference akActionref )
	 	rockfallSound.Play(Self)
		PlayAnimation( "stage2" )
		PlayImpactEffect(RockDustActivatorImpactSet, "", 0, 0, -1, 512, false, false)
		game.ShakeCamera(afStrength = fxCamShake)
		;wait(1.0)
		;debug.Trace("fx start")
	 	if DoOnce
	 		gotoState("PostTriggerRocks")
		else
			;wait(resetDelay)
			PlayAnimation( "reset" )
		endif
	  endEvent

EndState

State PostTriggerRocks
	;Do nothing
EndState