Scriptname RentRoomScript extends Actor  Conditional
{script for anyone who rents a room}

ObjectReference Property Bed  Auto  
{bed to rent}

GlobalVariable Property RentRoomHours Auto
{Global value for how long the player has the room}

GlobalVariable Property RentRoomCost Auto
{Global value for how much the room costs}

ActorValue Property RentRoomAV auto

; rent room
function RentRoom()
	debug.trace(self + " RentRoom called on RentRoomScript - room rental timer started")
	Bed.SetActorOwner(Game.GetPlayer().GetActorBase())
	StartTimerGameTime(RentRoomHours.GetValue())
	Game.GetPlayer().RemoveItem(Game.GetCaps(), RentRoomCost.GetValueInt())
	; used to conditionalize innkeeper dialogue
	SetValue(RentRoomAV, 1.0)	
endFunction

;clear rental
function ClearRoom()
 	debug.trace(self + " ClearRoom called on RentRoomScript - room rental expired")
	; clear ownership - either rental expired or I died
	Bed.SetActorOwner((self as Actor).GetActorBase())
	CancelTimerGameTime()
	; used to conditionalize innkeeper dialogue
	SetValue(RentRoomAV, 0.0)
endFunction

; when this is called, reset the ownership on the bed
Event OnTimerGameTime(int aiTimerID)
	ClearRoom()
endEvent

; if I die, clear the room rental as well, to stop the timer
Event OnDeath(Actor akKiller)
	ClearRoom()
endEvent