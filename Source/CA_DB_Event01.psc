Scriptname CA_DB_Event01 extends CA_DialogueBump_BaseScript

int myEventID = 1
; this script exists just to be cast by the receiving script to tell which eventID this is

function InitializeEventID()
	; set property on base script to this script's ID
	eventID = myEventID
endFunction
