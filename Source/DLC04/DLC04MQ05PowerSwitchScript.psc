Scriptname DLC04:DLC04MQ05PowerSwitchScript extends ObjectReference Const

Quest Property DLC04MQ05 Auto Const Mandatory
Quest Property DLC04PowerTracker Auto Const Mandatory
ObjectReference Property DLC04BPPowerOff Auto Const Mandatory
ObjectReference Property DLC04BPPowerOn Auto Const Mandatory
ObjectReference Property DLC04DRGPowerOff Auto Const Mandatory
ObjectReference Property DLC04DRGPowerOn Auto Const Mandatory
ObjectReference Property DLC04KKPowerOff Auto Const Mandatory
ObjectReference Property DLC04KKPowerOn Auto Const Mandatory
ObjectReference Property DLC04SAPowerOff Auto Const Mandatory
ObjectReference Property DLC04SAPowerOn Auto Const Mandatory
ObjectReference Property DLC04GZPowerOff Auto Const Mandatory
ObjectReference Property DLC04GZPowerOn Auto Const Mandatory
ObjectReference Property DLC04NTPowerOff Auto Const Mandatory
ObjectReference Property DLC04NTPowerOn Auto Const Mandatory
ObjectReference Property DLC04NIPowerOff Auto Const Mandatory
ObjectReference Property DLC04NIPowerOn Auto Const Mandatory
ObjectReference Property DLC04PPPowerOff Auto Const Mandatory
ObjectReference Property DLC04PPPowerOn Auto Const Mandatory
ObjectReference Property fireworksREF_GZ auto Const Mandatory
ObjectReference Property fireworksREF_SA auto Const Mandatory
ObjectReference Property fireworksREF_KK auto Const Mandatory
ObjectReference Property fireworksREF_DRG auto Const Mandatory
ObjectReference Property fireworksREF_NTUSA auto Const Mandatory
ObjectReference Property DLC04_PowerPlantControlRoomEnableMarker auto Const Mandatory
ObjectReference Property DLC04OBJNukaPowerPlantPowerOnmarkerREF auto Const Mandatory
musictype Property MUSReward auto const Mandatory
GlobalVariable Property DLC04NukaWorldPowerOnGlobal Auto Const Mandatory
Quest Property DLC04GZTrackingQuest Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if DLC04MQ05.GetStage() == 110
			DLC04MQ05.SetStage(120)
		endif

		if DLC04PowerTracker.GetStage() == 100
			DLC04PowerTracker.SetStage(255)
			ParkPowerOn()
		endif
	endif
	
EndEvent

Function ParkPowerOn()

	Debug.Trace("DLC05MQ PARK POWER ON")
	fireworksREF_GZ.enable()
	fireworksREF_SA.enable()
	fireworksREF_DRG.enable()
	fireworksREF_NTUSA.enable()
	fireworksREF_KK.enable()
	DLC04OBJNukaPowerPlantPowerOnmarkerREF.enable()
	utility.wait(1)
	game.getPlayer().RampRumble(0.5, 0.25, 512)
	utility.wait(1)
	MUSReward.Add()
	DLC04_PowerPlantControlRoomEnableMarker.Enable()
	utility.wait(1)
	DLC04PPPowerOff.Disable()
	DLC04PPPowerOn.Enable()
	utility.wait(1)
	DLC04NIPowerOff.Disable()
	DLC04NIPowerOn.Enable()
	utility.wait(1)
	DLC04GZPowerOff.Disable()
	DLC04GZPowerOn.Enable()
	utility.wait(1)
	fireworksREF_GZ.playAnimation("stage2")
	DLC04DRGPowerOff.Disable()
	DLC04DRGPowerOn.Enable()
	utility.wait(1)
	fireworksREF_DRG.playAnimation("stage2")
	DLC04SAPowerOff.Disable()
	DLC04SAPowerOn.Enable()
	utility.wait(1)
	fireworksREF_SA.playAnimation("stage2")
	DLC04BPPowerOff.Disable()
	DLC04BPPowerOn.Enable()
	utility.wait(1)
	DLC04KKPowerOff.Disable()
	DLC04KKPowerOn.Enable()
	utility.wait(1)
	fireworksREF_KK.playAnimation("stage2")
	DLC04NTPowerOff.Disable()
	DLC04NTPowerOn.Enable()
	utility.wait(1)
	fireworksREF_NTUSA.playAnimation("stage2")

	;Ride Controllers Activate
	DLC04NukaWorldPowerOnGlobal.SetValue(1)

	;Galactic Zone - Let the Galactic Zone tracking quest know that power has been restored.
	DLC04GZTrackingQuest.SetStage(2000)
EndFunction