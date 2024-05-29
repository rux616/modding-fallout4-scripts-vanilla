Scriptname FFDiamondCityWantedScript extends Quest

ReferenceAlias Property NoteMarker Auto
ReferenceAlias Property Note Auto
ReferenceAlias Property MapMarker Auto
GlobalVariable Property XPRadiant Auto

ReferenceAlias Property DugoutNoteMarker Auto
ReferenceAlias Property DugoutNote Auto
WorldSpace Property DiamondCity Auto
Cell Property DmndDugoutInn01 Auto

Quest Property FFdiamondCityWantedPosterMisc Auto

Function StartupFunction()
	ObjectReference NoteREF = Note.GetRef()
	ObjectReference DugoutNoteREF = DugoutNote.GetRef()

	RegisterForRemoteEvent(DugoutNoteRef, "OnLoad")
	RegisterForRemoteEvent(NoteREF, "OnLoad")

	;taking these notes is not a crime
	NoteREF.SetActorOwner(Game.GetPlayer().GetActorBase())
	DugoutNoteREF.SetActorOwner(Game.GetPlayer().GetActorBase())
EndFunction

Event ObjectReference.OnLoad(ObjectReference akSender)
	ObjectReference DugoutNoteREF = DugoutNote.GetRef()
	ObjectReference NoteREF = Note.GetRef()

	;place in proper spot on the wanted board
	If akSender == DugoutNoteREF
		DugoutNoteREF.SetMotionType(DugoutNoteREF.Motion_Keyframed, TRUE)
		DugoutNoteREF.moveto(DugoutNoteMarker.GetRef(), abMatchRotation=True)
		UnRegisterForRemoteEvent(DugoutNoteRef, "OnLoad")
	EndIf

	If akSender == NoteREF
		NoteREF.SetMotionType(NoteREF.Motion_Keyframed, TRUE)
		NoteREF.moveto(NoteMarker.GetRef(), abMatchRotation=True)
		UnRegisterForRemoteEvent(NoteREF, "OnLoad")
	EndIf
EndEvent

Function ActivatedBoardFunction()
	;clear Dugout Note
	DugoutNote.GetRef().Disable()
	;clear objective to check out the wanted poster
	If FFdiamondCityWantedPosterMisc.IsRunning()
		FFdiamondCityWantedPosterMisc.SetStage(100)
	EndIf
EndFunction

Function ActivatedDugoutBoardFunction()
	;clear main note
	Note.GetRef().Disable()
	;clear objective to check out the wanted poster
	If FFdiamondCityWantedPosterMisc.IsRunning()
		FFdiamondCityWantedPosterMisc.SetStage(100)
	EndIf
EndFunction

Function NoteReadFunction()
	SetObjectiveDisplayed(10)
	;add map marker
	MapMarker.GetRef().AddtoMap()
EndFunction

Function QuestCompleteFunction()
	ObjectReference NoteREF = Note.GetRef()
	ObjectReference DugoutNoteREF = DugoutNote.GetRef()

	;cleanup notes
	If (NoteREF.GetContainer() == None) && (NoteREF.GetWorldSpace() == DiamondCity)
		NoteREF.Disable()
	EndIf

	If (DugoutNoteREF.GetContainer() == None) && (DugoutNoteREF.GetParentCell() == DmndDugoutInn01)
		DugoutNoteREF.Disable()
	EndIf

	If NoteREF.IsDisabled()
		NoteREF.Delete()
	EndIf

	If DugoutNoteREF.IsDisabled()
		DugoutNoteREF.Delete()
	EndIf 
	CompleteAllObjectives()
	;Game.RewardPlayerXP(XPRadiant.GetValue() as int)
	Stop()
EndFunction