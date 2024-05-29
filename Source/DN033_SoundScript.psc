Scriptname DN033_SoundScript extends ObjectReference Hidden
{Moves an xmarker to a random location around the player and plays a sound}

Sound property mySound01 Auto Mandatory Const
{set to footsteps}
Sound property mySound02 Auto Mandatory Const
Sound property mySound03 Auto Mandatory Const
Sound property mySound04 Auto Mandatory Const
Sound property mySound05 Auto Mandatory Const
ObjectReference property myMarker Auto Const
{the xmarker we move around and play a sound from}
Float property soundOffset = 600.0 auto const
{Max distance to play the sound from the Player}

int myTimerSoundMax = 10 	;max number of seconds between sounds 
int myTimerSoundMin = 1 	;max number of seconds between sounds 
int myTimerIDSound= 1 		;ID number for sound timer
bool inTrigger = false

;**********************************************************

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		;player is in trigger, start timer to play sound
		inTrigger = True
		float myTimer = utility.RandomFloat(myTimerSoundMin, myTimerSoundMax)
		StartTimer(myTimer, myTimerIDSound)
		
	endIf
EndEvent

;**********************************************************

Event OnTriggerLeave(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		inTrigger = false
		CancelTimer(myTimerIDSound)
	endIf
EndEvent

;**********************************************************

Event OnTimer(int aiTimerID)
    if (aiTimerID == myTimerIDSound)
    	;move myMarker somewhere near the Player and play a sound
		float xStart = Game.GetPlayer().getPositionX()
		float yStart = Game.GetPlayer().getPositionY()
		float zStart = Game.GetPlayer().getPositionZ()

		float xOffset = utility.RandomFloat(-soundOffset, soundOffset)
		float yOffset = utility.RandomFloat(-soundOffset, soundOffset)
		float zOffset = utility.RandomFloat(-soundOffset, soundOffset)

		myMarker.setPosition(xStart + xOffset, yStart + yOffset, zStart + zOffset)
		Int myNum = Utility.RandomInt(1,8)
		Sound mySound
		;debug.notification("random = " + myNum)
		if(myNum <= 4)
			mySound = mySound01	;footsteps
		elseif(myNum == 5)
			mySound = mySound02
		elseif(myNum == 6)
			mySound = mySound03
		elseif(myNum == 7)
			mySound = mySound04
		elseif(myNum == 8)
			mySound = mySound05
		endif
		;handle footsteps based on myNum

		if(myNum <= 4)
			;handle footsteps (higher myNum is, the more footsteps will play)
			int myInt = 0
			while(myInt <= myNum)
				mySound.play(myMarker)
				utility.Wait(0.2)
				myInt = myInt + 1
			endWhile
		else
			mySound.play(myMarker)
		endif
		;debug.notification("just played sound at: " + myMarker.getPositionX() + " " + myMarker.getPositionY() + " " + myMarker.getPositionZ())

		if(inTrigger)
			;player is still in trigger, restart timer
			float myTimer = utility.RandomFloat(myTimerSoundMin, myTimerSoundMax)
			StartTimer(myTimer, myTimerIDSound)
		endif
	endif

EndEvent

;**********************************************************