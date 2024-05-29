Scriptname DLC06:DLC06RubbleAliasScript extends ReferenceAlias

Event OnLoad()
	Debug.Trace(SELF + ": DLC06RubbleAliasScript: Rubble loaded")
EndEvent

Event ObjectReference.OnWorkshopObjectDestroyed(ObjectReference akSender, ObjectReference akActionRef)
	debug.trace(self + " OnWorkShopObjectDestroyed")
	GetOwningQuest().SetStage(500)
EndEvent