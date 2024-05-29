Scriptname DLC03:DLC03AtomM01EncounterQuestScript extends Quest

EffectShader Property DLC03FogMotherFXS Auto Const Mandatory
{Effect shader for Mother of Fog and shadow stags}

Quest Property DLC03AtomM01 Auto Const Mandatory
{AtomM01 quest - used to check appropriate stages}

RefCollectionAlias Property Encounters Auto Const Mandatory
{Ref collection on EncounterHandler quest containing each of the encounters}

float Property fShutdownTimerLength = 15.0 Auto Const
{Length for shutdown timer}

int Property iCompletionStage = 60 Auto Const
{Stage to be set when ready for shutdown}

int Property iFailureStage = 750 Auto Const
{Stage to be set when ready for shutdown}

int Property iShutdownStage = 1000 Auto Const
{Stage to be set when ready for shutdown}

;Local vars
int iShutdownTimerID = 1 Const

Event OnTimer(int aiTimerID)
	if aiTimerID == iShutdownTimerID
		;If the player has progressed past the vision stage or the quest has failed, check for shutdown
		if DLC03AtomM01.GetStageDone(iCompletionStage) || DLC03AtomM01.GetStageDone(iFailureStage)
			CheckforShutdown()
		else
			;Otherwise, start the timer again
			StartTimer(fShutdownTimerLength, iShutdownTimerID)
		endif
	endif
EndEvent

Function StartShutdownTimer()
	;Triggered from the start up stage of the EncounterHandler
	StartTimer(fShutdownTimerLength, iShutdownTimerID)
EndFunction

Function CheckforShutdown()
	int i = 0
	int iCount = Encounters.GetCount()
	bool bEncountersActive = false

	;Loop through all the encounters
	while i < iCount && !bEncountersActive
		ObjectReference obj

		if Encounters.GetAt(i) != none
			obj = Encounters.GetAt(i)
		endif

		;If any still aren't disabled, keep the quest running and start the timer again
		if obj != none && !obj.IsDisabled() 
			bEncountersActive = true
			StartTimer(fShutdownTimerLength, iShutdownTimerID)
		endif

		i += 1
	endwhile

	;No encounters still active. Shut it down!
	if !bEncountersActive
		CancelTimer(iShutdownTimerID)
		SetStage(iShutdownStage)
	endif
EndFunction