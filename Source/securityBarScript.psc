Scriptname securityBarScript extends ObjectReference Conditional

bool Property openLinkedDoorWhenDisengaged = true Auto const
{Should the door being blocked swing open when the latch is freed?}
Message Property LatchedDoorSameSideMSG Auto Const
Message Property LatchedDoorMSG Auto Const
faction Property captiveFaction Auto const
keyword Property LinkCustom01 Auto Const
keyword Property LinkCustom02 Auto Const
keyword Property captiveLink Auto const
bool Property HasBeenTriggered Auto
bool Property HasLoaded Auto
int Property NumberOfCaptives Auto
int Property NumSecurityBars Auto Conditional
int Property NumTriggeredSecurityBars Auto
bool Property bIsMirrored Auto
Sound Property SecurityBarSound const Auto
Sound Property SecurityBarFall const Auto

Keyword Property PlayerActivateDoorLatchedSameSide Auto
Keyword Property PlayerActivateDoorLatchedMultiSameSide Auto
Keyword Property PlayerActivateDoorLatched Auto

Event OnLoad()
	if !HasBeenTriggered
		if !HasLoaded
			HasLoaded = TRUE
			if GetLinkedRef(LinkCustom01)
				(GetLinkedRef(LinkCustom01) as SecurityBarScript).IncrementNumSecurityBars()
			else
				IncrementNumSecurityBars()
			endif
			if GetLinkedRef(CaptiveLink)
				NumberOfCaptives = CountLinkedRefChain(CaptiveLink) + 1
			endif
			utility.Wait(3)
			if GetLinkedRef()
		    	GetLinkedRef().lock()
		    	GetLinkedRef().BlockActivation()
		    	GetLinkedRef().setLockLevel(251)
		    endif
		    RegisterForHitEvent(self)
		    if GetLinkedRef()
		    	registerForRemoteEvent(GetLinkedRef(), "onActivate")
		    endif
		endif

	    ;debug.Trace(self + "Running OnLoad()")
		if !HasBeenTriggered && GetLinkedRef(captiveLink)
			debug.Trace(self + "There are captives here, handle them.")
			bool bCaptiveFound = TRUE
			int iCurrentLinkToCheck = 1
				; Iterate through link chain to remove each actor from faction.
			while (bCaptiveFound) && iCurrentLinkToCheck < NumberOfCaptives
				(GetNthLinkedRef(iCurrentLinkToCheck, captiveLink) as actor).addToFaction(captiveFaction)
				(GetNthLinkedRef(iCurrentLinkToCheck, captiveLink) as actor).stopCombat()
				(GetNthLinkedRef(iCurrentLinkToCheck, captiveLink) as actor).evaluatePackage()
				debug.Trace(self + "Handling captive:" + iCurrentLinkToCheck + " Ref:" + GetNthLinkedRef(iCurrentLinkToCheck, captiveLink))
				iCurrentLinkToCheck = iCurrentLinkToCheck + 1

					; Check to see if there is another actor after this.  if there isn't, then bail out.
				if !(GetNthLinkedRef(iCurrentLinkToCheck, captiveLink))
					bCaptiveFound = FALSE
				endif
			endwhile
		endif
	endif

EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	;if isOnBarSide(akAggressor) && !self.isActivationBlocked()
		if !HasBeenTriggered
			if GetLinkedRef(LinkCustom01)
				(GetLinkedRef(LinkCustom01) as SecurityBarScript).IncrementNumTriggeredSecurityBars()
				(GetLinkedRef(LinkCustom01) as SecurityBarScript).TryToDisengage()
				TryToDisengage()
				playGamebryoAnimation("activate", 0.87)
				int SecurityBarFallInstance = SecurityBarFall.play(self)  
				Sound.SetInstanceVolume(SecurityBarFallInstance, 1)
			else
				NumTriggeredSecurityBars = NumTriggeredSecurityBars + 1
				TryToDisengage()
				playGamebryoAnimation("activate", 0.87)
				int SecurityBarFallInstance = SecurityBarFall.play(self)  
				Sound.SetInstanceVolume(SecurityBarFallInstance, 1)
			endif
		endif
	;endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
	;if isOnBarSide(akActionRef) && !self.isActivationBlocked()
		if !HasBeenTriggered
	    	if GetLinkedRef(LinkCustom01)
				(GetLinkedRef(LinkCustom01) as SecurityBarScript).IncrementNumTriggeredSecurityBars()
				(GetLinkedRef(LinkCustom01) as SecurityBarScript).TryToDisengage()
				TryToDisengage()
				playGamebryoAnimation("activate", 0.87)
				int SecurityBarFallInstance = SecurityBarFall.play(self)  
				Sound.SetInstanceVolume(SecurityBarFallInstance, 1)
			else
				NumTriggeredSecurityBars = NumTriggeredSecurityBars + 1
				TryToDisengage()
				playGamebryoAnimation("activate", 0.87)
				int SecurityBarFallInstance = SecurityBarFall.play(self)  
				Sound.SetInstanceVolume(SecurityBarFallInstance, 1)
			endif
		endif
    ;endif
