Scriptname DLC02:DLC02WorkshopRelaxCollectionScript extends RefCollectionAlias
{ script on WorkshopSummonedToRelax actors to trigger clapping when they observe combat }

Package property DLC02WorkshopSummonedToRelaxObserveCombatOverride auto const mandatory

Package property DLC02WorkshopSummonedToRelaxPackage auto const mandatory


Action Property ActionCustomCheering Auto Const mandatory

Event OnPackageChange(ObjectReference akSenderRef, Package akOldPackage)
	debug.trace(self + " OnPackageChange " + akSenderRef + ", " + akOldPackage)
	; play cheering on all actors who are starting the observe combat override
	if akOldPackage == DLC02WorkshopSummonedToRelaxPackage && akSenderRef is Actor
		Actor actorRef = akSenderRef as Actor
		; wait a second and see if running observe combat override
		utility.wait(utility.RandomFloat(0.2, 1.0))
		if actorRef.GetCurrentPackage() == DLC02WorkshopSummonedToRelaxObserveCombatOverride
			(GetOwningQuest() as DLC02:DLC02WorkshopSummonedToRelaxScript).Cheer(actorRef)
    	endif
    endif
EndEvent
