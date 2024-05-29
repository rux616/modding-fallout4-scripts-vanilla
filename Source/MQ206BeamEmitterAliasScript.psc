Scriptname MQ206BeamEmitterAliasScript extends ReferenceAlias

Event OnPowerOn(ObjectReference akPowerGenerator)
	(GetOwningQuest() as MQ206Script).UpdateBuildingStage()
	;workshop graph now handles power on/off anims
	;Self.GetRef().PlayAnimation("Stage2")
EndEvent

Event OnPowerOff()
	(GetOwningQuest() as MQ206Script).UpdateBuildingStage()
	;workshop graph now handles power on/off anims
	;Self.GetRef().PlayAnimation("Reset")
EndEvent

Function PlayerOnPlatform()
	Self.GetRef().PlayAnimation("Stage3")
EndFunction

Function FireTeleporter()
	Self.GetRef().PlayAnimation("Stage4")
EndFunction