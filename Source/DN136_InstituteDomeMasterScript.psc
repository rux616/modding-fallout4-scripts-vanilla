ScriptName DN136_InstituteDomeMasterScript extends ObjectReference
{Master script that handles when to turn the dome lights on/off}

import debug
import math

Group Required_Properties
	ObjectReference property myDome01 auto const
	ObjectReference property myDome02 auto const
	ObjectReference property myDome03 auto const
	ObjectReference property myDome04 auto const
	ObjectReference property myDomeSoundMarker auto const
	{marker to play myDomeSound from}
	Sound property myDomeSound auto const
	{looping sound to play at center of concourse}
EndGroup

bool setForNight = false
bool busy = false
int myDomeSoundID
float myTime

;************************************

Function AnimateDomes()
	busy = true
	myDomeSoundID = myDomeSound.play(myDomeSoundMarker)

	if(setForNight)
		;it's day time
		setForNight = false
		myDome01.playAnimation("playOpen")
		myDome02.playAnimation("playOpen")
		myDome03.playAnimation("playOpen")
		myDome04.playAnimationAndWait("playOpen", "DoneOpening")
	else
		;it's night time
		setForNight = true
		myDome01.playAnimation("playClose")
		myDome02.playAnimation("playClose")
		myDome03.playAnimation("playClose")
		myDome04.playAnimationAndWait("playClose", "DoneClosing")
	endif

	Sound.StopInstance(myDomeSoundID)
	
	busy = false
endFunction

;************************************

Event OnActivate(ObjectReference akActionRef)
	if(!busy)
		myTime = Utility.GetCurrentGameTime() - math.Floor(Utility.GetCurrentGameTime())
		if((myTime > 0.25) && (myTime < 0.75))
			;it's day time
			if(setForNight)
				busy = true
				AnimateDomes()
			endif
		else
			;it's night time
			if(!setForNight)
				busy = true
				AnimateDomes()
			endif
		endif
	endif
EndEvent

;************************************