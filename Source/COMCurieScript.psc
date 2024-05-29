Scriptname COMCurieScript extends Quest Conditional

Location Property pVault81Location Auto Const
GlobalVariable Property pCOMCurieLeftVault Auto Const
Int Property bRejectCompanion Auto Conditional

Int nLocationLeaveCounter

function RegisterLocationChange()
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
endfunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	; watch for player to change location

	; This is some hackery to make sure that the elevator transition cell doesn't improperly flag things

	; If you didn't just enter Vault 81 and you've transitioned 2 locations then set the flag
	if akNewLoc != pVault81Location && nLocationLeaveCounter == 1
		pCOMCurieLeftVault.SetValue(1)
		UnregisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	endif

	; You just left Vault 81
	if akOldLoc == pVault81Location && nLocationLeaveCounter == 0
		nLocationLeaveCounter += 1
	endif

	; You just entered Vault 81
	if akNewLoc == pVault81Location
		nLocationLeaveCounter = 0
	endif

EndEvent

Cell Property pElevTransVault Auto Const
