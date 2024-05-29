Scriptname DefaultAliasPlayerChangeLocation extends DefaultAlias Const Default
{Default script used for checking when this player alias changes location.}

import CommonArrayFunctions
Group Optional_Properties
	Location[] Property LeavingOneOfTheseLocations Auto Const
	{OPTIONAL: Stage will be set if the player leaves one of these locations}

	LocationAlias[] Property LeavingOneOfTheseAliases Auto Const
	{OPTIONAL: Stage will be set if the player leaves one of these location aliases}

	bool Property LeavingIgnoreIfNewLocIsChild = true Auto Const
	{ if true (DEFAULT), don't consider to be leaving the location if you're entering a child of one of the "leaving" locations}

	Location[] Property EnteringOneOfTheseLocations Auto Const
	{OPTIONAL: Stage will be set if the player enters one of these locations}

	LocationAlias[] Property EnteringOneOfTheseAliases Auto Const
	{OPTIONAL: Stage will be set if the player enters one of these location aliases}

	bool Property EnteringIgnoreIfOldLocIsChild = true Auto Const
	{ if true (DEFAULT), don't consider to be entering the location if you're leaving a child of one of the "entering" locations}

	bool Property LeavingIgnoreIfOldLocIsChild = true auto Const
	{ if true (DEFAULT), will not consider to be leaving the location if you're leaving a child of one of the "leaving" location
		if false, will consider leaving a child of any of the "leaving" locations
	}

	bool Property EnteringIgnoreIfNewLocIsChild = true auto Const
	{ if true (DEFAULT), will not consider to be entering the location if you're entering a child of one of the "entering" location
		if false, will consider entering a child of any of the "entering" locations
	}
EndGroup


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	DefaultScriptFunctions.DefaultScriptTrace(self + ": OnLocationChange() Called on DefaultAliasPlayerChangeLocation script: akOldLoc=" + akOldLoc + ", akNewLoc=" + akNewLoc, ShowTraces)
	if LeavingOneOfTheseAliases.length > 0 || LeavingOneOfTheseLocations.length > 0
		; do we care about child locations?
		if LeavingIgnoreIfNewLocIsChild
			; make sure new location is _not_ a child of one of these locations
			if !CheckLocationAgainstArray(ObjectToCheck = akNewLoc, ArrayToCheck = LeavingOneOfTheseLocations, matchIfChildLocation = true) && !CheckLocationAgainstLocationAliasArray(ObjectToCheck = akNewLoc, ArrayToCheck = LeavingOneOfTheseAliases, matchIfChildLocation = true)
				TryToSetStage(FormToCheck = akOldLoc, LocationArray = LeavingOneOfTheseLocations, LocationAliasArray = LeavingOneOfTheseAliases, LocationMatchIfChild = !LeavingIgnoreIfOldLocIsChild)
			endif
		else
			; we don't care about child locations, always check old location
			TryToSetStage(FormToCheck = akOldLoc, LocationArray = LeavingOneOfTheseLocations, LocationAliasArray = LeavingOneOfTheseAliases, LocationMatchIfChild = !LeavingIgnoreIfOldLocIsChild)
		endif
	endif

	if EnteringOneOfTheseAliases.length > 0 || EnteringOneOfTheseLocations.length > 0
		if EnteringIgnoreIfOldLocIsChild
			; make sure old location is _not_ a child of one of these locations
			if !CheckLocationAgainstArray(ObjectToCheck = akOldLoc, ArrayToCheck = EnteringOneOfTheseLocations, matchIfChildLocation = true) && !CheckLocationAgainstLocationAliasArray(ObjectToCheck = akOldLoc, ArrayToCheck = EnteringOneOfTheseAliases, matchIfChildLocation = true)
				TryToSetStage(FormToCheck = akNewLoc, LocationArray = EnteringOneOfTheseLocations, LocationAliasArray = EnteringOneOfTheseAliases, LocationMatchIfChild = !EnteringIgnoreIfNewLocIsChild)
			endif
		else
			TryToSetStage(FormToCheck = akNewLoc, LocationArray = EnteringOneOfTheseLocations, LocationAliasArray = EnteringOneOfTheseAliases, LocationMatchIfChild = !EnteringIgnoreIfNewLocIsChild)
		endif
	endif


EndEvent