Scriptname MQ101Vault111LineTriggerScript02 extends ReferenceAlias

Scene Property MyScene Auto
Quest Property MQ101 Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	If MQ101.GetStageDone(625) == 1
		MyScene.Start()
	EndIf
EndEvent