Scriptname TestWeaponRackTriggerScript extends ObjectReference Hidden

Keyword Property dn_HasBarrel_Long const auto
Keyword Property dn_HasBarrel_Short const auto
Keyword Property WeaponTypePistol const auto
Keyword Property WeaponTypeRifle const auto

Keyword Property dn_HasGrip_Rifle const auto

Event OnActivate(ObjectReference akActionRef)

	ObjectReference Player = Game.GetPlayer()

    if akActionRef == Player

    	;ObjectReference PistolShort = GetNthLinkedRef(1)
    	;ObjectReference PistolLong = GetNthLinkedRef(2)
    	;ObjectReference RifleShort = GetNthLinkedRef(3)
    	;ObjectReference RifleLong = GetNthLinkedRef(4)

    	ObjectReference Tiny = GetNthLinkedRef(1)
    	ObjectReference Short = GetNthLinkedRef(2)
    	ObjectReference Medium = GetNthLinkedRef(3)
    	ObjectReference Long = GetNthLinkedRef(4)

    	if (Player as Actor).GetEquippedWeapon()

    		Int PlayersEquippedItemType = (Player as Actor).GetEquippedItemType(0)
    		;debug.Trace("Player has an equipped item type of " + PlayersEquippedItemType)
	    	self.DisableNoWait()
	    	Weapon PlayersEquippedWeapon = (Player as Actor).GetEquippedWeapon()
	    	ObjectReference PlayersDroppedWeapon = Player.DropObject(PlayersEquippedWeapon as Form)

	    		

	    	RegisterForRemoteEvent(PlayersDroppedWeapon, "OnActivate")
	    	while (!PlayersDroppedWeapon.Is3DLoaded())
	    		utility.Wait(0.1)
	    	endwhile
	    	PlayersDroppedWeapon.SetMotionType(Motion_Keyframed, FALSE)

	    	Float WeaponLength = PlayersDroppedWeapon.GetLength()
	    	debug.Trace(self + "| Length of object is " + WeaponLength)

	    	if PlayersDroppedWeapon.HasKeyword(dn_HasGrip_Rifle)
	    		debug.Trace(self + "| Weapon has a long stock, shorting it's length some before placing it.")
	    		WeaponLength = WeaponLength - 20
	    	endif

	    	if WeaponLength < 30
	    		debug.Trace(self + "| Placing weapon at PIVOT node.")
	    		PlayersDroppedWeapon.MoveTo(self)
	    	elseif WeaponLength < 40
	    		debug.Trace(self + "| Placing weapon at TINY node.")
	    		PlayersDroppedWeapon.MoveTo(Tiny)
	    	elseif WeaponLength < 65
	    		debug.Trace(self + "| Placing weapon at SHORT node.")
	    		PlayersDroppedWeapon.MoveTo(Short)
	    	elseif WeaponLength < 75
	    		debug.Trace(self + "| Placing weapon at MEDIUM node.")
	    		PlayersDroppedWeapon.MoveTo(Medium)
	    	elseif  WeaponLength >= 75
	    		debug.Trace(self + "| Placing weapon at LONG node.")
	    		PlayersDroppedWeapon.MoveTo(Long)
	    	endif

	    	Float WeaponAngleX = PlayersDroppedWeapon.GetAngleX()
	    	Float WeaponAngleY = PlayersDroppedWeapon.GetAngleY()
	    	Float WeaponAngleZ = PlayersDroppedWeapon.GetAngleZ()

	    	if PlayersEquippedItemType < 9
	    		PlayersDroppedWeapon.SetAngle(WeaponAngleX - 90, WeaponAngleY, WeaponAngleZ + 90)
	    	else
	    		PlayersDroppedWeapon.SetAngle(WeaponAngleX, WeaponAngleY, WeaponAngleZ + 90)
	    	endif

	    endif

    endif
EndEvent


Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	self.EnableNoWait()
EndEvent