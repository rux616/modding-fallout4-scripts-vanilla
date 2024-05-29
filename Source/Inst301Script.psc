Scriptname Inst301Script extends Quest Hidden Conditional

Bool Property X6MoveToElevator Auto Conditional
Bool Property X6Following Auto Conditional
RefCollectionAlias Property CollectionOfRaiders Auto
Location Property LiberitaliaLocation Auto Const
Quest Property Inst301 Auto
Scene Property Inst301SceneX6ReturnToLibertalia const auto
referencealias Property X6 const auto
referencealias Property SynthBoss const auto

ObjectReference Property Inst301PorterWait Auto Const
ObjectReference Property Inst301GabrielTeleportIn Auto Const

Function DisableLivingRaiders()
	int TotalNumberOfRaiders = CollectionOfRaiders.GetCount()

	int count = 0
	while (count <= TotalNumberOfRaiders)
		if (CollectionOfRaiders.GetAt(count) as Actor).IsDead()
			; Do Nothing, they are dead
		else
			; They are alive, disable them
			CollectionOfRaiders.GetAt(count).DisableNoWait()
		endif
		count += 1
	endwhile
EndFunction

Function EnableDisabledRaiders()
	int TotalNumberOfRaiders = CollectionOfRaiders.GetCount()

	int count = 0
	while (count <= TotalNumberOfRaiders)
		if CollectionOfRaiders.GetAt(count).IsDisabled()
			; They are disabled, enable them
			CollectionOfRaiders.GetAt(count).MoveToMyEditorLocation()
			CollectionOfRaiders.GetAt(count).EnableNoWait()
		else
			; They are already enabled, don't touch them			
		endif
		count += 1
	endwhile
EndFunction

;Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
;	debug.trace(self + " received OnLocationChange from " + akSender)
;	; watch for player OnLocationChange events:
;	if akSender == Game.GetPlayer()
;		if akOldLoc == LiberitaliaLocation && akNewLoc != LiberitaliaLocation && X6Following == 1
;	    	; player leaves the Libertalia location while X6 is following
;	   		Inst301SceneX6ReturnToLibertalia.Start()
;	   		Utility.Wait(2)
;	   		X6Following = 0
;	   		X6.GetActorRef().EvaluatePackage()
;		endif
;		if akOldLoc != LiberitaliaLocation && akNewLoc == LiberitaliaLocation && X6Following == 0 && Inst301.GetStageDone(300)
;	    	; player enters the Libertalia location while X6 is not following and stage 300 has been set
;	   		X6Following = 1
;	   		X6.GetActorRef().EvaluatePackage()
;		endif
;	endif
;endEvent

; watch for teleport done events
Event TeleportActorScript.TeleportDone(TeleportActorScript akSender, Var[] akArgs)
	debug.Trace(self + "TeleportActorScript.TeleportDone " + akSender)

	if akSender == X6.GetRef()
		akSender.MoveTo(Inst301PorterWait)
	elseif akSender == SynthBoss.GetRef()
		akSender.MoveTo(Inst301GabrielTeleportIn)
	endif
EndEvent

