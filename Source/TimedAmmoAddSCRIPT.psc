Scriptname TimedAmmoAddSCRIPT extends Actor

AMMO PROPERTY ammoType AUTO
{the ammo type to add}

INT PROPERTY addCount =1 AUTO
{how many to add}

FLOAT PROPERTY addTimer =15.0 AUTO
{how often should we add them?}

;timer ID
INT timerID = 55

EVENT OnLoad()

	;start timer
	startTimer(addTimer, timerID)

ENDEVENT

EVENT OnTimer(int aiTimerID)		

	;the timer is up, is it the correct one?
	IF aiTimerID == timerID
		
		;add the items
		SELF.addItem(ammoType, addCount)

		;restart the timer
		startTimer(addTimer, timerID)		

	ENDIF

ENDEVENT

EVENT OnDying(ACTOR akKiller)

	;stop the timer
	CancelTimer(timerID)

ENDEVENT

EVENT OnUnload()

	;stop the timer
	CancelTimer(timerID)

ENDEVENT