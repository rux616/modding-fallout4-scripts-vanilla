Scriptname BHExtBOSEnable extends ObjectReference Const

;Keyword for Brotherhood Soldiers
keyword Property LinkCustom01 Auto Const

;Keyword for Synths
keyword Property LinkCustom02 Auto Const

Int Property stage Auto Const

Quest Property Inst302Combat Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == game.getplayer()
    	debug.trace(self + " is triggered")

    	if (Stage)

    		Inst302Combat.SetStage(Stage)
    		
    	endif
    	
    	
   		;ObjectReference [] BOSSoldiers = GetLinkedRefChildren(LinkCustom01)
    	ObjectReference [] Synth = GetLinkedRefChildren(LinkCustom02)

    	;int BOSSoldiersLength = BOSSoldiers.Length
    	int SynthLength = Synth.Length

    	int iBOS = 0
    	int iSynth = 0

    	float iRandom = Utility.RandomFloat(0.2, 0.5)

	    ;/
	    while (iBOS < BOSSoldierslength)
	    	BOSSoldiers[iBOS].enable()
	    	debug.trace(BOSSoldiers[iBOS] + " is enabled")
	    	iBOS += 1
	    endwhile
	    /;

	    GetLinkedRef(LinkCustom01).Enable()

	    while (iSynth < Synthlength)
	    	Synth[iSynth].enable()
	    	debug.trace(Synth[iSynth] + "Is enabled")
	    	Utility.Wait(iRandom)
	    	iRandom = Utility.RandomFloat(0.2, 0.5)
	    	iSynth+=1
	    endwhile

	    self.disable()
    endif
EndEvent


