Scriptname DN143TargetDummyScript extends ObjectReference Hidden

int Property MinScore = 10 auto const
{Minimum score that can be gained from shooting this target.}

int Property MaxScore = 100 auto const
{Maximum score that can be gained from shooting this target.}

int Property CurrentScore auto hidden
{Current store that get recorded when hit.}

float Property StartingWait = 0.5 auto hidden
{Time to wait before lowering score.}

DN143ResetScenarioButton Property ResetTargetDummyEventScriptThing auto const
;{Custom Script Variable voodoo that I don't quite understand :|}

bool Property ShowTraces = FALSE Auto Const

sound Property HitTargetSound Auto Const
sound Property EnableTargetSound auto Const


bool BeenHit = FALSE

Event OnInit()
    (ResetTargetDummyEventScriptThing as DN143ResetScenarioButton).CountMaxTargets()
EndEvent

Event OnLoad()
    RegisterForCustomEvent(ResetTargetDummyEventScriptThing, "ResetTargetDummy")
    ;if Is3DLoaded() && !BeenHit
        ;RegisterForHitEvent(self) ; get one hit event
    ;endIf

    if Is3DLoaded()
        int EnableinstanceID = EnableTargetSound.play(self)
        Sound.SetInstanceVolume(EnableinstanceID, 1)
    endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
		; Enable once activated
    self.EnableNoWait()
    RegisterForHitEvent(self) ; get one hit event
    if (ShowTraces)
    	;debug.Trace(self + ": Enabled")
    endif

    	; Set my current score to the max
    CurrentScore = MaxScore
    if (ShowTraces)
    	;debug.Trace(self + ": Setting CurrentScore to MaxScore.  CurrentScore = " + CurrentScore + " / MaxScore = " + MaxScore)
    endif
    	; Wait at max score for a set time
    if (ShowTraces)
    	;debug.Trace(self + ": Starting wait for : " + StartingWait)
    endif
    utility.Wait(StartingWait)

    	; Lower the score over time, down to the minimum, as long as we are stil enabled.
    if (ShowTraces)
    		;debug.Trace(self + ": Starting While Loop")
    endif 
    while (CurrentScore > MinScore) && !IsDisabled()
    	if (ShowTraces)
    		;debug.Trace(self + ": Waiting 1 Second")
    	endif
    	utility.Wait(1)
    	if !IsDisabled()
    		CurrentScore = CurrentScore - 10
    		if (ShowTraces)
    			;debug.Trace(self + ": Score = " + CurrentScore)
    		endif 
    	endif 	
    endwhile

EndEvent


Event DN143ResetScenarioButton.ResetTargetDummy(DN143ResetScenarioButton akSender, Var[] akArgs)
	self.DisableNoWait()
	BeenHit = FALSE
EndEvent


Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	if !BeenHit

		int HitinstanceID = HitTargetSound.play(self)
		Sound.SetInstanceVolume(HitinstanceID, 1)

		BeenHit = TRUE
        ;utility.wait(0.25)
    	self.DisableNoWait()
    	;debug.Trace(self + ": Final Score = " + CurrentScore)
    	(ResetTargetDummyEventScriptThing as DN143ResetScenarioButton).AddToScore(CurrentScore)
    endif
EndEvent


Event OnUnLoad()
    UnregisterForAllHitEvents()
    RegisterForCustomEvent(ResetTargetDummyEventScriptThing, "ResetTargetDummy")
EndEvent