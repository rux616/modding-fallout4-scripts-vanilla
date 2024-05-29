Scriptname DLC02:DLC02WeaponRackScript extends ObjectReference Hidden

Keyword Property WeaponTypePistol const auto
Keyword Property WeaponTypeRifle const auto
Keyword Property WeaponTypeMelee1H const auto
Keyword Property WeaponTypeMelee2H const auto
Keyword Property WeaponTypeHeavyGun const auto
Keyword Property WeaponTypeHandToHand const auto
Keyword Property BlockWorkshopInteractionKeyword const auto

ObjectReference Property PistolMarker auto
ObjectReference Property PistolEnableMarker auto
ObjectReference Property RifleMarker auto
ObjectReference Property RifleEnableMarker auto

ObjectReference WeaponToPlace

auto STATE WaitingForWeapon
	Event OnActivate(ObjectReference akActionRef)

		ObjectReference Player = Game.GetPlayer()

	    if akActionRef == Player

	    	if (Player as Actor).GetEquippedWeapon()

	    		GoToState("WeaponPlaced")
		    	PlaceWeapon()

		    else
		    	debug.Trace("You must have a weapon equipped to place it on the rack.")
		    endif

	    endif
	EndEvent

	Event OnTriggerEnter(ObjectReference akActionRef)

	    if akActionRef.GetBaseObject() is Weapon

			GoToState("WeaponPlaced")
			WeaponToPlace = akActionRef
		    PlaceWeapon(TRUE)

	    endif

	EndEvent
EndSTATE

STATE WeaponPlaced
	;Just Wait!
EndSTATE


Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	GoToState("WaitingForWeapon")
	akSender.RemoveKeyword(BlockWorkshopInteractionKeyword)
	self.SetDestroyed(FALSE)
	DisableNoWait(PistolEnableMarker)
	EnableNoWait(RifleEnableMarker)
EndEvent


Function PlaceWeapon(Bool PlacedByTrigger = FALSE)
	self.SetDestroyed(TRUE)

	DisableNoWait(PistolEnableMarker)
	DisableNoWait(RifleEnableMarker)

	if !PlacedByTrigger
		ObjectReference Player = Game.GetPlayer()
		Weapon PlayersEquippedWeapon = (Player as Actor).GetEquippedWeapon()
		WeaponToPlace = Player.DropObject(PlayersEquippedWeapon as Form)
	endif

	WeaponToPlace.WaitFor3DLoad()

	WeaponToPlace.AddKeyword(BlockWorkshopInteractionKeyword)

	RegisterForRemoteEvent(WeaponToPlace, "OnActivate")

	WeaponToPlace.SetMotionType(Motion_Keyframed, FALSE)

	if WeaponToPlace.HasKeyword(WeaponTypePistol)
		WeaponToPlace.MoveTo(PistolMarker)
		EnableNoWait(PistolEnableMarker)
	elseif WeaponToPlace.HasKeyword(WeaponTypeRifle)
		WeaponToPlace.MoveTo(RifleMarker)
		EnableNoWait(RifleEnableMarker)
	elseif WeaponToPlace.HasKeyword(WeaponTypeMelee1H) || WeaponToPlace.HasKeyword(WeaponTypeMelee2H)
		WeaponToPlace.MoveTo(RifleMarker)
		Float WeaponAngleX = WeaponToPlace.GetAngleX()
		Float WeaponAngleY = WeaponToPlace.GetAngleY()
		Float WeaponAngleZ = WeaponToPlace.GetAngleZ()
		WeaponToPlace.SetAngle(WeaponAngleX + 90, WeaponAngleY, WeaponAngleZ)
		EnableNoWait(RifleEnableMarker)
	elseif WeaponToPlace.HasKeyword(WeaponTypeHeavyGun)
		WeaponToPlace.MoveTo(RifleMarker)
		EnableNoWait(RifleEnableMarker)
	elseif WeaponToPlace.HasKeyword(WeaponTypeHandToHand)
		WeaponToPlace.MoveTo(PistolMarker)
		Float WeaponAngleX = WeaponToPlace.GetAngleX()
		Float WeaponAngleY = WeaponToPlace.GetAngleY()
		Float WeaponAngleZ = WeaponToPlace.GetAngleZ()
		WeaponToPlace.SetAngle(WeaponAngleX + 90, WeaponAngleY, WeaponAngleZ)
		EnableNoWait(PistolEnableMarker)
	endif
EndFunction