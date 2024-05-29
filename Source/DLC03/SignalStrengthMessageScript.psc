Scriptname DLC03:SignalStrengthMessageScript extends Quest

ReferenceAlias property FogCrawler auto const mandatory
{ keep transmitter near fog crawler while displaying message }

ReferenceAlias Property Transmitter auto const mandatory
{ transmitter reference }

Message Property SignalStrengthMessage auto const mandatory
Worldspace Property DLC03FarHarbor auto const mandatory
float fMaxDistance = 16000.0

int iSignalStrengthTimerID = 1 const
float fTimerSeconds = 3.0 const
int TransmitterFrequency = 83 const

int property TuneRadioObjective = 25 auto const

function StartTransmitter(bool bStart)
	debug.trace(self + "StartTransmitter " + bStart)
	if bStart
    	StartTimer(fTimerSeconds, iSignalStrengthTimerID)
    else 
		Transmitter.TryToDisable()
    	CancelTimer(iSignalStrengthTimerID)
    endif
endFunction

Event OnTimer(int aiTimerID)
	debug.trace(self + "OnTimer " + aiTimerID)
	Actor player = Game.GetPlayer()

	; move transmitter to current fog crawler location
	ObjectReference transmitterRef = Transmitter.GetRef()
	ObjectReference fogCrawlerRef = FogCrawler.GetRef()

	transmitterRef.MoveTo(fogCrawlerRef)

	float fPlayerDistance = player.GetDistance(transmitterRef)
	float fStrength = ((fMaxDistance-fPlayerDistance)/fMaxDistance)*100

	; turn on objective to tune to signal once within range
	if (Game.IsPlayerInRadioRange(TransmitterFrequency)) && IsObjectiveCompleted(TuneRadioObjective) == false
		SetObjectiveDisplayed(TuneRadioObjective)
	endif 

	if fPlayerDistance > fMaxDistance
		fStrength = 0.0
	endif
	if player.GetWorldspace() == DLC03FarHarbor && player.IsInInterior() == false && Game.IsPlayerRadioOn() && Game.GetPlayerRadioFrequency() == TransmitterFrequency
		SignalStrengthMessage.Show(fStrength)
	endif
	if GetStageDone(200) == false
		StartTimer(fTimerSeconds)
	endif
EndEvent
	