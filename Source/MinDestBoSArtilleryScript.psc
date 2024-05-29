Scriptname MinDestBoSArtilleryScript extends Quest Conditional

RefCollectionAlias[] Property Artillery Auto Const
{ artillery collections - castle artillery is first in the list}

ReferenceAlias Property PrydwenTargetMarker Auto Const

int FailsafeTimerID = 1 ; failsafe timer to advance scene
float failsafeTimerSeconds = 3.0

Function FireAtPrydwen(bool fireForEffect = true)
	debug.trace(self + " FireAtPrydwen")
	ObjectReference targetMarker = PrydwenTargetMarker.GetRef()

	; start failsafe timer
	if fireForEffect
		StartTimer(failsafeTimerSeconds, FailsafeTimerID)
	endif

	; fire/aim artillery, if any are loaded
	int aliasIndex = 0
	while aliasIndex < Artillery.Length
		; get collection
		RefCollectionAlias artilleryCollection = Artillery[aliasIndex]
		
		; loop through artillery, if any are loaded, turn/fire
		int artilleryIndex = 0
		while artilleryIndex < artilleryCollection.GetCount()
			ArtilleryReferenceScript artilleryRef = artilleryCollection.GetAt(artilleryIndex) as ArtilleryReferenceScript
			if artilleryRef && artilleryRef.Is3DLoaded()
				if fireForEffect
					debug.trace(self + " firing " + artilleryRef)
					; register for "done firing" event, and then don't count as finished/next strike until get that back, or failsafe timer expires
					RegisterForCustomEvent(artilleryRef, "FinishedFiring")
					artilleryRef.FireAtTarget(targetMarker)
				else
					debug.trace(self + " targeting " + artilleryRef)
					artilleryRef.TurnToTarget(targetMarker, doNotFire = true)
				endif				
			endif
			artilleryIndex += 1
		endWhile

		aliasIndex += 1
	endWhile
endFunction

Event ArtilleryReferenceScript.FinishedFiring(ArtilleryReferenceScript akSender, Var[] akArgs)
	debug.Trace(self + "ArtilleryReferenceScript.FinishedFiring " + akSender)
	; as soon as one is done firing, start destruction sequence
	StartDestructionSequence()
EndEvent

Event OnTimer(int aiTimerID)
    ; failsafe timer in case none of the artillery returns FinishedFiring event
    if aiTimerID == FailsafeTimerID
    	StartDestructionSequence()
    endif
EndEvent

function StartDestructionSequence()
	CancelTimer(FailsafeTimerID)
	utility.wait(3.0)
	if GetStageDone(100) == false
		setStage(100)
	endif
endFunction


