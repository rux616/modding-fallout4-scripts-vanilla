Scriptname DLC03:DLC03ConvFarHarborCoAEndingScript extends Quest

Scene Property pDLC03ConvFarHarborCoAEnding_00_Start Auto Const Mandatory

Function OpeningScene()

	StartTimer(1.0)

EndFunction

Event OnTimer(int timerID)
	if timerID == 0
		if ( !GetStageDone(100) )
			StartTimer(1.0)
			pDLC03ConvFarHarborCoAEnding_00_Start.Start()
		endif
	endif
EndEvent