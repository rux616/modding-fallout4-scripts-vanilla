Scriptname DLC03:DLC03MQ06_NukePlayerAliasScript extends ReferenceAlias

Holotape Property DLC03MQ06_SafeRoomSecurityTape Auto Const Mandatory
{Holotape to watch for via inventory event}

ReferenceAlias Property NukeKeyHolotape Auto Const Mandatory
{Alias for holotape}

ObjectReference Property TapeSpawnMarker Auto Const Mandatory
{Marker location to spawn the new tape}

;Local vars
bool bForceAliasOnce

Event OnAliasInit()
	AddInventoryEventFilter(DLC03MQ06_SafeRoomSecurityTape)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	;If the player adds the Safe Room Security tape to their inventory, throw it into the appropriate alias on MQ06
	if !bForceAliasOnce && akBaseItem == DLC03MQ06_SafeRoomSecurityTape
		debug.trace(self + "Player picked up the Safe Room holotape.")
		bForceAliasOnce = true
		RemoveAllInventoryEventFilters()

		Actor PA = Game.GetPlayer()
		ObjectReference Tape 
		int iTryCount = 0
		while Tape == none && iTryCount < 5
			debug.trace(self + "Trying to spawn new holotape. Attempt number: " + iTryCount )
			Tape = TapeSpawnMarker.PlaceAtMe(DLC03MQ06_SafeRoomSecurityTape)

			if Tape != none
				NukeKeyHolotape.ForceRefTo(Tape)
				PA.RemoveItem(DLC03MQ06_SafeRoomSecurityTape, 1, true)
				PA.AddItem(Tape, 1, true)
			else
				debug.trace(self + "Spawn of holotape failed. Attempt number: " + iTryCount )
			endif
			Utility.Wait(1.0)

			iTryCount += 1
		endwhile
	endif
EndEvent