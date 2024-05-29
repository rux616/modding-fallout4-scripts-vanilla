Scriptname MQ203MemoryH_CourserTriggerScript extends ObjectReference Const

MQ203Script property MQ203 auto const mandatory
ReferenceAlias property MemoryH_Courser auto const mandatory

Event OnTriggerEnter(ObjectReference akActionRef)
	if MQ203.IsRunning() && akActionRef == MemoryH_Courser.GetRef() && MQ203.GetMemoryStage(MQ203.MemoryH_ID) == 1
		debug.trace(self + " courser enters trigger")
		MQ203.AdvanceMemory(MQ203.MemoryH_ID, 2)
	endif
endEvent
