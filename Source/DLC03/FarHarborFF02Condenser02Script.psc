Scriptname DLC03:FarHarborFF02Condenser02Script extends ObjectReference

;Play the "stage 2" animation on load, which makes the fog condenser appear to be off
;Conditioned so this only happens if the condenser is not repaired
;Also replaces this fog condenser with a normal one on unload once it has been repaired

;Properties
Quest Property DLC03FarHarborFF02 Auto
ObjectReference Property DLC03FogCondenser02Ref Auto
Activator Property DLC03FogCondenser01 Auto
GlobalVariable Property DLC03FarHarborFF02_FC2Replaced Auto

Event OnLoad()
;If the player has not repaired this fog condenser...
	if DLC03FarHarborFF02.GetStageDone(220) == False
		;...play the "off state" anim without a transition
		DLC03FogCondenser02Ref.PlayAnimation("Stage2NoTransition")
	endif
endEvent

Event OnUnload()
	;if this fog condenser has been repaired...
	int FC2RepairValue = DLC03FarHarborFF02_FC2Replaced.GetValue() as int
	if DLC03FarHarborFF02.GetStageDone(220) == True && FC2RepairValue == 0
		;disable it and replace it with normal fog condenser
		DLC03FogCondenser02Ref.PlaceAtMe(DLC03FogCondenser01)
		DLC03FarHarborFF02_FC2Replaced.SetValue(1)
		debug.trace("fog condenser 2 replaced")
		DLC03FogCondenser02Ref.Disable()
		debug.trace("fog condenser 2 disabled")
	endif
endevent