Scriptname MirelurkNestScript extends ObjectReference
{tracks when all linked eggs are destroyed/hatched}

int eggCount
int destroyedCount

event OnLoad()
	if IsDestroyed() == false && IsDisabled() == false
		; run timer to periodically check egg status (failsafe)
		StartTimer(2.0)
	endif
endEvent

event OnUnload()
	; kill timer
	CancelTimer()
endEvent

; called by eggs when they are destroyed
bool busy = false
function CheckEggStatus()
	if busy
		; run timer to check a bit later
		StartTimer(1.0)
	endif

	; only 1 at a time in this function
	busy = true

	ObjectReference[] myEggs = GetLinkedRefChildren(NONE)
	eggCount = myEggs.Length
;	debug.trace(self + " CheckEggStatus: " + myEggs.Length + " eggs")
	int i = 0
	destroyedCount = 0
	while i < myEggs.Length
		ObjectReference theEgg = myEggs[i]
;		debug.trace(self + "	" + theEgg + ": isDestroyed=" + theEgg.IsDestroyed())
		if theEgg.IsDestroyed()
			destroyedCount += 1
		endif
		i += 1
	endWhile
;	debug.trace(self + "	destroyedCount = " + destroyedCount)
	; if all my eggs are destroyed, destroy me
	if destroyedCount >= myEggs.Length
;		debug.trace(self + " all " + destroyedCount + " eggs destroyed - destroy me")
		SetDestroyed()
		CancelTimer()
	else
		StartTimer(2.0)
	endif

	; clear lock
	busy = false
endFunction

event OnTimer(int aiTimerID)
	CheckEggStatus()
endEvent