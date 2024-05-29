Scriptname DLC01:DLC01_MedSprayScript extends ObjectReference
{Script that tells the arches to spray or not}

Quest Property MyQuest Auto Const Mandatory
ObjectReference Property Arch1 Auto Const Mandatory
ObjectReference Property Arch2 Auto Const Mandatory
ObjectReference Property mySpawnMarker Auto Const Mandatory
ActorBase Property mySpawnActor Auto Const Mandatory
Bool Property bShouldSpray = TRUE Auto
{Default = TRUE, set to FALSE if you want them to turn off onEnter}
Spell Property mySpell Auto Const Mandatory
Int Property NumToSpawn = 5 Auto
{Number of spawns to place aroundt the room, defaults to 5}
Float Property myEffectTimer = 30.0 Auto
{how long the effect lasts on the player before being removed, default is 30 seconds}

Bool bInTrigger = FALSE
Bool bEffectOn = FALSE
Bool myEffectTimerActive = FALSE
Int myEffectTimerID = 0
Int myLinkCount = 0
ObjectReference[] mySpawnActorArray

;************************************

Function HandleSpawns(Bool bShouldSpawn)
	int myIndex = 0
	if(bShouldSpawn == TRUE)
		;spawn the actors
		ObjectReference myNewRef

		while(myIndex < NumToSpawn)
			if(mySpawnActorArray[myIndex])
				if((mySpawnActorArray[myIndex] as Actor).isDead() == TRUE)
					;actor is dead, remove him from array and delete the ref
					mySpawnActorArray[myIndex].disable()
					mySpawnActorArray[myIndex].delete()
					mySpawnActorArray[myIndex] = None
				endif
			endif

			if(mySpawnActorArray[myIndex] == None)
				int myRandomNum = Utility.RandomInt (1, myLinkCount)
				myNewRef = mySpawnMarker.getNthLinkedRef(myRandomNum).placeAtMe(mySpawnActor, 1)
				mySpawnActorArray[myIndex] = myNewRef
			endif
			myIndex = myIndex + 1
		endWhile
	else
		;clean up the actors
		while(myIndex < NumToSpawn)
			debug.trace("CLEANING UP ACTORS")
			if(mySpawnActorArray[myIndex])
				mySpawnActorArray[myIndex].disable()
				mySpawnActorArray[myIndex].delete()
				mySpawnActorArray[myIndex] = None
			endif
			myIndex = myIndex + 1
		endWhile
	endif
EndFunction

;************************************

Event OnTimer(int aiTimerID)
	if(aiTimerID == myEffectTimerID)
		if(bInTrigger == FALSE)
			;remove spell from player
			game.getPlayer().DispelSpell(mySpell)
			HandleSpawns(FALSE)
			myEffectTimerActive = FALSE
		else
			;restart timer
			myEffectTimerActive = TRUE
			StartTimer(myEffectTimer, myEffectTimerID)
		endif
	endif
EndEvent

;************************************

Auto State Waiting
	Event OnLoad()
		if(mySpawnMarker)
			myLinkCount = mySpawnMarker.CountLinkedRefChain()
		endif
		mySpawnActorArray = new ObjectReference[NumToSpawn]
	EndEvent

	Event OnTriggerEnter(ObjectReference akActionRef)
	    if(akActionRef == game.GetPlayer())
	    	if(MyQuest.getStageDone(300) == TRUE)
	    		;player has killed the shade
	    		gotoState("Done")
	    		CancelTimer(myEffectTimerID)
	    		game.getPlayer().DispelSpell(mySpell)
	    		HandleSpawns(FALSE)
	    		Arch1.playAnimation("Reset")
	    		Arch2.playAnimation("Reset")
	    	elseif(bShouldSpray == TRUE)
	  			if(bInTrigger == FALSE)
	  				bInTrigger = TRUE
	    			Arch1.playAnimation("Stage2")
	    			Arch2.playAnimationAndWait("Stage2", "Stage3")
	    		endif
	    		
	    		if(myEffectTimerActive == FALSE)
	    			;add effect to player
	    			mySpell.Cast(Game.getPlayer(), Game.getPlayer())
	    		endif
	    		HandleSpawns(TRUE)
	    		
	    		myEffectTimerActive = TRUE
	    		StartTimer(myEffectTimer, myEffectTimerID)
	    	else
		    	Arch1.playAnimation("Stage4")
		    	Arch2.playAnimationAndWait("Stage4", "Reset")
		    endif		
		endif
	EndEvent

	Event OnTriggerLeave(ObjectReference akActionRef)
		bInTrigger = FALSE
	EndEvent

EndState

;************************************

State Done
	Event OnTriggerEnter(ObjectReference akActionRef)
	    ;do nothing
	EndEvent

	Event OnTriggerLeave(ObjectReference akActionRef)
	    ;do nothing
	EndEvent
EndState

;************************************