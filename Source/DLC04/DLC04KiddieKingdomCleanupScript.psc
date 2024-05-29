Scriptname DLC04:DLC04KiddieKingdomCleanupScript extends Quest
{This handles clean up for the corpses from Kiddie Kingdom}

objectReference[] CleanupRefs
bool CleanupTimerRunning
float recheckTime = 5.0
Actor Player
Function AddForCleanup(objectReference RefForCleanup)
	Player = Game.GetPlayer()
	if !CleanupRefs
		CleanupRefs = new objectReference[0]
	endif
	CleanupRefs.Add(RefForCleanup)
	if !CleanupTimerRunning
		CleanupTimerRunning = true
		StartTimer(recheckTime)
	Endif
EndFunction



Event OnTimer(int aiTimerID)
	int i = 0
	bool removedRef
	while i < CleanupRefs.length
		removedRef = false
		if !Player.HasDirectLOS(CleanupRefs[i])
			objectReference RefToRemove = CleanupRefs[i]
			CleanupRefs.Remove(i)
			RefToRemove.DisableNoWait()
			RefToRemove.Delete()
			removedRef = true
		endif
		if !removedRef
			i += 1
		endif
	EndWhile
	if CleanupRefs.length > 0
		StartTimer(recheckTime)
	else
		CleanupTimerRunning = false
	endif
EndEvent