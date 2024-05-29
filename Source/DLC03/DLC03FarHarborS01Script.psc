Scriptname DLC03:DLC03FarHarborS01Script extends Quest Conditional

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	; Registered on Stage 425
	; watch for player to change location to the Last Plank
	if ( akNewLoc == pDLC03LastPlankLocation && akSender == Game.GetPlayer() )
		; Then teleport Uncle Ken inside
		pUncleKen.GetActorRef().MoveTo(pUncleKenAtLastPlankMarker)

		UnregisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	endif

EndEvent

Location Property pDLC03LastPlankLocation Auto Const Mandatory
ReferenceAlias Property pUncleKen Auto Const Mandatory
ObjectReference Property pUncleKenAtLastPlankMarker Auto Const Mandatory

Int Property bThreatenedUncleKen Auto Conditional

Int Property bUncleKenMollified Auto Conditional
