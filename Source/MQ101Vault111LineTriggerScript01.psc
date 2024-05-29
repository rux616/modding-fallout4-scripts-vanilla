Scriptname MQ101Vault111LineTriggerScript01 extends ReferenceAlias

Scene Property MQ101Vault111_DoorCheckerFemale Auto
Scene Property MQ101Vault111_DoorCheckerMale Auto
Scene Property MQ101Vault111_DoorCheckerSpouse Auto
Quest Property MQ101 Auto

ReferenceAlias Property ActiveSpouse Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	If MQ101.GetStageDone(625) == 1
		If akActionRef.GetBaseObject() == ActiveSpouse.GetRef().GetBaseObject()
			MQ101Vault111_DoorCheckerSpouse.Start()
		ElseIf (akActionRef.GetBaseObject() as ActorBase).GetSex() == 0
			MQ101Vault111_DoorCheckerMale.Start()
		ElseIf (akActionRef.GetBaseObject() as ActorBase).GetSex() == 1
			MQ101Vault111_DoorCheckerFemale.Start()
		EndIf
	EndIf
EndEvent