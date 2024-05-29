Scriptname DN036QuestScript extends Quest Conditional


bool property KnowsSynthExpert = false Auto hidden Conditional
int GetOutTimer = 100
int GetOutTimeLimit = 300

int LeftArea = 99
int LeftAreaTimer = 72

Quest Property DN036_Post Auto Const
ReferenceAlias Property Alias_Phyllis Auto Const

ObjectReference Property DN036CovenantCellMarker Auto Const
ObjectReference Property DN036NotePlacementMarker Auto Const
ObjectReference Property DN036GiftEnableMarker Auto Const
ObjectReference Property NoteActual Auto Hidden
ObjectReference Property DN036BloodEnableParent Auto Const

bool Property EndingComplete = false Auto Conditional Hidden

Group Notes
	Book Property DN036CompassionNote Auto Const
	Book Property DN036CompassionSonNote Auto Const
	Book Property DN036JustMoveOnNote Auto Const
	Book Property DN036MinutemenNote Auto Const
	Book Property DN036RailroadNote Auto Const
	Book Property DN036ToughLoveNote Auto Const
	Book Property DN036CovenantNote Auto Const
EndGroup

Function StartGetOutTimer()
	StartTimer(GetOutTimeLimit , GetOutTimer)
endFunction

Event OnTimer(int aiTimerID)
    if aiTimerID == GetOutTimer && GetStageDone(195) == false
    	setstage(499)
    endif
EndEvent


Event OnTimerGameTime(int aiTimerID)
	;If phyllis is going to leave the commonwealth, this timer tells her it is time
	Actor Phyllis = Alias_Phyllis.GetActorRef()
    if aiTimerID == LeftArea && !Phyllis.IsDead() && !DN036_Post.GetStageDone(30)
    	PhyllisLeavesCommonwealth()
    Endif
EndEvent


Function EgretHasLoaded()
	CancelTimerGameTime(LeftArea)
	if EndingComplete
		SetStage(1000)
	Endif
endFunction

;On unload of the area, check if phyllis is going to leave and if so start the timer
Function EgretHasUnloaded()
	Actor Phyllis = Alias_Phyllis.GetActorRef()
	if !Phyllis.IsDead() && !EndingComplete
		if DN036_Post.SetStage(10) && (!DN036_Post.SetStage(13) || !DN036_Post.SetStage(14))
			;Player has misc objective so don't send her away
		elseif DN036_Post.SetStage(20) && !DN036_Post.SetStage(23)
			;Player has misc objective so don't send her away
		elseif GetStageDone(600)
			StartTimerGameTime(LeftAreaTimer, LeftArea)
		endif
	endif
EndFunction

Function MiscObjectiveFailedStartTimer()
	;Try To Start the timer again
	EgretHasUnloaded()
EndFunction

;
Function CovenantBaseHasLoaded()
	Actor Phyllis = Alias_Phyllis.GetActorRef()
	If GetStageDone(514) && !Phyllis.IsDead()
		Phyllis.MoveTo(DN036CovenantCellMarker)
		Phyllis.AddItem(DN036CovenantNote)
		Phyllis.Kill()
		DN036_Post.SetStage(30)
		EndingComplete = true
		SetStage(1000)
	endif
EndFunction

Function RailRoadEnding()
	if NoteActual != none
		NoteActual.Delete()
	endif
	NoteActual = DN036NotePlacementMarker.PlaceAtMe(DN036RailroadNote)
	DN036GiftEnableMarker.Enable()
	EndingComplete = true
	SetStage(1000)
EndFunction

Function InstituteEnding()
	Actor Phyllis = Alias_Phyllis.GetActorRef()
	DN036BloodEnableParent.Enable()
	Phyllis.Disable()
	Phyllis.Delete()
	EndingComplete = true
	SetStage(1000)
EndFunction

Function PhyllisLeavesCommonwealth()
	Actor Phyllis = Alias_Phyllis.GetActorRef()
	Phyllis.Disable()
	Phyllis.Delete()
	if GetStageDone(511)		;tough love
		NoteActual = DN036NotePlacementMarker.PlaceAtMe(DN036ToughLoveNote)
	elseif GetStageDone(510)	;Player Asked her to join the minutemen
		NoteActual = DN036NotePlacementMarker.PlaceAtMe(DN036MinutemenNote)
	elseif GetStageDone(512)	;Compassion
		if GetStageDone(202)	;Talked about your son
			NoteActual = DN036NotePlacementMarker.PlaceAtMe(DN036CompassionSonNote)
		else
			NoteActual = DN036NotePlacementMarker.PlaceAtMe(DN036CompassionNote)
		endif
	elseif GetStageDone(513)	;why not leave
		NoteActual = DN036NotePlacementMarker.PlaceAtMe(DN036JustMoveOnNote)
	endif
	DN036GiftEnableMarker.Enable()
	EndingComplete = true
EndFunction