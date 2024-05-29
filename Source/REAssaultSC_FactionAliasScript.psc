ScriptName REAssaultSC_FactionAliasScript extends ReferenceAlias
{Script for aliases on REAssaultSC_Faction quests.}

int property specialWeaponChance = 10 Auto Const
{Percent chance of this actor having his special weapon.}

LeveledItem property SpecialWeapon Auto Const
{The special weapon to give this actor if the percent chance roll passes.}


Event OnAliasInit()
	if (Utility.RandomInt(0, 100) < specialWeaponChance)
		Debug.Trace("REAssaultSC_FactionAliasScript GAVE SPECIAL ITEM to " + Self.GetActorRef())
		Self.GetActorRef().AddItem(SpecialWeapon)
	EndIf
EndEvent