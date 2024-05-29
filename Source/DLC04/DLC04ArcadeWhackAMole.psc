scriptName DLC04:DLC04ArcadeWhackAMole extends DLC04:DLC04ArcadeController
{Whack a Mole game, most of the guts are in the DLC04ArcadeController}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Local Game functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Function LocalGameStart()
	StoppingGame = false
	Debug.Trace(self + ": LocalGameStart")
	SetGameMolesGameRunning(true)
	currentMaxTimeBetweenPopup = timeBetweenPopupMaxStart
	molesActive = 1
	StartTimer(Utility.RandomFloat(timeBetweenPopupMin, currentMaxTimeBetweenPopup), molesActive)
endFunction

bool StoppingGame
Function LocalGameStop()
	StoppingGame = true
	SetGameMolesGameRunning(false)
	int i = 1
	while i <= 7
		CancelTimer(i)
		i += 1
	EndWhile
	utility.wait(8.0)
endFunction

Function SetGameMolesGameRunning(bool gameIsActive)
	Debug.Trace(self + ": SetGameMolesGameRunning >> " + gameIsActive)
	int i = 0
	int count = 7 
	while i < count
		myMoles[i].SetGameRunning(gameIsActive)
		if gameIsActive
			myMoles[i].SetStartingSpeedVar()
		endif
		i += 1
	endwhile
EndFunction

Function PopUpMole(DLC04:DLC04ArcadeWhackAMoleTarget Mole)
	Debug.Trace(self + ": PopUpMole")
	if gameRunning
		Mole.SetCanBeScored()
		StartTimer(Utility.RandomFloat(timeBetweenPopupMin, currentMaxTimeBetweenPopup), molesActive)
	endif
endFunction

Function MolePicker()
	Debug.Trace(self + ": Starting molePicker")
	bool validSelection = false
	int i
	int count = 6	;myMoles.length - 1
	while !ValidSelection
		i = utility.randomInt(0, count)
		if !myMoles[i].getIsCurrentlyActive()
			ValidSelection = true
		endif
	endWhile
	Debug.Trace(self + ": MolePicked!")
	PopUpMole(myMoles[i])
endFunction


Function LocalOnTimer(int aiTimerID)
	if gameRunning
		if aiTimerID >= 1 && aiTimerID <= 7
			MolePicker()
		endif
	endif
EndFunction

Function LowerMoleTimer(float fDecrease)
	if (currentMaxTimeBetweenPopup - fDecrease) < timeBetweenPopupMin
		if molesActive < 7 && !StoppingGame
			currentMaxTimeBetweenPopup = timeBetweenPopupMaxStart
			molesActive += 1
			StartTimer(Utility.RandomFloat(timeBetweenPopupMin, currentMaxTimeBetweenPopup), molesActive)
		Endif
	else
		currentMaxTimeBetweenPopup -= fDecrease
	endif
EndFunction

Function LocalScoringFunction(objectReference triggerObj, int ScoringEventNumber)
	LowerMoleTimer(SpeedUpOnMoleHit)
EndFunction

Function MoleGotAway()
	LowerMoleTimer(SpeedUpOnMoleMissed)
EndFunction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Local Properties & Vars
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AttachedRef[] Property Moles Auto Const

DLC04:DLC04ArcadeWhackAMoleTarget[] myMoles
;Called by parent when setting up objects

Function LocalAttachMyObjects()
	int i = 0
	int count

	;Place and link TokenSlots
	count = Moles.length
	myMoles = new DLC04:DLC04ArcadeWhackAMoleTarget[0]
	while i < count
		objectReference currentObject
		currentObject = PlaceAtNode(Moles[i].NodeName, Moles[i].formToPlace, abDeleteWhenAble = false, abAttach = true)
		currentObject.SetLinkedRef(self)
		myMoles.Add(currentObject as DLC04:DLC04ArcadeWhackAMoleTarget)
		currentObject.RegisterForRemoteEvent(self, "OnWorkshopObjectDestroyed")
		currentObject.RegisterForRemoteEvent(self, "OnReset")
		i += 1
	EndWhile
EndFunction

float currentMaxTimeBetweenPopup
int molesActive = 1

Group LocalProperties CollapsedOnRef
	float Property timeBetweenPopupMin = 0.3 auto const
	Float Property timeBetweenPopupMaxStart = 2.0 auto const
	float Property SpeedUpOnMoleHit = 0.2 auto const
	float Property SpeedUpOnMoleMissed = 0.1 auto const
endGroup

Function LocalWorkshopObjectDestroyed()
	myMoles.Clear()
EndFunction