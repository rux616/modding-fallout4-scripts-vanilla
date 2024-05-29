Scriptname MQ203SceneTriggerScript extends ObjectReference conditional

MQ203Script property MQ203 auto const

int property mySceneID auto const
{ the ID of the scene that plays when the player is inside this trigger }

bool property HasBeenTriggered auto conditional
{ set to true when the player first enters the trigger }

bool property playerInTrigger auto hidden ; set to TRUE when player is in trigger

bool busy  			; set to TRUE while OnTriggerEnter/Leave are in progress (wait to allow progress)

Event OnTriggerEnter(ObjectReference akActionRef)
	debug.trace(self + " OnTriggerEnter " + akActionRef + " playerInTrigger=" + playerInTrigger)
	; don't actually do this until the player is considered "in" the trigger,
	; meaning all OnTriggerEnter events have been cleared
	while busy && playerInTrigger
		utility.wait(0.5)
	endWhile
	; grab "lock"
	busy = true
	playerInTrigger = true

	HasBeenTriggered = true
	if MQ203.IsRunning()
		MQ203.StartMemory(mySceneID, false)
	endif
	busy = false
endEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	debug.trace(self + " OnTriggerLeave " + akActionRef + " playerInTrigger=" + playerInTrigger)
	; don't actually do this until the player is considered "in" the trigger,
	; meaning all OnTriggerEnter events have been cleared
	while busy && playerInTrigger == false
		utility.wait(0.5)
	endWhile
	; grab "lock"
	busy = true
	playerInTrigger = false

    if MQ203.IsRunning() && MQ203.GetStageDone(1000) == 0
    	MQ203.ExitMemory(mySceneID)
    endif

    ; release lock
    busy = false
EndEvent