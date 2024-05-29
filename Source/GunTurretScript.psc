Scriptname GunTurretScript extends ObjectReference
{The script to place on a gun turret.}

ActorValue Property ignoreCrippleValue Auto const
Keyword Property powerArmorArmorKeyword Auto

; Local Variables
Actor activatingActor
Weapon turretWeapon
Ammo turretAmmo
Weapon priorEquippedWeapon
int iactorInitialAmmoCount

Event OnInit()
	debug.trace("GunTurret OnInit")
	activatingActor = None
	turretWeapon = None
	turretAmmo = None
	priorEquippedWeapon = None	  
	iactorInitialAmmoCount = 0

	Furniture turretFurniture = GetBaseObject() as Furniture
	if( turretFurniture != None )
		turretWeapon = turretFurniture.GetAssociatedForm() as Weapon
		if( turretWeapon != None )
			turretAmmo = turretWeapon.GetAmmo()
		endif
	endif 
EndEvent

; Function to enter the turret
Function EnterTurret()
	debug.trace("GunTurret EnterTurret")
	; Store the previously equipped weapon & ammo count.
	priorEquippedWeapon = activatingActor.GetEquippedWeapon()

	iactorInitialAmmoCount = activatingActor.GetItemCount( turretAmmo)
	if ( iactorInitialAmmoCount > 0 )
		activatingActor.RemoveItem( turretAmmo, iactorInitialAmmoCount, true )
	endif
				
	; Find out how much ammo the container has in it.
	int iammoCount = GetItemCount( turretAmmo )
	RemoveItem( turretAmmo, iammoCount, true )

	; Add the ammo and weapon to the actor.
	activatingActor.AddItem( turretWeapon, 1, true )

	; Remove any bonus ammo
	int itmpammoCount = activatingActor.GetItemCount( turretAmmo )
	activatingActor.RemoveItem( turretAmmo, itmpammoCount, true )
	
	activatingActor.AddItem( turretAmmo, iammoCount, true )
	activatingActor.EquipItem( turretWeapon, false, true )
			
	; Register for the turret rip off event and OnDying event
	RegisterForAnimationEvent( activatingActor, "removingTurret" )
	RegisterForRemoteEvent(activatingActor, "OnDying")
	
	; make the user ignore being crippled until they get out of the turret
	activatingActor.SetValue( ignoreCrippleValue, 1 )
EndFunction

Event Actor.OnDying(Actor akSender, Actor akKiller)
	ExitTurret()
	GoToState("TurretInactive")
endEvent

; Function to exit the turret
Function ExitTurret()
	debug.trace("GunTurret ExitTurret")
	; Unregister for the turret rip off event and OnDying event
	UnregisterForAnimationEvent( activatingActor, "removingTurret" )
	UnregisterForRemoteEvent(activatingActor, "OnDying")
		
	; Remove the weapon now.
	activatingActor.UnequipItem( turretWeapon, false, true )
	activatingActor.RemoveItem( turretWeapon, 1, true )
			
	; and remove the ammo
	activatingActor.UnequipItem( turretAmmo, false, true )
	int iammoCount = activatingActor.GetItemCount( turretAmmo )		
	if( iammoCount > 0 )
		activatingActor.RemoveItem( turretAmmo, iammoCount, true )
		AddItem( turretAmmo, iammoCount, true )
	endif
			
	; put our old ammo & weapon back on.
	if ( iactorInitialAmmoCount > 0 )
		activatingActor.AddItem( turretAmmo, iactorInitialAmmoCount, true )
	endif

	if ( priorEquippedWeapon != None )
		activatingActor.EquipItem( priorEquippedWeapon, false, true )
	endif
	
	; let the actor be crippled again - UNLESS they are in power armor!
	if( powerArmorArmorKeyword == None || !activatingActor.WornHasKeyword( powerArmorArmorKeyword ) )
		activatingActor.SetValue( ignoreCrippleValue, 0 )
	endif
			
	iactorInitialAmmoCount = 0
	priorEquippedWeapon = None
	activatingActor = None
EndFunction


; State where the turret is not active
Auto State TurretInactive
	; Handle the actor activating the turret
	Event OnActivate( ObjectReference akActionRef )
		debug.trace("turret got activate while inactive")
		activatingActor = akActionRef as Actor
		if ( activatingActor != None && turretWeapon != None && turretAmmo != None )
			EnterTurret()
			GoToState("TurretActive")
		endif
	EndEvent
EndState

; State where the turret is active
State TurretActive
	; Handle the actor activating the turret
	Event OnActivate( ObjectReference akActionRef )
		debug.trace("turret got activate while active")
		if( akActionRef == activatingActor )
			ExitTurret();
			GoToState("TurretInactive")
		endif
	EndEvent

	; Handle the remove turret event
	Event OnAnimationEvent( ObjectReference akSource, string asEventName )
		if ( akSource == activatingActor && activatingActor != None && asEventName == "removingTurret" )
			debug.trace("Handling remove of turret")
			BlockActivation()

			UnregisterForAnimationEvent( activatingActor, "removingTurret" );

			if ( iactorInitialAmmoCount > 0 )
				activatingActor.AddItem( turretAmmo, iactorInitialAmmoCount, true )
			endif

			iactorInitialAmmoCount = 0
			priorEquippedWeapon = None
			activatingActor = None
		
			; Flag the turret as destroyed so the game knows it is no longer usable
			SetDestroyed(true)
			GoToState("TurretDisabled")
		endif
	EndEvent	
EndState

; State where the turret is disabled
State TurretDisabled
EndState