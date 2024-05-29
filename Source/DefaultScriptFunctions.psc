Scriptname DefaultScriptFunctions Const Hidden Default
import CommonArrayFunctions

; RETURN:
; 	true = set the stage (or stage already set)
; 	false = didn't pass conditions to set stage
bool Function TryToSetStage(Quest QuestToSet, Int StageToSet, Int PrereqStage, Int TurnOffStage, Bool PlayerCheckOverride = FALSE, ObjectReference RefToCheck = NONE, Form FormToCheck = NONE, ObjectReference[] ReferenceArray = NONE, ReferenceAlias[] AliasArray = NONE, Faction[] FactionArray = NONE, Form[] FormArray = NONE, Location[] LocationArray = NONE, LocationAlias[] LocationAliasArray = NONE, bool LocationMatchIfChild = false)  Global
	; Used by DefaultAlias scripts to attempt to set a stage
	;debug.Trace("DefaultScriptFunctions: TryToSetStage() Called on DefaultAlias script.")
	bool returnVal = false

	if QuestToSet.GetStageDone(StageToSet)
		;debug.Trace("DefaultScriptFunctions: TryToSetStage() Stage Already Set, returning early")
		RETURN true
	else
		if (PrereqStage > -1 && QuestToSet.GetStagedone(PrereqStage) == FALSE)
			;debug.Trace("DefaultScriptFunctions: TryToSetStage(): Prereq stage not set - do nothing")
		elseif (TurnOffStage > -1 && QuestToSet.GetStage() >= TurnOffStage)
			;debug.Trace("DefaultScriptFunctions: TryToSetStage(): Current stage >= TurnOffStage - do nothing")
		else
			;debug.Trace("DefaultScriptFunctions: TryToSetStage() - passed PrereqStage and TurnOffStage checks")

				; Do we only care about the player?
			if PlayerCheckOverride

					; We do, so check if he triggered us, and if he does then set the correct stage.
				if ReftoCheck == Game.GetPlayer()
					;debug.Trace("DefaultScriptFunctions: TryToSetStage() We only care about the Player, and he passed the check, stage setting SUCCEEDED, going to Set Stage " + StageToSet + " on Quest " + QuestToSet)
					SafeSetStage(QuestToSet, StagetoSet)
					returnVal = true
				else
					;debug.Trace("DefaultScriptFunctions: TryToSetStage() We only care about the Player, and he DIDN'T pass the check, setting stage FAILED")
				endif

			else

					; Do the arrays contain anything?
				if ReferenceArray.Length > 0 || AliasArray.Length > 0 || FactionArray.Length > 0 || FormArray.Length > 0 || LocationArray.Length > 0 || LocationAliasArray.Length > 0
						; See if the RefToCheck is in a faction, an alias, or any of the references in these specfic arrays
					;debug.Trace("DefaultScriptFunctions: TryToSetStage() There is something in one of the arrays, checking to see if any of them are a match.")
					if CheckFormAgainstArray(FormToCheck, FormArray) || CheckObjectReferenceAgainstArray(RefToCheck, ReferenceArray) || CheckObjectReferenceAgainstReferenceAliasArray(RefToCheck, AliasArray) || CheckActorAgainstFactionArray(RefToCheck as Actor, FactionArray) || CheckLocationAgainstArray(FormToCheck as Location, LocationArray, matchIfChildLocation = LocationMatchIfChild) || CheckLocationAgainstLocationAliasArray(FormToCheck as Location, LocationAliasArray, matchIfChildLocation = LocationMatchIfChild)
						;debug.Trace("DefaultScriptFunctions: TryToSetStage() There was a match, setting stage SUCCEEDED, going to Set Stage" + StageToSet + " on Quest " + QuestToSet)
						SafeSetStage(QuestToSet, StagetoSet)
						returnVal = true
					else
							; Stage wasn't set because RefToCheck isn't in a faction, an alias, or any of the references in the speific arrays.
						;debug.Trace("DefaultScriptFunctions: TryToSetStage() Setting stage FAILED, " + ReftoCheck + " was not a reference listed in: " + ReferenceArray + " or on an alias listed in" + AliasArray + " or an actor in a faction listed in " + FactionArray)
					endif

				else
						; There's no ref to check, just set the stage
					;debug.Trace("DefaultScriptFunctions: TryToSetStage() There are no arrays to search through, setting stage SUCCEEDED, going to Set Stage " + StageToSet + " on Quest " + QuestToSet)
					SafeSetStage(QuestToSet, StagetoSet)
					returnVal = true
				endif	

			endif

		endif
	endif

	return returnVal
