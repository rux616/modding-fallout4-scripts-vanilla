Scriptname MS16PortaDinerSceneScript extends ObjectReference

scene property pMS16AmbientCommentaryPie auto
quest property pMS16 auto


auto State Waiting
Event OnActivate(ObjectReference akActionRef)
    if pMS16.getStage() < 200 && pMS16.IsRunning()
    	pMS16AmbientCommentaryPie.Start()
    	gotoState("Done")
    endif
EndEvent
endState

state done
	;do nothing
endState