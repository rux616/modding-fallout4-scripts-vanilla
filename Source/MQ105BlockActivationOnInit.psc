Scriptname MQ105BlockActivationOnInit extends ReferenceAlias

bool bInitialized = false	; set to true when successfully initialized (e.g. ref is in alias)

Event OnAliasInit()
	If bInitialized == false
		bInitialized = True
		Self.GetRef().BlockActivation(True, True)
	EndIf
EndEvent