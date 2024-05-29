Scriptname MQ203CollectionScript extends RefCollectionAlias Const
{for MQ203 refs
blocks activation}

event OnLoad(ObjectReference akSenderRef)
	int i = 0
	while i < GetCount()
		ObjectReference myRef = GetAt(i)
		if myRef
			myRef.BlockActivation(abBlocked = true, abhideActivateText = true )
			myRef.setMotionType(myRef.Motion_Keyframed)
		endif
		i += 1
	endWhile
endEvent
