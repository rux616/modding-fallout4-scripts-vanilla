Scriptname RR201Script extends Quest Conditional

Int Property bReturnedToDez Auto Conditional
Int Property bDezOneLastThing Auto Conditional
Int Property bZ114NotToldPlan Auto Conditional
Int Property bLiamTurnedDown Auto Conditional
Int Property bPlayerKeepsPassword Auto Conditional
Int Property bWelcomedAfterInstitute Auto Conditional

MQ00Script property MQ00 auto const
bool initialized = false

Function StartZ1Timer(int nTimer = 201)
	StartTimerGameTime(24, nTimer)
EndFunction

Function CancelZ1Timer(int nTimer = 201)
	CancelTimerGameTime(nTimer)
EndFunction

Event OnTimerGameTime (int iTimer)
	;Once the timer's done, Z1-14 is now ready to meet
	;debug.messagebox("OnTimer fired")
	if iTimer == 201
		if !GetStageDone(725)
			SetStage(725)
		endif
	endif

	if iTimer == 910
		if !GetStageDone(910)
			SetStage(910)
		endif
	endif

EndEvent

function InitializeQuest()
	if initialized
		return
	endif

	RegisterForCustomEvent(MQ00, "MQFactionKickOut")

	Debug.Trace("RR201Script Intialized")

	initialized = true
endFunction

function HolotapeGivenAway()
	Debug.Trace("Holotape has been given away")

	if ( GetStageDone(100) && !GetStageDone(200) )   ; (100) Are you actively running RR201 for the Railroad? AND (200) You haven't turned it in?
		; Check the number of quest holotapes in your inventory
		int nHolo1 = Game.GetPlayer().GetItemCount(pMQ206Holotape)
		int nHolo2 = Game.GetPlayer().GetItemCount(pMQ206HolotapeRR)
		if ( nHolo1 + nHolo2 == 0 )  ; If you don't have any, do some stuff
			bGetNewHolotape = 1
			SetObjectiveDisplayed(75)			; Show a new objective - talk to Tinker Tom
			if GetStageDone(150)
				SetObjectiveDisplayed(150, FALSE)
			else
				SetObjectiveDisplayed(100, FALSE)
			endif
		endif
	endif

endFunction

function HolotapePickedUp()
	Debug.Trace("Holotape has been picked up")

	if ( bGetNewHolotape == 1 )		; Are you waiting for a new tape?
		bGetNewHolotape = 0
		SetObjectiveDisplayed(75, FALSE)	; Hide the objective
		if ( GetStageDone(150) )
			SetObjectiveDisplayed(150)
		else
			SetObjectiveDisplayed(100)
		endif
	endif
endFunction

; This function makes sure the player has a holotape for RR201
; (Called from RRAct3Pickup and RR201)
function MaybeGiveHolotape()
	int nHolo1 = Game.GetPlayer().GetItemCount(pMQ206Holotape)
	int nHolo2 = Game.GetPlayer().GetItemCount(pMQ206HolotapeRR)

	; See if the player has a holotape
	if ( nHolo1 + nHolo2 == 0 )  
		ObjectReference oItem = Game.GetPlayer().PlaceAtMe(pMQ206HolotapeRR)
		Game.GetPlayer().AddItem(oItem)
		QuestHolotape.ForceRefTo(oItem)
	endif

endFunction

; handle faction kickout event
Event MQ00Script.MQFactionKickOut(MQ00Script akSender, Var[] akArgs)
	;store off which faction we just got kicked out of
	int kickoutFactionNumber = (akArgs[0] as int)

	Debug.Trace("Received kickout event: " + kickoutFactionNumber)

	if ( kickoutFactionNumber == 3 )     ; 3 is the Railroad
		SetStage(9000)                   ; Fail the quest
	endif

	if ( kickoutFactionNumber == 4 )     ; 4 is the Insitute
		SetStage(8900)                   ; Fail the quest
	endif

EndEvent

Int Property bBlockRR201 Auto Conditional

Int Property bBlockRR201fromRR301 = 0 Auto Conditional

Int Property bMessengerInterrupts Auto Conditional

Holotape Property pMQ206Holotape Auto Const Mandatory
Holotape Property pMQ206HolotapeRR Auto Const Mandatory

Int Property bGetNewHolotape Auto Conditional

ReferenceAlias Property QuestHolotape Auto

Int Property bBlockRR201fromRRM02 Auto Conditional

Int Property bBlockRR201fromRRR06 Auto Conditional
