Scriptname DLC02:DLC02WorkshopArenaCombatantScript extends WorkshopObjectScript

group ArenaCombatantProperties
	Faction property DLC02TamedCreatureFaction auto const mandatory
	Faction property WorkshopNPCFaction auto const mandatory
	Faction property PotentialCompanionFaction auto const mandatory
	Faction property REFarmerFaction auto const mandatory

	Faction property DLC02WorkshopArenaCombatantFaction auto const mandatory
	Faction property DLC02WorkshopArenaCombatantEnemyFaction auto const mandatory
	Faction property HasBeenCompanionFaction auto const mandatory
	{ for companion check }

	ActorValue property DLC02WorkshopWork24HoursFlag auto const mandatory
	{ stores original value of bWork24Hours flag from workshopNPCScript }

	ActorValue property DLC02WorkshopRatingArenaPlatform auto const mandatory
	{ use to get all arena platforms in current workshop }

	int property ArenaCombatantDeathHappinessPenalty = -5 auto const
endGroup

function AssignActor(WorkshopNPCScript newActor = None)
	; add/remove special combat faction
	; also protected status
	if newActor
		AssignArenaCombatant(newActor, true)
		RegisterForRemoteEvent(newActor, "OnDying")
		; if a companion, send assault alarm against enemy team
		if newActor.IsInFaction(HasBeenCompanionFaction) || newActor.GetHighestRelationshipRank() > 0
			debug.trace(self + " AssignActor: " + newActor + " is companion or family NPC - find enemy combatants")
			WorkshopScript workshopRef = WorkshopParent.GetWorkshop(workshopID)
			ObjectReference[] arenaPlatforms = WorkshopParent.GetResourceObjects(workshopRef, DLC02WorkshopRatingArenaPlatform)
			debug.trace(self + "       arenaPlatforms=" + arenaPlatforms)
			; find actors in the enemy arena faction
			int i = 0
			while i < arenaPlatforms.Length
				ObjectReference thePlatform = arenaPlatforms[i]
				if thePlatform && thePlatform.GetBaseObject() != self.GetBaseObject() && thePlatform.HasActorRefOwner()
					; get owner and see if enemy
					Actor theNPC = thePlatform.GetActorRefOwner()
					debug.trace(self + "       " + i + ": " + thePlatform + " owned by " + theNPC)
					if theNPC && theNPC.IsInFaction(DLC02WorkshopArenaCombatantEnemyFaction)
						debug.trace(self + "       " + theNPC + " is in " + DLC02WorkshopArenaCombatantEnemyFaction + " faction - start combat")
						theNPC.StartCombat(newActor)
						newActor.StartCombat(theNPC)
					endif
				endif
				i += 1
			endWhile
		endif
	else
		WorkshopNPCScript oldActor = GetActorRefOwner() as WorkshopNPCScript
		if oldActor
			AssignArenaCombatant(oldActor, false)
			UnregisterForRemoteEvent(oldActor, "OnDying")
		endif
	endif
	Parent.AssignActor(newActor)
endFunction

function AssignArenaCombatant(WorkshopNPCScript assignedActor, bool bAssignToArena)
	WorkshopScript workshopRef = WorkshopParent.GetWorkshop(workshopID)

	if bAssignToArena
		assignedActor.bIsGuard = true ; weapon out
		assignedActor.AddToFaction(DLC02WorkshopArenaCombatantFaction)
		assignedActor.RemoveFromFaction(WorkshopNPCFaction)
		assignedActor.RemoveFromFaction(REFarmerFaction)

		assignedActor.SetValue(DLC02WorkshopWork24HoursFlag, assignedActor.bWork24Hours as float)
		assignedActor.bWork24Hours = true

		if assignedActor.IsInFaction(PotentialCompanionFaction) == false && assignedActor.GetHighestRelationshipRank() <= 0
			assignedActor.SetProtected(false)
		endif
	else
		assignedActor.bIsGuard = false ; clear weapon out package
		assignedActor.RemoveFromFaction(DLC02WorkshopArenaCombatantFaction)
		assignedActor.AddToFaction(WorkshopNPCFaction)

		; clear combat alarms in case already fighting other arena combatants
		assignedActor.StopCombatAlarm()

		; restore original value for this flag
		assignedActor.bWork24Hours = ( assignedActor.GetValue(DLC02WorkshopWork24HoursFlag) > 0 )

		if assignedActor.IsInFaction(PotentialCompanionFaction) == false
			assignedActor.SetProtected(true)
		endif
	endif

	if workshopRef.SettlementOwnershipFaction && workshopRef.UseOwnershipFaction && assignedActor.bApplyWorkshopOwnerFaction
		if assignedActor.bCountsForPopulation
			if bAssignToArena
				assignedActor.RemoveFromFaction(workshopRef.SettlementOwnershipFaction)
			else
				assignedActor.SetCrimeFaction(workshopRef.SettlementOwnershipFaction)
			endif
		else
			if bAssignToArena
				assignedActor.SetFactionOwner(NONE)
			else
				assignedActor.SetFactionOwner(workshopRef.SettlementOwnershipFaction)
			endif
		endif
	endif

endFunction

Event Actor.OnDying(Actor akSender, Actor akKiller)
    ; reduce happiness if arena combatant dies
   	WorkshopScript workshopRef = WorkshopParent.GetWorkshop(workshopID)
   	if workshopRef
    	WorkshopParent.ModifyHappinessModifier(workshopRef, ArenaCombatantDeathHappinessPenalty)
    endif
EndEvent