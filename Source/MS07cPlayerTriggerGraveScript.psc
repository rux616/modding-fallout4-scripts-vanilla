Scriptname MS07cPlayerTriggerGraveScript extends ObjectReference Conditional

Quest Property pMS07c Auto Const
ReferenceAlias Property pPlayerDefault Auto Const
ObjectReference Property pPlayerRef Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)

;	debug.messagebox("Someone has entered this trigger!")

	if pMS07c.GetStageDone(260)

;		debug.messagebox("Proper stage is done!")

		if akActionRef == pPlayerRef

;			debug.messagebox("It's the player!")

			(pMS07c as MS07cScript).bPlayerAtGrave = true

			if pMS07c.GetStageDone(270)

;				debug.messagebox("Set stage 275!")

				pMS07c.SetStage(275)

			endif

		endif

	endif

EndEvent

Event OnTriggerLeave (ObjectReference akActionRef)
	
	if pMS07c.GetStageDone(260)

		if akActionRef == pPlayerRef

			(pMS07c as MS07cScript).bPlayerAtGrave = false

		endif

	endif

EndEvent

