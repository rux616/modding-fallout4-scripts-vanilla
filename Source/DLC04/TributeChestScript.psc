Scriptname DLC04:TributeChestScript extends ObjectReference
{This is not The Greatest Chest in the World, no. This is just a tribute.}

Group SpawnData
	float Property DaysBetweenItemSpawns = 5.0 Auto Const
	{how many days must pass before items spawn here}

	int Property MaxInventoryValue = 1000 Auto Const
	{if contents of container are >= to this, don't spawn anything new}

	LeveledItem Property LeveledListToSpawn Auto Const Mandatory
	{What list should we add to the container when items spawn?}
EndGroup

Group LegendaryItemData
	LegendaryItemQuestScript Property LegendaryItemQuest Auto Const Mandatory
	{AUTOFILL}

	int Property LegendaryItemChance = 5 Auto Const
	{(0-100) Chance for spawning legendary item}

	int Property MinDaysBetweenLegendaryItems = 30 Auto Const
	{How many days must elapse before spawning another legendary item?}
endGroup

group messages
	Message property EmptyContainerMessageProducing auto const mandatory

	Message property EmptyContainerMessageNotProducing auto const mandatory
endGroup

float Today							;time of this load
float LastSpawnItemDay				;last time the chest spawned something
float LastLegendaryItemSpawnDay		;last time the chest spawned a legendary item

bool init


Event OnLoad()
	Debug.Trace(self + "OnLoad()")

	; make sure activation blocked (to prevent use of quick container menu)
    BlockActivation(true, false)

	Today = Utility.GetCurrentGameTime() 

	Debug.Trace(self + "OnLoad() Today: " + Today)
	Debug.Trace(self + "OnLoad() LastSpawnItemDay: " + LastSpawnItemDay)

	
	if init == false
		Debug.Trace(self + "OnLoad() init == false, setting LastSpawnItemDay = Today")
		
		LastSpawnItemDay = Today ;Sorry. It's not going to be full of goodies right when you build it.

		LastLegendaryItemSpawnDay = Today - MinDaysBetweenLegendaryItems  ;but rest assured you can roll a legendary next time

		init = true
	endif

    ;If it's full, then they assume you don't care anymore since you can't be bothered to come get your stuff.
    if GetInventoryValue() >= MaxInventoryValue
		Debug.Trace(self + "OnLoad() GetInventoryValue() >= MaxInventoryValue: " + GetInventoryValue() + " >= " + MaxInventoryValue  )
		LastSpawnItemDay = Today

    else 
	    float DaysSinceLastSpawn = Today - LastSpawnItemDay
		Debug.Trace(self + "OnLoad() calling SpawnItemsIfNeeded()")
		SpawnItemsIfNeeded(DaysSinceLastSpawn)
    endif

EndEvent

Event OnActivate(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer() && GetInventoryValue() == 0    	
    	if CanProduceForWorkshop()
    		EmptyContainerMessageProducing.Show()
    	else
    		EmptyContainerMessageNotProducing.Show()
    	endif
    else 
        Activate(akActionRef, true)
    endif
EndEvent

Function SpawnItemsIfNeeded(float DaysSinceLastSpawn)
	Debug.Trace(self + "SpawnItemsIfNeeded() DaysSinceLastSpawn: " + DaysSinceLastSpawn)

	float itemsToSpawn = DaysSinceLastSpawn / DaysBetweenItemSpawns

	Debug.Trace(self + "SpawnItemsIfNeeded() DaysSinceLastSpawn: " + DaysSinceLastSpawn)
	Debug.Trace(self + "SpawnItemsIfNeeded() DaysBetweenItemSpawns: " + DaysBetweenItemSpawns)
	Debug.Trace(self + "SpawnItemsIfNeeded() itemsToSpawn: " + itemsToSpawn)

	if itemsToSpawn >= 1
		LastSpawnItemDay = Today

		While itemsToSpawn >= 1
			additem(LeveledListToSpawn) ;Here, take this.

			TryToSpawnLegendaryItem()	;Good Luck.

			;decrement counter
			itemsToSpawn -= 1
		EndWhile
	endif
	
EndFunction


Function TryToSpawnLegendaryItem()
	Debug.Trace(self + "TryToSpawnLegendaryItem() MinDaysBetweenLegendaryItems: " + MinDaysBetweenLegendaryItems)
		
	if LegendaryItemChance > 0 ; don't roll if chance is 0
		if Today - LastLegendaryItemSpawnDay >=	MinDaysBetweenLegendaryItems
			Debug.Trace(self + "TryToSpawnLegendaryItem() it's been long enough time to spawn an new legendary item: " + (Today - LastLegendaryItemSpawnDay))

			int dieRoll = Utility.RandomInt(0, 100)
			Debug.Trace(self + "TryToSpawnLegendaryItem() LegendaryItemChance: " + LegendaryItemChance)
			Debug.Trace(self + "TryToSpawnLegendaryItem() dieRoll: " + dieRoll)

			if dieRoll <= LegendaryItemChance

	;			"Once every hundred-thousand years or so,
	;		When the sun doth shine and the moon doth glow
	;				    And the grass doth grow..." 

				LegendaryItemQuest.GenerateLegendaryItem(self) 	

				LastLegendaryItemSpawnDay = Today

				Debug.Trace(self + "TryToSpawnLegendaryItem() ROCK!")

			endif

		else
			Debug.Trace(self + "TryToSpawnLegendaryItem() it has NOT been long enough time to spawn an new legendary item: " + (Today - LastLegendaryItemSpawnDay))
		endif
	endif 

EndFunction