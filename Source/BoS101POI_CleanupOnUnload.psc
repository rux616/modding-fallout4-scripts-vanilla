Scriptname BoS101POI_CleanupOnUnload extends RefCollectionAlias
{Script for the BoS101POI Caravan fight. Disables the caravan guards when they unload, provided the fight has been triggered.}

Quest property BoS101POI auto const
{BoS101POI}

Event OnUnload(ObjectReference source)
	if (BoS101POI.GetStageDone(30))
		Self.RemoveRef(source)
		source.Disable()
		source.Delete()
	EndIf
EndEvent