Scriptname MS05BCorpseDismemberScript extends ReferenceAlias

ReferenceAlias Property pTickCorpse Auto Const

Quest Property pMS05BTapes Auto Const

EVENT OnLoad()
;	debug.messagebox("Corpse loaded")
	if !pMS05BTapes.GetStageDone(5)
;		debug.messagebox("Stage five not done")
		if pTickCorpse.GetRef().Is3DLoaded()
;			debug.messagebox("Corpse 3D loaded")
			pTickCorpse.GetActorRef().Dismember("Head1", false, true)
			pTickCorpse.GetActorRef().Dismember("LeftLeg1", false, true)
			pMS05BTapes.SetStage(5)
;			debug.messagebox("Hack 'em to pieces")
		else 

		endif
	endif
endEvent