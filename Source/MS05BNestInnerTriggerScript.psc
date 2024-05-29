Scriptname MS05BNestInnerTriggerScript extends ObjectReference Const

Quest Property pMS05B Auto Const

ReferenceAlias Property pPoppaDeathclaw Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
  
	if pMS05B.GetStageDone(250)

;		debug.messagebox("Stage 250 is go")

		if !pMS05B.GetStageDone(400)

;			if akActionRef == Game.GetPlayer()

;				debug.messagebox("Player hit the trigger")

;				if !pMS05B.GetStageDone(500)

;					(pMS05B as MS05BScript).bPlayerLeaveNestWithEgg = false
;
;				endif

;			endif

			if akActionRef == pPoppaDeathclaw.GetActorRef()

;				debug.messagebox("Poppa hit the trigger")

				if !pMS05B.GetStageDone(275)

; 					debug.messagebox("275 is not set")

					pMS05B.SetStage(275)

				endif

			endif

		endif

	endif

EndEvent

;Event OnTriggerLeave(ObjectReference akActionRef)
  
;	if pMS05B.GetStageDone(250)

;		if akActionRef == Game.GetPlayer() 

;			if !pMS05B.GetStageDone(500)

;				pMS05B.SetStage(490)
;				(pMS05B as MS05BScript).bPlayerLeaveNestWithEgg = true

;			endif

;		endif 

;	endif

;EndEvent
