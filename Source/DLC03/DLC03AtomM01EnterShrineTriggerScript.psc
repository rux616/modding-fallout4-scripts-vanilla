Scriptname DLC03:DLC03AtomM01EnterShrineTriggerScript extends ObjectReference

ReferenceAlias Property SpringTrigger Auto Const Mandatory
{Alias for the trigger for Atom's spring in DLC03AtomM01}

Quest Property DLC03AtomM01 Auto Const Mandatory
{Quest the effect is used for}

Event OnTriggerEnter(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()

		;When the player enters the shrine, set stage 60 if the quest is running and the proper stage has been reached
		if DLC03AtomM01.IsRunning() && !DLC03AtomM01.GetStageDone(60) && DLC03AtomM01.GetStageDone(20) && !DLC03AtomM01.GetStageDone(750)
			DLC03AtomM01.SetStage(60)
		endif

		;If the effect on the spring hallucination effect has worn off,
		;and the player hasn't finished this section of AtomM01, reactivate it
		if DLC03AtomM01.IsRunning() && !DLC03AtomM01.GetStageDone(70) && DLC03AtomM01.GetStageDone(20) && !DLC03AtomM01.GetStageDone(750)

			DLC03AtomSpringScript myTrigger = (SpringTrigger.GetRef() as DLC03AtomSpringScript)
			if !myTrigger.bEffectActive
				myTrigger.TriggerHallucination()
			endif
		endif
	endif
EndEvent