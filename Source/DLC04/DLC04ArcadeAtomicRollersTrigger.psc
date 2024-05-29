scriptname DLC04:DLC04ArcadeAtomicRollersTrigger Extends DLC04:DLC04ArcadeScoringObject


Function DoOfflineOnEnter(ObjectReference triggerRef)
	(GetLinkedRef() as DLC04:DLC04ArcadeAtomicRollers).StoreBall(triggerRef)
EndFunction