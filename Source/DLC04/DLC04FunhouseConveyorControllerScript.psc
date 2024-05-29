Scriptname DLC04:DLC04FunhouseConveyorControllerScript extends ObjectReference Const

int Property mySpeed = 0 Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	Debug.Trace(self + ": OnTriggerEnter by " + akActionRef)
	if mySpeed != 10
	    SetSpeed(mySpeed)
	elseif mySpeed == 10
		SetSpeed(0)
		DisableNoWait()
	Endif
EndEvent

Function SetSpeed(int speed)
	DLC04:DLC04KKConveyorScript CurrentConveyor = GetLinkedRef() as DLC04:DLC04KKConveyorScript
    While CurrentConveyor
    	CurrentConveyor.SetSpeed(speed)
    	CurrentConveyor = CurrentConveyor.GetLinkedRef() as DLC04:DLC04KKConveyorScript
    EndWhile
EndFunction