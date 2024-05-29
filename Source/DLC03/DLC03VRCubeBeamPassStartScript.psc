Scriptname DLC03:DLC03VRCubeBeamPassStartScript extends ObjectReference Hidden


Weapon Property LightBeam Auto

ObjectReference PassEndRef

Int BeamPulseOffTimeIndex = 30
float Property BeamPulseOffTime = 1.0 Auto

Int ChainNumber

Event OnLoad()
	RegisterForHitEvent(self)
    ChainNumber = CountLinkedRefChain()
    PassEndRef = GetNthLinkedRef(ChainNumber)
    PassEndRef.PlayAnimation("StartOff01")
EndEvent

auto STATE AllowHit
	Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
	  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
		debug.trace(self + " OnHit by " + akSource)
		;GoToState("BlockHit")
		;StartTimer(BeamPulseOffTime, BeamPulseOffTimeIndex)
		;PowerBeamBlocks(TRUE)
		Activate(self)
		LightBeam.Fire(PassEndRef)
		RegisterForHitEvent(self)
	EndEvent
EndSTATE

STATE BlockHit
	;Do Nothing
EndSTATE

Event OnTimer(int aiTimerID)
	debug.trace(self + " OnTimer " + aiTimerID)
    if aiTimerID == BeamPulseOffTimeIndex
		PowerBeamBlocks(FALSE)
	endif
EndEvent


Function PowerBeamBlocks(Bool ShouldPower)
	int count = 1
	while (count <= ChainNumber)
		if ShouldPower
			GetNthLinkedRef(count).PlayAnimation("Play01")
		else
			GetNthLinkedRef(count).PlayAnimation("Play02")
		endif
		count += 1
	endwhile
	if ShouldPower
		utility.Wait(0.25)
		RegisterForHitEvent(self)
		LightBeam.Fire(PassEndRef)
		GoToState("AllowHit")
	endif
EndFunction

Function DoThing()
	RegisterForHitEvent(self)
EndFunction