scriptName DLC04:DLC04ArcadeShootingGalleryTarget extends DLC04:DLC04ArcadeScoringObject
{Shooting Gallery Target, this controls what it does when it is active and not active}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Local Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Group LocalProperties
	String Property HitAnim = "ShootLeft01" Auto Const
	String Property MoveAnim = "Play01" auto Const
	String Property MoveDoneEvent = "Done" Auto Const
EndGroup


Function LocalScoreReaction()
	Debug.Trace(self + ": LocalScoreReaction")
	PlayAnimation(HitAnim)
EndFunction

Function DoLocalScoredByHitStart()
	Debug.Trace(self + ": DoLocalScoredByHitStart")
	RegisterForAnimationEvent(self, MoveDoneEvent)
	PlayAnimation(MoveAnim)
EndFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if asEventName == MoveDoneEvent
		Self.DisableNoWait()
		(GetLinkedRef() as DLC04:DLC04ArcadeShootingGallery).TargetGotAway(self)
		Self.Delete()
	Endif
EndEvent

Function SetCanBeScored()
	Debug.Trace(self + ": SetCanBeScored")
	isGameRunning = true
	if ScoresOnEnter
		GoToState("ScoredByEnter")
	else
		GoToState("ScoredByHit")
	endif
EndFunction

Event OnCellDetach()
	Self.DisableNoWait()
	Self.Delete()
EndEvent