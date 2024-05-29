Scriptname VFTPlayerScript extends ReferenceAlias

ReferenceAlias Property Alias_CompanionVFT Auto Const
ReferenceAlias Property Alias_DogmeatVFT Auto Const
ReferenceAlias Property VertibirdVFT Auto Const

Quest Property VFT Auto Const

Event OnInit()

	RegisterForMenuOpenCloseEvent("PipboyMenu")

endEvent

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
	if VFT.GetStage() == 30
	    if (asMenuName== "PipboyMenu")
   	     if (abOpening == false)
		    	;get companions immediately into vbird

		    	Actor companionActor = Alias_CompanionVFT.GetActorRef()
		    	Actor dogmeatActor = Alias_DogmeatVFT.GetActorRef()

		    	if (companionActor)
		  			companionActor.SnapIntoInteraction(VertibirdVFT.GetReference())
		  		endif
		  		
		  		if (dogmeatActor)
					dogmeatActor.SnapIntoInteraction(VertibirdVFT.GetReference())
				endif

   		    endif
    	endif
    endif

endEvent