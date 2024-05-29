scriptName DLC04:DLC04ArcadeHoopShot extends DLC04:DLC04ArcadeController
{Skeeball game, most of the guts are in the gamejamArcadeController}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Local Game functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



Function LocalScoringFunction(objectReference triggerObj, int ScoringEventNumber)

	;debug.Notification((gameLimiterScoringEvents - eventsScored) + " balls remaining")
EndFunction

Function LocalGameStart()
	SetTriggersActive(true)
endFunction

Function LocalGameStop()
	SetTriggersActive(false)
endFunction

Function SetTriggersActive(bool gameIsActive)
	int i = 0
	int count = myTriggers.length
	while i < count
		myTriggers[i].SetGameRunning(gameIsActive)
		i += 1
	endwhile
EndFunction


;Technically doing this as an array is not necessary
;	but it makes it easy to crib for atomic rollers
AttachedRef[] Property Triggers Auto Const

DLC04:DLC04ArcadeScoringObject[] myTriggers
Function LocalAttachMyObjects()
	int i = 0
	int count

	;Place and link TokenSlots
	count = Triggers.length
	myTriggers = new DLC04:DLC04ArcadeScoringObject[0]
	while i < count
		objectReference currentObject
		currentObject = PlaceAtNode(Triggers[i].NodeName, Triggers[i].formToPlace, abDeleteWhenAble = false, abAttach = true)
		currentObject.SetLinkedRef(self)
		myTriggers.Add(currentObject as DLC04:DLC04ArcadeScoringObject)
		currentObject.RegisterForRemoteEvent(self, "OnWorkshopObjectDestroyed")
		currentObject.RegisterForRemoteEvent(self, "OnReset")
		i += 1
	EndWhile

EndFunction