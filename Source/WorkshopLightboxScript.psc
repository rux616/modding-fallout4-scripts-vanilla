Scriptname WorkshopLightboxScript extends ObjectReference Const

String[] Property LightColors auto Const

String[] Property LightBrightness auto Const

int property cylingTimeDefault = 2 auto Const
{ default cycling time if nothing is set yet }

ActorValue Property WorkshopLightboxCycling auto Const
{ used to store cycling time interval
}

ActorValue Property WorkshopLightboxCyclingType auto Const
{ used to store cycling timer
 0 = no cycling
 1 = random
 2 = sequential
}

ActorValue Property WorkshopTerminalLightColor auto Const
{ used to store last light color - index to LightColors array 
}

ActorValue Property WorkshopTerminalLightBrightness auto Const
{ used to store last light brightness - index to LightBrightness array 
}

;/
int cyclingTimerID = 1 Const
Event OnLoad()
    if GetValue(WorkshopLightboxCyclingType) > 0
    	; start cycling
    	StartCycling()
    endif
EndEvent

Event OnUnload()
    ; cancel timer
    CancelTimer(cyclingTimerID)
EndEvent

Event OnPowerOff()
    StartCycling(false)
EndEvent

Event OnPowerOn(ObjectReference akPowerGenerator)
    StartCycling(true)
EndEvent
/;

Event OnActivate(ObjectReference akActionRef)
    if akActionRef is Actor
    	; cycle to next color
    	CycleToNextColor()
    endif
EndEvent

;/
Event OnTimer(int aiTimerID)
    if aiTimerID == cyclingTimerID

    	; get cycling type
    	int cyclingType = GetValue(WorkshopLightboxCyclingType) as int
    	; cycling type 0 = no cycling
    	if cyclingType > 0
    		int iNewBrightness = GetValue(WorkshopTerminalLightBrightness) as int
	    	int iNewColor = 0
    
    		debug.trace(self + " cyclingType=" + cyclingType)
	    	if cyclingType == 1
		    	; pick random light color & brightness
				iNewColor = Utility.RandomInt(0, LightColors.Length - 1)
				debug.trace(self + " pick random color " + iNewColor)
				; pick random brightness
				iNewBrightness = Utility.RandomInt(0, LightBrightness.Length - 1)
	    	elseif cyclingType == 2
	    		; get last color
	    		iNewColor = (GetValue(WorkshopTerminalLightColor) as int) + 1
	    		if iNewColor >= LightColors.Length
	    			iNewColor = 0
	    		endif
	    		; NOTE: keep brightness
				debug.trace(self + " pick new color in sequence " + iNewColor)
	    	else
	    		; future?
			endif
			; save color
			SetValue(WorkshopTerminalLightColor, iNewColor)
			String animString = GetAnimString(iNewColor, iNewBrightness)
			debug.trace(self + " changing color to " + animString)
			PlayAnimation(animString)
	    	; rerun timer
	    	StartCycling()
	    endif
    endif
EndEvent
/;

function SetColor(int iColor = -1, int iBrightness = -1, bool bStopCycling = true)
	if iColor == -1
		iColor = GetValue(WorkshopTerminalLightColor) as int
	endif
	if iBrightness == -1
		iBrightness = GetValue(WorkshopTerminalLightBrightness) as int
	endif
	; set cycling type to 0 - no cycling
	if bStopCycling
		SetCyclingType(0)
	endif
	String animString = GetAnimString(iColor, iBrightness)
	if animString
		; save color
		SetValue(WorkshopTerminalLightColor, iColor)
		SetValue(WorkshopTerminalLightBrightness, iBrightness)
		debug.trace(self + " setting color to " + animString)
		PlayAnimation(animString)
	endif
endFunction

function SetCyclingTime(float cyclingTime)
	if cyclingTime <= 0
		; turn off
		SetValue(WorkshopLightboxCycling, 0)
		StartCycling(false)
	else
		SetValue(WorkshopLightboxCycling, cyclingTime)
		StartCycling(true)
	endif
endFunction

function SetCyclingType(int cyclingType)
	SetValue(WorkshopLightboxCyclingType, cyclingType)
	if cyclingType == 0
		StartCycling(false)
	else
		StartCycling()
	endif
endFunction

function StartCycling(bool bStart = true)
	;/
	float cyclingTime = GetValue(WorkshopLightboxCycling)
	if cyclingTime == 0
		; get and set default value
		cyclingTime = cylingTimeDefault
	endif

	if bStart && cyclingTime > 0
		StartTimer(cyclingTime, cyclingTimerID)
	else
	    ; cancel timer
	    CancelTimer(cyclingTimerID)
	endif
	/;
endFunction

String function GetAnimString(int iColor, int iBrightness)
	if iColor < 0 || iColor >= LightColors.Length || iBrightness < 0 || iBrightness >= LightBrightness.Length
		return NONE
	else
		return LightColors[iColor] + LightBrightness[iBrightness]
	endif
endFunction

; iterate to next color/brightness combination
function CycleToNextColor()
	int iCurrentColor = (GetValue(WorkshopTerminalLightColor) as int)
	int iCurrentBrightness = (GetValue(WorkshopTerminalLightBrightness) as int)
	iCurrentBrightness += 1
	if iCurrentBrightness >= LightBrightness.Length
		iCurrentBrightness = 0
		iCurrentColor += 1
		if iCurrentColor >= LightColors.Length
			iCurrentColor = 0
		endif
	endif
	SetColor(iCurrentColor, iCurrentBrightness, false)
endFunction