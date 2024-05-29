Scriptname TestPowerPuzzleSwitchScript extends ObjectReference Hidden

Message Property TestPowerPuzzleSwitchMessageNeedsPower Auto
;Keyword Property WorkshopCanBePowered Auto
ActorValue Property PowerRequired Auto
;Keyword Property WorkshopPowerConnection Auto
;Keyword Property WorkshopRadiatesPower Auto

Bool Property IsDoor = FALSE Auto


Bool bOn = false

Event OnLoad()
;	AddKeyword(WorkshopCanBePowered)
      SetValue(PowerRequired, 5)
	;AddKeyword(WorkshopPowerConnection)
	;AddKeyword(WorkshopRadiatesPower)
	if (IsDoor) && (!bOn)
		BlockActivation()
	endif
EndEvent

Event OnPowerOn(ObjectReference akPowerGenerator)
	debug.trace(self + " OnPowerOn akPowerGenerator=" + akPowerGenerator)
	bOn = TRUE
	if IsDoor
		BlockActivation(FALSE)
		SetOpen()
	endif
EndEvent

Event OnPowerOff()
	debug.trace(self + " OnPowerOff")
	bOn = FALSE
	if IsDoor
		BlockActivation(TRUE)
		SetOpen(FALSE)
	endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
    if bOn
    	GetLinkedRef().Activate(self)
    else
    	TestPowerPuzzleSwitchMessageNeedsPower.Show()
    endif
EndEvent