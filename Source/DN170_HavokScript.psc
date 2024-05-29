Scriptname DN170_HavokScript extends ObjectReference

defaultDisableHavokOnLoad property DisableHavokScript auto

auto State Waiting

	Event OnActivate(ObjectReference akActionRef)

		GoToState("Done")

		ObjectReference[] LinkedRefChain = GetLinkedRefChain()
		int i = 0
		Debug.trace("Activated")
		while i < LinkedRefChain.Length
			ObjectReference linkRef = LinkedRefChain[i]
			DisableHavokScript = linkRef as defaultDisableHavokOnLoad
			Debug.trace("iterate object for Havok and Impulse")
			DisableHavokScript.ReleaseToHavok()

			i += 1
		endWhile 

	endEvent

endState


state Done 
;do nothing

endState
