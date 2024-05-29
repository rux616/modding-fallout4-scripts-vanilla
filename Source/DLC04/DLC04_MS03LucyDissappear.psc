Scriptname DLC04:DLC04_MS03LucyDissappear extends ObjectReference Const

Actor Property DLC04_MS03_Lucy Auto Const Mandatory

ObjectReference Property DLC04_MS03FinalLucyDoor Auto Const Mandatory

Event OnTriggerEnter(ObjectReference akActionRef)

	Debug.Trace(akActionRef + " just entered us!")

  	ObjectReference Lucy = DLC04_MS03_Lucy as ObjectReference

  	if (akActionRef == Lucy)
  		
  		Lucy.Disable()
  		DLC04_MS03FinalLucyDoor.Activate(Lucy)
		;DLC04_MS03FinalLucyDoor.Lock()

  	endif

EndEvent


