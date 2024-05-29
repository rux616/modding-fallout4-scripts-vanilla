Scriptname DNMasterHostileFactionScript extends Quest Hidden

GlobalVariable Property PlayerBoS_KickedOut Auto Const Mandatory
GlobalVariable Property PlayerInstitute_KickedOut Auto Const Mandatory

GlobalVariable Property HostileGlobalBrotherhoodOfSteel Auto Const Mandatory
GlobalVariable Property HostileGlobalInstitute Auto Const Mandatory
GlobalVariable Property HostileGlobalGunner Auto Const Mandatory

Bool PreviouslyEnemiesWithBOS = FALSE
Bool PreviouslyEnemiesWithINST = FALSE


Function UpdateHostileFactionGlobals()
	Debug.Trace(self + "UpdateHostileFactionGlobals()")
	if PlayerBos_KickedOut.GetValue() == 1 && PlayerInstitute_KickedOut.GetValue() == 1
		Debug.Trace(self + "UpdateHostileFactionGlobals() Both Inst and BOS are enemies, see who was previously an enemy.")
		; Player is hostile to both BOS and Institute, pick one of them to be the hostile faction from here on out.
		if !PreviouslyEnemiesWithINST
			Debug.Trace(self + "UpdateHostileFactionGlobals() BOS was our previous enemy, make Inst our new enemy.")
				; Player was previously enemies with BOS, make INST the enemy now.
			HostileGlobalGunner.SetValue(100)
			HostileGlobalBrotherhoodOfSteel.SetValue(100)
			HostileGlobalInstitute.SetValue(0)
		elseif !PreviouslyEnemiesWithBOS
			Debug.Trace(self + "UpdateHostileFactionGlobals() Inst was our previous enemy, make BOS our new enemy.")
				; Player was previously enemies with INST, make BOS the enemy now.
			HostileGlobalGunner.SetValue(100)
			HostileGlobalBrotherhoodOfSteel.SetValue(0)
			HostileGlobalInstitute.SetValue(100)
		endif
	elseif PlayerBos_KickedOut.GetValue() == 0 && PlayerInstitute_KickedOut.GetValue() == 1
		Debug.Trace(self + "UpdateHostileFactionGlobals() We are only enemies with Inst right now.")
		; Player has ONLY been kicked out of the Institute, make them the hostile faction.
		PreviouslyEnemiesWithINST = TRUE
		HostileGlobalGunner.SetValue(100)
		HostileGlobalBrotherhoodOfSteel.SetValue(100)
		HostileGlobalInstitute.SetValue(0)
	elseif PlayerBos_KickedOut.GetValue() == 1 && PlayerInstitute_KickedOut.GetValue() == 0
		Debug.Trace(self + "UpdateHostileFactionGlobals() We are only enemies with BOS right now.")
		; Player has ONLY been kicked out of the BOS, make them the hostile faction.
		PreviouslyEnemiesWithBOS = TRUE
		HostileGlobalGunner.SetValue(100)
		HostileGlobalBrotherhoodOfSteel.SetValue(0)
		HostileGlobalInstitute.SetValue(100)
	elseif PlayerBos_KickedOut.GetValue() == 0 && PlayerInstitute_KickedOut.GetValue() == 0
		Debug.Trace(self + "UpdateHostileFactionGlobals() We are only enemies with Gunners right now.")
		; Player has NOT been kicked out of either factions, make Gunners the hostile faction.
		HostileGlobalGunner.SetValue(0)
		HostileGlobalBrotherhoodOfSteel.SetValue(100)
		HostileGlobalInstitute.SetValue(100)
	endif
EndFunction