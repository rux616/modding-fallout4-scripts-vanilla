Scriptname DLC03:DLC03AtomM01CombatStopScript extends Quest Const

RefCollectionAlias Property NucleusCitizens Auto Const Mandatory
{Ref Collection of all the folks in the Nucleus}

Cell Property DLC03Nucleus Auto Const Mandatory
Cell Property DLC03NucleusSubInterior01 Auto Const Mandatory
{Cells to check for citizens}

Function EndNucleusCombat()
	;Loop through everyone in the Nucleus
	int i = 0
	int iCount = NucleusCitizens.GetCount()

	while i < iCount
		Actor act = (NucleusCitizens.GetAt(i) as Actor)
		Cell CC = act.GetParentCell()

		;If they're currently inside the Nucleus and unloaded, stop combat on them
		if !act.Is3dLoaded() && (CC == DLC03Nucleus || CC == DLC03NucleusSubInterior01)
			;debug.trace("DLC03AtomM01: Stopping combat on: " + act)
			act.StopCombat()
		endif

		i += 1
	endwhile

	;Combat halted. Shut down quest.
	SetStage(1000)
EndFunction