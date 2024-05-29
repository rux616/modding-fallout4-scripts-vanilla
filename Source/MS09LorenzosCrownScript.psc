Scriptname MS09LorenzosCrownScript extends ObjectReference

Actor myActor

MS09Script property MS09 auto const mandatory

Event OnEquipped(Actor akActor)
	debug.trace(self + " OnEquipped " + akActor)
    myActor = akActor
    ; register for custom event from MS09
    RegisterForCustomEvent(MS09, "LorenzoTelekinesisEvent")
EndEvent

Event MS09Script.LorenzoTelekinesisEvent(MS09Script akSender, Var[] akArgs)
	; got event, animate?
	debug.trace(self + " LorenzoTelekinesisEvent received")
	myActor.PlaySubGraphAnimation("Stage2")
	utility.wait(2.0)
	myActor.PlaySubGraphAnimation("Reset")
endEvent