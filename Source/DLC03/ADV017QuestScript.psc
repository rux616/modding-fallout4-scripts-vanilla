Scriptname DLC03:ADV017QuestScript extends Quest Conditional
{This is the quest script for Erikson's settlement}

;This function is called when the player enters a trigger in Erikson's Plane
;	This is to give the player a bit of time to poke around
;	Then we try to enable Erikson if his enable marker is out of sight
;	and start the scene to have him call to the player

bool introSceneStarted = false
int TimerIDIntro = 99

Function TryToStartIntroScene()
	;For right now just start it, we'll do the complicated set up later
	;StartIntroScene()

	;Start the timer so the player can explore before Erikson shows up
	StartTimer(InitialExplorationTime, TimerIDIntro)
EndFunction

Function StartIntroScene()
	if !introSceneStarted
		introSceneStarted = true

		;We no longer need the intro triggers so disable them
		IntroTriggers.DisableAll()

		;Move erikson to his enable marker and enable him, then start the scene
		ObjectReference EriksonRef = Erikson.GetReference()
		EriksonRef.MoveTo(DLC03_ADV017_IntroEnableMarkerRef)
		EriksonRef.Enable(abFadeIn = false)
		DLC03_ADV017_IntroYellingScene.Start()
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Real Time Timer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnTimer(int aiTimerID)
	;Real Time timers EG: 0.5 == 0.5 seconds
	if aiTimerID == TimerIDIntro
		Actor PlayerActor = Game.GetPlayer()
		; if the player is still in the camp as defined by a large trigger
		if DLC03_ADV017_PlayerInPlaneTrigger.GetTriggerObjectCount() > 0
			if !PlayerActor.HasDetectionLOS(DLC03_ADV017_IntroEnableMarkerRef) && !PlayerActor.IsInCombat()
				StartIntroScene()
			else
				StartTimer(5.0, TimerIDIntro)
			endif
		else
			; Player has left location
		endif
	endif
EndEvent



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Properties
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Group IntroProperties
	Scene Property DLC03_ADV017_IntroYellingScene Auto Const Mandatory
	ObjectReference Property DLC03_ADV017_IntroEnableMarkerRef Auto Const Mandatory
	ReferenceAlias Property Erikson Auto Const Mandatory
	ObjectReference Property DLC03_ADV017_PlayerInPlaneTrigger Auto Const Mandatory
	RefCollectionAlias Property IntroTriggers Auto Const Mandatory
	float Property InitialExplorationTime = 15.0 Auto Const
	ReferenceAlias Property Alias_Dog Auto Const mandatory
	ReferenceAlias Property Alias_Wolf Auto Const mandatory
	ReferenceAlias Property Alias_FEVHound Auto Const mandatory

	ReferenceAlias Property Alias_StartingDog Auto Const mandatory
	ReferenceAlias Property Alias_StartingWolf Auto Const mandatory
	ReferenceAlias Property Alias_StartingFEVHound Auto Const mandatory

	bool property ForSaleDog = true auto Conditional hidden
	bool property ForSaleWolf = true auto Conditional hidden
	bool property ForSaleFEVHound = true auto Conditional hidden

EndGroup

WorkshopParentScript Property WorkshopParent Auto Const Mandatory
GenericGoHomeScript Property GenericGoHome Auto Const Mandatory
DLC03:ADV017CanineSpawnerScript Property ADV017CanineSpawner Auto Const mandatory
Faction Property DLC03_ADV017_EriksonCrimeFaction Auto Const Mandatory
RefCollectionAlias Property TravelCollection Auto Const Mandatory

GlobalVariable Property DLC03EriksonDogPrice Auto Const mandatory
GlobalVariable Property DLC03EriksonWolfPrice Auto Const mandatory
GlobalVariable Property DLC03EriksonFEVHoundPrice Auto Const mandatory
Keyword Property ActorTypeDog Auto Const Mandatory

Group DogSpawnProperties
	float Property NewDogTime = 120.0 Auto Const
	{Time after selling a dog till we spawn a new one}
	float Property RecheckNewDogTime = 24.0 Auto Const
	{If the player is in the loaded area when the dog timer expires
		recheck at this interval}
EndGroup

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Area Loaded
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bool areaLoaded

Function SetAreaLoaded(bool areaIsLoaded = true)
	areaLoaded = areaIsLoaded
	if areaIsLoaded
		CheckForSceneEvents()
	endif
EndFunction

Function CheckForSceneEvents()
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Canine Purchasing
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function PurchaseDog()

Game.GetPlayer().RemoveItem(game.GetCaps(), DLC03EriksonDogPrice.GetValueInt(), false, Erikson.GetRef())
; put dog in go home alias so it can persist until it arrives
Actor MyCanine = Alias_Dog.GetActorRef()
MyCanine.RemoveFromFaction(DLC03_ADV017_EriksonCrimeFaction)
MyCanine.SetCrimeFaction(none)
MyCanine.AddKeyword(ActorTypeDog)
GenericGoHome.GoHomeActors.AddRef(Alias_Dog.GetRef())
MyCanine.AllowPCDialogue(true)
TravelCollection.AddRef(MyCanine)

if Alias_StartingDog != none
	Alias_StartingDog.Clear()
endif
ForSaleDog = false
Alias_Dog.Clear()

StartTimerGameTime(NewDogTime, DogSpawnTimerID)
EndFunction



Function PurchaseWolf()

Game.GetPlayer().RemoveItem(game.GetCaps(), DLC03EriksonWolfPrice.GetValueInt(), false, Erikson.GetRef())
; put dog in go home alias so it can persist until it arrives
Actor MyCanine = Alias_Wolf.GetActorRef()
MyCanine.RemoveFromFaction(DLC03_ADV017_EriksonCrimeFaction)
MyCanine.SetCrimeFaction(none)
MyCanine.AddKeyword(ActorTypeDog)
GenericGoHome.GoHomeActors.AddRef(MyCanine)
MyCanine.AllowPCDialogue(true)
TravelCollection.AddRef(MyCanine)

if Alias_StartingWolf != none
	Alias_StartingWolf.Clear()
endif
ForSaleWolf = false
Alias_Wolf.Clear()
StartTimerGameTime(NewDogTime, WolfSpawnTimerID)
EndFunction


Function PurchaseFEVHound()

Game.GetPlayer().RemoveItem(game.GetCaps(), DLC03EriksonFEVHoundPrice.GetValueInt(), false, Erikson.GetRef())
; put dog in go home alias so it can persist until it arrives
Actor MyCanine = Alias_FEVHound.GetActorRef()
MyCanine.RemoveFromFaction(DLC03_ADV017_EriksonCrimeFaction)
MyCanine.SetCrimeFaction(none)
MyCanine.AddKeyword(ActorTypeDog)
GenericGoHome.GoHomeActors.AddRef(MyCanine)
MyCanine.AllowPCDialogue(true)
TravelCollection.AddRef(MyCanine)

if Alias_StartingFEVHound != none
	Alias_StartingFEVHound.Clear()
endif
ForSaleFEVHound = false
Alias_FEVHound.Clear()
StartTimerGameTime(NewDogTime, FEVHoundSpawnTimerID)
EndFunction

Function CanineKilled(int whichCanine)
	if whichCanine == 0
		ForSaleDog = false
		Alias_Dog.Clear()
		StartTimerGameTime(NewDogTime, DogSpawnTimerID)
		if Alias_StartingDog != none
			Alias_StartingDog.Clear()
		endif
	elseif whichCanine == 1
		ForSaleWolf = false
		Alias_Wolf.Clear()
		StartTimerGameTime(NewDogTime, WolfSpawnTimerID)
		if Alias_StartingWolf != none
			Alias_StartingWolf.Clear()
		endif
	elseif whichCanine == 2
		ForSaleFEVHound = false
		Alias_FEVHound.Clear()
		StartTimerGameTime(NewDogTime, FEVHoundSpawnTimerID)
		if Alias_StartingFEVHound != none
			Alias_StartingFEVHound.Clear()
		endif
	else
		Debug.Trace(Self + ": CanineKilled passed incorrect value >> " + whichCanine)
	endif

EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Canine Spawning
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


int DogSpawnTimerID = 10
int WolfSpawnTimerID = 20
int FEVHoundSpawnTimerID = 30



;This timer is used for generating new canines
Event OnTimerGameTime(int aiTimerID)
	if aiTimerID == DogSpawnTimerID
		;if the area is non loaded we are good to spawn
		if !areaLoaded
			ADV017CanineSpawner.SpawnDog()
		else 	;The area IS loaded so restart the timer 
			StartTimerGameTime(RecheckNewDogTime, DogSpawnTimerID)
		endif
	elseif aiTimerID == WolfSpawnTimerID
		if !areaLoaded
			ADV017CanineSpawner.SpawnWolf()
		else 	;The area IS loaded so restart the timer 
			StartTimerGameTime(RecheckNewDogTime, WolfSpawnTimerID)
		endif
	elseif aiTimerID == FEVHoundSpawnTimerID
		if !areaLoaded
			ADV017CanineSpawner.SpawnFEVHound()
		else 	;The area IS loaded so restart the timer 
			StartTimerGameTime(RecheckNewDogTime, FEVHoundSpawnTimerID)
		endif
	endif

EndEvent

