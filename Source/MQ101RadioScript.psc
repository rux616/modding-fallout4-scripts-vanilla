ScriptName MQ101RadioScript extends ReferenceAlias

ReferenceAlias Property OtherRadio Auto

Event OnActivate(ObjectReference akActionRef)
	;check if the other radio is on and turn it off
	If OtherRadio.GetRef().IsRadioOn()
		OtherRadio.GetRef().SetRadioOn(False)
	EndIf
EndEvent