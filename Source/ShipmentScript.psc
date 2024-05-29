Scriptname ShipmentScript extends ObjectReference

Keyword Property pWorkbench_General Auto Const
MiscObject Property ScrapMisc Auto
MiscObject Property pShipment Auto
Int Property nAmount Auto

;/
BUG 89856: Removing exploit for getting ulimited scrap
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	; When shipments are dropped in a workbench, do stuff
	if ( akNewContainer.HasKeyword(pWorkbench_General) )
		akNewContainer.AddItem(ScrapMisc, nAmount)    ; Add some scrap components

		akNewContainer.RemoveItem(pShipment)
	endif

EndEvent
/;
