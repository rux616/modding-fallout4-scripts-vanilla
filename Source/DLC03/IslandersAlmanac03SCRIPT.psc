Scriptname DLC03:IslandersAlmanac03SCRIPT extends ObjectReference

OBJECTREFERENCE PROPERTY pDLC03POI04MapMarkerRef AUTO
OBJECTREFERENCE PROPERTY pDLC03BrookesHeadLighthouseMapMarker AUTO
OBJECTREFERENCE PROPERTY pSouthWestHarborMapMarkerRef AUTO
OBJECTREFERENCE PROPERTY pRayburnPointMapMarkerRef AUTO
OBJECTREFERENCE PROPERTY pDLC03EchoLakeLumberMapMarker AUTO
OBJECTREFERENCE PROPERTY pEdenMeadowsCinemasMapMarkerRef AUTO
OBJECTREFERENCE PROPERTY pCliffsEdgeHotelMapMarker AUTO
OBJECTREFERENCE PROPERTY pOceanariumMapMarkerRef AUTO
OBJECTREFERENCE PROPERTY pMSAzaleaMapMarkerRef AUTO
OBJECTREFERENCE PROPERTY pOldPondHouseMapMarkerRef AUTO

bool bRead

EVENT ONREAD()

	if ( !bRead )
		pDLC03POI04MapMarkerRef.addToMap()
		pDLC03BrookesHeadLighthouseMapMarker.addToMap()
		pSouthWestHarborMapMarkerRef.addToMap()
		pRayburnPointMapMarkerRef.addToMap()
		pDLC03EchoLakeLumberMapMarker.addToMap()
		pEdenMeadowsCinemasMapMarkerRef.addToMap()
		pCliffsEdgeHotelMapMarker.addToMap()
		pOceanariumMapMarkerRef.addToMap()
		pMSAzaleaMapMarkerRef.addToMap()
		pOldPondHouseMapMarkerRef.addToMap()
		bRead = 1
	endif

ENDEVENT