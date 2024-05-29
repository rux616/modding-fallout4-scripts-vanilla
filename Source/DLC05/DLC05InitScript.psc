Scriptname DLC05:DLC05InitScript extends Quest

WorkshopParentScript Property WorkshopParent Auto Const mandatory
{ parent quest - holds most general workshop properties }

struct massData
	keyword objectKeyword 
	float minMass = 1.0
endStruct

massData[] property MinimumMassData auto const 
{ keyword/min mass data, to use for shooting objects as projectiles, accounting for bad mass data on some objects }

group builderData
	Component[] Property Components auto const 
	{ array of components to use for text replacement }

	GlobalVariable[] Property RecipeComponentCounts auto const 
	{ array of globals to use for text replacement for component list}

	Message Property BlankMessage Auto Const
endGroup 

struct builderData
	Form builder 
	bool isBuilt 
endStruct 

Group TutorialMessageData
	FormList property HelpManualPC auto const mandatory 
	FormList property HelpManualXBox auto const mandatory 

	int property TutorialMessageStageFireworks = 10 auto const 
	int property TutorialMessageStageLogicGates = 20 auto const 
	int property TutorialMessageStageBuilders = 30 auto const 

	Message property DLC05WorkshopTutorialMessageFireworks auto const mandatory 
	Message property DLC05WorkshopTutorialMessageLogicGates auto const mandatory 
	Message property DLC05WorkshopTutorialMessageBuilders auto const mandatory 

	ActorValue property LogicOperation auto const mandatory 
	{ actor value which indicates a logic gate }

endGroup

Group AchievementData
	int property AchievementStageDisplay = 100 auto const 
	int property AchievementStagePillory = 110 auto const 
	int property AchievementStageBuilders = 120 auto const 

	Form property DLC05NPCWorkshopPillory auto const mandatory

	GlobalVariable property DLC05BuilderAchievementCount auto const mandatory
	GlobalVariable property DLC05BuilderAchievementTotal auto const mandatory

	bool property AchievementDisplayWeaponRack auto 
	bool property AchievementDisplayArmorRack auto 
	bool property AchievementDisplayPowerArmor auto 
endGroup

Event OnQuestInit()
	; register for build event for achievement
	RegisterForTutorialEvents(true)
	; register for init event to pick up new workshops
	RegisterForCustomEvent(WorkshopParent, "WorkshopInitializeLocation")
	RegisterForCustomEvent(WorkshopParent, "WorkshopActorAssignedToWork")
	
	; add help messages:
	HelpManualPC.AddForm(DLC05WorkshopTutorialMessageBuilders)
	HelpManualXBox.AddForm(DLC05WorkshopTutorialMessageBuilders)

	HelpManualPC.AddForm(DLC05WorkshopTutorialMessageLogicGates)
	HelpManualXBox.AddForm(DLC05WorkshopTutorialMessageLogicGates)

	HelpManualPC.AddForm(DLC05WorkshopTutorialMessageFireworks)
	HelpManualXBox.AddForm(DLC05WorkshopTutorialMessageFireworks)

endEvent

function SetTextReplacementData(objectReference akTerminalRef, DLC05:WorkshopBuilderScript builder, int recipeIndex)
	; get recipe, set text replacement messages/globals
	DLC05:WorkshopBuilderScript:recipeComponent[] recipe = builder.GetRecipe(recipeIndex)

	Form recipeItemName 

	if builder.recipeItemNames.Length > recipeIndex
		debug.trace(self + " using recipeItemNames list")
		recipeItemName = builder.recipeItemNames[recipeIndex]
	else
		debug.trace(self + " using recipeItems list")
		recipeItemName = builder.recipeItems[recipeIndex]
	endif 
	akTerminalRef.AddTextReplacementData("RecipeName", recipeItemName)
	debug.trace(self + " setting RecipeName to " + recipeItemName)
	
	; loop through all list of RecipeComponentCounts globals - either fill in with component name, or make blank
	int i = 0
	while i < RecipeComponentCounts.Length
		GlobalVariable componentGlobal = RecipeComponentCounts[i]
		if i < recipe.Length
			componentGlobal.SetValueInt(recipe[i].iCount)
			Component theComponent = recipe[i].theComponent
			if theComponent
				debug.trace(self + " i=" + i + ": recipe component=" + theComponent)
				; find this component in the components array
				;int componentIndex = Components.Find(theComponent)
				String componentName = "ComponentName" + i
				debug.trace(self + " setting " + componentName + " to " + theComponent)
				akTerminalRef.AddTextReplacementData(componentName, theComponent)
			else 
				; use recipe item
				Form recipeItem = recipe[i].theItem
				debug.trace(self + " i=" + i + ": recipe item=" + recipeItem)
				String componentName = "ComponentName" + i
				debug.trace(self + " setting " + componentName + " to " + recipeItem)
				akTerminalRef.AddTextReplacementData(componentName, recipeItem)
			endif
		else 
			componentGlobal.SetValue(0)
			akTerminalRef.AddTextReplacementData("ComponentName" + i, BlankMessage)
		endif
		String componentGlobalString = "ComponentCount" + i
		debug.trace(self + " setting " + componentGlobalString + " to " + componentGlobal)
		akTerminalRef.AddTextReplacementData(componentGlobalString, componentGlobal)
		i += 1
	endWhile

