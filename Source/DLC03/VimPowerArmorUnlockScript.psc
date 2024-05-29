Scriptname DLC03:VimPowerArmorUnlockScript extends ObjectReference 

GlobalVariable Property DLC03_HasVimPASchematicGreen Auto Const mandatory
GlobalVariable Property DLC03_HasVimPASchematicRed Auto Const mandatory
Bool Property isRefreshVersion = false auto const

bool done = false

Event OnActivate(ObjectReference akActivator)
	if !done
 	debug.trace(self + "Putting on Vim power armor")

 		if akActivator == Game.GetPlayer()
    		debug.trace(self + " is worn by the player") 
	    	if isRefreshVersion
	    		debug.trace(self + " is Refresh Version") 
	    		DLC03_HasVimPASchematicGreen.SetValue(1)
	    	else
	    		debug.trace(self + " is Classic Version") 
	    		DLC03_HasVimPASchematicRed.SetValue(1)
	    	endif
	    endif
  	done = true
  	endif
  
endEvent
