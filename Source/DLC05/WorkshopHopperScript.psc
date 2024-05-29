Scriptname DLC05:WorkshopHopperScript extends ObjectReference

DLC05:DLC05InitScript property DLC05Init auto const mandatory 

struct Vector
	float x 
	float y
	float z
endStruct

group flags
	bool property bShootWhenPowered = true auto const 
	{ TRUE = fires inventory when powered 
	 FALSE = no firing, just holds onto inventory }

	 bool property bAllowTriggerInput = true auto const 
	 { TRUE if this accepts objects from entering the trigger volume }

	 bool property bFireAsWeapon = false auto const 
	 { TRUE means to fire objects as a weapon from the FireAsWeaponFormList list }
endGroup

group projectileData
	String Property ProjectileNode = "SpawnNode" auto const

	float property ProjectileMagnitude = 1.0 auto const
	{ how hard to shoot inventory - base value }

	float property CurrentProjectileMagnitude = 1.0 auto
	{ how hard to shoot inventory - current value }

	Vector property baseVector auto const
	{ set to how much x/y/z direction you want to the force applied }

	float property fFiringTimer = 1.0 auto
	{ how long between firing while powered }

	float property minAcceleration = 80.0 auto const 
	float property maxAcceleration = 150.0 auto const

	float property currentMinAcceleration = 80.0 auto 
	float property currentMaxAcceleration = 150.0 auto

	FormList property LargeItemFormList auto const 
	{ optional form list to use alternate projectile node }

	FormList property FireAsWeaponFormList auto const 
	{ optional keyword form list to use fire as weapons }

	String Property ProjectileNodeLarge = "SpawnNodeLarge" auto const 
	{ if LargeItemFormList exists, use this node for items matching that list }

	Sound Property FiringSound Auto Const

	float property minimumMass = 1.0 auto const
endGroup

group containersData
	bool property bAllowTriggerContainers = false auto const 
	{ if TRUE will grab objects from containers within the specified radius }

	float property fContainerSearchRadius = 350.0 auto const 
	float property fAllowedDistanceZMin = -25.0 auto const 
	float property fAllowedDistanceZMax = 25.0 auto const 

	float property fAllowedHeadingAngle = 22.0 auto const 
	{ +/- heading angle allowed between hopper and target container - to make sure it is in front of the hopper }

	float property fHeadingAngleModifier = 90.0 auto const 
	{ how much to add to heading angle calculation (based on hopper input position relative to hoppers actual 0 angle) }

	FormList property DLC05WorkshopHopperContainerKeywords auto const

	float property fCheckContainersTimer = 1.0 auto
	{ run timer for checking containers to avoid spamming the call from OnItemAdded }
endGroup

Keyword property WorkshopItemKeyword auto const mandatory 


; TIMERS:
int iFiringTimerID = 1 const 
int iCheckContainersTimerID = 2 const 

Function SetOutputForce(float newForce)
	debug.trace(self + " SetOutputForce: BEGIN: newForce=" + newForce + " minAccel=" + currentMinAcceleration + ", maxAcceleration=" + currentMaxAcceleration)
	if ProjectileMagnitude > 0 ; can't change magnitude if base value is 0
		if newForce > 0
			; use relative scale to set current min/max acceleration
			currentMinAcceleration = minAcceleration * (newForce/ProjectileMagnitude)
			currentMaxAcceleration = maxAcceleration * (newForce/ProjectileMagnitude)

			debug.trace(self + " SetOutputForce: DONE: newForce=" + newForce + " minAccel=" + currentMinAcceleration + ", maxAcceleration=" + currentMaxAcceleration)
		else 
			currentMinAcceleration = 0
			currentMinAcceleration = 0
		endif 
		CurrentProjectileMagnitude = newForce
	endif
endFunction

ObjectReference[] Property Containers auto
{Array of current containers that are in my trigger volume }

