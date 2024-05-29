Scriptname DLC02:WorkshopDecontaminationShowerScript extends ObjectReference Const

GenericDoctorsScript property DialogueGenericDoctors auto const mandatory

Event OnTriggerEnter(ObjectReference akActionRef)
	Actor player = Game.GetPlayer()
    if akActionRef == player && IsPowered() && GetOpenState() == 3
    	; clear radiation
    	DialogueGenericDoctors.HealRadiation(player)
    endif
EndEvent
