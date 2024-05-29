Scriptname testStealthSwitchSCRIPT extends ObjectReference

BOOL PROPERTY switchBright AUTO
BOOL PROPERTY switchLow AUTO
BOOL PROPERTY switchNormal AUTO

OBJECTREFERENCE PROPERTY lightBrightMarker AUTO

OBJECTREFERENCE PROPERTY lightLow1Marker AUTO

OBJECTREFERENCE PROPERTY lightNormal1Marker AUTO

EVENT OnActivate(ObjectReference akActionRef)
    
	IF switchBright

		lightBrightMarker.enable()
		lightLow1Marker.disable()
		lightNormal1Marker.disable()

	ELSEIF switchLow

		lightBrightMarker.disable()
		lightLow1Marker.enable()
		lightNormal1Marker.disable()

	ELSEIF switchNormal

		lightBrightMarker.disable()
		lightLow1Marker.disable()
		lightNormal1Marker.enable()

	ENDIF

ENDEVENT