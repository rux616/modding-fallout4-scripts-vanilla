Scriptname DLC04:DLC04MQ05WeatherOverrideScript extends ObjectReference Const

Quest Property DLC04MQ05 Auto Const Mandatory
Quest Property DLC04PowerTracker Auto Const Mandatory
Quest Property DLC04MQ05WeatherOverride Auto Const Mandatory
Weather Property DLC04NukaWorldEndgameDark Auto Const Mandatory
GlobalVariable Property DLC04WeatherToggled Auto Const Mandatory

Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef == Game.GetPlayer()
		If DLC04MQ05.GetStage() >= 30 || DLC04PowerTracker.getstage() == 100
 			If DLC04WeatherToggled.GetValue() == 0
 				DLC04NukaWorldEndgameDark.ForceActive(true)
 				DLC04MQ05WeatherOverride.Start()
 				DLC04WeatherToggled.SetValue(1)
			EndIf
		EndIf	
	EndIf
EndEvent