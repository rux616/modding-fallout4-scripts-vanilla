Scriptname DLC03:DLC03WorkshopRECreatureScript extends Actor
{script to reset tagged RETrigger on death}

RETriggerScript property myTrigger auto

Event OnDeath(Actor akKiller)
    ; if I have an RETrigger, let it know to reset
    if myTrigger
    	myTrigger.ReArmTrigger()
    	; clear it
    	myTrigger = NONE
    endif
EndEvent