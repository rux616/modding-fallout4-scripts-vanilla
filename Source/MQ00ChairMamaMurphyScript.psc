Scriptname MQ00ChairMamaMurphyScript extends ObjectReference Const

MQ00MamaMurphyScript Property MQ00MamaMurphy auto const mandatory
ReferenceAlias Property MurphyChair Auto const Mandatory
GlobalVariable Property MQ00ChairMamaMurphyBuilt Auto Const Mandatory

Event OnInit()
	debug.trace(self + " OnInit")
	MurphyChair.ForceRefTo(Self)
	MQ00ChairMamaMurphyBuilt.SetValueint(1)
	MQ00MamaMurphy.SetStage(50)
	MQ00MamaMurphy.AssignToChair((self as ObjectReference) as WorkshopObjectScript)
EndEvent

Event OnWorkshopObjectDestroyed(ObjectReference akActionRef)
	debug.trace(self + " OnWorkshopObjectDestroyed")
	MurphyChair.Clear()
	MQ00ChairMamaMurphyBuilt.SetValueint(0)
	MQ00MamaMurphy.AssignToChair(NONE)
EndEvent
