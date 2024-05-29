Scriptname BoS303ReactorTriggerScript extends ObjectReference Const

GlobalVariable Property BoS303ReactorSandbox Auto Const
ReferenceAlias Property BoS303IngramAlias Auto Const

Event OnTriggerEnter (ObjectReference akActionRef)
	if akActionRef == Game.getPlayer() && BoS303ReactorSandbox.GetValue() == 0
		BoS303ReactorSandbox.SetValue(1)
		BoS303IngramAlias.GetActorRef().EvaluatePackage()
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	if akActionRef == Game.getPlayer() && BoS303ReactorSandbox.GetValue() == 1
		BoS303ReactorSandbox.SetValue(0)
		BoS303IngramAlias.GetActorRef().EvaluatePackage()
	endif
EndEvent