EndEvent

Event ObjectReference.onActivate(objectReference akSender, ObjectReference akActionRef)
	if akSender == GetLinkedRef() && akActionRef == game.getPlayer()
		if isOnBarSide(game.getPlayer())
			LatchedDoorSameSideMSG.show()
			If NumSecurityBars > 1
				Game.GetPlayer().SayCustom(PlayerActivateDoorLatchedMultiSameSide)
			else
				Game.GetPlayer().SayCustom(PlayerActivateDoorLatchedSameSide)
			EndIf
		else
			LatchedDoorMSG.show()
			Game.GetPlayer().SayCustom(PlayerActivateDoorLatched)
		endif
	endif
	; always re-register.  Rely on the disengage to unregister.
	int SecurityBarSoundInstance = SecurityBarSound.play(self)  
	Sound.SetInstanceVolume(SecurityBarSoundInstance, 1)
	registerForRemoteEvent(GetLinkedRef(), "onActivate")
endEvent

function TryToDisengage()
	if NumTriggeredSecurityBars == NumSecurityBars
		debug.Trace(self + "Running TryToDisengage()")
		HasBeenTriggered = TRUE
		debug.trace("Latch: disengage")
		;playGamebryoAnimation("activate", 0.87)
		blockActivation(TRUE, TRUE)
		if GetLinkedRef()
			unregisterForRemoteEvent(GetLinkedRef(), "onActivate")
			GetLinkedRef().unlock()
		endif
		if openLinkedDoorWhenDisengaged
			if GetLinkedRef()
				GetLinkedRef().BlockActivation(FALSE)
				GetLinkedRef().Lock(FALSE)
				GetLinkedRef().setOpen()
				GetLinkedRef(LinkCustom02).DisableNoWait()
			endif
		endif
		debug.trace("Captivity System - Notify relevant actors that they are now freed.")
		if GetLinkedRef(captiveLink)
			debug.Trace(self + "There are captives here, handle them.")
			bool bCaptiveFound = TRUE
			int iCurrentLinkToCheck = 1
				; Iterate through link chain to remove each actor from faction.
			while (bCaptiveFound) && iCurrentLinkToCheck < NumberOfCaptives
				(GetNthLinkedRef(iCurrentLinkToCheck, captiveLink) as actor).removeFromFaction(captiveFaction)
				(GetNthLinkedRef(iCurrentLinkToCheck, captiveLink) as actor).evaluatePackage()
				debug.Trace(self + "Handling captive:" + iCurrentLinkToCheck + " Ref:" + GetNthLinkedRef(iCurrentLinkToCheck, captiveLink))
				iCurrentLinkToCheck = iCurrentLinkToCheck + 1

					; Check to see if there is another actor after this.  if there isn't, then bail out.
				if !(GetNthLinkedRef(iCurrentLinkToCheck, captiveLink))
					bCaptiveFound = FALSE
				endif
			endwhile
		endif
	else
		; Do nothing since all bars haven't been activated
	endif
endfunction

Event OnReset()
    blockActivation(FALSE)
EndEvent

bool function isOnBarSide(objectReference refToCheck)
	debug.trace("Player/Bar heading Angle = "+getheadingAngle(game.getPlayer()))
	if !bIsMirrored
		if math.abs(getHeadingAngle(game.getPlayer())) > 90
			debug.trace("Latch: "+Game.GetPlayer()+" is on bar side of door.")
			return true
		else
			debug.trace("Latch: "+Game.GetPlayer()+" is NOT on bar side of door.")
			return FALSE
		endif
	else
		if math.abs(getHeadingAngle(game.getPlayer())) < 90
			debug.trace("Latch: "+Game.GetPlayer()+" is on bar side of door.")
			return true
		else
			debug.trace("Latch: "+Game.GetPlayer()+" is NOT on bar side of door.")
			return FALSE
		endif
	endif
endfunction


Function IncrementNumSecurityBars()
	NumSecurityBars = NumSecurityBars + 1
EndFunction

Function IncrementNumTriggeredSecurityBars()
	NumTriggeredSecurityBars = NumTriggeredSecurityBars + 1
EndFunction