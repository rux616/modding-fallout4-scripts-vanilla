Scriptname MQ101PlayerPodBlockActivationOnInit extends ReferenceAlias

bool bInitialized = false	; set to true when successfully initialized (e.g. ref is in alias)

Event OnAliasInit()
	If bInitialized == false
		bInitialized = true
		Self.GetRef().BlockActivation()
	EndIf
EndEvent