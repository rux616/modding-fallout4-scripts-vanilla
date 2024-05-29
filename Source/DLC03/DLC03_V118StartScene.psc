Scriptname DLC03:DLC03_V118StartScene extends ObjectReference Const
{Simple script to start a scene when clicking on the reference.  Useful for things like intercoms.}

Scene Property sceneToPlay Auto Const
Quest Property DLC03_v118_Intro Auto Const
Int Property turnOnStage = 15 Auto Const
Int Property turnOffStage = 100 Auto Const

;/
Event OnActivate(ObjectReference akActionRef)
    if ( Game.GetPlayer() == akActionRef && !sceneToPlay.isPlaying() )
    	if turnOnStage && !turnOffStage
    		sceneToPlay.start()
    	endif
    endif
EndEvent
/;