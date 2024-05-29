Scriptname Hardcore:HC_CannibalDiseaseEvent extends Perk Const

Hardcore:HC_ManagerScript property HC_Manager auto const mandatory

Event OnEntryRun(int auiEntryID, ObjectReference akTarget, Actor akOwner)
	HC_Manager.PlayerEatsCorpse()

EndEvent
