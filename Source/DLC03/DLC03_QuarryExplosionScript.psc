Scriptname DLC03:DLC03_QuarryExplosionScript extends ObjectReference

Explosion Property myExplosion Auto Const Mandatory
Keyword Property LinkCustom01 Auto Const
Keyword Property LinkCustom02 Auto Const
Keyword Property LinkCustom03 Auto Const
Keyword Property LinkCustom04 Auto Const
Keyword Property LinkCustom05 Auto Const
Keyword Property LinkCustom06 Auto Const

Bool doOnce = FALSE
Int iExplosionCounter = 1
Int linkedRefCount = 0


;************************************

Auto State Waiting
	Event OnActivate(ObjectReference akActionRef)
		if(iExplosionCounter <= 6)
			goToState("DoNothing")
			int count = 0
			Keyword myKeyword = none
			if(iExplosionCounter == 1)
	    		linkedRefCount = getLinkedRef(LinkCustom01).countLinkedRefChain()
	    		myKeyword = LinkCustom01
	    	elseif(iExplosionCounter == 2)
	    		linkedRefCount = getLinkedRef(LinkCustom02).countLinkedRefChain()
	    		myKeyword = LinkCustom02
	    	elseif(iExplosionCounter == 3)
	    		linkedRefCount = getLinkedRef(LinkCustom03).countLinkedRefChain()
	    		myKeyword = LinkCustom03
	    	elseif(iExplosionCounter == 4)
	    		linkedRefCount = getLinkedRef(LinkCustom04).countLinkedRefChain()
	    		myKeyword = LinkCustom04
	    	elseif(iExplosionCounter == 5)
	    		linkedRefCount = getLinkedRef(LinkCustom05).countLinkedRefChain()
	    		myKeyword = LinkCustom05
	    	elseif(iExplosionCounter == 6)
	    		linkedRefCount = getLinkedRef(LinkCustom06).countLinkedRefChain()
	    		myKeyword = LinkCustom06
	    	endif

	    	While(count <= linkedRefCount)
	    		getLinkedRef(myKeyword).getNthLinkedRef(count).placeAtMe(myExplosion, 1)
	    		utility.Wait(0.5)
	    		count = count + 1
	    	endWhile
			iExplosionCounter = iExplosionCounter + 1

	    	goToState("Waiting")
	    else
	    	goToState("DoNothing")
	    endif
	EndEvent

EndState

;************************************

State DoNothing	
	Event OnActivate(ObjectReference akActionRef)
	    ;do nothing
	EndEvent
EndState

;************************************