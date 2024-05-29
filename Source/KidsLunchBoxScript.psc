Scriptname KidsLunchBoxScript extends ObjectReference

MiscObject Property LunchBoxToAdd Auto Mandatory Const

bool LunchBoxActivated = false


Event OnActivate(ObjectReference akActionRef)
    if(akActionRef == game.GetPlayer())
    	if(LunchBoxActivated == false)
    		;player activated lunch box for the first time
    		;open it up
    		LunchBoxActivated = true
    		damageObject(10.0)
    	else
    		;player has already activated it and activates it again to pick it up
    		;disable the lunchbox and add a miscitem to the player's inventory
    		disable()
    		game.GetPlayer().AddItem(LunchBoxToAdd, 1)
    		Delete()
    	endif
   	endif
EndEvent