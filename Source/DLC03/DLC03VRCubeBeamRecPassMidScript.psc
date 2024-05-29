Scriptname DLC03:DLC03VRCubeBeamRecPassMidScript extends ObjectReference Hidden



auto STATE WaitingForActivate
	Event OnActivate(ObjectReference akActionRef)
		GoToState("DoNothing")
		if Is3DLoaded()
		    PlayAnimationAndWait("Play01", "done")
		    PlayAnimationAndWait("Play01", "done")
		endif
		GoToState("WaitingForActivate")
	EndEvent
EndSTATE

STATE DoNothing
	;Do Nothing
EndSTATE

;Bool Powered = FALSE
;
;Event OnLoad()
;    RegisterForCustomEvent((GetLinkedRef() as DLC03:DLC03VRCubeBeamPassStartScript), "PowerOn")
;    RegisterForCustomEvent((GetLinkedRef() as DLC03:DLC03VRCubeBeamPassStartScript), "PowerOff")
;EndEvent
;
;Event DLC03:DLC03VRCubeBeamPassStartScript.PowerOn(DLC03:DLC03VRCubeBeamPassStartScript akSender, Var[] akArgs)
;	;if (GetLinkedRef() as DLC03:DLC03VRCubeBeamPassStartScript).Powered == FALSE
;	;	Powered = TRUE
;	;	PlayAnimation("Play01")
;	;endif
;	if (GetLinkedRef() as DLC03:DLC03VRCubeBeamPassStartScript).Powered
;		PlayAnimation("Play01")
;	else
;		PlayAnimation("Play02")
;	endif
;EndEvent
;
;Event DLC03:DLC03VRCubeBeamPassStartScript.PowerOff(DLC03:DLC03VRCubeBeamPassStartScript akSender, Var[] akArgs)
;	;if (GetLinkedRef() as DLC03:DLC03VRCubeBeamPassStartScript).Powered == TRUE
;	;	Powered = FALSE
;	;	PlayAnimation("Play02")
;	;endif
;	if (GetLinkedRef() as DLC03:DLC03VRCubeBeamPassStartScript).Powered
;		PlayAnimation("Play01")
;	else
;		PlayAnimation("Play02")
;	endif
;EndEvent