Scriptname ConcordMuseumLightSparks extends ObjectReference Hidden Const

Keyword Property LinkCustom01 Auto Const

Function EnableDisableLight()
	GetLinkedRef(LinkCustom01).EnableNoWait()
    utility.Wait(0.1)
    GetLinkedRef(LinkCustom01).DisableNoWait()
EndFunction