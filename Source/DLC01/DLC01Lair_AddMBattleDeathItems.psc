ScriptName DLC01:DLC01Lair_AddMBattleDeathItems extends RefCollectionAlias
{Script for the RefCollectionAliases that hold the Mechanist's robots during Phases 1 & 2 of the boss battle. Gives them some additional ammo when killed.}
;These are standard Lvl robots who all get put into the same ref collection, so doing this through script is easier than doing it through actor bases or their alias inventory.

Race[] property RacesForSmallAmmo Auto Const Mandatory
{Races that use the Small ammo list, instead of the Standard one.}

;Autofill properties.
LeveledItem property DLC01Lair_MBattle_LL_Ammo_Drop_Small Auto Const Mandatory
LeveledItem property DLC01Lair_MBattle_LL_Ammo_Drop_Standard Auto Const Mandatory


Event OnDying(ObjectReference akSource, Actor akKiller)
	Actor akSourceActor = akSource as Actor
	if (akSourceActor != None)
		if (RacesForSmallAmmo.Find(akSourceActor.GetRace()) >= 0)
			akSourceActor.AddItem(DLC01Lair_MBattle_LL_Ammo_Drop_Small)
		Else
			akSourceActor.AddItem(DLC01Lair_MBattle_LL_Ammo_Drop_Standard)			
		EndIf
	EndIf
EndEvent