endFunction 

function SetRecipe(int newRecipeIndex, ObjectReference terminalRef, Keyword LinkTerminalKeyword)
	debug.trace(self + " SetRecipe: newRecipeIndex=" + newRecipeIndex + ", LinkTerminalKeyword=" + LinkTerminalKeyword)
	ObjectReference[] linkedRefArray = terminalRef.getLinkedRefArray(LinkTerminalKeyword)

	DLC05:WorkshopBuilderScript builderRef

	int i = 0
	while i < linkedRefArray.length
		ObjectReference theObject = linkedRefArray[i] 
		debug.trace(self + " " + i + ": " + theObject)
		if theObject is DLC05:WorkshopBuilderScript
			debug.trace(self + "  setting recipe on " + theObject)
			(theObject as DLC05:WorkshopBuilderScript).SetCurrentRecipeIndex(newRecipeIndex)
			if builderRef == NONE 
				builderRef = (theObject as DLC05:WorkshopBuilderScript)
			endif
		endif
		i += 1
	endWhile
	
	; set up text replacement data
	if builderRef 
		SetTextReplacementData(terminalRef, builderRef, newRecipeIndex)
	endif
EndFunction

Event WorkshopParentScript.WorkshopInitializeLocation(WorkshopParentScript akSender, Var[] akArgs)
	if (akArgs.Length > 0)
		WorkshopScript workshopRef = akArgs[0] as WorkshopScript
		if workshopRef && CheckForUnregister() == false
			debug.trace(self + " WorkshopInitializeLocation: registering for build events from " + workshopRef)
			RegisterForRemoteEvent(workshopRef, "OnWorkshopObjectPlaced")
		endif
	endif
endEvent

Event WorkshopParentScript.WorkshopActorAssignedToWork(WorkshopParentScript akSender, Var[] akArgs)
	if (akArgs.Length > 0)
		WorkshopObjectScript newObject = akArgs[0] as WorkshopObjectScript
		WorkshopScript workshopRef = akArgs[1] as WorkshopScript
		if newObject.GetBaseObject() == DLC05NPCWorkshopPillory
			; pillory achievement
			SetStage(AchievementStagePillory)
			UnregisterForCustomEvent(WorkshopParent, "WorkshopActorAssignedToWork")
		endif
	endif
endEvent

Event ObjectReference.OnWorkshopObjectPlaced(ObjectReference akSender, ObjectReference newObject)
		debug.trace(self + " OnWorkshopObjectPlaced from " + akSender + ", object " + newObject)
		if (newObject as ObjectReference) is DLC05:DLC05WorkshopFirework
			; tutorial message
			SetStage(TutorialMessageStageFireworks)
		elseif newObject.GetBaseValue(LogicOperation) > 0
			; tutorial message
			SetStage(TutorialMessageStageLogicGates)
		elseif (newObject as ObjectReference) is DLC05:WorkshopBuilderScript
			; tutorial message
			SetStage(TutorialMessageStageBuilders)
		endif
		; see if OK to unregister for build event
		CheckForUnregister()			
endEvent

function IncrementBuilderAchievement()
	; no need to check if we already have the achivement
	if GetStageDone(AchievementStageBuilders) == false
		DLC05BuilderAchievementCount.Mod(1)
		if DLC05BuilderAchievementCount.GetValue() >= DLC05BuilderAchievementTotal.GetValue()
			SetStage(AchievementStageBuilders)
		endif
	endif
endFunction 

function SetWeaponRackAchievementFlag()
	AchievementDisplayWeaponRack = true 
	CheckForDisplayAchievement()
endFunction 

function SetArmorRackAchievementFlag()
	AchievementDisplayArmorRack = true 
	CheckForDisplayAchievement()
endFunction 

function SetPowerArmorAchievementFlag()
	AchievementDisplayPowerArmor = true 
	CheckForDisplayAchievement()
endFunction 

function CheckForDisplayAchievement()
	if GetStageDone(AchievementStageDisplay) == false && AchievementDisplayWeaponRack && AchievementDisplayArmorRack && AchievementDisplayPowerArmor
		SetStage(AchievementStageDisplay)
	endif
endFunction 

; call to see if time to unregister for build event
bool function CheckForUnregister()
	; check if OK to turn off event registration
	if GetStageDone(TutorialMessageStageFireworks) && GetStageDone(TutorialMessageStageLogicGates) && GetStageDone(TutorialMessageStageBuilders)
		; no need for this event any more
		RegisterForTutorialEvents(false)
		return true 
	else 
		return false
	endif
endFunction

function RegisterForTutorialEvents(bool bRegister)
	int i = 0
	while i < WorkshopParent.Workshops.Length 
		WorkshopScript workshopRef = WorkshopParent.Workshops[i]
		if bRegister
			RegisterForRemoteEvent(workshopRef, "OnWorkshopObjectPlaced")
		else 
			UnregisterForRemoteEvent(workshopRef, "OnWorkshopObjectPlaced")
		endif
		i += 1
	endWhile
endFunction
