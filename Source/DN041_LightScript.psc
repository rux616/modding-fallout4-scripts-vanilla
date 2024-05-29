Scriptname DN041_LightScript extends ObjectReference

float property WaitTime01 Auto
Float property WaitTime02 Auto
Float property WaitTime03 Auto
 
Keyword property LinkCustom01 Auto 
Keyword property LinkCustom02 Auto 
Keyword property LinkCustom03 Auto 

bool Entered = False


Event OnTriggerEnter(ObjectReference akActionRef)
  Debug.Trace(akActionRef + " just entered us!")
  if (akActionRef == Game.GetPlayer()) && (Entered == False)
  	;Self.Disable()
  	Debug.Trace(akActionRef + " just entered us!")
  	Entered = True

  	utility.wait(WaitTime01)
    Self.GetLinkedRef(LinkCustom01).EnableNoWait()
  	
  	utility.wait(WaitTime02)
    Self.GetLinkedRef(LinkCustom02).EnableNoWait()
  	
  	utility.wait(WaitTime03)
    Self.GetLinkedRef(LinkCustom03).EnableNoWait()

    ;Self.Disable()
  endif
EndEvent