Scriptname DLC03:DLC03MQ05QuickPortTriggerScript extends ObjectReference Const
; This fast ports the Far Harbor attackers into Acadia

Quest Property pDLC03MQ05 Auto Const Mandatory
LocationRefType Property pDLC03FarHarborAggressorsRefType Auto Const Mandatory
ObjectReference Property pDLC03MQ05QuickPortMarker Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)

	; If the attack is over, then disable this trigger
	if ( pDLC03MQ05.GetStageDone(900) )
		SELF.Disable()
	endif

	; If the Far Harbor people are storming Acadia, then this is valid
	if ( pDLC03MQ05.GetStageDone(850) && !pDLC03MQ05.GetStageDone(900) )
		if ( akActionRef.HasLocRefType(pDLC03FarHarborAggressorsRefType) )    ; Are you one of the attackers?
			akActionRef.Disable(TRUE)
			akActionRef.MoveTo(pDLC03MQ05QuickPortMarker)   ; If so, teleport in
			akActionRef.Enable()
		endif
	endif

EndEvent