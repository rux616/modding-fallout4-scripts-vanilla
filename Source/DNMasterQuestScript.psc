Scriptname DNMasterQuestScript extends Quest

ReferenceAlias Property Alias_Pulowski_Shelter Auto Const
ReferenceAlias Property Alias_terminalHackerTurret Auto Const
ReferenceAlias Property Alias_terminalHackerTurretTarget Auto Const
Faction Property CaptiveFaction Auto Const
SPELL Property terminalHackerTurretConfidenceSpell Auto Const
FormList Property ExplosivesCanSeeList Auto Const
FormList Property DoorBlockersCanSeeList Auto Const
Keyword Property LinkTerminalTurret Auto Const
Scene Property turretTargetFireScene Auto Const
Formlist Property targetList auto
ObjectReference Property currentTerminal auto

int targetIndex
;Index for the objects that are being targeted by the turrets(Outside of the function due to needing it's value to remain)

Function turretTargetSetup(FormList CanSeeList, ObjectReference baseTerminal)

	ObjectReference[] turretsArray = baseTerminal.GetLinkedRefChain(LinkTerminalTurret)
	;Array to hold turrets linked to specified terminal.

	currentTerminal = baseTerminal
	;Assigning the baseTerminal parameter to the currentTerminal property for use in the Scene and Package fragments when calling a function.
	targetList = CanSeeList
	;Assigning the CanSeeList parameter to the targetList property for use in the Scene and Package fragments when calling a function.
	debug.trace(CanSeeList.GetSize())

	targetIndex = 0
	Actor currentTurret
	ObjectReference currentTarget

	int turretIndex
	;Index for the array of turrets connected to the specified turret.

	while turretIndex < turretsArray.Length
		; Iterate through the linked turrets to prevent them from starting/responding to combat while performing this operation.
		currentTurret = (turretsArray[turretIndex] as Actor)
		currentTurret.AddSpell(terminalHackerTurretConfidenceSpell, false)
		currentTurret.AddToFaction(CaptiveFaction)
		currentTurret.stopCombatAlarm()

		turretIndex += 1
	endwhile

	turretTarget(CanSeeList, baseTerminal)
endFunction

Function turretTarget (Formlist CanSeeList, ObjectReference baseTerminal)
;Where the turret and target aliases are defined and the scene is started.

	ObjectReference[] turretsArray = baseTerminal.GetLinkedRefChain(LinkTerminalTurret)
	;Array to hold turrets linked to specified terminal.

	Actor currentTurret
	ObjectReference currentTarget

	int turretIndex
	;Index for the array of turrets connected to the specified turret.

	debug.trace("Starting, index at " + targetIndex)
	debug.trace("Is alias in scene" + (Alias_terminalHackerTurret.GetReference() as Actor).IsInScene())
	if targetIndex < CanSeeList.GetSize()

		currentTarget = (CanSeeList.GetAt(targetIndex) as ObjectReference)
		turretIndex = 0
		Alias_terminalHackerTurretTarget.ForceRefTo(currentTarget)
		float iLastClosestDistance
		iLastClosestDistance = turretsArray[turretIndex].GetDistance(currentTarget)

		while turretIndex < turretsArray.Length && (currentTarget != none)
		;Iterate through the linked turrets to check whether they have LoS with the latest target and then whether they are closer to the target than the last turret that had LoS.
			
			currentTurret = (turretsArray[turretIndex] as Actor)
			bool HasLoS = currentTurret.HasDirectLoS(currentTarget, asSourceNode = "ProjectileNode")
				if iLastClosestDistance >= currentTurret.GetDistance(currentTarget) && HasLoS == true && !currentTurret.IsDead()
					Alias_terminalHackerTurret.ForceRefTo(currentTurret)
					iLastClosestDistance = currentTurret.GetDistance(currentTarget)

				elseif currentTurret.IsDead() == 1
						iLastClosestDistance = turretsArray[(turretIndex + 1)].GetDistance(currentTarget)
				endif

			turretIndex += 1
		endwhile

		;Start the scene but do not let the scene attempt to start or the script continue while the current turret is in the scene.(scene ends after the package to shoot the target completes)
		if Alias_terminalHackerTurretTarget != none
			turretTargetFireScene.forcestart()

			StartTimer(10, 1)	; NOTE: 2.5 seconds was not even enough time for the turret to finish its wake-up animation.  Need more time.
			;Fail-safe in the case that the scene is unable to finish due to outside interference destroying targeted objects or turrets doing the targeting at the time, etc.
		endif

	else
		;debug.trace("Finished.")
		Alias_terminalHackerTurret.Clear()
		Alias_terminalHackerTurretTarget.Clear()

		while turretIndex < turretsArray.Length
			;Iterate through the linked turrets and return their confidence and factions to normal, then stopcombat to reevaluate.
			currentTurret = turretsArray[turretIndex] as Actor
			currentTurret.DispelSpell(terminalHackerTurretConfidenceSpell)
			currentTurret.RemoveFromFaction(CaptiveFaction)
			currentTurret.stopCombatAlarm()
			
			turretIndex += 1
		endwhile

	endif

endFunction

Function resetTurretTarget(Formlist CanSeeList, ObjectReference baseTerminal)
	;Where the script is reset and setup for the next turret/target.

	;debug.trace("resetting, index was at " + targetIndex)
	Alias_terminalHackerTurretTarget.Clear()
	targetIndex += 1
	turretTarget(CanSeeList, baseTerminal)		
endFunction

Event OnTimer(int aiTimerID)
    ;stop scene and continue iterating through the list of targets.

    if aiTimerID == 1
      	;debug.trace("DNMasterQuestScript, turretTarget function hit fail-safe")
    	turretTargetFireScene.Stop()
		resetTurretTarget(targetList, currentTerminal)
    endif

EndEvent