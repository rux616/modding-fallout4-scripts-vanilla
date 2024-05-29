Scriptname DLC03:DLC03VRRecieverScript extends ObjectReference Hidden

Quest property myQuest auto const 
{ OPTIONAL - quest to set stage on when triggered }
int property StageToSet auto const 
{ OPTIONAL - quest stage to set when triggered }

Sound Property DLC03QSTVRBlockDissolve Auto Const Mandatory

Event OnLoad()
	RegisterForHitEvent(self)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	debug.trace(self + " OnHit: " + akSource + " with projectile " + akProjectile)
	self.Activate(self)
	int instanceID = DLC03QSTVRBlockDissolve.play(self)
	Sound.SetInstanceVolume(instanceID, 1)
	PlayAnimation("Play01")
	StartTimer(7)
EndEvent


Event OnTimer(int aiTimerID)
	debug.trace(self + " OnTimer " + aiTimerID)
    Disable()
	if myQuest
		myQuest.SetStage(StageToSet)
	endif
EndEvent