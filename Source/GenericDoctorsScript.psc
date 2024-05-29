Scriptname GenericDoctorsScript extends Quest Conditional

Scene Property DoctorMedicineScene03_AllDone Auto Const
Idle Property IdlePreppingNeedle Auto Const
MiscObject Property Caps001 Auto Const

ActorValue Property LeftAttackCondition auto const
ActorValue Property LeftMobilityCondition auto const
ActorValue Property PerceptionCondition auto const
ActorValue Property RightAttackCondition auto const
ActorValue Property RightMobilityCondition auto const
ActorValue Property EnduranceCondition Auto const

ActorValue Property Rads Auto const
ActorValue Property Health Auto const
SPELL Property CureAddictions Auto Const

Int Property DoctorJustCuredWounds Auto Conditional
Int Property DoctorJustCuredRads Auto Conditional
Int Property DoctorJustCuredAddict Auto Conditional

GlobalVariable Property ServiceCostCureWoundsLarge Auto Const
GlobalVariable Property ServiceCostCureWoundsSmall Auto Const
GlobalVariable Property ServiceCostCureRads Auto Const
GlobalVariable Property ServiceCostCureAddict Auto Const

Int Property ProcedureComplete Auto Conditional

Hardcore:HC_ManagerScript Property HC_Manager const auto mandatory
{autofill, for new survival mode}

Function HealInjuries(Actor myPatient)
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

	DoctorJustCuredWounds = 1
EndFunction

Function HealRadiation(Actor myPatient)
	int RadsToHeal = (mypatient.GetValue(Rads) as int)
	mypatient.RestoreValue(Rads, RadsToHeal)
	DoctorJustCuredRads = 1
EndFunction

Function HealAddiction(Actor myPatient)
	CureAddictions.Cast(myPatient, myPatient)
	DoctorJustCuredAddict = 1
EndFunction

;when the scene shuts down, make sure we clear out dialogue conditions
Function ClearDialogueConditions()
	DoctorJustCuredAddict = 0
	DoctorJustCuredRads = 0
	DoctorJustCuredWounds = 0
EndFunction

;disable player controls, play the needle animation, fade out, fade up
;myProcedure: 0 = Injuries, 1 = Rads, 2 = Addiction
Function StartMedical(Actor myDoctor, Int myProcedure)
	InputEnableLayer myLayer = InputEnableLayer.Create()
	Actor myPlayer = Game.GetPlayer()

	;remove money
	If myProcedure == 0
		If myPlayer.GetValuePercentage(Health) < 0.4
			myPlayer.RemoveItem(Caps001, ServiceCostCureWoundsLarge.GetValueInt())
		Else
			myPlayer.RemoveItem(Caps001, ServiceCostCureWoundsSmall.GetValueInt())
		EndIf
	ElseIf myProcedure == 1
		myPlayer.RemoveItem(Caps001, ServiceCostCureRads.GetValueInt())
	ElseIf myProcedure == 2
		myPlayer.RemoveItem(Caps001, ServiceCostCureAddict.GetValueInt())
	EndIf

	;track when the scene should progress
	ProcedureComplete = 0
	DoctorMedicineScene03_AllDone.Start()

	myLayer.DisablePlayerControls()
	myDoctor.PlayIdle(IdlePreppingNeedle)
	Utility.Wait(2.0)
	Game.FadeOutGame(True, True, 0.0, 3.0, True)
	Utility.Wait(4.0)
	Game.FadeOutGame(False, True, 0.0, 3.0)
	Utility.Wait(1.0)
	ProcedureComplete = 1

	;Run cure functions
	If myProcedure == 0
		HealInjuries(myPlayer)
	ElseIf myProcedure == 1
		HealRadiation(myPlayer)
	ElseIf myProcedure == 2
		HealAddiction(myPlayer)
	EndIf
	
	;InputEnableLayer clears when the function ends, but let's clear it just in case
	myLayer=None
EndFunction