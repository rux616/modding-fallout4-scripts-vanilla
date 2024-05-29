Scriptname TeleportInSpawnerScript extends ObjectReference 


int spawnCount = 3

ObjectReference myNextLinkedRef
int myNextLinkedRefNum
int numLinkedRefs
int portalOpenLoopID


actorBase Property TeleportSynthProperty Auto Const
sound Property portalOpenSound Auto Const
sound Property portalOpenLoopSound Auto Const
sound Property portalCloseSound Auto Const
sound Property telportCrackSound Auto Const


function pickRandomSpot()
	numLinkedRefs = countLinkedRefChain()  
	myNextLinkedRefNum = Utility.RandomInt(1, numLinkedRefs-1)

	myNextLinkedRef = GetNthLinkedRef(myNextLinkedRefNum)
endFunction


Event OnActivate(ObjectReference akActionRef)
	    
	
	playAnimation("openPortal")
	portalOpenSound.play(self)
	utility.wait(3)
	int i = 0 
	portalOpenLoopID = portalOpenLoopSound.play(self)
	while  i < spawnCount			

		SetAnimationVariableFloat("fDampRate", 0.1)
    	SetAnimationVariableFloat("fToggleBlend", 1.5)
    	
    	telportCrackSound.play(self)
		pickRandomSpot()

		myNextLinkedRef.PlaceActorAtMe(TeleportSynthProperty, 1)
		utility.wait(0.05)
		SetAnimationVariableFloat("fDampRate", 0.07)
    	SetAnimationVariableFloat("fToggleBlend", 0.0)
		i = i + 1
		utility.wait(Utility.RandomFloat(0.3, 1.0))
	endWhile
	utility.wait(1)
	portalCloseSound.play(self)
	Sound.StopInstance(portalOpenLoopID)   
	playAnimation("closePortal")

EndEvent


