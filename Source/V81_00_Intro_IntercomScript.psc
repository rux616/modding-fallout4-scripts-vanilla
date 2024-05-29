Scriptname V81_00_Intro_IntercomScript extends ObjectReference

Quest Property V81_00_Intro Auto
Scene Property V81_00_Intro_Intercom_PCHasCores Auto
Scene Property V81_00_Intro_Intercom_Initial Auto
Scene Property V81_00_Intro_Overseer_OfferTask Auto

Event OnActivate(ObjectReference akActionRef)
  Debug.Trace("Activated by Player" + akActionRef)
  If (V81_00_Intro.GetStageDone(200))
  	V81_00_Intro_Intercom_PCHasCores.Start()
  EndIf
  If (V81_00_Intro.GetStageDone(30))
  	V81_00_Intro_Overseer_OfferTask.Start()
  EndIf
  If (V81_00_Intro.GetStageDone(20))
  	V81_00_Intro_Intercom_Initial.Start()
  EndIf
  If (V81_00_Intro.GetStageDone(10))
    V81_00_Intro_Intercom_Initial.Start()
  EndIf
EndEvent
