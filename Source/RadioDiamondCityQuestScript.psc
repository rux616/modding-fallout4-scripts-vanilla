Scriptname RadioDiamondCityQuestScript extends Quest  Conditional

Int Property CurrentSong Auto  Conditional

Int Property LastSong01 Auto  Conditional

Int Property LastSong02 Auto  Conditional

Int Property LastSong03 Auto  Conditional

Int Property LastSong04 Auto  Conditional

Int Property LastSong05 Auto  Conditional

Int Property LastSong06 Auto  Conditional

Int Property LastSong07 Auto  Conditional

Int Property LastSong08 Auto  Conditional

Int Property LastSong09 Auto  Conditional

Int Property LastSong10 Auto  Conditional



Int Property SongIntroPlayed Auto  Conditional

Int Property SongOutroPlayed Auto  Conditional

Int Property SongCount Auto  Conditional

Int Property TraceVar Auto  Conditional

Function UpdateRadio()

	SongCount += 1

	LastSong10 = LastSong09
	LastSong09 = LastSong08
	LastSong08 = LastSong07
	LastSong07 = LastSong06
	LastSong06 = LastSong05
	LastSong05 = LastSong04
	LastSong04 = LastSong03
	LastSong03 = LastSong02
	LastSong02 = LastSong01
	LastSong01 = CurrentSong

EndFunction
Int Property SongLoop Auto Conditional

Int Property ShroudEpisode Auto Conditional


Int Property LastNews01 Auto Conditional

Int Property LastNews02 Auto Conditional

Int Property LastNews03 Auto Conditional

Int Property LastNews04 Auto Conditional

Function UpdateNews(int CurrentNews)

	LastNews04 = LastNews03
	LastNews03 = LastNews02
	LastNews02 = LastNews01
	LastNews01 = CurrentNews

EndFunction
Int Property CyclesPlayed Auto Conditional

Int Property EndNewsTriggered Auto Conditional

Float Property LastSceneStartTime Auto Conditional 

GlobalVariable Property GameDaysPassed Auto Const Mandatory

Int Property RadioDCTimerID = 25 Auto Conditional

Function StartRadioTimer()

StartTimerGameTime(12, RadioDCTimerID)

EndFunction



Event OnTimerGameTime(int aiTimerID)
	if aiTimerID == RadioDCTimerID
		if (LastSceneStartTime + 1) < GameDaysPassed.GetValue()
			;restart the whole thing
			DiamondCityRadioMusicScene.Start()
		endif
		;run the timer again
		StartTimerGameTime(12,RadioDCTimerID)
	endif


EndEvent
Scene Property DiamondCityRadioMusicScene Auto Const Mandatory
