Scriptname BoS303LabSandboxTriggerScript extends ObjectReference Const

GlobalVariable Property BoS303LabSandbox Auto Const
ReferenceAlias Property BoS303IngramAlias Auto Const

Event OnTriggerEnter (ObjectReference akActionRef)
	if akActionRef == Game.getPlayer() && BoS303LabSandbox.GetValue() == 0
		BoS303LabSandbox.SetValue(1)
		BoS303IngramAlias.GetActorRef().EvaluatePackage()
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if akActionRef == Game.getPlayer() && BoS303LabSandbox.GetValue() == 1
		BoS303LabSandbox.SetValue(0)
		BoS303IngramAlias.GetActorRef().EvaluatePackage()
	endif
EndEvent