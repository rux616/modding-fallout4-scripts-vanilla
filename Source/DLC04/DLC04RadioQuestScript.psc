Scriptname DLC04:DLC04RadioQuestScript extends Quest Conditional

Int Property LastSong01 Auto Conditional

Int Property LastSong02 Auto Conditional

Int Property LastSong03 Auto Conditional

Int Property LastSong04 Auto Conditional

Int Property CurrentSong Auto Conditional

Function UpdateRadio()

;run whenever random info stack in SongControlScene picks a valid song

;	LastSong04 = LastSong03
;	LastSong03 = LastSong02
;	LastSong02 = LastSong01
;	LastSong01 = CurrentSong

EndFunction



Int Property EndNewsTriggered Auto Conditional

Float Property LastCycleStartTime Auto Conditional 

GlobalVariable Property GameDaysPassed Auto Const Mandatory

Int Property DLC04RadioTimerID = 55 Auto Conditional

Scene Property DLC04RadioQuestStationIdentScene01 Auto Const Mandatory

Scene[] Property AllRadioScenes auto const 
{ for debugging }

Function StartRadioTimer()

	StartTimerGameTime(4, DLC04RadioTimerID)

EndFunction



Event OnTimerGameTime(int aiTimerID)

;if timer finishes, and player hasn't been kicked out but new cycle hasn't started recently, jump-start radio

	if DLC04RaiderKickout.GetStageDone(20)==0
		if aiTimerID == DLC04RadioTimerID	
			if (LastCycleStartTime +0.5) < GameDaysPassed.GetValue()
				;restart the whole thing
				DLC04RadioQuestStationIdentScene01.Start()
			endif
			;run the timer again
			StartTimerGameTime(4,DLC04RadioTimerID)
		endif
	endif

EndEvent

function CheckScenes()
	debug.trace(self + " CheckScenes:")
	int i = 0
	bool playing
	while i < AllRadioScenes.Length 
		Scene theScene = AllRadioScenes[i]
		if theScene.isPlaying()
			playing = true
			debug.trace(self + "   " + theScene + " is playing")
		endif
		i += 1
	endWhile
	if playing == false 
		debug.trace(self + "   NO SCENES PLAYING")
	endif
endFunction
Quest Property DLC04RaiderKickout Auto Const Mandatory
