Scriptname MS17InterviewChairScript extends ObjectReference Const
{Simple script to start a scene when clicking on the reference.  Useful for things like intercoms.}

Quest Property pMS17 Auto Const
Scene Property sceneToPlay Auto Const

Event OnActivate(ObjectReference akActionRef)
    if ( akActionRef == Game.GetPlayer() )
	    if ( pMS17.GetStageDone(140) && !pMS17.GetStageDone(175) )
		    if !sceneToPlay.isPlaying()
		    	sceneToPlay.start()
		    endif
		endif
	endif
EndEvent