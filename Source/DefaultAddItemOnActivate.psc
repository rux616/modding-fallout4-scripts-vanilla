Scriptname DefaultAddItemOnActivate extends ObjectReference
{Give the player an item when they activate this reference.}

Form property ItemToGive Auto const
{The Item to give to the player when this references is activated.}

int property iNumberToGiveMin = 1 Auto const
{How many of the item are given?  If always the same, Min and Max should be equal.  Otherwise it's a random value between min/max}
int property iNumberToGiveMax = 1 Auto const
{If Greater than the Min, the number given will be randomized between that value and this one.}

bool property bDisableWhenDone = FALSE auto const
{Should this object disable when clicked?  False by default.}

Auto State Initial
	Event OnActivate(ObjectReference akActionRef)
		int iNumberToGive
		if (iNumberToGiveMin >= iNumberToGiveMax)
			; If Min==Max or if the range is invalid, then just give the number in Min
			iNumberToGive = iNumberToGiveMin
		else
			; if Min < Max, then generate a random whole number between.
			iNumberToGive = utility.randomInt(iNumberToGiveMin,iNumberToGiveMax)
		endif
		akActionRef.AddItem(ItemToGive, iNumberToGive)
		if bDisableWhenDone
			; make this object go away.  Generally for things which are being "taken" like a stack of noodle bowls, etc
			disable()
		else
			; otherwise just block future activation.
			GoToState("Done")
		endif
	EndEvent
EndState

State Done
	Event OnActivate(ObjectReference akActionRef)
		;Do nothing.
	EndEvent
EndState