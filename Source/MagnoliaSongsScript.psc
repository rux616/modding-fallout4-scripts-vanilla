Scriptname MagnoliaSongsScript extends Quest Conditional

Int Property var_CurrentSong Auto Conditional
;"I'm the One You're Looking For"
Scene Property MagnoliaSong1 Auto const
;"Baby It's Just You"
Scene Property MagnoliaSong2 Auto const
;"Goodneighbor"
Scene Property MagnoliaSong3 Auto const
;"Man Enough"
Scene Property MagnoliaSong4 Auto const
;"Train Train"
Scene Property MagnoliaSong5 Auto const
Location Property GoodneighborTheThirdRailLocation Auto const

bool Property AllowSinging = true Conditional Auto Hidden  	; set to false to prevent her from starting back singing after taking a break

bool OnBreak = false conditional
bool SongPlayingNow = false conditional

int var_LastSong conditional

ReferenceAlias Property GenericNPC01 Auto const
ReferenceAlias Property GenericNPC02 Auto const
ReferenceAlias Property GenericNPC03 Auto const
Action Property ActionCustomCheering Auto const

; plays song in order
Function PlaySong()
	If (var_LastSong == 0) || (var_LastSong == 5)
		var_LastSong = 1
		MagnoliaSong1.Start()
	ElseIf var_LastSong == 1
		var_LastSong = 2
		MagnoliaSong2.Start()
	ElseIf var_LastSong == 2
		var_LastSong = 3
		MagnoliaSong3.Start()
	ElseIf var_LastSong == 3
		var_LastSong = 4
		MagnoliaSong4.Start()
	ElseIf var_LastSong == 4
		var_LastSong = 5
		MagnoliaSong5.Start()
	EndIf								
EndFunction

Function PickNewSong()
	If OnBreak == false
		PlaySong()
	EndIf
EndFunction

Function SongEnded()
	; Magnolia takes a break for a few hours
	SongPlayingNow = False
	OnBreak = true
	StartTimerGameTime(4, 10)
EndFunction

Function StopAllSongs()
	MagnoliaSong1.Stop()
	MagnoliaSong2.Stop()
	MagnoliaSong3.Stop()
	MagnoliaSong4.Stop()
	MagnoliaSong5.Stop()
EndFunction

Function ForceNewSong()
	OnBreak = false
	PlaySong()
EndFunction


Event OnTimerGameTime(int aiTimerID)
	If aiTimerID == 10
		OnBreak = false
		If Game.GetPlayer().GetCurrentLocation() == GoodneighborTheThirdRailLocation && AllowSinging
			PickNewSong()
		EndIf
	EndIf
EndEvent

Function SetAllowSinging(bool bAllowSinging)
	AllowSinging = bAllowSinging
	if AllowSinging && OnBreak == 0 && Game.GetPlayer().GetCurrentLocation() == GoodneighborTheThirdRailLocation
		PickNewSong()
	endif
endFunction

Function SongStarted()
	SongPlayingNow = true
EndFunction

Function AudienceClaps()
	;GenericNPC01.GetActorRef().PlayIdleAction(ActionCustomCheering)
	GenericNPC02.GetActorRef().PlayIdleAction(ActionCustomCheering)
	GenericNPC03.GetActorRef().PlayIdleAction(ActionCustomCheering)
EndFunction