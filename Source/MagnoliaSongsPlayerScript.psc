Scriptname MagnoliaSongsPlayerScript extends ReferenceAlias

Location Property GoodneighborTheThirdRail Auto

;If the player leaves or re-enters the Third Rail after hearing Magnolia sing at least once, handle starting up and shutting down the songs
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	MagnoliaSongsScript myQuest = (GetOwningQuest() as MagnoliaSongsScript)
	If myQuest.GetStageDone(10) == 1
		If akOldLoc == GoodneighborTheThirdRail
			myQuest.StopAllSongs()
			; set AllowSinging back to true as failsafe
			myQuest.SetAllowSinging(true)
		ElseIf akNewLoc == GoodneighborTheThirdRail && myQuest.AllowSinging
			myQuest.PickNewSong()
		EndIf
	EndIf
EndEvent