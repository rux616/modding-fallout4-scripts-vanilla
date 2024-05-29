Scriptname MQ101CollectionActivationBlockScript extends RefCollectionAlias
{ blocks activation on everything in the collection }

event OnAliasInit()
	int i = 0
	while i < GetCount()
		ObjectReference theRef = GetAt(i)
		theRef.BlockActivation(abBlocked = true, abhideActivateText = true)
		i += 1
	endWhile
endevent
