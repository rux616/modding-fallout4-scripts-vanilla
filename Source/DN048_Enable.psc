Scriptname DN048_Enable extends ObjectReference Hidden Const

keyword property LinkCustom01 auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == getlinkedref()
		getlinkedref(LinkCustom01).enable()
	endif
EndEvent