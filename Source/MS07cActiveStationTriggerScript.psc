Scriptname MS07cActiveStationTriggerScript extends ObjectReference Conditional

Quest Property pMS07c Auto Const
int Property iStationIndex Auto Const
;INDEX LIST
;1 = Cambridge PD 	2 = Malden
;3 = Quincy 		4 = BADTFL
;5 = Natick 		6 = Nahant
;7 = East Boston	8 = South Boston
;9 = Fens PD 		10 = Coast Guard 


Event OnTriggerEnter(ObjectReference akActionRef)
;When the player enters a police station trigger, if the quest is live, set the bAnyStationActive var 
;and the iCurrentStationActive var on MS07c to hide all objectives except the current one

	if pMS07c.IsRunning() && !pMS07c.GetStageDone(210)

;		debug.trace(self + "OnTriggerEnter")
		if akActionRef == Game.GetPlayer()

			if  !(pMS07c as MS07cScript).bTriggerOff[iStationIndex]

				(pMS07c as MS07cScript).bAnyStationActive = 1
				(pMS07c as MS07cScript).iCurrentStationActive = iStationIndex

;				debug.trace(self + "PreAdd Entry Count:" + (pMS07c as MS07cScript).iTriggerEntryCount)
				(pMS07c as MS07cScript).iTriggerEntryCount += 1
				;If the player enters multiple versions of the same volume, increment this var
;				debug.trace(self + "PostAdd Entry Count:" + (pMS07c as MS07cScript).iTriggerEntryCount)

			endif

		endif

	endif

EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
;When the player exits a police station trigger, if the quest is live, set the bAnyStationActive var 
;and the iCurrentStationActive var on MS07c to zero, revealing all objectives again

	if pMS07c.IsRunning() && !pMS07c.GetStageDone(210)
	
;		debug.trace(self + "OnTriggerLeave")
		if akActionRef == Game.GetPlayer()

			if  !(pMS07c as MS07cScript).bTriggerOff[iStationIndex]

;				debug.trace(self + "PreSubtract Leave Entry Count:" + (pMS07c as MS07cScript).iTriggerEntryCount)
				(pMS07c as MS07cScript).iTriggerEntryCount -= 1
;				debug.trace(self + "PostSubtract Leave Entry Count:" + (pMS07c as MS07cScript).iTriggerEntryCount)

;				debug.trace(self + "OnTriggerLeave")
				if (pMS07c as MS07cScript).iTriggerEntryCount == 0
					;If there are multiple instances of the same Active Station volume in proximity, don't turn objectives back 
					;on until the player has exited all of them			

					(pMS07c as MS07cScript).bAnyStationActive = 0
					(pMS07c as MS07cScript).iCurrentStationActive = 0

				endif

			endif

		endif

	endif

EndEvent