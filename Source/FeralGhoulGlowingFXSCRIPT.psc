Scriptname FeralGhoulGlowingFXSCRIPT extends ActiveMagicEffect
{FX for glowing one }

;Armor Property SkinFeralGhoulGlowingGlow Auto

bool isAlive = true
int sleepState =2
int sitState =2
int loop

Event OnEffectStart(Actor akTarget, Actor akCaster)
	;wait while 3d loads
	if  (akCaster as objectReference).WaitFor3DLoad()
		;test to see if xx is in ambush mode
	
		sleepState = akCaster.GetSleepState()
		sitState = akCaster.GetSitState()
		if (sleepState == 3)
			;Low glow in ambushes...set to 1.0 if you decide you want no glow
			akCaster.SetSubGraphFloatVariable("fToggleBlend", 0.75)
		elseif (sitState == 3)
			;no glow
			akCaster.SetSubGraphFloatVariable("fToggleBlend", 0.75)
		else
			;glow
			akCaster.SetSubGraphFloatVariable("fToggleBlend", 0.0)
		endIf
	else
		;nothing
	endif
EndEvent

	Event OnGetUp(ObjectReference akFurniture)
		actor selfRef = self.GetTargetActor()
		;debug.trace("WAAAAAAKKEEEEEEEEEE")
		;glow
		selfRef.SetSubGraphFloatVariable("fToggleBlend", 0.0)
	endEvent

Event OnCripple(ActorValue akActorValue, bool abCrippled)
	actor selfRef = self.GetTargetActor()
	;Debug.Trace("OnCripple Received: " + akActorValue + ", " + abCrippled)
	if isAlive ==true
		;med glow
		selfRef.SetSubGraphFloatVariable("fToggleBlend", 0.15)
	endIf
EndEvent

Event OnDying(Actor akKiller)
	actor selfRef = self.GetTargetActor()
	isAlive = false
	selfRef.SetSubGraphFloatVariable("fDampRate", 0.005)
    selfRef.SetSubGraphFloatVariable("fToggleBlend", 0.35)
EndEvent

Event OnDeath(Actor akKiller)
	actor selfRef = self.GetTargetActor()
	isAlive = false
    selfRef.SetSubGraphFloatVariable("fToggleBlend", 0.35)
EndEvent