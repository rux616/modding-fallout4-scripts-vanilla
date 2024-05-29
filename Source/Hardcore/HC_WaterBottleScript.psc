Scriptname Hardcore:HC_WaterBottleScript extends Quest

	HC_ManagerScript Property HC_Manager Auto Const Mandatory
	{autofill}

	formlist Property HC_FillableWaterBottlesList Auto Const Mandatory
{autofill; miscobjects in this formlist can be filled with water - new bottles in DLCs need to be added to this}

	Sound Property HC_UIModsComponentsWater Auto Const Mandatory
{autofill}

	keyword Property AnimFurnWaterPump Auto Const Mandatory
{autofill}

	potion Property WaterDirty Auto Const Mandatory
{autofill}

	potion Property WaterPurified Auto Const Mandatory
{autofill}

	spell[] Property CleanDrinkingFountainSpells Auto Const Mandatory
{array of spells from drinking fountain scripts that mean clean water}

	Actor PlayerRef
	
	int iCount

	ObjectReference lastTarget

	bool playerInWaterPump


	float SoundWaitTime = 1.25 const

State Busy
	Function FillWaterBottle(ObjectReference TargetRef)
		HC_Manager.trace(self, "FillWaterBottle() BUSY state.")
	EndFunction
EndState


Function FillWaterBottle(ObjectReference TargetRef)
	GotoState("Busy")
	HC_Manager.trace(self, "FillWaterBottle() TargetRef: " + TargetRef)
	lastTarget = TargetRef
	PlayerRef = Game.GetPlayer()

	iCount = 1

	drinkFromFountainScript fountain = TargetRef as drinkFromFountainScript

	HC_Manager.trace(self, "FillWaterBottle() fountain: " + fountain)

	;play animation
	if fountain
		if fountain.HasKeyword(AnimFurnWaterPump)
			;it's a water pump, so pump until player exits furniture or runs out of bottles
			HC_Manager.trace(self, "FillWaterBottle() fountain has AnimFurnWaterPump keyword")

			;enter furniture:
			fountain.Activate(playerRef, abDefaultProcessingOnly = true)
			
			RegisterForRemoteEvent(fountain, "OnExitFurniture")
			playerInWaterPump = true

			Utility.wait(3)

			iCount = 0
			While playerInWaterPump && PlayerRef.GetItemCount(HC_FillableWaterBottlesList)
				HC_Manager.trace(self, "Water Pump processing...")
				iCount += 1
				GiveWater(5.2)
			EndWhile

			;exit furniture (if player is still in it) -
			if playerInWaterPump
				fountain.Activate(playerRef, abDefaultProcessingOnly = true)
			endif

		else
			HC_Manager.trace(self, "FillWaterBottle() fountain processing...")
			fountain.FountainStart.play(fountain) ;sound effect

			;turn on water
			fountain.SetAnimationVariableFloat("fDampRate", 0.08)
			fountain.SetAnimationVariableFloat("fToggleBlend", 1.0)

			GiveWater()

			;turn off water
			fountain.SetAnimationVariableFloat("fDampRate", 0.03)
			fountain.SetAnimationVariableFloat("fToggleBlend", 0.0) 
		endif
	
	else ;assuming drinking from world
		HC_Manager.trace(self, "FillWaterBottle() drinking from world processing...")
		GiveWater()
	endif

	GotoState("Ready")
EndFunction


Function GiveWater(float WaitTime = -1.0)
	HC_Manager.trace(self, "GiveWater() lastTarget: " + lastTarget)
	
	if iCount == 0
		HC_Manager.trace(self, "GiveWater() iCount == 0. BAILING OUT.")
		RETURN
	endif

	if WaitTime == -1
		WaitTime = SoundWaitTime
	endif

	bool isCleanWater

	drinkFromFountainScript fountain = lastTarget as drinkFromFountainScript

	if fountain && CleanDrinkingFountainSpells.find(fountain.spellOnDrink) > -1
		isCleanWater = true
	else ;assume we are drinking from irradiated sources)
		isCleanWater = false
	endif

	int iBottles = PlayerRef.GetItemCount(HC_FillableWaterBottlesList)

	if iBottles < iCount
		iCount = iBottles
	endif		

	HC_UIModsComponentsWater.Play(PlayerRef)

	PlayerRef.RemoveItem(HC_FillableWaterBottlesList, iCount)
	
	if isCleanWater
		playerRef.AddItem(WaterPurified, iCount)
	else
		playerRef.AddItem(WaterDirty, iCount)
	endif

	Utility.wait(WaitTime)
	

	iCount = 0
	
EndFunction

Event ObjectReference.OnExitFurniture(ObjectReference akSender, ObjectReference akActionRef)
    playerInWaterPump = false
EndEvent