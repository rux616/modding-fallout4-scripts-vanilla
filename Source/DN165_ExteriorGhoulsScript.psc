Scriptname DN165_ExteriorGhoulsScript extends RefCollectionAlias Hidden
{Script for the DN165 Exterior ghouls that start dead.}

Event OnAliasInit()
	int i = 0
	While (i < Self.GetCount())
		(Self.GetAt(i) as Actor).Kill()
		i = i + 1
	EndWhile
EndEvent