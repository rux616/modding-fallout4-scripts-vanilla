Scriptname DN011ForceRefTrig extends ObjectReference Hidden Const

Referencealias Property AliasToForceInto Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
    	utility.wait(1)
    	AliasToForceInto.ForceRefTo(GetLinkedRef())
    endif
EndEvent