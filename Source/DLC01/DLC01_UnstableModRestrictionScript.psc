Scriptname DLC01:DLC01_UnstableModRestrictionScript extends DLC01:DLC01_AddFormsEffectScript
{Script for unstable mods on the player's robot. During combat (only), runs a timer, checks conditions, and adds or removes AddFormsEffectScript's forms based on whether those conditions are met.}
;
;Essentially, this script tries to prevent the robot from using a mod on an on unsuitable target, such as using a Fat Man against a radroach at point-blank range. It's not going
;to be perfect, but it seems to work well in practice.


Group Restriction_Properties
	float property TargetMinRange = -1.0 Auto Const
	{Min range to combat target.}

	float property TargetMaxRange = -1.0 Auto Const
	{Max range to combat target.}

	float property PlayerMinRangeFromTarget = -1.0 Auto Const
	{Min distance the player must be from the combat target.}

	float property TargetMinLevelMult = -1.0 Auto Const
	{(TargetMinLevelMult) * (Player's Level) <= (Target's Level). Prevents use of the mod on weak enemies.}

	float property TimerDelay = 1.0 Auto Const
	{Delay between timer checks.}
EndGroup

;Local variables.
Actor player
Actor myActor
bool hasForms


Event OnEffectStart(Actor akTarget, Actor akCaster)
	player = Game.GetPlayer()
	myActor = akTarget
	;DO NOT run the Parent's OnEffectStart or add any forms at this time. Do this only on timer checks.
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Parent.OnEffectFinish(akTarget, akCaster)
EndEvent


;During combat, run a timer...
Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if (aeCombatState == 1)
		StartTimer(0)
	EndIf
EndEvent

Event OnTimer(int timerID)
	;Are we still in combat?
	if (myActor.GetCombatState() == 1)
		Actor currentTarget = myActor.GetCombatTarget()
		if (currentTarget != None)
			float distanceToCurrentTarget = currentTarget.GetDistance(myActor)
			if (((TargetMinRange < 0) || (distanceToCurrentTarget >= TargetMinRange)) && \
			    ((TargetMaxRange < 0) || (distanceToCurrentTarget <= TargetMaxRange)) && \
			    ((PlayerMinRangeFromTarget < 0) || (player.GetDistance(currentTarget) >= PlayerMinRangeFromTarget)) && \
			    ((TargetMinLevelMult < 0) || (currentTarget.GetLevel() >= (player.GetLevel() * TargetMinLevelMult))))
				if (!hasForms)
					Parent.AddForms(myActor)
					hasForms = True
					;Debug.Trace("--Added")
				EndIf
			ElseIf (hasForms)
				Parent.RemoveForms(myActor)
				hasForms = False
				;Debug.Trace("--Removed")
			EndIf
		EndIf
		StartTimer(TimerDelay)
	Else
		Parent.RemoveForms(myActor)
	EndIf
EndEvent