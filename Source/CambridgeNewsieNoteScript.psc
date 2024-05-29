Scriptname CambridgeNewsieNoteScript extends ObjectReference Const

ObjectReference Property DiamondCityMapMarkerRef Auto Const

Event onRead()
	if !DiamondCityMapMarkerRef.IsMapMarkerVisible()
		DiamondCityMapMarkerRef.AddToMap(false)
	endif

EndEvent