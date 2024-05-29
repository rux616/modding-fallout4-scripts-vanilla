Scriptname DLC01:DLC01AssaultronHeadSCRIPT extends ObjectReference

import Debug			; Import Debug for access to trace
import utility			; Import for access to RandomInt

; save off muyself
ACTOR mySelf

; the explosion to play
EXPLOSION PROPERTY headExplosion AUTO

; the idle reload to play
IDLE PROPERTY reloadIdle AUTO

AMMO PROPERTY headAmmo AUTO

; the counter for the gun
INT shotsFired=0

; the player's equipped weapon
WEAPON equippedWeapon

EVENT ONCONTAINERCHANGED(OBJECTREFERENCE akNewContainer, OBJECTREFERENCE akOldContainer) 

	; if we're the player, store us and start looking for events
	IF(akNewContainer == game.getPlayer())
		


		;add 3 ammo for the 3 shots
		IF(game.getPlayer().getItemCount(headAmmo) < 3)
			game.getPlayer().addItem(headAmmo, (3 - game.getPlayer().getItemCount(headAmmo)), 1)
		ELSEIF(game.getPlayer().getItemCount(headAmmo) > 3)
			game.getPlayer().removeItem(headAmmo, (game.getPlayer().getItemCount(headAmmo) - 3), 1)
		ENDIF

	ENDIF

ENDEVENT

; ////////
; //START LOOKING FOR THE EVENTS WHEN THE PLAYER EQUIPS US
; ////////
EVENT ONEQUIPPED(ACTOR akActor)
	
	; if we're the player, store us and start looking for events
	IF(akActor == game.getPlayer())
		
		;add 3 ammo for the 3 shots
		IF(game.getPlayer().getItemCount(headAmmo) < 3)
			game.getPlayer().addItem(headAmmo, (3 - game.getPlayer().getItemCount(headAmmo)), 1)
		ELSEIF(game.getPlayer().getItemCount(headAmmo) > 3)
			game.getPlayer().removeItem(headAmmo, (game.getPlayer().getItemCount(headAmmo) - 3), 1)
		ENDIF

		myself = game.getPlayer()
		RegisterForAnimationEvent(myself, "weaponFire")
		equippedWeapon = game.getPlayer().GetEquippedWeapon()

	ENDIF

ENDEVENT

; ////////
; //STOP LOOKING FOR THE EVENTS WHEN THE PLAYER EQUIPS US
; ////////
EVENT ONUNEQUIPPED(ACTOR akActor)

	; if we're the player, store us and start looking for events
	IF(akActor == game.getPlayer())
		;add 3 ammo for the 3 shots
		IF(game.getPlayer().getItemCount(headAmmo) < 3)
			game.getPlayer().addItem(headAmmo, (3 - game.getPlayer().getItemCount(headAmmo)), 1)
		ELSEIF(game.getPlayer().getItemCount(headAmmo) > 3)
			game.getPlayer().removeItem(headAmmo, (game.getPlayer().getItemCount(headAmmo) - 3), 1)
		ENDIF
	
		; stop looking for the event
		UnRegisterForAnimationEvent(myself, "weaponFire")

	ENDIF

ENDEVENT

; ////////
; //When we find the event, apply the IMOD
; ////////
EVENT onAnimationEvent(objectReference akSource, string asEventName)
	
	; if we catch the open or close events, do stuff!
	IF (asEventName == "weaponFire")
		
		; track the shots fired
		shotsFired = shotsFired + 1

		; the explode formula
		;IF (RandomInt(0,10) + shotsFired) > 10
		IF shotsFired >= 3
				
				;play the anim of the player dropping the weapon
				game.getPlayer().playIdle(reloadIdle)
				game.getPlayer().addItem(headAmmo, 3, 1)
				
				wait(1)

				; blow it up
				;SELF.placeatme(headExplosion)
				
				;unequip and remove it from the player's inventory
				myself.unequipItem(equippedWeapon, FALSE, TRUE)
				myself.removeItem(equippedWeapon)
				
				wait(1)
				
				; we're done with it, delete it
				SELF.delete()

		ENDIF
		
	ENDIF


endEVENT
