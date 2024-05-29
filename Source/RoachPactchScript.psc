Scriptname RoachPactchScript extends ObjectReference 
{Handles the actions of the individual roach patch.}

RoachScareScript Property myParentScript Auto
{parent script on trigger}







Event OnLoad()
    
	;events to get from parent script
    registerForCustomEvent(myParentScript, "Flee")
    registerForCustomEvent(myParentScript, "safe")

    if Is3DLoaded()
    	RegisterForHitEvent(self) ; get a single hit
    endIf
EndEvent






Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
	bool abBashAttack, bool abHitBlocked, string asMaterialName)
	runAndHide()
	RegisterForHitEvent(self) ; get a single hit
EndEvent

event RoachScareScript.flee(RoachScareScript akSender, Var[] akArgs)
	;If the event comes to flee do it no mateer what
	;debug.trace("fleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")
	runAndHide()
endEvent

event RoachScareScript.safe(RoachScareScript akSender, Var[] akArgs)
	;debug.trace("Saaaaaaaaaaaaaaaaaaaaaafesss")
	comeOutAndPlay()
endEvent













function runAndHide()
	utility.wait(Utility.RandomFloat(0.0, 0.5))
	SetAnimationVariableFloat("fDampRate", 0.01)
    SetAnimationVariableFloat("fToggleBlend", 1.8)
endFunction

function comeOutAndPlay()
	utility.wait(Utility.RandomFloat(5.5, 10.5))
	SetAnimationVariableFloat("fDampRate", 0.003)
    SetAnimationVariableFloat("fToggleBlend", 0.0)
endFunction