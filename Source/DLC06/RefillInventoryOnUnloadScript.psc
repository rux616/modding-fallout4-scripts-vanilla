Scriptname DLC06:RefillInventoryOnUnloadScript extends ObjectReference Const
{ replenish container inventory }


Form Property FormToRefill Auto Const Mandatory
Form Property FormToRefill02 Auto Const

int maxCount = 10 const 	; how many do we keep in the container?

Event OnUnload()
	debug.trace(self + " OnUnload")
	RefreshInventory(FormToRefill)
	if FormToRefill02
		RefreshInventory(FormToRefill02)
	endif
EndEvent

Function RefreshInventory(Form refillForm = NONE)
	if refillForm == NONE 
		refillForm = FormToRefill 
	endif
    ; vault suit count
	int currentCount = GetItemCount(refillForm)
    if currentCount < maxCount
    	int refillCount = utility.RandomInt(1, maxCount)
    	debug.trace(self + " RefreshInventory: adding " + refillCount + " " + refillForm)
    	AddItem(refillForm, refillCount)
    endif
endFunction
