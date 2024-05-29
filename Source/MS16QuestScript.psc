Scriptname MS16QuestScript extends Quest Conditional

int property negotiationvariable auto conditional

Group DialogueConditions
	bool Property PointedFromMQ auto conditional
EndGroup

Group WorkerTracking
	GlobalVariable Property MS16UnskilledWorkers auto
	GlobalVariable Property MS16RecruitedSoFar auto
	GlobalVariable Property MS16RecruitMax auto

	; who the player is talking to at the moment (could be None)
	ReferenceAlias Property GenericResident const auto

	ReferenceAlias[] Property WorkerAliases auto const

	bool Property RecruitingDonePhaseOne auto conditional
EndGroup


Group DigProgress
	bool Property BlockageOne auto conditional
EndGroup


bool Property PlayerGettingTour auto conditional

bool Property RecruitedCasey auto conditional
bool Property RecruitedMel auto conditional
bool Property FahrenheitPresent auto conditional


Function AddWorker()
	if (ModObjectiveGlobal(1, MS16RecruitedSoFar, 31, MS16RecruitMax.GetValueInt(), true, true))
		RecruitingDonePhaseOne = true
	endif

	MS16UnskilledWorkers.Mod(1)

	ObjectReference workerRef = GenericResident.GetReference()
	if (workerRef != None)
		int count = 0
		while (count < WorkerAliases.length)
			Debug.Trace("MS16: Trying to put " + workerRef + " into " + WorkerAliases[count])

			if (WorkerAliases[count].ForceRefIfEmpty(workerRef))
				count = WorkerAliases.length ; wait, we don't have a "break" statement?!
			endif
			count += 1
		endwhile
	else
		Debug.Trace("MS16: Couldn't figure out who the player was talking to.", 2)
	endif
EndFunction


Group Rewards
	int Property RewardChosen auto conditional
	
	MiscObject Property Caps001 const auto
	int Property CapsAmount const auto
	LeveledItem Property WeaponList const auto
	int Property WeaponAmount const auto
	LeveledItem Property FoodList const auto
	int Property FoodAmount const auto
EndGroup

Function RewardPlayer()
	if     (RewardChosen == 1)
		Game.GetPlayer().AddItem(Caps001, CapsAmount)
	elseif (RewardChosen == 2)
		Game.GetPlayer().AddItem(WeaponList, WeaponAmount)
	elseif (RewardChosen == 3)
		Game.GetPlayer().AddItem(FoodList, FoodAmount)
	else
		; wtf
		Debug.Trace("MS16: What, how? Invalid reward.")
		Game.GetPlayer().AddItem(Caps001, CapsAmount) ; just give the caps for now
	endif
EndFunction
