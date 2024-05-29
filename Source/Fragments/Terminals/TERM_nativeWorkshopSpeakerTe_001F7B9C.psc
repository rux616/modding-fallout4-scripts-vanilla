;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_nativeWorkshopSpeakerTe_001F7B9C Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
bool SetTimeOn = akTerminalRef.GetValue(WorkshopTerminalTimerIntervalType) == 1
ChangeSwitchInterval(1, SetTimeOn)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
bool SetTimeOn = akTerminalRef.GetValue(WorkshopTerminalTimerIntervalType) == 1
ChangeSwitchInterval(2, SetTimeOn)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
bool SetTimeOn = akTerminalRef.GetValue(WorkshopTerminalTimerIntervalType) == 1
ChangeSwitchInterval(3, SetTimeOn)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
bool SetTimeOn = akTerminalRef.GetValue(WorkshopTerminalTimerIntervalType) == 1
ChangeSwitchInterval(4, SetTimeOn)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
bool SetTimeOn = akTerminalRef.GetValue(WorkshopTerminalTimerIntervalType) == 1
ChangeSwitchInterval(5, SetTimeOn)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
bool SetTimeOn = akTerminalRef.GetValue(WorkshopTerminalTimerIntervalType) == 1
ChangeSwitchInterval(6, SetTimeOn)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
bool SetTimeOn = akTerminalRef.GetValue(WorkshopTerminalTimerIntervalType) == 1
ChangeSwitchInterval(7, SetTimeOn)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
bool SetTimeOn = akTerminalRef.GetValue(WorkshopTerminalTimerIntervalType) == 1
ChangeSwitchInterval(8, SetTimeOn)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
bool SetTimeOn = akTerminalRef.GetValue(WorkshopTerminalTimerIntervalType) == 1
ChangeSwitchInterval(9, SetTimeOn)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_10
Function Fragment_Terminal_10(ObjectReference akTerminalRef)
;BEGIN CODE
bool SetTimeOn = akTerminalRef.GetValue(WorkshopTerminalTimerIntervalType) == 1
ChangeSwitchInterval(10, SetTimeOn)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

function ChangeSwitchInterval(int iNewTime, bool bChangeTimeOn)
	;/
	ObjectReference[] linkedRefArray = akTerminalRef.getLinkedRefArray(LinkTerminalMotor)

	int i = 0
	while i < linkedRefArray.length
		GenericMotorScript theObject = linkedRefArray[i] as GenericMotorScript 
		debug.trace(self + " " + i + ": " + theObject)
		if theObject 
			theObject.MotorVelocity = 0
			theObject.ResetMotor()
		endif
		i += 1
	endWhile
	/;
EndFunction

Keyword Property LinkTerminalMotor Auto Const

ActorValue Property WorkshopTerminalTimerIntervalType Auto Const
