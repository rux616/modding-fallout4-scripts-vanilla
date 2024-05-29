Scriptname DLC04:DLC04MS02Script extends Quest Conditional



ObjectReference Property DLC04NWJunkyardUFOExtTo01 Auto Const Mandatory

int Property CoresPlaced = 0 Auto Conditional

GlobalVariable Property DLC04MS02_UFOIsPowered auto const Mandatory

DLC04:DLC04UFOExteriorScript Property DLC04JunkyardUFOExteriorRef Auto Const Mandatory

InputEnableLayer property HubLayer auto

Function Freeze()
	HubLayer = InputEnableLayer.Create()
    HubLayer.DisablePlayerControls()
EndFunction

Function UnFreeze()
    HubLayer.EnablePlayerControls()
EndFunction

Function SetCoreInPlace()
	CoresPlaced += 1
	if CoresPlaced == 3
		SetUFOPowered()
	elseif CoresPlaced >= 4
		SetUFOOverloaded()
	Endif
EndFunction

bool UFOHasPower
Function SetUFOPowered()
	UFOHasPower = true
	SetObjectiveCompleted(800)
	CheckForStage()
EndFunction


bool Property UFOOverloaded = false auto Conditional
int Property OverLoadedStage = -1 auto Const
{Set this stage when there are too many fusion cores if this is NOT -1}
Function SetUFOOverloaded()
	UFOOverloaded = true
	if OverLoadedStage > 0
		SetStage(OverLoadedStage)
	endif
EndFunction


bool UFOHasPowerDistributor
Function SetHasPowerDistributor()
	UFOHasPowerDistributor = true
	SetObjectiveCompleted(805)
	CheckForStage()
EndFunction


int property PoweredOnStage Auto Const Mandatory
{Set this stage when this has at least 3 power cores and has the distributor}
Function CheckForStage()
	if !GetStageDone(PoweredOnStage)
		if UFOHasPowerDistributor && UFOHasPower
			DLC04NWJunkyardUFOExtTo01.Unlock()
			DLC04MS02_UFOIsPowered.SetValue(1)
			SetStage(PoweredOnStage)
			DLC04JunkyardUFOExteriorRef.CheckPower()
		endif
	endif
EndFunction