Scriptname IdiotSavantScript extends Perk

Event OnEntryRun(int auiEntryID, ObjectReference akTarget, Actor akOwner)
	Game.ShowPerkVaultBoyOnHUD(idiotSavantSwfName, yeah)
	Game.IncrementStat("Bright Ideas")

	if akOwner.HasPerk(IdiotSavant03) == true
		IdiotSavantXPBoostSpell.cast(akOwner)
	endif
EndEvent

Sound Property Yeah Auto Const
SPELL Property IdiotSavantXPBoostSpell Auto Const
Perk Property IdiotSavant03 Auto Const
string Property idiotSavantSwfName = "Components\\VaultBoys\\Perks\\PerkClip_1d245e.swf" Auto const
