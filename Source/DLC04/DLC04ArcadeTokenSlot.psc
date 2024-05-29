Scriptname DLC04:DLC04ArcadeTokenSlot extends ObjectReference


Auto State Waiting
	Event OnBeginState(string asOldState)
	    SetDestroyed(false)
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		GoToState("busy")
		Actor PlayerActor = Game.GetPlayer() as actor
		if akActionRef == (PlayerActor as ObjectReference)
			Debug.Trace(self + ": Activated by Player")
			if PlayerActor.GetItemCount(DLC04_Nukacade_Token01) >= 1
				Debug.Trace(self + ": Taking Token")
				PlayerActor.RemoveItem(DLC04_Nukacade_Token01, 1)
				OBJ_Arcade_Coin_Insert_01.play(self)
				(GetLinkedRef() as DLC04:DLC04ArcadeController).AttemptToStartGame(SlotNumber)
			else
				Debug.Trace(self + ": Player has no tokens")
				DLC04_Nukacade_TokenNeededMessage.Show()
				GoToState("Waiting")
			endif
		endif
	EndEvent
EndState

State Busy
	Event OnBeginState(string asOldState)
	    SetDestroyed(true)
	EndEvent
EndState

Function SetTokenSlotActive(bool shouldBeActive = true)
	if !shouldBeActive
		GoToState("Busy")
	else
		GoToState("Waiting")
	Endif
EndFunction

Message Property DLC04_Nukacade_TokenNeededMessage Auto Const Mandatory
MiscObject Property DLC04_Nukacade_Token01 Auto Const Mandatory
Sound Property OBJ_Arcade_Coin_Insert_01 Auto Const mandatory
int Property SlotNumber = 0 Auto 

Event ObjectReference.OnWorkshopObjectDestroyed(ObjectReference akSender, ObjectReference akActionRef)
	Debug.Trace(self + ": Has Received OnWorkshopObjectDestroyed !!!!!")
	Delete()
EndEvent

Event ObjectReference.OnReset(ObjectReference akSender)
	Debug.Trace(self + ": Has Received OnReset !!!!!")
	Delete()
EndEvent