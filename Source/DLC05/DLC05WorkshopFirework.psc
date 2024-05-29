Scriptname DLC05:DLC05WorkshopFirework extends ObjectReference

String Property FireworkMortarNode = "FireworkMortarNode" auto const

Message Property DLC05FireworkMortarMessageFull auto const mandatory

float property fFireworkFiringTimer = 2.0 auto
{ how long between firing while powered }

int property iFireworkFiringTimerID = 1 auto const 

Sound Property FiringSound Auto Const

Event OnPowerOn(ObjectReference akPowerGenerator)
	debug.trace(self + " OnPowerOn")
	StartFiringTimer()	
EndEvent

auto STATE AllowActivate

	Event OnActivate(ObjectReference akActionRef)
		GoToState("Busy")
		BlockActivation(TRUE)
		AddInventoryEventFilter(NONE)

		debug.Trace(self + "OnActivate()")
		if akActionRef == Game.GetPlayer()
			; wait for player to exit menu
			Utility.Wait(0.1)
			CheckInventory()
		else
			GoToState("AllowActivate")
		endif

		BlockActivation(FALSE)

	EndEvent

EndSTATE

STATE Busy
	;Do Nothing
EndSTATE

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	debug.Trace(self + "OnItemAdded: " + aiItemCount + " akBaseItem=" + akBaseItem + " akItemReference=" + akItemReference)
	; fire on timer if working
  	if IsPowered() && IsDestroyed() == false
		StartFiringTimer()
	endif
EndEvent

Event OnTimer(int aiTimerID)
	if aiTimerID == iFireworkFiringTimerID
		TryToFireProjectile()
	endif 
EndEvent

function StartFiringTimer()
	; run timer for next shell if working
	StartTimer(fFireworkFiringTimer, iFireworkFiringTimerID)
endFunction

function TryToFireProjectile()
	if CheckInventory()
	  	if IsDestroyed() == false
			ObjectReference refToFire = DropFirstObject(true) ; disabled so not visible
			debug.trace(self + " TryToFireProjectile: refToFire=" + refToFire + ", is DLC05:FireworkShellScript? " + (refToFire is DLC05:FireworkShellScript))
			Weapon weaponToFire = (refToFire as DLC05:FireworkShellScript).FireworkWeapon
			if weaponToFire
				if FiringSound
					FiringSound.Play(self)
				endif
			  	Debug.Trace("Launching Firework " + weaponToFire)
				weaponToFire.Fire(self)
			endif
			refToFire.Delete()
			; if we still have more shells, run timer again
	  		if CheckInventory() && IsPowered()
	  			StartFiringTimer()
	  		endif
		endif
	endif
endFunction

; if nothing in inventory, clear FireworkShell variable
bool function CheckInventory()
	if GetItemCount() == 0
		return false
	else 
		return true
	endif
endFunction
