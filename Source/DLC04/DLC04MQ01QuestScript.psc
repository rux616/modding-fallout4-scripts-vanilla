Scriptname DLC04:DLC04MQ01QuestScript extends Quest

Scene Property DLC04MQ01_PAGauntletNukaStationLoop Auto Const Mandatory
Scene Property DLC04MQ01_PAGauntletInteriorLoop Auto Const Mandatory
Scene Property DLC04MQ01_PAGauntletExteriorLoop Auto Const Mandatory
Location Property DLC04NukaStationLocation Auto Const Mandatory
Location Property DLC04GauntletLocation Auto Const Mandatory

;This script was created to check when the player is not making progress while venturing through the Gauntlet.
;A timer is set after a stage is set in the quest (which is assumed to show progress). Should no further stages
;be set after 60 seconds, it will start a looping scene where Redeye makes comments about the player being
;slow and not doing enough. Once progress is made again, the scene should stop and the timer is reset.

Event OnStageSet(int auiStageID, int auiItemID)
	If auiStageID >= 201 && auiStageID < 250
		DLC04MQ01_PAGauntletNukaStationLoop.Stop()
		DLC04MQ01_PAGauntletInteriorLoop.Stop()
		DLC04MQ01_PAGauntletExteriorLoop.Stop()
		StartTimer(60)	
	EndIf
EndEvent

;There are three different scenes to play depending on where the player is in the Gauntlet. This is because
;the scenes are played by a different X marker, so when the timer goes off, the script runs checks to find
;out where the player is so the proper scene can play.

Event OnTimer(int aiTimerID)
	If Game.GetPlayer().IsInLocation(DLC04NukaStationLocation) && DLC04MQ01_PAGauntletNukaStationLoop.IsPlaying() == 0
		DLC04MQ01_PAGauntletNukaStationLoop.Start()
	ElseIf Game.GetPlayer().IsInLocation(DLC04GauntletLocation) && Game.GetPlayer().IsInInterior() && DLC04MQ01_PAGauntletInteriorLoop.IsPlaying() == 0
		DLC04MQ01_PAGauntletInteriorLoop.Start()
	ElseIf Game.GetPlayer().IsInLocation(DLC04GauntletLocation) && DLC04MQ01_PAGauntletExteriorLoop.IsPlaying() == 0
		DLC04MQ01_PAGauntletExteriorLoop.Start()
	EndIf
EndEvent
