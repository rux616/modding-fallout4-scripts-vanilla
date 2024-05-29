Scriptname MQ206SignalInterceptorAliasScript extends ReferenceAlias

Event OnPowerOn(ObjectReference akPowerGenerator)
	(GetOwningQuest() as MQ206Script).UpdateBuildingStage()
EndEvent

Event OnPowerOff()
	(GetOwningQuest() as MQ206Script).UpdateBuildingStage()
EndEvent