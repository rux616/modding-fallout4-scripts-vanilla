Scriptname DefaultAliasOnContainerChangedFrom extends DefaultAlias Const Default
{Default script used for checking if an alias changed from a different container, and optionally what specific container.}
import CommonArrayFunctions

Group Optional_Properties
	ObjectReference[] Property ItemChangedFromReferences Auto Const
	{OPTIONAL: Stage will be set if this item changed from any of these references.
	If ALL arrays are empty then stage is set if item changes from any container.}

	ReferenceAlias[] Property ItemChangedFromAliases Auto Const
	{OPTIONAL: Stage will be set if this item changed from any of these aliases.
	If ALL arrays are empty then stage is set if item changes from any container.}

	Faction[] Property ItemChangedFromFactions Auto Const
	{OPTIONAL: Stage will be set if this item changed from any of these factions.
	If ALL arrays are empty then stage is set if item changes from any container.}
EndGroup

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	DefaultScriptFunctions.DefaultScriptTrace(self + ": OnContainerChanged() Called on DefaultAliasOnOnContainerChangedFrom script.", ShowTraces)
	TryToSetStage(RefToCheck = akOldContainer, ReferenceArray = ItemChangedFromReferences, AliasArray = ItemChangedFromAliases, FactionArray = ItemChangedFromFactions)
EndEvent
