Scriptname DLC03:DLC03AlamanacTrackerScript extends ObjectReference 

Quest Property pDLC03_Achievements Auto Const Mandatory
GlobalVariable Property pDLC03AlamanacGlobal Auto Const Mandatory

bool bPickedUp


Event OnActivate(ObjectReference akActionRef)
    
    if ( !bPickedUp )
    	pDLC03AlamanacGlobal.Mod(1)		; Increment the tracker variable

    	if ( pDLC03AlamanacGlobal.GetValue() >= 5 )	; Have you found all 5?
    		pDLC03_Achievements.SetStage(64)
    	endif

    	bPickedUp = 1
    endif

EndEvent