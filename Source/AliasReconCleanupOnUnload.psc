Scriptname AliasReconCleanupOnUnload extends RefCollectionAlias Hidden

Event OnUnload(ObjectReference akSender)
	Self.RemoveRef(akSender)
EndEvent