Scriptname MQ203MemoryEKelloggScript extends ReferenceAlias Const

Event OnSit(ObjectReference akFurniture)
	MQ203Script MQ203 = GetOwningQuest() as MQ203Script
    MQ203.AdvanceMemory(MQ203.MemoryE_ID, 1)
EndEvent