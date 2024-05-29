Scriptname CA_DB_Event11 extends ca_dialoguebump_basescript

int myEventID = 11
; this script exists just to be cast by the receiving script to tell which eventID this is

function InitializeEventID()
	; set property on base script to this script's ID
	eventID = myEventID
endFunction