bool property bFiring = false auto hidden 
{TRUE while in the middle of firing (don't try to start firing timer again)}

bool property bFiringTimerRunning = false auto hidden 
{TRUE while firing timer is running - don't restart timer }

Event OnInit()
	; initialize current projectile values
	SetOutputForce(ProjectileMagnitude)
endEvent 

Event OnLoad()
	bFiringTimerRunning = false
	TurnOnInventoryEventFilter(true)
	if bAllowTriggerContainers
		RegisterForWorkshopEvents()
		FindContainers()
	endif
	if IsPowered() && IsDestroyed() == false 
		StartFiringTimer()
	endif
EndEvent

function TurnOnInventoryEventFilter(bool bTurnOn = true)
	if bTurnOn 
		if bShootWhenPowered
			AddInventoryEventFilter(NONE)
			bFiring = false
		endif
	else 
		RemoveAllInventoryEventFilters()
	endif 
endFunction

Event OnUnload()
	debug.trace(self + " OnUnload")
	RemoveAllContainers()
	RegisterForWorkshopEvents(false)
	; clear flags
	bFiring = false
	bFiringTimerRunning = false
endEvent 

Event OnPowerOn(ObjectReference akPowerGenerator)
	debug.trace(self + " OnPowerOn")
	StartFiringTimer()	
EndEvent

Event OnActivate(ObjectReference akActionRef)
	debug.Trace(self + "OnActivate()")
	if akActionRef == Game.GetPlayer()
		; wait for player to exit menu
		Utility.Wait(0.1)
		CheckInventory()
	endif
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	debug.Trace(self + "OnItemAdded: " + aiItemCount + " akBaseItem=" + akBaseItem + " akItemReference=" + akItemReference)
	if bShootWhenPowered
		; fire on timer (powered/destroyed checks come later)
		StartFiringTimer()
	endif
EndEvent

; remote event from trigger containers
Event ObjectReference.OnItemAdded(ObjectReference akSource, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if akSource != self
		debug.trace(self + " REMOTE OnItemAdded from " + akSource + " akBaseItem=" + akBaseItem + ", aiItemCount=" + aiItemCount + " akItemReference=" + akItemReference)
		; unregister for inventory events temporarily (turned back on by CheckContainers) to avoid spamming
		UnregisterForRemoteEvent(akSource, "OnItemAdded")
		StartCheckContainersTimer()
	endif
endEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	if bAllowTriggerInput
		debug.trace(self + "OnTriggerEnter akActionRef=" + akActionRef + " IsDisabled()=" + akActionRef.IsDisabled() + " x=" + akActionRef.GetPositionX() + " y=" + akActionRef.GetPositionY() + "z=" + akActionRef.GetPositionZ())
		if akActionRef.IsDisabled() == false
			if (akActionRef is Actor) == false
				; if it's a container, add to array
				if akActionRef.GetBaseObject() is Container
					AddContainer(akActionRef)
					StartCheckContainersTimer()
				else
					; try to add to my inventory
					AddItem(akActionRef)
				endif
			endif
		endif
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if bAllowTriggerContainers
		RemoveContainer(akActionRef)
	endif
EndEvent

Event OnTimer(int aiTimerID)
	debug.trace(self + " OnTimer " + aiTimerID)
	if aiTimerID == iFiringTimerID
		bFiringTimerRunning = false
		TryToFireProjectile()
	elseif aiTimerId == iCheckContainersTimerID
		CheckTriggerContainers(true)
	endif 
EndEvent

function StartFiringTimer()
	if bShootWhenPowered && IsPowered() && IsDestroyed() == false && Is3DLoaded()
		debug.trace(self + " StartFiringTimer bFiring=" + bFiring)
		if bFiring == false && bFiringTimerRunning == false
			; run timer for next item
			bFiringTimerRunning = true
			StartTimer(fFiringTimer, iFiringTimerID)
			StartFiringTimerCustom()
		else 
			debug.trace(self + " StartFiringTimer: already firing, don't start timer right now")
		endif
	endif
endFunction

; called when firing timer is started
function StartFiringTimerCustom()
	; blank function for children to override
endFunction 

function StartCheckContainersTimer()
	StartTimer(fCheckContainersTimer, iCheckContainersTimerID)
endFunction

function TryToFireProjectile()
	debug.trace(self + " TryToFireProjectile START")
	if bFiring == false && CheckInventory()
 		if IsPowered() && IsDestroyed() == false && Is3DLoaded()
			bFiring = true

			ObjectReference refToFire = DropFirstObject(true) ; disabled so not visible
			String firingNode = ProjectileNode
			if refToFire
				; check for large item node
				if LargeItemFormList && LargeItemFormList.HasForm(refToFire.GetBaseObject())
					debug.trace(self + " large item - use " + ProjectileNodeLarge)
					firingNode = ProjectileNodeLarge
					refToFire.MoveToNode(self, ProjectileNodeLarge)
				else
					refToFire.MoveToNode(self, ProjectileNode)
				endif

				debug.trace(self + "TryToFireProjectile refToFire=" + refToFire + " IsDisabled()=" + refToFire.IsDisabled() + " x=" + refToFire.GetPositionX() + " y=" + refToFire.GetPositionY() + "z=" + refToFire.GetPositionZ())

				; calculate havok impulse with current rotation
			  	Vector realVector = RotateVector(baseVector)

				FireProjectile(refToFire, realVector, firingNode)				
			endif

			bFiring = false
		endif
	endif

	bFiring = false

	; if we still have more inventory, run timer again
	if CheckInventory() || CheckTriggerContainers(true)
		StartFiringTimer()
	endif
	debug.trace(self + " TryToFireProjectile DONE")
endFunction

function FireProjectile(ObjectReference refToFire, Vector firingVector, String firingNode)
	if refToFire
		if FiringSound
			FiringSound.Play(self)
		endif

		Weapon weaponToFire
		if bFireAsWeapon && refToFire.HasKeywordInFormList(FireAsWeaponFormList)
			if refToFire.GetBaseObject() is Weapon
				weaponToFire = (refToFire.GetBaseObject() as Weapon)
			elseif refToFire is DLC05:FireworkShellScript
				weaponToFire = (refToFire as DLC05:FireworkShellScript).FireworkWeapon
			endif 
		endif 
		if weaponToFire 
			debug.trace(self + " firing " + refToFire + " as weapon " + weaponToFire)
			weaponToFire.Fire(self)
			refToFire.Delete()
		else
			refToFire.MoveToNode(self, firingNode)
			refToFire.Enable() ; just in case
			; force to actually use:
			float force = CalculateForce(refToFire)
			refToFire.ApplyHavokImpulse(firingVector.x, firingVector.y, firingVector.z, force)
		endif
	endif 
endFunction 

; if nothing in inventory, clean up inventory array
bool function CheckInventory()
	if bShootWhenPowered
		if GetItemCount() == 0
			return false
		else
			return true
		endif
	else 
		return false
	endif
endFunction

function AddContainer(ObjectReference newContainerRef)
	if newContainerRef != self
		if CheckContainerPosition(newContainerRef)
			if Containers == NONE
				; initialize container
				Containers = New ObjectReference[0]
			endif 
			debug.trace(self + "   adding container " + newContainerRef + " to trigger list")
			if Containers.Find(newContainerRef) == -1
				Containers.Add(newContainerRef)
				RegisterForRemoteEvent(newContainerRef, "OnItemAdded")
			endif
		endif
	endif
endFunction 

function RemoveContainer(ObjectReference containerToRemove)
	if containerToRemove != self
	    if Containers && Containers.Length > 0
	    	int foundIndex = Containers.Find(containerToRemove)
	    	if foundIndex > -1
				debug.trace(self + "   removing container " + containerToRemove + " from trigger list")
	    		Containers.Remove(foundIndex)
	    		UnregisterForRemoteEvent(containerToRemove, "OnItemAdded")
	    	endif
	    endif
	endif
endFunction 

function RemoveAllContainers()
    if Containers && Containers.Length > 0
		int i = 0
		while i < Containers.Length 
			ObjectReference theContainer = Containers[i]
			RemoveContainer(theContainer)
		endWhile
	endif
endFunction

function FindContainers()
	debug.trace(self + " FindContainers")
	; clear current container list
	RemoveAllContainers()

	; find containers with these keywords
	int k = 0
	while k < DLC05WorkshopHopperContainerKeywords.GetSize()
		Keyword theKeyword = DLC05WorkshopHopperContainerKeywords.GetAt(k) as Keyword 
		debug.trace(self + "    find containers with keyword " + theKeyword + " within " + fContainerSearchRadius)
		if theKeyword
			ObjectReference[] foundContainers = FindAllReferencesWithKeyword(theKeyword, fContainerSearchRadius)
			if foundContainers.Length > 0
				int i = 0
				while i < foundContainers.Length
					debug.trace(self + " found by keyword " + theKeyword + " container " + foundcontainers[i])
					AddContainer(foundContainers[i])
					i += 1
				endWhile
			endif
		endif
		k += 1
	endWhile

	CheckTriggerContainers(true)
endFunction

; returns true if the specified container is within the trigger zone of the hopper
bool function CheckContainerPosition(ObjectReference theContainer)
	bool bValidContainer = false
	float zDifference = theContainer.GetPositionZ() - GetPositionZ()
	debug.trace(self + " CheckContainerPosition for " + theContainer + " zDifference=" + zDifference)
	bValidContainer = ( zDifference >= fAllowedDistanceZMin ) && ( zDifference <= fAllowedDistanceZMax )

	if bValidContainer 
		; check heading angle
		float fHeadingAngle = GetHeadingAngle(theContainer) + fHeadingAngleModifier
		; convert to +/- angle
		if fHeadingAngle > 180
			fHeadingAngle = fHeadingAngle - 360
		endif

		debug.trace(self + " CheckContainerPosition for " + theContainer + " headingAngle=" + fHeadingAngle)
		bValidContainer = (Math.abs(fHeadingAngle) <= fAllowedHeadingAngle)
	endif

	debug.trace(self + " CheckContainerPosition = " + bValidContainer)
	return bValidContainer
endFunction 

bool function CheckTriggerContainers(bool bGrabObject = false)
	; if I have any containers in my list, and any have inventory, return true
	bool foundContainerInventory = false
	if bAllowTriggerContainers && Containers && Containers.Length > 0
		int i = 0
		while i < Containers.Length && foundContainerInventory == false
			ObjectReference theContainer = Containers[i]
			if theContainer.GetItemCount() > 0
				debug.trace(self + " CheckTriggerContainers: found container with inventory " + theContainer)
				foundContainerInventory = true
				if bGrabObject
					if Utility.IsInMenuMode() == false ; don't do this when the game is paused
						GrabObjectFromContainer(theContainer)
					else
						; start firing timer once we leave menu mode
						StartFiringTimer()
					endif
				endif
			endif
			; reregister for inventory events (turned off by remote OnAddItem to avoid spamming)
			RegisterForRemoteEvent(theContainer, "OnItemAdded")
			i += 1
		endWhile
	endif
	return foundContainerInventory
endFunction

function GrabObjectFromContainer(ObjectReference theContainer)
	debug.trace(self + " GrabObjectFromContainer " + theContainer)
	if IsPowered() && IsDestroyed() == false
		; grab one object from this container
		if theContainer
			ObjectReference grabbedRef = theContainer.DropFirstObject(true) ; disable the ref so it isn't visible
			debug.trace(self + " GrabObjectFromContainer: grabbing object " + grabbedRef)
			if grabbedRef
				TurnOnInventoryEventFilter(false) ; to avoiding spamming OnItemAdded events with large stacks
				AddItem(grabbedRef)
				TurnOnInventoryEventFilter(true) ; put inventory filter back
				if grabbedRef
					grabbedRef.Enable()
				endif
				if bShootWhenPowered
					; fire on timer (powered/destroyed checks come later)
					StartFiringTimer()
				endif
			endif
		endif
	endif
endFunction

; return new X based on z rotation
Vector function RotateVector(Vector startingVector)
	Vector rotatedVector = new Vector
	float zAngle = GetAngleZ()
	float h = Math.pow(startingVector.x, 2) + Math.pow(startingVector.y, 2)

	; new X = cos(z) * h
	rotatedVector.x = math.cos(zAngle) * h * -1 ; unclear why need the -1 here, but it works - possibly the node is rotated by 180 relative to the object orientation?
	; new Y = sin(z) * h
	rotatedVector.y = math.sin(zAngle) * h

	rotatedVector.z = startingVector.z

	debug.trace(self + " RotateVector: zAngle=" + zAngle + ", h=" + h + ", rotated vector=" + rotatedVector)
	return rotatedVector
endFunction

float function CalculateForce(ObjectReference refToFire)
	if CurrentProjectileMagnitude == 0
		return 0
	else
		; get min mass for this ref, if any
		float minMass = minimumMass
		float mass = refToFire.GetMass()
		debug.trace(self + " CalculateForce: mass of " + refToFire + "=" + mass)
		mass = math.max(mass, minMass)
		float acceleration = CurrentProjectileMagnitude/mass 
		debug.trace(self + " CalculateForce: default acceleration=" + acceleration)
		if acceleration < currentMinAcceleration
			acceleration = currentMinAcceleration
		elseif acceleration > currentMaxAcceleration
			acceleration = currentMaxAcceleration
		endif 

		; force to actually use:
		float force = mass * acceleration 
		debug.trace(self + " CalculateForce " + refToFire + ": mass=" + mass + " acceleration=" + acceleration + ", force=" + force)
		return force
	endif
endFunction

function RegisterForWorkshopEvents(bool bRegister = true)
	debug.trace(self + " RegisterForWorkshopEvents " + bRegister)
	ObjectReference workshopRef = GetLinkedRef(WorkshopItemKeyword)
	if workshopRef
		if bRegister
			RegisterForRemoteEvent(workshopRef, "OnWorkshopObjectMoved")
			RegisterForRemoteEvent(workshopRef, "OnWorkshopObjectPlaced")
			RegisterForRemoteEvent(workshopRef, "OnWorkshopObjectDestroyed")
		else 
			UnregisterForRemoteEvent(workshopRef, "OnWorkshopObjectMoved")
			UnregisterForRemoteEvent(workshopRef, "OnWorkshopObjectPlaced")
			UnregisterForRemoteEvent(workshopRef, "OnWorkshopObjectDestroyed")
		endif
	endif	
endFunction 

Event ObjectReference.OnWorkshopObjectDestroyed(ObjectReference akSource, ObjectReference akActionRef)
	RemoveContainer(akActionRef)
endEvent

Event ObjectReference.OnWorkshopObjectMoved(ObjectReference akSource, ObjectReference akActionRef)
	; check if any containers should be added or removed
	FindContainers()
endEvent

Event ObjectReference.OnWorkshopObjectPlaced(ObjectReference akSource, ObjectReference akActionRef)
	; check if any containers should be added
	FindContainers()
endEvent