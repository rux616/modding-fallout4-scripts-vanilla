Scriptname Hardcore:HC_DrinkWaterEffectScript extends ActiveMagicEffect Const

HC_ManagerScript Property HC_Manager const auto mandatory
{autofill}

GlobalVariable Property HC_Rule_SustenanceEffects const auto mandatory
{autofill}

bool Property bDirtyWater Auto Const Mandatory

Event OnEffectStart(Actor akTarget, Actor akCaster)

	if  HC_Manager.IsGlobalTrue(HC_Rule_SustenanceEffects)
		HC_Manager.DrinkSippableWater(bDirtyWater)
		HC_Manager.trace(self, "PLAYER IS DRINKING WATER! bDirtyWater: " + bDirtyWater)
	endif

EndEvent
