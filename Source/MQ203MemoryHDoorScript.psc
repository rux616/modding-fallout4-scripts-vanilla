Scriptname MQ203MemoryHDoorScript extends ReferenceAlias Const

ReferenceAlias Property MemoryH_Courser Auto Const

GlobalVariable Property MQ203MemoryHStage Auto Const

Event OnActivate(ObjectReference akActionRef)
	debug.trace(self + " OnActivate by " + akActionRef)
    if akActionRef == MemoryH_Courser.GetRef() && MQ203MemoryHStage.GetValue() == 1.0
    	MQ203MemoryHStage.SetValue(2.0)
    endif
EndEvent