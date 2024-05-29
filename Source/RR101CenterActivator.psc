Scriptname RR101CenterActivator extends ObjectReference Conditional

ObjectReference Property pRR101PuzzleRingActivator Auto Const
ObjectReference Property pRR101PuzzleBase Auto Const
ObjectReference Property pRR101SecretDoor Auto Const
ObjectReference Property pRR101SecretDoorNavCut Auto 
Quest Property pRR101 Auto Const
Int Property CurrentPuzzleLetter Auto Conditional
Message Property pRR101_TempMarkerFailure Auto Const
Message Property pRR101_TempMarkerSuccess Auto Const
Scene Property pRR101_PuzzleFirstCorrect Auto Const
Scene Property pRR101_PuzzleFirstSpin Auto Const
Scene Property pRR101_PuzzleSelectWrong Auto Const
Scene Property pRR101_PuzzleSolved Auto Const
Scene Property pRR101_PuzzleStartOver Auto Const
sound Property pQSTRR01RailroadPuzzleSelectSuccess Auto Const
sound Property pQSTRR01RailroadPuzzleSelectFail Auto Const
sound Property pQSTRR01RailroadPuzzleSolve Auto Const

int nLetterSelected
int bCorrectLetterEntered
int bFirstCorrect
int bFirstWrong

auto STATE waitingForPlayer
	EVENT onActivate(objectReference triggerRef)
		Self.PlayAnimation("PlayAnimation")
		Debug.Trace(self)

		nLetterSelected = (pRR101PuzzleRingActivator as RR101TrailSping).Letter

		Debug.Trace("CurrentPuzzleLetter = " + CurrentPuzzleLetter + ", nLetterSelected = " + nLetterSelected)

		if ( CurrentPuzzleLetter == 0 )			; Looking for - RRRRR
			if ( nLetterSelected == 4 || nLetterSelected == 11 )
				bCorrectLetterEntered = 1
			endif		
		elseif ( CurrentPuzzleLetter == 1 )		; Looking for - AAAAA
			if ( nLetterSelected == 12 )
				bCorrectLetterEntered = 1
			endif		
		elseif ( CurrentPuzzleLetter == 2 )		; Looking for - IIIII
			if ( nLetterSelected == 13 )
				bCorrectLetterEntered = 1
			endif		
		elseif ( CurrentPuzzleLetter == 3 )		; Looking for - LLLLL
			if ( nLetterSelected == 14 )
				bCorrectLetterEntered = 1
			endif		
		elseif ( CurrentPuzzleLetter == 4 )		; Looking for - RRRRR
			if ( nLetterSelected == 4 || nLetterSelected == 11 )
				bCorrectLetterEntered = 1
			endif		
		elseif ( CurrentPuzzleLetter == 5 )		; Looking for - OOOOO
			if ( nLetterSelected == 8 || nLetterSelected == 16 || nLetterSelected == 19 )
				bCorrectLetterEntered = 1
			endif		
		elseif ( CurrentPuzzleLetter == 6 )		; Looking for - AAAAA
			if ( nLetterSelected == 12 )
				bCorrectLetterEntered = 1
			endif		
		elseif ( CurrentPuzzleLetter == 7 )		; Looking for - DDDDD
			if ( nLetterSelected == 7 )
				pRR101.SetStage(400)	; Puzzle solved
				bCorrectLetterEntered = 1

				; Play the puzzle solved sound
				pQSTRR01RailroadPuzzleSolve.Play(self)

				; Make it so you can't mess with the puzzle
				pRR101SecretDoorNavCut.BlockActivation(true, true)
				pRR101PuzzleBase.BlockActivation(true, true)
				pRR101PuzzleRingActivator.BlockActivation(true, true)
				BlockActivation(true, true)

				; Let the sound finish before opening the door
				; Open the secret door, disable the activators
				Utility.Wait(3.5)
				pRR101SecretDoor.setOpen(true)

				; Play some player VO
				Utility.Wait(1.0)
				pRR101_PuzzleSolved.Start()
			endif		
		endif

		; RESOLUTION OF THE LETTER CHOSEN
		if ( bCorrectLetterEntered == 1 )
			Debug.Trace("Correct letter chosen.")

			; Play the correct sound
			int nCorrectSound = pQSTRR01RailroadPuzzleSelectSuccess.Play(self)
			Sound.SetInstanceVolume(nCorrectSound, 1.5)

			; If this is the first correct play a scene
			if ( bFirstCorrect == 0 )
				pRR101_PuzzleFirstCorrect.Start()
				bFirstCorrect = 1
			endif
		
			CurrentPuzzleLetter += 1  	; Cycle to the next letter it's looking for
		else 
			Debug.Trace("Incorrect letter chosen.")

			; Play the incorrect sound
			int nFailSound = pQSTRR01RailroadPuzzleSelectFail.Play(self)
			Sound.SetInstanceVolume(nFailSound, 1.5)

			; If this is the first incorrect selection play a scene
			if ( bFirstWrong == 0 )
				pRR101_PuzzleSelectWrong.Start()
				bFirstWrong = 1
			endif

			; If the player has selected some of the right letters play some dialog
			if ( CurrentPuzzleLetter > 0 )
				pRR101_PuzzleStartOver.Start()
			endif

			CurrentPuzzleLetter = 0  	; Reset the puzzle - looking for the first letter now
		endif

		bCorrectLetterEntered = 0

	endEVENT
endSTATE






