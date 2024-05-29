Scriptname MS19SecretDoorTriggerScript extends ObjectReference 

Event OnActivate(ObjectReference akActionRef)
    self.getlinkedRef().playAnimation("Play01")
    self.disable()
EndEvent