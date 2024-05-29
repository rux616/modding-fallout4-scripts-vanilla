Scriptname MS13MarowskiRevengeScript extends Quest Conditional

int Property startupTimerID = 1 const auto
int Property waitForPlayerTimerID = 2 const auto
int Property waitForPaymentTimerID = 3 const auto

float startupHours = 24.0
float waitForPlayerHours = 168.0 ; 7 days
float waitForPaymentHours = 168.0 ; 7 days

function Startup()
	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")

	; run 24 hour timer for quest to really start
	StartTimerGameTime(startupHours, startupTimerID)
endFunction

function StartupComplete()
	; what does Marowski know? - wait until now to check so Nelson & Trish have time to unload
	; if Trish or Nelson escaped, Marowski knows player was involved
	if MS13.GetStageDone(510) || MS13.GetStageDone(690)
		MarowskiState = 2
		SendMessage = true
	else
		MarowskiState = 1
	endif
endFunction

function StartWaitingForPlayer()
	; run timer for Marowski to get tired of waiting for player to come talk
	StartTimerGameTime(waitForPlayerHours, waitForPlayerTimerID)
endFunction

function StartWaitingForPayment()
	; run timer while Marowski is waiting to get paid
	SendThugs = false
	SendMessage = false
	StartTimerGameTime(waitForPaymentHours, waitForPaymentTimerID)
endFunction

Event OnTimerGameTime(int aiTimerID)
	if aiTimerID == startupTimerID
		SetStage(10)
	elseif aiTimerId == waitForPlayerTimerID
		; Marowski tired of waiting for player - send thugs
		SetStage(150)
	elseif aiTimerId == waitForPlayerTimerID
		; Marowski tired of waiting for payment - send thugs
		SetStage(330)
	endif
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	debug.trace(self + "OnLocationChange " + akNewLoc)
	if akSender == Game.GetPlayer()
		if (akNewLoc == GoodneighborLocation && !GoodneighborLocation.IsChild(akOldLoc))
			; player is entering Goodneighbor
			; Marowski sends thugs while alive after he knows player was involved in ambush
			if SendThugs && !Alias_Marowski.GetActorRef().IsDead()
				MS13ThugsKeyword.SendStoryEvent(akLoc = GoodneighborLocation)
			endif
		endif
	endif
endEvent

bool Property SendThugs = false auto conditional 		; when true, thugs will be sent to kill player
bool Property SendMessage = false auto conditional 	; when true, Marowski sends message to talk to player

Int Property MarowskiState = 0 Auto Conditional
{
1 = no witnesses
2 = knows player did it
}

MS13Script Property MS13 Auto const

Location Property GoodneighborLocation auto const
Keyword Property MS13ThugsKeyword const auto
ReferenceAlias Property Alias_Marowski const auto

Bool Property ThugsAttackPlayer Auto Conditional
{set to true when Marowski's thugs fight the player}
