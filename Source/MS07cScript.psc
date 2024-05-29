Scriptname MS07cScript extends Quest Conditional

Int Property iHolotapeCount Auto Conditional
Int Property iHolotapeCount_Tapes Auto Conditional
Bool Property bPlayerAtGrave Auto Conditional
Bool Property bProcessingObjectives Auto Conditional
Quest Property pMS07c Auto Const
InputEnableLayer Property MS07cEnableLayer Auto Hidden
Bool Property bAnyStationActive Auto Conditional
int Property iCurrentStationActive Auto Conditional
int Property iTriggerEntryCount Auto Conditional
Bool Property bNickEntersInfat Auto Conditional
Bool Property bNicksGraveHellosBlocked Auto Conditional
RefCollectionAlias Property Alias_AndrewStationRaiders01 Auto Const
RefCollectionAlias Property Alias_AndrewStationRaiders03 Auto Const
GlobalVariable Property MS07cEddieDoorTimer Auto Const

Actor PlayerRef
bool bRaiderColl01Disabled

Bool[] Property bTriggerOff Auto Conditional

ReferenceAlias Property Tape00 Auto Const
ReferenceAlias Property Tape01 Auto Const
ReferenceAlias Property Tape02 Auto Const
ReferenceAlias Property Tape03 Auto Const
ReferenceAlias Property Tape04 Auto Const
ReferenceAlias Property Tape05 Auto Const
ReferenceAlias Property Tape06 Auto Const
ReferenceAlias Property Tape07 Auto Const
ReferenceAlias Property Tape08 Auto Const
ReferenceAlias Property Tape09 Auto Const

Event OnInit()
	bTriggerOff = new Bool[11]
	PlayerRef = Game.GetPlayer()
EndEvent

Function TakeAllTapes()
;Nick removes all the tapes from the player's possession

	PlayerRef.RemoveItem(Tape00.GetRef(), 1, true)
	PlayerRef.RemoveItem(Tape01.GetRef(), 1, true)
	PlayerRef.RemoveItem(Tape02.GetRef(), 1, true)
	PlayerRef.RemoveItem(Tape03.GetRef(), 1, true)
	PlayerRef.RemoveItem(Tape04.GetRef(), 1, true)
	PlayerRef.RemoveItem(Tape05.GetRef(), 1, true)
	PlayerRef.RemoveItem(Tape06.GetRef(), 1, true)
	PlayerRef.RemoveItem(Tape07.GetRef(), 1, true)
	PlayerRef.RemoveItem(Tape08.GetRef(), 1, true)
	PlayerRef.RemoveItem(Tape09.GetRef(), 1, true)

EndFunction

Function UpdateAlreadySeenTerminals()

	int TerminalsIndex = 20
	int TapesIndex = 35
	int TurnOffTermIndex = 30

	;Don't want terminal objectives completed during this stage, use this var to block completion
	bProcessingObjectives = true

	;Loop through all tape objectives in the MS07cTape quest and check if player has seen them already
	while TapesIndex < 125
		if pMS07cTapes.GetStageDone(TapesIndex)
			;If they've seen them already, activate that tape's stage in MS07c
			;Utility.Wait(0.5)
			pMS07c.SetStage(TapesIndex)
			;debug.messagebox("Now playing" + TapesIndex)
		endif
		TapesIndex += 10
		;debug.trace("TapesIndex made it to" + TapesIndex)

	endwhile

	;Loop through all terminal objectives in the MS07cTape quest and check if player has seen them already
	while TerminalsIndex < 120
		if pMS07cTapes.GetStageDone(TerminalsIndex)
			;If they've seen them already, activate that terminal's objectives
			;Utility.Wait(0.5)
			pMS07c.SetStage(TerminalsIndex)
			;debug.messagebox("Now playing" + TerminalsIndex)
		endif
		TerminalsIndex += 10
		;debug.trace("TerminalsIndex made it to" + TerminalsIndex)
		if TerminalsIndex == 120
			
		endif

	endwhile	

	bProcessingObjectives = false

EndFunction

Function StartNickTimer()
	StartTimerGameTime(24, 155)
EndFunction

Function CancelNickTimer()
	CancelTimerGameTime(155)
EndFunction

Function StartEddieDoorTimer()
	StartTimer(MS07cEddieDoorTimer.GetValue(), 1)
EndFunction

Function CancelEddieDoorTimer()
	CancelTimer(1)
EndFunction

Event OnTimerGameTime (int iTimer)
	;Once the timer's done, check if the player has already finished Nick's scene. If not, end Nick's grave scene
	;debug.messagebox("OnTimer fired")
	if iTimer == 155
		;debug.messagebox("Timer has correct ID")
		if !pMS07c.GetStageDone(290)
			;debug.messagebox("Stage 280 not set")
			pMS07c.SetStage(300)
		endif
	endif
EndEvent

Event OnTimer (int iTimer)
	;Once the timer's done, check to see if door has already opened. If not, open it
	if iTimer == 1
		if !pMS07c.GetStageDone(230) 
			pMS07c.SetStage(230)
		endif
	endif
EndEvent

Function StopRaiderCombat()

	int iCount = Alias_AndrewStationRaiders01.GetCount()
	int jCount = Alias_AndrewStationRaiders03.GetCount()
	int i = 0
	int j = 0

	if !bRaiderColl01Disabled
		while i < iCount
			ObjectReference CurrentRef = Alias_AndrewStationRaiders01.GetAt(i)
			;debug.trace(CurrentRef + " stopped combat!")
			(CurrentRef as Actor).StopCombatAlarm()
			i += 1
		endwhile
	endif

	while j < jCount
		ObjectReference CurrentRef = Alias_AndrewStationRaiders03.GetAt(j)
		;debug.trace(CurrentRef + " stopped combat!")
		(CurrentRef as Actor).StopCombatAlarm()
		j += 1
	endwhile
EndFunction

Function DisableRaiderCollection01()

	int iCount = Alias_AndrewStationRaiders01.GetCount()
	int i = 0

	while i < iCount
		ObjectReference CurrentRef = Alias_AndrewStationRaiders01.GetAt(i)
		CurrentRef.Disable()
		i += 1
	endwhile

	bRaiderColl01Disabled = true

EndFunction

Quest Property pMS07cTapes Auto Const