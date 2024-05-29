Scriptname DLC03:DLC03POI04_RepairActivateScript extends ObjectReference Hidden Conditional

Component Property RepairItemType Auto Const Mandatory
Int Property RepairItemCount Auto Const Mandatory
ActorValue Property SkillRequired Auto Const Mandatory
Int Property SkillNumberRequired Auto Const Mandatory
ObjectReference Property EnableMarkerRef Auto Const Mandatory
ObjectReference Property LightToEnable Auto Const Mandatory
Message Property RepairMessageToShow Auto Const Mandatory
Message Property MissingComponentsMessage Auto Const Mandatory
Message Property JuryRigFailMessage Auto Const Mandatory
Message Property JuryRigSuccessMessage Auto Const Mandatory
Message Property LuckFailMessage Auto Const Mandatory
Message Property LuckSuccessMessage Auto Const Mandatory
ObjectReference Property CircuitBreakerRef Auto Const Mandatory
Sound Property TurnOnSound Auto Const Mandatory
Sound Property RepairSound Auto Const Mandatory
Sound Property HitSound Auto Const Mandatory
ObjectReference Property LoopingSoundMarker	Auto Const Mandatory
Bool Property FailedLuck Auto Conditional

Event OnActivate(ObjectReference akActionRef)
	Debug.Trace("I've been activated by " + akActionRef)
	ObjectReference PlayerRef = Game.GetPlayer()
    if akActionRef == PlayerRef
    	int ButtonPressed = RepairMessageToShow.Show()
		if ButtonPressed == 0
			;Do Nothing
		elseif ButtonPressed == 1	; Components
			if PlayerRef.GetComponentCount(RepairItemType) >= RepairItemCount
				PlayerRef.RemoveComponents(RepairItemType, RepairItemCount)
				RepairObject()
			else
				MissingComponentsMessage.Show(RepairItemCount)
			endif
		elseif ButtonPressed == 2 	; SPECIAL Skill
			if PlayerRef.GetValue(SkillRequired) >= SkillNumberRequired
				JuryRigSuccessMessage.Show()
				RepairObject()
			else
				JuryRigFailMessage.Show()
			endif
		elseif ButtonPressed == 3	; LUCK
			int instanceID = HitSound.play(Game.GetPlayer())
			Sound.SetInstanceVolume(instanceID, 1)
			BlockActivation(TRUE,TRUE)
			utility.Wait(0.5)
			int RandomLuckNumber = Utility.RandomInt(1, 10)
			Debug.Trace(self + "| Random Number is " + RandomLuckNumber)
			Debug.Trace(self + "| Player Luck is " + PlayerRef.GetValue(Game.GetLuckAV()))
			if RandomLuckNumber <= PlayerRef.GetValue(Game.GetLuckAV())
				Debug.Trace(self + "| Player was lucky enough to win!")
				LuckSuccessMessage.Show()
				RepairObject()
				BlockActivation(FALSE,FALSE)
			else
				LuckFailMessage.Show()
				FailedLuck = TRUE
				BlockActivation(FALSE,FALSE)
			endif

		endif
    elseif akActionRef == GetLinkedRef()
	    int instanceID = TurnOnSound.play(PlayerRef)
		Sound.SetInstanceVolume(instanceID, 1)
		Game.ShakeCamera(PlayerRef, 0.25, 1)
		Game.ShakeController(0.25, 0.25, 1)
		Utility.Wait(0.25)
		LoopingSoundMarker.EnableNoWait()
    endif
EndEvent

Function RepairObject()
	(CircuitBreakerRef as CircuitBreakerMasterScript).DenyOnPosition = FALSE
	EnableMarkerRef.EnableNoWait()
	LightToEnable.EnableNoWait()
    int instanceID = RepairSound.play(Game.GetPlayer())
	Sound.SetInstanceVolume(instanceID, 1)
EndFunction