Scriptname DN158SubDoorLightController extends ObjectReference

int property LightState = 0 Auto
{0 = off
1 = red
2 = yellow
3 = green}

Group LinkKeywords CollapsedOnRef
	Keyword Property LinkCustom01 Auto Const

	Keyword Property LinkCustom02 Auto Const

	Keyword Property LinkCustom03 Auto Const

	Keyword Property LinkCustom04 Auto Const
EndGroup

int off = 0
int red = 1
int yellow = 2
int green = 3



Event OnCellAttach()
	SetLightState(LightState, true)
EndEvent

Function SetLightState(int newState, bool bypass = false)
	debug.Trace(Self + ": SetLightState to >> " + newState)
	if newState == LightState && !bypass
		;we don't need to do anything
	else
		if newState == off
			SetFakeLightState("Off")
		DisableLinkChain(LinkCustom02)	;red
		DisableLinkChain(LinkCustom03)	;yellow
		DisableLinkChain(LinkCustom04)	;Green
		;if newState != off
		;	if !bypass
		;		utility.Wait(1.0)
		;	endif
			elseif newState == red
				SetFakeLightState("Red")
				EnableLinkChain(LinkCustom02)	;red
				DisableLinkChain(LinkCustom03)	;yellow
				DisableLinkChain(LinkCustom04)	;Green
			elseif newState == yellow
				SetFakeLightState("Yellow")
				DisableLinkChain(LinkCustom02)	;red
				EnableLinkChain(LinkCustom03)	;yellow
				DisableLinkChain(LinkCustom04)	;Green
			elseif newState == green
				SetFakeLightState("Green")
				DisableLinkChain(LinkCustom02)	;red
				DisableLinkChain(LinkCustom03)	;yellow
				EnableLinkChain(LinkCustom04)	;Green
			;endif
		endif
		LightState = newState
	endif
EndFunction


Function SetFakeLightState(string stateString)
	ObjectReference currentLight = GetLinkedRef(LinkCustom01)
	while currentLight && currentLight.Is3dLoaded()
		currentLight.PlayAnimation(stateString)
		currentLight = currentLight.GetLinkedRef(LinkCustom01)
	endWhile
EndFunction

Function EZLightState(string lightStateString)
	debug.Trace(Self + ": EZLightState called >> " + lightStateString)
	if lightStateString == "off" || lightStateString == "Off"
		SetLightState(off)
	elseif lightStateString == "red" || lightStateString == "Red"
		SetLightState(red)
	elseif lightStateString == "yellow" || lightStateString == "Yellow"
		SetLightState(yellow)
	elseif lightStateString == "green" || lightStateString == "Green"
		SetLightState(green)
	endif
EndFunction
		

Function UndoLockout()
	if LightState == red
		EZLightState("yellow")
	endif
endFunction