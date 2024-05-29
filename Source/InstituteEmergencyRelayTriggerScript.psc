Scriptname InstituteEmergencyRelayTriggerScript extends ObjectReference Conditional

Quest Property DialogueInstitute Auto

ObjectReference Property CITRuinsMarker Auto Const

Quest Property InstituteKickOut Auto Const

Quest Property MQ302 Auto Const

Bool Property ReadyToGo Auto Conditional

Bool Property PlayerInTrigger Auto Conditional

Scene Property InstKickOutShaunScene Auto Conditional


Event OnTriggerEnter(ObjectReference ActionRef)


;Before we do anything else, make sure MQ302 isnt running

	if MQ302.IsRunning() == 0


;if InstKickOut is at Stage 10 or 20, run the appropriate scene




;		if InstituteKickOut.GetStage() == 10 || InstituteKickOut.GetStage() == 20
		if InstituteKickOut.GetStage() == 10
;turn off normal functionality
			(DialogueInstitute as DialogueInstituteQuestScript).EmergencyRelayActive = 0

;disable player controls
			(InstituteKickOut as InstKickOutQuestScript).ControlToggle(0)

;run appropriate scene
			(InstituteKickOut as InstKickOutQuestScript).PlayerInRelay=1
			if Shaun.GetActorReference().IsDead() == 0
				InstKickoutShaunScene.Start()
			else
				InstKickoutShaunDeadScene.Start()
			endif
		endif

	
		if (DialogueInstitute as DialogueInstituteQuestScript).EmergencyRelayActive == 1

			if ActionRef == Game.GetPlayer()

;set bool for player being inside trigger
				PlayerInTrigger = True

				if ReadyToGo == True

;reset vars and move player above ground
					RunTeleporter()

				endif
			endif
		endif
	endif

EndEvent

Event OnTriggerLeave(ObjectReference ActionRef)


;Turn off bool if player leaves trigger
	if ActionRef == Game.GetPlayer()
		if PlayerInTrigger == True
			PlayerInTrigger = False
		endif
	endif
EndEvent		



Function RunTeleporter()

				if InstituteKickOut.GetStage() == 20
					InstituteKickOut.SetStage(100)
				else



					ReadyToGo = False
					(DialogueInstitute as DialogueInstituteQuestScript).EmergencyRelayActive = 0			
					Game.GetPlayer().AddSpell(TeleportPlayerOutSpell, abVerbose=False)
					Utility.Wait(4.0)
					Game.GetPlayer().MoveTo(CITRuinsMarker)
				endif
EndFunction

ReferenceAlias Property shaun Auto Const

Scene Property InstKickOutShaunDeadScene Auto Const

SPELL Property TeleportPlayerOutSpell Auto Const Mandatory