EndFunction

function SafeSetStage(Quest theQuest, int aiStage) global
	if aiStage > -1
		theQuest.setStage(aiStage)
	endif
endFunction

bool Function CheckForMatches(ObjectReference RefToCheck = NONE, Form FormToCheck = NONE, ObjectReference[] ReferenceArray = NONE, ReferenceAlias[] AliasArray = NONE, Faction[] FactionArray = NONE, Form[] FormArray = NONE, Bool PlayerCheckOverride = FALSE)  Global
	; Used by any script that want's to check if any of the triggering/activating references aer in these arrays
	;debug.Trace("DefaultScriptFunctions: CheckForMatches()")


		; Do we only care about the player?
	if PlayerCheckOverride

			; We do, so check if he triggered us, and if he does then return TRUE
		if ReftoCheck == Game.GetPlayer()
			;debug.Trace("DefaultScriptFunctions: CheckForMatches() We only care about the Player, and he passed the check, returning TRUE")
			return TRUE
		else
			;debug.Trace("DefaultScriptFunctions: CheckForMatches() We only care about the Player, and he DIDN'T pass the check, returning FALSE")
			return FALSE
		endif

	else

			; Do the arrays contain anything?
		if ReferenceArray.Length > 0 || AliasArray.Length > 0 || FactionArray.Length > 0 || FormArray.Length > 0
				; See if the RefToCheck is in a faction, an alias, or any of the references in these specfic arrays
			;debug.Trace("DefaultScriptFunctions: CheckForMatches() There is something in one of the arrays, checking to see if any of them are a match.")
			if CheckFormAgainstArray(FormToCheck, FormArray) || CheckObjectReferenceAgainstArray(RefToCheck, ReferenceArray) || CheckObjectReferenceAgainstReferenceAliasArray(RefToCheck, AliasArray) || CheckActorAgainstFactionArray(RefToCheck as Actor, FactionArray)
				;debug.Trace("DefaultScriptFunctions: CheckForMatches() There was a match, returning TRUE")
				return TRUE
				
			else
					; Returning FALSE because RefToCheck isn't in a faction, an alias, or any of the references in the speific arrays.
				;debug.Trace("DefaultScriptFunctions: CheckForMatches() Returning FALSE, " + ReftoCheck + " was not a reference listed in: " + ReferenceArray + " or on an alias listed in" + AliasArray + " or an actor in a faction listed in " + FactionArray)
				return FALSE
			endif

		else
				; There's no ref to check, returning TRUE
			;debug.Trace("DefaultScriptFunctions: CheckForMatches() There are no arrays to search through, returning TRUE")
			return TRUE
		endif	

	endif

EndFunction


Function DefaultScriptTrace(string TextToPrint, bool ShowTrace) Global DebugOnly
	; Function for default scripts traces that will only show traces if a the global is set to non-zero...
	;  ...or the scripts local ShowTrace bool is true.
	if (ShowTrace) || ((Game.GetFormFromFile(0x0004E34C, "Fallout4.esm") as GlobalVariable).value)
		debug.Trace(TextToPrint)
	endif
EndFunction


; !!!-INCOMPLETE-!!! May eventually turn into a function that will search through a bunch of arrays and return whether it found a match.

; Bool Function FindInArrays(ObjectReference RefToCheck = NONE, ObjectReference[] ReferenceArray = NONE, ReferenceAlias[] AliasArray = NONE, Faction[] FactionArray = NONE) Global
; 		; Do the arrays contain anything?
; 	if ReferenceArray.Length > 0 || AliasArray.Length > 0 || FactionArray.Length > 0 || FormArray.Length > 0

; 	endif
; EndFunction