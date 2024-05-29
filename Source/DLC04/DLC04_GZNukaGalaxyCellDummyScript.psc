Scriptname DLC04:DLC04_GZNukaGalaxyCellDummyScript Extends ObjectReference

DLC04:DLC04GZNukaGalaxyQuestScript property DLC04GZNukaGalaxy Auto Const Mandatory

Event OnCellLoad()
	if (DLC04GZNukaGalaxy.IsRunning())
		DLC04GZNukaGalaxy.CellLoaded()
	EndIf
EndEvent