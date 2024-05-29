ScriptName MinDefendCastleVertibirdQuestScript Extends Quest Conditional
{}

MinDefendCastleAttackScript Property MinDefendCastle Auto Const 


Group RefAliases
	ReferenceAlias Property Vertibird Auto Const
	ReferenceAlias Property Pilot Auto Const
	ReferenceAlias Property Gunner Auto Const
	ReferenceAlias Property Passenger1 Auto Const
	ReferenceAlias Property Passenger2 Auto Const

	ReferenceAlias Property CircleMarker Auto Const
	ReferenceAlias Property LandingMarker Auto Const
	ReferenceAlias Property AirdropMarker Auto Const
	ReferenceAlias Property SpawnMarker Auto const
EndGroup

Group LocRefs
	LocationRefType Property MinDefendCastleVerti Auto Const
	LocationRefType Property MinDefendCastleVertiPilot Auto Const
	LocationRefType Property MinDefendCastleVertiGunner Auto Const
	LocationRefType Property MinDefendCastleVertiPassenger1 Auto Const
	LocationRefType Property MinDefendCastleVertiPassenger2 Auto Const
EndGroup

Group ExternalRefCollections
	RefCollectionAlias Property MinDefendCastleAirDropMarkers Auto Const
	RefCollectionAlias Property MinDefendCastleLandingMarkers Auto Const
	ReferenceAlias Property Center Auto Const
EndGroup

Keyword Property MinDefendCastleInUse Auto Const
Bool Property LandTroops Auto Conditional
int Property landTroopsPercentChance = 50 auto const

ObjectReference[] mySquad
ObjectReference VertibirdRef
ObjectReference SpawnMarkerRef

;This is called from the stage that starts this quest
;The number tells this script which attacker phase squad to grab from the minDefendCastleAttackScript
Function GetMySquad(int SquadNumber)
	if MinDefendCastle.AttackerPhases[SquadNumber].VertibirdPhase == false
		;This isn't a vertibird stage dummy! Shut it down!
		Debug.Trace(Self + ": THIS WAS NOT A VERTIBIRD PHASE >>> " + SquadNumber)
		Stop()
	else
		mySquad = new ObjectReference[0]
		int i = 0
		int count = MinDefendCastle.AttackerPhases[SquadNumber].AttackerSquad.GetCount()
		While i < count
			;Add each member of the squad to the mySquad so we can affect them all if needed
			mySquad.Add(MinDefendCastle.AttackerPhases[SquadNumber].AttackerSquad.GetAt(i))

			;Then check if we can force it to an appropriate RefAlias
			ForceToAppropriateRefAlias(mySquad[i])
			i += 1
		EndWhile
		;Set up spawning marker
		SpawnMarker.ForceRefTo(MinDefendCastle.AttackerPhases[SquadNumber].VertibirdStartMarker.GetReference())
		SpawnMarkerRef = SpawnMarker.GetRef()

		CircleMarker.ForceRefTo(Center.GetReference())
		SetVertibirdMarker(LandingMarker, MinDefendCastleLandingMarkers)
		SetVertibirdMarker(AirDropMarker, MinDefendCastleAirDropMarkers)
	endif
	debug.trace(self + " GetMySquad: spawn marker = " + SpawnMarkerRef)
	;We're ready, start the controller scene
	VertibirdRef.Moveto(SpawnMarkerRef)
	gunner.TryToMoveto(SpawnMarkerRef)
	pilot.TryToMoveto(SpawnMarkerRef)
	passenger1.TryToMoveto(SpawnMarkerRef)
	passenger2.TryToMoveto(SpawnMarkerRef)
	VertibirdRef.Enable()
	; for now, randomly choose whether to land or drop troops
	if Utility.RandomInt(1, 100) <= landTroopsPercentChance
		LandTroops = true
	endif
	SetStage(10)
EndFunction



;Check for LocRefTypes and if we have them force this ref into the appropriate refAlias
Function ForceToAppropriateRefAlias(ObjectReference RefToForce)
	if RefToForce.HasLocRefType(MinDefendCastleVerti)
		Vertibird.ForceRefTo(RefToForce)
		VertibirdRef = Vertibird.GetReference()

	elseif RefToForce.HasLocRefType(MinDefendCastleVertiPilot)
		Pilot.ForceRefTo(RefToForce)

	elseif RefToForce.HasLocRefType(MinDefendCastleVertiGunner)
		Gunner.ForceRefTo(RefToForce)	

	elseif RefToForce.HasLocRefType(MinDefendCastleVertiPassenger1) && MinDefendCastleVertiPassenger1 != NONE
		Passenger1.ForceRefTo(RefToForce)	

	elseif RefToForce.HasLocRefType(MinDefendCastleVertiPassenger2) && MinDefendCastleVertiPassenger2 != NONE
		Passenger2.ForceRefTo(RefToForce)	
	else 
		;What is this garbage!? I can't do anything with this!
		Debug.Trace(Self + ": FAILED TO FORCE REF TO ALIAS >>> " + RefToForce)
	endif
EndFunction




Function SetVertibirdMarker(ReferenceAlias RefAliasToForce, RefCollectionAlias RefColl)
	int i = 0
	int maxIndex = RefColl.GetCount() - 1
	bool pickResolved = false
	while !pickResolved
		i = utility.RandomInt(0, maxIndex)
		if !RefColl.GetAt(i).HasKeyword(MinDefendCastleInUse)
			RefAliasToForce.ForceRefTo(refColl.GetAt(i))
			pickResolved = true
		endif
	endWhile
EndFunction