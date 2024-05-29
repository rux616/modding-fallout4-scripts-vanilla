Scriptname DLC03:DLC03_PCVisitedNucleusTriggerScript extends ObjectReference Const

GlobalVariable Property DLC03CoA_PlayerVisitedNucleus Auto Const Mandatory
{Global to set first time player approaches}

Event OnTriggerEnter(ObjectReference akActionRef)
	;Player approached the Nucleus for the first time. Set global, delete trigger
	if akActionRef == Game.GetPlayer()
		DLC03CoA_PlayerVisitedNucleus.SetValue(1)
		self.Delete()
	endif
EndEvent