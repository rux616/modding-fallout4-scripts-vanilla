Scriptname MS09LorenzoCellButtonScript extends ObjectReference Conditional
{script to track when buttons have been pressed}

ObjectReference Property MS09GeneratorFX Auto Const
ObjectReference Property MS09GeneratorOnSMarker Auto Const

Sound Property QSTMS09GeneratorPowerOn2D Auto
;keyword LinkCustom01

bool bActivated = false conditional
string AnimName = "Stage2"


Event OnActivate(ObjectReference akActionRef)
    if !bActivated
    	bActivated = true
    	SetDestroyed(true)
    	MS09GeneratorOnSMarker.Enable()
    	debug.trace(self + " has activated")
    	if (MS09GeneratorFX.PlayAnimation(AnimName) == TRUE)
    		debug.trace(AnimName + " has played")	
    	endif
    	utility.wait(0.5)
    	QSTMS09GeneratorPowerOn2D.play(MS09GeneratorFX)
    	;MS09GeneratorFX.PlayAnimation(AnimName)
    endif
EndEvent

