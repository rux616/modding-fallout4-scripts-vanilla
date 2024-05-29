Scriptname DialogueInstituteQuestScript extends Quest Conditional

Int Property ShaunDeactivated Auto Conditional

;Quest variables to track Department Head greetings
Int Property AlanGreeted Auto Conditional
Int Property JustinGreeted Auto Conditional
Int Property AllieGreeted Auto Conditional
Int Property MadisonGreeted Auto Conditional
Int Property ClaytonGreeted Auto Conditional
Int Property EmergencyRelayActive Auto Conditional

;Properties for Institute doctor functions
Scene Property DialogueInstituteDoctorDoneScene Auto Const
Idle Property IdlePreppingNeedle Auto Const
MiscObject Property Caps001 Auto Const

;Properties for healing conditions
ActorValue Property LeftAttackCondition auto const
ActorValue Property LeftMobilityCondition auto const
ActorValue Property PerceptionCondition auto const
ActorValue Property RightAttackCondition auto const
ActorValue Property RightMobilityCondition auto const
ActorValue Property EnduranceCondition Auto const

;Properties for healing rads (not currently used, but included in case we want to add it later)
ActorValue Property Rads Auto const
ActorValue Property Health Auto const

;Properties for healing addiction (not currently used, but included in case we want to add it later)
SPELL Property CureAddictions Auto Const

Hardcore:HC_ManagerScript Property HC_Manager const auto mandatory
{autofill, for new survival mode}

Function HealInjuries(Actor myPatient)
	int RadsToHeal = (mypatient.GetValue(Rads) as int)
	mypatient.RestoreValue(Rads, RadsToHeal)
	myPatient.RestoreValue(Health, 9999)
	myPatient.RestoreValue(LeftAttackCondition, 9999)
	myPatient.RestoreValue(LeftMobilityCondition, 9999)
	myPatient.RestoreValue(PerceptionCondition, 9999)
	myPatient.RestoreValue(RightAttackCondition, 9999)
	myPatient.RestoreValue(RightMobilityCondition, 99999)
	myPatient.RestoreValue(EnduranceCondition, 9999)

	;for new survival - curing diseases
	if myPatient == Game.GetPlayer()
		HC_Manager.ClearDisease()
	endif
EndFunction

;Function HealRadiation(Actor myPatient)
;	int RadsToHeal = (mypatient.GetValue(Rads) as int)
;	mypatient.RestoreValue(Rads, RadsToHeal)
;EndFunction

Function HealAddiction(Actor myPatient)
	CureAddictions.Cast(myPatient, myPatient)
EndFunction

;disable player controls, play the needle animation, fade out, fade up
;myProcedure: 0 = Injuries, 1 = Rads, 2 = Addiction
Function StartMedical(Actor myDoctor, Int myProcedure)
	InputEnableLayer myLayer = InputEnableLayer.Create()
	Actor myPlayer = Game.GetPlayer()

	myLayer.DisablePlayerControls()
	myDoctor.PlayIdle(IdlePreppingNeedle)
	Utility.Wait(2.0)
	Game.FadeOutGame(True, True, 0.0, 3.0, True)
	Utility.Wait(4.0)
	Game.FadeOutGame(False, True, 0.0, 3.0)
	Utility.Wait(1.0)
	DialogueInstituteDoctorDoneScene.Start()

	If myProcedure == 0
		HealInjuries(myPlayer)
	;ElseIf myProcedure == 1
	;	HealRadiation(myPlayer)
	;ElseIf myProcedure == 2
	;	HealAddiction(myPlayer)
	EndIf
EndFunction

