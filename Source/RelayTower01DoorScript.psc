Scriptname RelayTower01DoorScript extends ObjectReference Hidden

Message Property RelayTower01HaveStrength Auto Const
Message Property RelayTower01NeedStrength Auto Const
ActorValue Property Strength Auto Const

Event OnLoad()
    BlockActivation()
EndEvent
auto STATE DebrisNotCleared
	Event OnActivate(ObjectReference akActionRef)
		ObjectReference DoorDebris = GetLinkedRef()

	    if akActionRef == Game.GetPlayer()
	    	if Game.GetPlayer().GetValue(Strength) > 4
	    		GoToState("DebrisCleared")
	    		DoorDebris.DisableNoWait()
	    		RelayTower01HaveStrength.Show()
	    		utility.Wait(0)
	    		self.Activate(Game.GetPlayer(), TRUE)
	    		BlockActivation(FALSE)
	    	else
	    		RelayTower01NeedStrength.Show()
	    	endif
	    else
	    	self.Activate(akActionRef, TRUE)
	    endif
	EndEvent
EndSTATE

STATE DebrisCleared
	Event OnActivate(ObjectReference akActionRef)
	    self.Activate(akActionRef, TRUE)
	EndEvent
EndSTATE
