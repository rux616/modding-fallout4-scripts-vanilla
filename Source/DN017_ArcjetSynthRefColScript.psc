Scriptname DN017_ArcjetSynthRefColScript extends RefCollectionAlias Hidden
{Script on DN017's ArcjetSynths RefCollectionAlias. Sets the crime faction of the synths in the collection.}

Faction property DN017_CrimeFactionArcjet Auto Const Mandatory
{The Arcjet Crime Faction. Needed to handle an edge case where the player is also in InstituteFaction, causing the synths to not attack...}

Event OnAliasInit()
	int i = 0
	While (i < Self.GetCount())
		Actor current = Self.GetAt(i) as Actor
		if (current != None)
			current.SetCrimeFaction(DN017_CrimeFactionArcjet)
		EndIf
		i = i + 1
	EndWhile
EndEvent