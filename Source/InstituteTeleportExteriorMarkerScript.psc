Scriptname InstituteTeleportExteriorMarkerScript extends ObjectReference Conditional

Quest Property MQ207 Auto Const

GlobalVariable Property PlayerInstitute_Joined Auto Const

SPELL Property TeleportPlayerInSpell Auto Const

Int Property MQ207Teleport Auto Conditional

Quest Property InstKickOut Auto Const

Event OnTriggerEnter (ObjectReference ActionRef)


	if ActionRef == Game.GetPlayer()
		if MQ207.GetStageDone(180) && PlayerInstitute_Joined.GetValue()==0
			if MQ207Teleport==0

				Game.GetPlayer().AddSpell(TeleportPlayerInSpell, abVerbose=0)
				MQ207Teleport=1
				Utility.Wait(2.0)
				MQ207.SetStage(200)
			endif
		elseif InstKickOut.GetStage() == 100
			Game.GetPlayer().AddSpell(TeleportPlayerInSpell, abVerbose=0)
			Utility.Wait(2.0)
			InstKickOut.SetStage(200)	
			Self.Disable()
		endif
			
	endif


EndEvent
		