Scriptname MS13NelsonDiesScript extends Quest Conditional

int Property startupTimer = 1 const auto


function Startup()
	; run 24 hour timer for quest to really start
	StartTimerGameTime(24.0, startupTimer)

	actor killer = Alias_Killer.GetActorRef()
	actor nelson = Alias_NelsonLatimer.GetActorRef()
	actor player = Game.GetPlayer()
	Location deathLocation = Alias_DeathLocation.GetLocation()

	; if Marowski's thugs killed Nelson, Malcolm wants to hire player to go after Marowski
	if MS13.GetStageDone(440)
		MalcolmInvestigation = 1
	; if player was involved in Nelson's death, Malcolm wants to talk to you
	elseif ( killer && (player.GetFactionReaction(killer) == 2 || killer == player) ) || ( MS13.GetStageDone(450) && MS13.GetStageDone(800) == false)
		MalcolmInvestigation = 2
	elseif DiamondCityLocation != deathLocation && !DiamondCityLocation.IsChild(deathLocation) && !nelson.IsDisabled()
	; otherwise, Malcolm wants to find Nelson's body (if not in Diamond City)
		MalcolmInvestigation = 3
	else
	; otherwise, Malcolm is sad about his son's death
		MalcolmInvestigation = 4
	endif

endFunction

Event OnTimerGameTime(int aiTimerID)
	if aiTimerID == startupTimer
		SetStage(10)
	endif
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	debug.trace(self + "OnLocationChange " + akNewLoc)
	if akSender == Game.GetPlayer()
		if (akNewLoc == DiamondCityLocation && !akOldLoc.IsChild(DiamondCityLocation))
			; player is entering Diamond City
			; Malcolm sends thugs while alive after player kills Nelson - until player pays reparations
			if GetStageDone(220) && !GetStageDone(250) && !Alias_MalcolmLatimer.GetActorRef().IsDead() && !GetStageDone(250)
				MS13ThugsKeyword.SendStoryEvent(akLoc = DiamondCityLocation)
			endif
		endif
	endif
endEvent


Int Property MalcolmInvestigation = 0 Auto Conditional
{
1 = hire player to kill Marowski
2 = suspects player
3 = hire player to find body
4 = no action - grieving
}

ReferenceAlias Property Alias_NelsonLatimer Auto const
ReferenceAlias Property Alias_Killer Auto const
LocationAlias Property Alias_DeathLocation Auto const
ReferenceAlias Property Alias_MalcolmLatimer Auto const

MS13Script Property MS13 Auto const

Location Property DiamondCityLocation auto const
Keyword Property MS13ThugsKeyword const auto

Bool Property ThugsAttackPlayer Auto Conditional
{set to true when Malcolm's thugs fight the player}
