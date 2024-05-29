ScriptName CyclicElectricalHazard Extends objectReference
;
;
;
;
import utility


;==================================================
;		Properties & Vars
;==================================================

bool Property StartsOn = true Auto

Group LocalProperties CollapsedOnRef
	;LaserMusketBeamLtBlue
	Spell property TrapElectricArcSpell Auto Const

	form property xmarker auto hidden Const
	float property TargetDistance = 256.0 auto hidden Const
EndGroup

Group FiringTimeProperties 
	float property firingTime = 3.0 Auto Const
	{How long to remain firing
	if this is set to -1 it will remain firing indefinitely while loaded}
	float Property firingPauseTime = 3.0 auto const
	{How long to pause between firing, if firingTime is not set to -1}
	Float Property OffsetTimer = 0.0 Auto Const
	{Onload wait this long before starting to fire, used to offset multiple traps}
	Float Property BlindFireRange = 200.0 Auto Const
	{This is the +/- used from the firing target in x/y/z when firing blind}
EndGroup

bool isTurnedOn
bool isFiring

int TimerIDStartFiring = 100 const
int TimerIDStopFiring = 200 const
bool cellIsLoaded

;==================================================
;		Main Events
;==================================================

Event OnInit()
	isTurnedOn = StartsOn
EndEvent

Event onTimer(int aiTimerID)
	if is3dLoaded() && isTurnedOn
		if aiTimerID == TimerIDStartFiring 
			FireElectricity()
		elseif aiTimerID == TimerIDStopFiring
			isFiring = false
		endif
	Endif
EndEvent

Event OnLoad()
	;On Load if we are supposed to be on, start firing
	if isTurnedOn
		Utility.Wait(OffsetTimer)
		FireElectricity()
	Endif
EndEvent

Event OnCellAttach()
	cellIsLoaded = true
EndEvent

Event OnCellDetach()
	cellIsLoaded = false
EndEvent

;==================================================
;		Firing Function
;==================================================

;Put the local stuff in here
Function FireElectricity()
	;Local Vars
	isFiring = true
	objectReference akTargetRange
	objectReference akTarget
	objectReference objSelf = self as objectReference

	;Start the timer to turn this off, if the firingTime is greater than 0
	if firingTime > 0 
		StartTimer(firingTime, TimerIDStopFiring)
	endif

	;Find our target
	if GetLinkedRef()
		akTargetRange = GetLinkedRef()
	else
		akTargetRange = objSelf
	endif

	objectReference myXmarker 
	myXmarker = akTargetRange.placeAtMe(xmarker)
	float currentTargetDistance = (TargetDistance * akTargetRange.GetScale())

	;StartFiring!
	;If we are unloaded, turned off, or set isFiring to false, then stop
	While isFiring && is3dLoaded() && isTurnedOn && cellIsLoaded
		;akTarget.moveToNode( game.FindRandomActorFromRef(objSelf, TargetDistance), "Torso")
		akTarget = game.FindRandomActorFromRef(akTargetRange, currentTargetDistance)
		
		;if we have a target and this is not a dummy fire, half the time fire at the dummy
		if akTarget && randomint(1, 100) <= 50 
			debug.trace(self + ": firing at actor >> " + akTarget)
			TrapElectricArcSpell.Cast(objSelf, akTarget)

		else 		
			debug.trace(self + ": firing at dummy >> " + myXmarker)
			myXmarker.moveto(akTargetRange, afXOffset = randomfloat(-BlindFireRange, BlindFireRange),  afYOffset = randomfloat(-BlindFireRange, BlindFireRange), afZOffset = randomfloat(-BlindFireRange, BlindFireRange))
			TrapElectricArcSpell.Cast(objSelf, myXmarker)
		endif
		
		wait(randomfloat(0.05, 0.2))
	endWhile
	;clear the targets
	akTarget = none
	myXmarker.delete()

	;if we are still turned on, then start the firingPauseTime
	if isTurnedOn
		StartTimer(firingPauseTime, TimerIDStartFiring)
	Endif
EndFunction



;==================================================
;		External interface Events/Functions
;==================================================


;Generic function for external interface
Event OnActivate(ObjectReference akActionRef)
    if !isTurnedOn	;If off, turn on
    	TurnOn()
    else 			;If on, turn off
    	TurnOn(False)
	endif
EndEvent

;advanced function for use with Terminals, etc.
Function TurnOn(bool ShouldBeOn = true)
	isTurnedOn = ShouldBeOn
	if isTurnedOn
		FireElectricity()
	else
		CancelTimer(TimerIDStartFiring)
    	CancelTimer(TimerIDStopFiring)
    endif
endFunction