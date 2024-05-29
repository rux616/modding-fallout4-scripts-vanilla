Scriptname DLC05:WeaponRackScript extends ObjectReference

Keyword Property BlockWorkshopInteractionKeyword const auto mandatory

Keyword Property BlockPlayerActivation const auto mandatory

Keyword Property WorkshopStackedItemParentKEYWORD const auto mandatory

DLC05:DLC05InitScript property DLC05Init auto const mandatory 

struct NodeData
	String NodeName
	Keyword NodeKeyword
	String animationName
endStruct

NodeData[] property Nodes auto const

String property DefaultNode = "DefaultNode" auto const 
{ if no matching node found in Nodes array, use this }

String property EmptyAnimationName auto const
{ if this exists, play animation when weapon is removed }

Message Property DLC05WeaponRackMessageFull auto const mandatory
Message Property DLC05WeaponRackMessageInvalid auto const mandatory

Form WeaponToPlace ; this can either be a base object OR an object reference
ObjectReference PlacedWeaponRef ; this is set only when a weapon is removed from rack and placed on a node

auto STATE AllowActivate

	Event OnActivate(ObjectReference akActionRef)
		; Block activation of the stand when the player activates it, add inventory event filter, then display weapon afterwards

		GoToState("Busy")
		BlockActivation(TRUE)
		AddInventoryEventFilter(NONE)

		debug.Trace(self + "OnActivate()")
	    if akActionRef == Game.GetPlayer()
	    	Utility.Wait(0.1)
	    	PlaceWeapon()
	    else
		    GoToState("AllowActivate")
	    endif

		BlockActivation(FALSE)

	EndEvent

EndSTATE

STATE Busy
	;Do Nothing
EndSTATE

bool bBusy = false ; threading block

function GetThreadLock(bool bGetLock = true)
	if bGetLock
		if bBusy
			Utility.WaitMenuMode(0.1)
		endif 
		bBusy = true 
	else 
		bBusy = false 
	endif
endFunction

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		; If an item is added and it's a weapon then add it to the array, else give it back to the player.
	GetThreadLock()
	debug.Trace(self + "OnItemAdded() " + aiItemCount + " akBaseItem=" + akBaseItem + " akItemReference=" + akItemReference + " WeaponToPlace=" + WeaponToPlace)
	if WeaponToPlace
			; The rack is full
    	debug.Trace(self + "OnItemAdded() The Weapon Rack is full, give the weapon back to the player.")
    	RemoveItem(akBaseItem, aiItemCount, false, Game.GetPlayer())
    	DLC05WeaponRackMessageFull.Show()
	else
    		; Item is a weapon - save it
    	if akItemReference
	    	WeaponToPlace = akItemReference
	    else
	    	WeaponToPlace = akBaseItem
	    endif
    	debug.Trace(self + "OnItemAdded() Item was a weapon, adding it to the rack: " + WeaponToPlace)
    endif
    GetThreadLock(false)
EndEvent


Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	GetThreadLock()
	debug.Trace(self + "OnItemRemoved() " + aiItemCount + " akBaseItem=" + akBaseItem + " akItemReference=" + akItemReference + " WeaponToPlace=" + WeaponToPlace)
	if akItemReference == WeaponToPlace
		debug.Trace(self + "OnItemRemoved: removing stored weapon, clearing WeaponToPlace")
		WeaponToPlace = NONE
	elseif ( akBaseItem == WeaponToPlace && GetItemCount(akBaseItem) == 0 )
		debug.Trace(self + "OnItemRemoved: removing base item = WeaponToPlace, clearing WeaponToPlace")
		WeaponToPlace = NONE
	endif
	; restore WeaponToPlace if base item still in container
	if GetItemCount(akBaseItem) > 0
		WeaponToPlace = akBaseItem 
	endif

	GetThreadLock(false)
EndEvent

Function PlaceWeapon(Bool PlacedByTrigger = FALSE)
	debug.trace(self + " PlaceWeapon: WeaponToPlace=" + WeaponToPlace)

	if WeaponToPlace
		AddKeyword(BlockPlayerActivation)
		; turn this into a ref if it wasn't already
		if WeaponToPlace is ObjectReference
			; have to use base object - PlacedWeaponRef.Drop() causes issues (OnItemRemoved triggered when we don't want it to be)
			PlacedWeaponRef = DropObject((WeaponToPlace as ObjectReference).GetBaseObject())
		else
			PlacedWeaponRef = DropObject(WeaponToPlace)
		endif
		AttachWeapon(PlacedWeaponRef)

		; look for matching node
		int i = 0
		bool bFoundNode = false
		while i < Nodes.Length && bFoundNode == false
			NodeData theNode = Nodes[i]
			if PlacedWeaponRef.HasKeyword(theNode.NodeKeyword)
				bFoundNode = true
				PlacedWeaponRef.MoveToNode(self, theNode.NodeName)
				if theNode.animationName
					PlayAnimation(theNode.animationName)
				endif
			endif
			i += 1
		endWhile
		if bFoundNode == false && HasNode(DefaultNode)
			PlacedWeaponRef.MoveToNode(self, DefaultNode)
		endif

		; achievement check
		DLC05Init.SetWeaponRackAchievementFlag()

		; clear inventory back to player as failsafe
		ObjectReference droppedRef = DropFirstObject(abInitiallyDisabled = true)
		while droppedRef
			Game.GetPlayer().AddItem(droppedRef)
			droppedRef.Enable()
			droppedRef = DropFirstObject(abInitiallyDisabled = true)
		endWhile
	else
		; nothing placed, clear Busy state
		GoToState("AllowActivate")
	endif
EndFunction

Event OnWorkshopObjectDestroyed(ObjectReference akActionRef)
		if PlacedWeaponRef
			AttachWeapon(PlacedWeaponRef, false)
			ClearWeaponSlot()
		endif
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	AttachWeapon(akSender, false)

	; clear current weapon
	ClearWeaponSlot()
EndEvent

function AttachWeapon(ObjectReference weaponRef, bool bAttach = true)
	if weaponRef
		if bAttach
			weaponRef.SetLinkedRef(self, WorkshopStackedItemParentKEYWORD)
			weaponRef.WaitFor3DLoad()
			weaponRef.AddKeyword(BlockWorkshopInteractionKeyword)
			RegisterForRemoteEvent(weaponRef, "OnActivate")
			weaponRef.SetMotionType(Motion_Keyframed, FALSE)
		else
			weaponRef.RemoveKeyword(BlockWorkshopInteractionKeyword)
			weaponRef.SetLinkedRef(NONE, WorkshopStackedItemParentKEYWORD)
			weaponRef.SetMotionType(Motion_Dynamic, TRUE)
			UnregisterForRemoteEvent(weaponRef, "OnActivate")
		endif
	endif
endFunction

function ClearWeaponSlot()
	WeaponToPlace = NONE
	PlacedWeaponRef = NONE

	if EmptyAnimationName
		PlayAnimation(EmptyAnimationName)
	endif

	; ready to place new weapon
	GoToState("AllowActivate")

	RemoveKeyword(BlockPlayerActivation)
endFunction