Scriptname DLC03:DLC03CoA_DialogueNucleusScript extends Quest Conditional

int Property iBrotherDevinChoice Auto Conditional 
; 0 = no choice, 1 = speech challenge, 2 = talk reverntly, 3 = talk casually 

int Property iSisterMaiBargainSuccess Auto Conditional 
{Used to track how many successes the player has gotten while negotiating with Mai} 

int Property iHCDivisionChoice Auto Conditional 
; 0 = no choice, 1 = "Atom reached out", 2 = pretended to be Atom's messengers, 3 = "Leave filth of this world" 

int Property iPlayerTrustLevel Auto Conditional 
{Stores the player's current trust level in case they fail the Division speech challenge so they can't do it multiple times if they fail}

float Property fCurrentWareRootTime = -1.0 Auto 
{Time until next Ware Root}

float Property fDaysUntilWareRoot = 3.0 Auto Const
{How long before Ware should give more root}

int Property iDevinFailSafeTimerLength = 80 Auto Const
{Length of timer before Brother Devin's failsafe timer gets set}

bool Property bHasWareRoot = false Auto Conditional
{Used to manage if player should receive new Ware Root}

GlobalVariable Property DLC03CoA_QuestsCompleted Auto Const Mandatory
{How many quests the player has completed for the Children of Atom}

;Local vars
int iDevinFailSafeTimerID = 1 Const

Event OnTimer(int aiTimerID)
	;Set the stage saying it's okay for Devin to be healthy again
	if aiTimerID == iDevinFailSafeTimerID
		SetStage(128)
	endif
EndEvent

Function CalcWareRoot()
;This function gets called when the player start the "Turn In" scene for Zealot Ware in the DLC03 Nucleus location

	;First time this is called, just set the timer
	if fCurrentWareRootTime <= -1.0
		fCurrentWareRootTime = Utility.GetCurrentGameTime() + fDaysUntilWareRoot
	else
		;On subsequent calls, check against game timer. If enough time has passed, give Ware Root
		if Utility.GetCurrentGameTime() >= fCurrentWareRootTime
			;Gets set back to false and timer updated in info fragment
			bHasWareRoot = true
		else
			bHasWareRoot = false
		endif
	endif
EndFunction

Function StorePlayerTrustLevel()
	;If the player hasn't convinced the High Confessor it's time for Division, 
	;And the player hasn't already failed the "I'm Atom's Chosen" speech challenge
	;update the threshold var

	;This is called at the start of the "Convince the HC of Division" scene
	if !GetStageDone(93) && !GetStageDone(95)
		iPlayerTrustLevel = (DLC03CoA_QuestsCompleted.GetValue() as int)
	endif
EndFunction

Function StartDevinFailSafeTimer()
	StartTimer(iDevinFailSafeTimerLength, iDevinFailSafeTimerID)
EndFunction

Function CancelDevinFailSafeTimer()
	CancelTimer(iDevinFailSafeTimerID)
EndFunction

