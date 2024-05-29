Scriptname DLC05:DLC05WorkshopConveyor extends ObjectReference Const

Float Property fConveyorSpeedX = 0.0 auto const
Float Property fConveyorSpeedY = 1.0 auto const
Float Property fConveyorSpeedZ = 0.0 auto const


Event OnLoad()
  ApplyConveyorBelt("ConveyorBeltsNode", fConveyorSpeedX, fConveyorSpeedY, fConveyorSpeedZ, false, false)
  if (IsPowered())
  ;		SetAnimationVariableFloat("bPowered", 1.0)
    Debug.Trace(self + "Conveyor was left in a powered state, resuming animation.")
    TurnConveyorOn(true)
  EndIf

EndEvent

Event OnPowerOn(ObjectReference akPowerGenerator)
  Debug.Trace(self + "Turning Conveyor On.")
  TurnConveyorOn(true)
EndEvent

Event OnPowerOff()
  Debug.Trace(self + "Turning Conveyor Off.")
  TurnConveyorOn(false)
  ;RegisterForAnimationEvent(self, "reset")
EndEvent

function TurnConveyorOn(bool bTurnOn = true)
  if bTurnOn
    Debug.Trace(self + "Turning Conveyor On.")
    ConveyorBeltOn(true)
    SetAnimationVariableFloat("bPowered", 1.0)
    PlayAnimation("Yes")
  else
    Debug.Trace(self + "Turning Conveyor Off.")
    ConveyorBeltOn(false)
    SetAnimationVariableFloat("bPowered", 0.0)
  endif
endFunction


