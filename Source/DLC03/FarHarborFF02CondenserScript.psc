Scriptname DLC03:FarHarborFF02CondenserScript extends ObjectReference
{Controls the animations of the three fog condensers in FarharborFF02}

;Play the "stage 2" animation on load, which makes the fog condenser appear to be off
;Conditioned so this only happens if the condenser is not repaired
;Also replaces this fog condenser with a normal one on unload once it has been repaired

;Properties
Quest Property DLC03FarHarborFF02 Auto
ObjectReference Property DLC03FogCondenser01Ref Auto
Activator Property DLC03FogCondenser01 Auto
GlobalVariable Property DLC03FarHarborFF02_FC1Replaced Auto

Event OnLoad()
;If the player has not repaired this fog condenser...
	if DLC03FarHarborFF02.GetStageDone(210) == False
		;...play the "off state" anim without a transition
		DLC03FogCondenser01Ref.PlayAnimation("Stage2NoTransition")
	endif
endEvent

Event OnUnload()
	;if this fog condenser has been repaired and has not already replaced itself...
	int FC1RepairValue = DLC03FarHarborFF02_FC1Replaced.GetValue() as int
	if DLC03FarHarborFF02.GetStageDone(210) == True && FC1RepairValue == 0
		;disable it and replace it with normal fog condenser
		DLC03FogCondenser01Ref.PlaceAtMe(DLC03FogCondenser01)
		DLC03FarHarborFF02_FC1Replaced.SetValue(1)
		debug.trace("fog condenser 1 replaced")
		DLC03FogCondenser01Ref.Disable()
		debug.trace("fog condenser 1 disabled")
	endif
endevent