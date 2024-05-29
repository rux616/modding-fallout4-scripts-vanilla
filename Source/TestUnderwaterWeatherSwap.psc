Scriptname TestUnderwaterWeatherSwap extends ObjectReference 

import game
import debug
Weather Property IndoorWeather Auto 
Weather Property underwaterWeather Auto 
bool property outOfWater = false auto
VisualEffect Property pFootStepSiltE Auto Const
Weapon Property pTestHarpoonGunSingleShot Auto Const

;**********************************************

auto State waiting
	Event OnTriggerEnter(ObjectReference akActionRef)
	    if(akActionRef == game.GetPlayer())

	  		if(outOfWater == false)
	  			IndoorWeather.ForceActive(true)
	  			;IndoorWeather.SetActive(true, true)
	  			Game.GetPlayer().UnequipItem(pTestHarpoonGunSingleShot)
	  			outOfWater = true
	  			pFootStepSiltE.stop(game.GetPlayer())
	  		else
	  			underwaterWeather.ForceActive(true)
	  			outOfWater = false
	  			pFootStepSiltE.play(game.GetPlayer())
	  			Game.GetPlayer().EquipItem(pTestHarpoonGunSingleShot)
	  		endif

	    endif
	EndEvent
endState



