Scriptname DLC05:WorkshopBuilderScript extends DLC05:WorkshopHopperScript

struct recipeComponent
	Component theComponent
	{ required Component - for component-based recipes }
	Form theItem
	{ OPTIONAL: use either theComponent or theItem, not both }
	int iCount
	{ amount of theComponent/theItem needed }
endStruct

struct recipeNode
	bool bUseDefaultNode = true 
	string nodeName = ""
endStruct 

int property currentItemIndex auto 
{ index to current item (also ID of matching recipe)}

group animations 
	string property animationBuilding = "Manufacture" auto const 
	string property animationHalt = "Halt" auto const 
endGroup 

group recipeList
	recipeComponent[] property recipe00 Auto const
	recipeComponent[] property recipe01 Auto const 
	recipeComponent[] property recipe02 Auto const 
	recipeComponent[] property recipe03 Auto const 
	recipeComponent[] property recipe04 Auto const 
	recipeComponent[] property recipe05 Auto const 
	recipeComponent[] property recipe06 Auto const 
	recipeComponent[] property recipe07 Auto const 
	recipeComponent[] property recipe08 Auto const 
	recipeComponent[] property recipe09 Auto const 
	recipeComponent[] property recipe10 Auto const 
	recipeComponent[] property recipe11 Auto const 
	recipeComponent[] property recipe12 Auto const 
	recipeComponent[] property recipe13 Auto const 
	recipeComponent[] property recipe14 Auto const 
	recipeComponent[] property recipe15 Auto const 

	Form[] property recipeItems auto const 
	{ array of items that match the above recipes }

	Form[] property recipeItemNames auto const 
	{ OPTIONAL: array of item names that match the above recipes - needed for things like weapons where the base item doesn't have the full name }

	recipeNode[] property recipeItemNodes auto const 
	{ array of node data that matches recipeItems }

	int property iRecipeItemCount = 1 auto const 
	{ how many of each recipeItem to spawn? }
endGroup

int recipeIndexMax = 15 const ; make sure to update if adding more recipeXX arrays

; override parent function
Event OnUnload()
	debug.trace(self + " OnUnload")
	Parent.OnUnload()
	StartBuilding(false)
endEvent 

; override parent function
; called when firing timer is started
function StartFiringTimerCustom()
	debug.trace(self + " StartFiringTimerCustom building=" + building)
	; start animation
	if building == false && CanBuildItem()
		StartBuilding()
	endif
endFunction 

; override parent function
function TryToFireProjectile()
	debug.trace(self + " TryToFireProjectile START")
	if Is3DLoaded() && CanBuildItem()
 		if IsPowered() && IsDestroyed() == false
			bFiring = true

			String nodeToUse = ProjectileNode
			Form currentItem = recipeItems[currentItemIndex]
			if recipeItemNodes && recipeItemNodes.Length > currentItemIndex
				recipeNode theItemNode = recipeItemNodes[currentItemIndex]
				if theItemNode && theItemNode.bUseDefaultNode == false
					debug.trace(self + " TryToFireProjectile: use special node " + nodeToUse + " for " + currentItem)
					nodeToUse = theItemNode.nodeName
				endif 
			endif 

			debug.trace(self + " TryToFireProjectile: Powered - try to build item " + currentItem)

			; remove components
			bool bCanBuild = BuildItem(currentItemIndex)

			if bCanBuild
				; had all the needed components
				DLC05Init.IncrementBuilderAchievement()
				
				; calculate havok impulse with current rotation
			  	Vector realVector = RotateVector(baseVector)

				ObjectReference refToFire = PlaceAtNode(nodeToUse, currentItem, abDeleteWhenAble = false, aiCount = iRecipeItemCount)
			  	debug.trace(self + " TryToFireProjectile: firing ref " + refToFire + " at node " + nodeToUse)
				FireProjectile(refToFire, realVector, nodeToUse)
			endif

			bFiring = false

		endif
	endif

	bFiring = false

	; if we still have more inventory, run timer again
	if CanBuildItem() || CheckTriggerContainers(true)
		if IsPowered() && IsDestroyed() == false
			StartBuilding() ; start building directly here so StartFiringTimerCustom won't have to call CanBuildItem again
			StartFiringTimer()
		endif
	else 
		StartBuilding(false)
	endif

	debug.trace(self + " TryToFireProjectile DONE")
endFunction

; returns true if succeeded in building item
bool function BuildItem(int itemIndex)
	debug.trace(self + " BuildItem " + itemIndex)
	bool bCanBuild = Is3DLoaded() ; don't build if unloaded

	recipeComponent[] currentRecipe = GetRecipe(itemIndex)

	int i = 0
	while i < currentRecipe.Length && bCanBuild
		recipeComponent theRecipeItem = currentRecipe[i]
		if theRecipeItem.theComponent
			debug.trace(self + " BuildItem: recipeItem " + i + ": " + theRecipeItem.theComponent + " x" + theRecipeItem.iCount)
			; use components
			if GetComponentCount(theRecipeItem.theComponent) < theRecipeItem.iCount
				debug.trace(self + " BuildItem - missing component " + theRecipeItem.theComponent)
				bCanBuild = false
			else 
				debug.trace(self + " BuildItem - removing " + theRecipeItem.iCount + " " + theRecipeItem.theComponent)
				RemoveComponents(theRecipeItem.theComponent, theRecipeItem.iCount, abSilent = true)
			endif
		else 
			debug.trace(self + " BuildItem: recipeItem " + i + ": " + theRecipeItem.theItem + " x" + theRecipeItem.iCount)
			; normal crafting - use theItem
			if GetItemCount(theRecipeItem.theItem) < theRecipeItem.iCount
				debug.trace(self + " BuildItem - missing item " + theRecipeItem.theItem)
				bCanBuild = false
			else 
				debug.trace(self + " BuildItem - removing " + theRecipeItem.iCount + " " + theRecipeItem.theItem)
				RemoveItem(theRecipeItem.theItem, theRecipeItem.iCount, abSilent = true)
			endif
		endif
		i += 1
	endWhile

	return bCanBuild
endFunction 

; returns true if can build an item
bool function CanBuildItem()
	; run through current recipe and see if we have enough components
	recipeComponent[] currentRecipe = GetRecipe(currentItemIndex)

	bool bCanBuild = true
	int i = 0
	while i < currentRecipe.Length && bCanBuild
		recipeComponent theRecipeItem = currentRecipe[i]
		if theRecipeItem.theComponent
			debug.trace(self + " CanBuildItem: i=" + i + ": " + theRecipeItem + " GetComponentCount=" + GetComponentCount(theRecipeItem.theComponent))
			if GetComponentCount(theRecipeItem.theComponent) < theRecipeItem.iCount
				bCanBuild = false
			endif
		else 
			debug.trace(self + " CanBuildItem: i=" + i + ": " + theRecipeItem + " GetItemCount=" + GetItemCount(theRecipeItem.theItem))
			if GetItemCount(theRecipeItem.theItem) < theRecipeItem.iCount
				bCanBuild = false
			endif
		endif			
		i += 1
	endWhile
	debug.trace(self + " CanBuildItem DONE: " + bCanBuild)
	return bCanBuild
endFunction

bool building = false 

function StartBuilding(bool bStart = true)
	debug.trace(self + " StartBuilding " + bStart)
	building = bStart
	if Is3DLoaded()
		if bStart 
			PlayAnimation(animationBuilding)
		else 
			PlayAnimation(animationHalt)
		endif
	endif
endFunction 

Event OnPowerOff()
	debug.trace(self + " OnPowerOff")
	; stop building
	StartBuilding(false)
endEvent 

function SetCurrentRecipeIndex(int recipeIndex)
	if recipeIndex >= 0 && recipeIndex <= recipeIndexMax
		currentItemIndex = recipeIndex 
	endif 
endFunction 

recipeComponent[] function GetRecipe(int recipeIndex)
	if recipeIndex == 0
		return recipe00
	elseif recipeIndex == 1
		return recipe01
	elseif recipeIndex == 2
		return recipe02
	elseif recipeIndex == 3
		return recipe03
	elseif recipeIndex == 4
		return recipe04
	elseif recipeIndex == 5
		return recipe05
	elseif recipeIndex == 6
		return recipe06
	elseif recipeIndex == 7
		return recipe07
	elseif recipeIndex == 8
		return recipe08
	elseif recipeIndex == 9
		return recipe09
	elseif recipeIndex == 10
		return recipe10
	elseif recipeIndex == 11
		return recipe11
	elseif recipeIndex == 12
		return recipe12
	elseif recipeIndex == 13
		return recipe13
	elseif recipeIndex == 14
		return recipe14
	elseif recipeIndex == 15
		return recipe15

	; etc.
	endif
endFunction 
