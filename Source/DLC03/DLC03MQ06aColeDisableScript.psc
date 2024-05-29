Scriptname DLC03:DLC03MQ06aColeDisableScript extends ReferenceAlias

;If Cole unloads, disable him
Event OnUnload()
	self.GetRef().Disable()
EndEvent