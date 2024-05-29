Scriptname AliasTargetingScopeScript extends ReferenceAlias

Spell Property TargetingScopeSpell Auto
Keyword Property HasScopeTargeting Auto
MagicEffect Property TargetingScopeEquippedEffect Auto

float TargetingTick = 0.25
int TargetingTimerId = 970978

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
	Debug.Trace(self + "equipping weapon" + Game.GetPlayer().GetEquippedWeapon())
	;check if the weapon has the keyword
	if (Game.GetPlayer().HasMagicEffect(TargetingScopeEquippedEffect))
		Debug.Trace(self + "Targeting Scope weapon, starting timer")
		;start the timer to check for ironsights
		StartTimer(TargetingTick, TargetingTimerId)
	endif
EndEvent

Event OnTimer(Int aiTimerID)
	Debug.Trace(self + "aiTimerID: " + aiTimerID)
	Actor PlayerRef = Game.GetPlayer()

	;Check that the player is using a recon weapon to prevent timing mismatches
	if PlayerRef.HasMagicEffect(TargetingScopeEquippedEffect)
		if aiTimerID == TargetingTimerId && PlayerRef.IsInIronSights()
			;cast the spell if in ironsights
			Debug.Trace(self + "casting Targeting spell")
			TargetingScopeSpell.RemoteCast(PlayerRef, PlayerRef)
		endif
		;start the timer again
		StartTimer(TargetingTick, TargetingTimerId)
	endif
EndEvent

Event OnItemUnequipped(Form akBaseObject, ObjectReference akReference)
	debug.trace(self + "canceling Targeting timer")
	;cancel the timer if the weapon is unequipped
	CancelTimer(TargetingTimerId)
	;GetOwningQuest().SetStage(20)
EndEvent