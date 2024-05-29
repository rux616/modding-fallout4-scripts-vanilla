Scriptname CaravanBaseScript extends Quest Conditional

; Trader int passed to CaravanWaits function
int nCarla 		= 0		; Junk
int nDocWeaver 	= 1		; Doctor
int nLucas 		= 2		; Armor
int nCricket 	= 3 	; Weapons

Function CaravanWaits(int nCaravan)
	Debug.Trace("Caravan " + nCaravan + "'s waiting timer has started.")
	StartTimerGameTime(8, nCaravan) 		; 8 hour waiting at the caravan destination
EndFunction

Event OnTimerGameTime(int aiTimerID)		
	Debug.Trace("Caravan " + aiTimerID + "'s waiting timer has ended.")
	
  	If aiTimerID == nDocWeaver 				; Doc's timer expires
		Debug.Trace(self + ": Doc Weathers is done waiting at settlement.")
		pCaravanDWCurrentStatus.SetValue(0)
  	EndIf

  	If aiTimerID == nCarla 				; Doc's timer expires
		Debug.Trace(self + ": Carla is done waiting at settlement.")
		pCaravanCarlaCurrentStatus.SetValue(0)
  	EndIf

  	If aiTimerID == nLucas 				; Doc's timer expires
		Debug.Trace(self + ": Lucas is done waiting at settlement.")
		pCaravanLucasCurrentStatus.SetValue(0)
  	EndIf

  	If aiTimerID == nCricket 				; Doc's timer expires
		Debug.Trace(self + ": Cricket is done waiting at settlement.")
		pCaravanCricketCurrentStatus.SetValue(0)
  	EndIf

EndEvent

GlobalVariable Property pCaravanCarlaCurrentStatus Auto Const
GlobalVariable Property pCaravanCricketCurrentStatus Auto Const
GlobalVariable Property pCaravanDWCurrentStatus Auto Const
GlobalVariable Property pCaravanLucasCurrentStatus Auto Const
