Scriptname DN017_ToggleButtonRocketScript extends ToggleButtonScript
{Variant of the standard toggle button used for the DN017 Rocket Fire toggle button. Plays scenes and/or sound effects instead of displaying failure messages.}

Group DN017_Properties
	DN017QuestScript property DN017 Auto Const Mandatory
	{DN017}

	Scene property BoS101ArcJetComputerScene00 Auto Const Mandatory
	{Early failure scene: Power is off.}

	Scene property BoS101ArcJetComputerScene04 Auto Const Mandatory
	{Late failure scene: Fuel depleted after firing.}

	Sound property OBJActivateButtonFailGeneric Auto Const Mandatory
	{Sound to play when a button press fails.}
EndGroup


State Inactive
	Event OnActivate(ObjectReference akActionRef)
		;Play button press animation.
		PlayAnimation(animationName)
		Utility.Wait(0.5)
		;Play failure sound.
		OBJActivateButtonFailGeneric.Play(Self)
		Utility.Wait(0.5)
		;Do we want to play one of the failure scenes? Omit if one is already playing, or the rocket fire is in progress.
		int currentStage = DN017.GetStage()
		if (!BoS101ArcJetComputerScene00.IsPlaying() && !BoS101ArcJetComputerScene04.IsPlaying() && ((currentStage < 90) || (currentStage >= 99)))
			if (currentStage < 80)
				;Play early failure scene.
				BoS101ArcJetComputerScene00.Start()
			Else
				;Play late failure scene.
				BoS101ArcJetComputerScene04.Start()
			EndIf
		EndIf
	EndEvent
EndState

State Active
	Event OnActivate(ObjectReference akActionRef)
		;Play button press animation.
		PlayAnimation(animationName)
		;Fire the rocket.
		DN017.RocketButtonActivated()
		SetActive(False)
	EndEvent
EndState