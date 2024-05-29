Scriptname InstituteEmergencyRelayButtonScript extends ObjectReference Conditional

Quest Property DialogueInstitute Auto Const


Event OnActivate(ObjectReference ActivateRef)


	if MQ302.GetStage() < 100
		if MQ207.GetStage() >= 200
			if ActivateRef == Game.GetPlayer()
				if (DialogueInstitute as DialogueInstituteQuestScript).EmergencyRelayActive==0
					(DialogueInstitute as DialogueInstituteQuestScript).EmergencyRelayActive=1
					DialogueInstituteEmergencyRelayActiveScene.Start()
				endif
			endif
		else
			InstEmergencyRelayOfflineMessage.Show()
		endif
	else	
		InstEmergencyRelayOfflineMessage.Show()
	endif
EndEvent

Scene Property DialogueInstituteEmergencyRelayActiveScene Auto Const

Quest Property MQ302 Auto Const
Quest Property MQ207 Auto Const
Message Property InstEmergencyRelayOfflineMessage Auto Const
