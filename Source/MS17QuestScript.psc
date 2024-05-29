Scriptname MS17QuestScript extends Quest Conditional

Int Property pCounterBarter Auto 
Int Property pCounterBigGuns Auto 
Int Property pCounterEnergyWeapons Auto 
Int Property pCounterExplosives Auto 
Int Property pCounterLockpick Auto 
Int Property pCounterMedicine Auto 
Int Property pCounterMeleeWeapons Auto 
Int Property pCounterRepair Auto 
Int Property pCounterScience Auto 
Int Property pCounterSmallGuns Auto 
Int Property pCounterSneak Auto 
Int Property pCounterSpeech Auto 
Int Property pCounterUnarmed Auto 
Int Property pCounterHighestValue Auto 

; custom event sent when th player starts investigating Covenant
CustomEvent MS17Investigate

GlobalVariable Property pMS17_QuestionAnswer Auto Const

int nMenuIndex             ; This is for which button has been pushed
string sDebugText          ; What debug text to display

function InvestigateStarts(bool bBool = TRUE )
	; send custom event for the investigation
	Var[] kargs = new Var[1]
	kargs[0] = bBool
	SendCustomEvent("MS17Investigate", kargs)		
endFunction

Function MS17_RunQuestion(int nQuestionNumber, message mQuestionMessage, scene sSceneToPlay)
	; Show the menu, set up a global variable with the player's choice
	nMenuIndex = mQuestionMessage.Show()
	pMS17_QuestionAnswer.SetValue(nMenuIndex)

	; Run custom logic depending on what question you're on
	; QUESTION ONE
	if ( nQuestionNumber == 1 )
		if ( nMenuIndex == 0 )
		     sDebugText = "Science +1."
		     pCounterScience += 1
		elseif ( nMenuIndex == 1 )
		     sDebugText = "Speech +1."
		     pCounterSpeech += 1
		elseif ( nMenuIndex == 2 )
		     sDebugText = "Melee +1."
		     pCounterMeleeWeapons += 1
		elseif ( nMenuIndex == 3 )
		     sDebugText = "Sneak +1."
		     pCounterSneak += 1
		endif

	; QUESTION TWO
	elseif ( nQuestionNumber == 2 )
		if ( nMenuIndex == 0 )
		     sDebugText = "Melee +1."
		     pCounterMeleeWeapons += 1
		elseif ( nMenuIndex == 1 )
		     sDebugText = "Speech +1."
		     pCounterSpeech += 1
		elseif ( nMenuIndex == 2 )
		     sDebugText = "Medicine +1."
		     pCounterMedicine += 1
		elseif ( nMenuIndex == 3 )
		     sDebugText = "Science +1."
		     pCounterScience += 1
		endif

	; QUESTION THREE
	elseif ( nQuestionNumber == 3 )
		if ( nMenuIndex == 0 )
		     sDebugText = "Speech +1."
		     pCounterSpeech += 1
		elseif ( nMenuIndex == 1 )
		     sDebugText = "Unarmed +1."
		     pCounterUnarmed += 1
		elseif ( nMenuIndex == 2 )
		     sDebugText = "Sneak +1."
		     pCounterSneak += 1
		elseif ( nMenuIndex == 3 )
		     sDebugText = "No advancement."
		endif

	; QUESTION FOUR
	elseif ( nQuestionNumber == 4 )
		if ( nMenuIndex == 0 )
		     sDebugText = "Explosives +1."
		     pCounterExplosives += 1
		elseif ( nMenuIndex == 1 )
		     sDebugText = "Big Guns +1."
		     pCounterBigGuns += 1
		elseif ( nMenuIndex == 2 )
		     sDebugText = "Melee +1."
		     pCounterMeleeWeapons += 1
		elseif ( nMenuIndex == 3 )
		     sDebugText = "Unarmed +1."
		     pCounterUnarmed += 1
		endif

	; QUESTION FIVE
	elseif ( nQuestionNumber == 5 )
		if ( nMenuIndex == 0 )
		     sDebugText = "Small Guns +1."
		     pCounterSmallGuns += 1
		elseif ( nMenuIndex == 1 )
		     sDebugText = "Barter +1."
		     pCounterBarter += 1
		elseif ( nMenuIndex == 2 )
		     sDebugText = "Big Guns +1."
		     pCounterBigGuns += 1
		elseif ( nMenuIndex == 3 )
		     sDebugText = "Explosives +1."
		     pCounterExplosives += 1
		endif

	; QUESTION SIX
	elseif ( nQuestionNumber == 6 )
		if ( nMenuIndex == 0 )
		     sDebugText = "Lockpick +1."
		     pCounterLockpick += 1
		elseif ( nMenuIndex == 1 )
		     ; This gives the player 2 counters
		     sDebugText = "Barter +1."
		     pCounterBarter += 1

		     sDebugText = "Explosives +1."
		     pCounterExplosives += 1
		elseif ( nMenuIndex == 2 )
		     sDebugText = "Energy Weapons +1."
		     pCounterEnergyWeapons += 1
		elseif ( nMenuIndex == 3 )
		     sDebugText = "Repair +1."
		     pCounterRepair += 1
		endif

	; QUESTION SEVEN
	elseif ( nQuestionNumber == 7 )
		if ( nMenuIndex == 0 )
		     sDebugText = "Small Guns +1."
		     pCounterSmallGuns += 1
		elseif ( nMenuIndex == 1 )
		     sDebugText = "Medicine +1."
		     pCounterMedicine += 1
		elseif ( nMenuIndex == 2 )
		     sDebugText = "Barter +1."
		     pCounterBarter += 1
		elseif ( nMenuIndex == 3 )
		     sDebugText = "Energy Weapons +1."
		     pCounterEnergyWeapons += 1
		endif

	; QUESTION EIGHT
	elseif ( nQuestionNumber == 8 )
		if ( nMenuIndex == 0 )
		     sDebugText = "Barter +1."
		     pCounterBarter += 1
		elseif ( nMenuIndex == 1 )
		     sDebugText = "Small Guns +1."
		     pCounterSmallGuns += 1
		elseif ( nMenuIndex == 2 )
		     sDebugText = "Sneak +1."
		     pCounterSneak += 1
		elseif ( nMenuIndex == 3 )
		     sDebugText = "Medicine +1."
		     pCounterMedicine += 1
		endif

	; QUESTION NINE
	elseif ( nQuestionNumber == 9 )
		if ( nMenuIndex == 0 )
		     sDebugText = "Repair +1."
		     pCounterRepair += 1
		elseif ( nMenuIndex == 1 )
		     sDebugText = "Explosives +1."
		     pCounterExplosives += 1
		elseif ( nMenuIndex == 2 )
		     sDebugText = "Medicine +1."
		     pCounterMedicine += 1
		elseif ( nMenuIndex == 3 )
		     sDebugText = "Lockpick +1."
		     pCounterLockpick += 1
		endif

	; QUESTION TEN
	elseif ( nQuestionNumber == 10 )
		if ( nMenuIndex == 0 )
		     sDebugText = "Button 1 Pressed."
		elseif ( nMenuIndex == 1 )
		     sDebugText = "Button 2 Pressed."
		elseif ( nMenuIndex == 2 )
		     sDebugText = "Button 3 Pressed."
		elseif ( nMenuIndex == 3 )
		     sDebugText = "Button 4 Pressed."
		endif

		; Determine what's the highest value of all the counters
		pCounterHighestValue = pCounterBarter
		if ( pCounterBigGuns > pCounterHighestValue )
		     pCounterHighestValue = pCounterBigGuns
		endif
		if ( pCounterEnergyWeapons > pCounterHighestValue )
		     pCounterHighestValue = pCounterEnergyWeapons
		endif
		if ( pCounterExplosives > pCounterHighestValue )
		     pCounterHighestValue = pCounterExplosives
		endif
		if ( pCounterLockpick > pCounterHighestValue )
		     pCounterHighestValue = pCounterLockpick
		endif
		if ( pCounterMedicine > pCounterHighestValue )
		     pCounterHighestValue = pCounterMedicine
		endif
		if ( pCounterMeleeWeapons > pCounterHighestValue )
		     pCounterHighestValue = pCounterMeleeWeapons
		endif
		if ( pCounterRepair > pCounterHighestValue )
		     pCounterHighestValue = pCounterRepair
		endif
		if ( pCounterScience > pCounterHighestValue )
		     pCounterHighestValue = pCounterScience
		endif
		if ( pCounterSmallGuns > pCounterHighestValue )
		     pCounterHighestValue = pCounterSmallGuns
		endif
		if ( pCounterSneak > pCounterHighestValue )
		     pCounterHighestValue = pCounterSneak
		endif
		if ( pCounterSpeech > pCounterHighestValue )
		     pCounterHighestValue = pCounterSpeech
		endif
		if ( pCounterUnarmed > pCounterHighestValue )
		     pCounterHighestValue = pCounterUnarmed
		endif

	endif

	Debug.Trace(sDebugText)
	
	; This delay is here to make things work
	Utility.Wait(1.0)

	; Restart the scene
	sSceneToPlay.Start()

EndFunction

Function LockPCControls(bool bLock)
	if ( bLock == TRUE )
		EnableLayer = InputEnableLayer.Create()
		EnableLayer.DisablePlayerControls()
	else
		EnableLayer.EnablePlayerControls()
	endif
EndFunction

Int Property bBrianTalksAboutRadio = 0 Auto Conditional

Int Property KA_Lemonade Auto Conditional

InputEnableLayer Property EnableLayer Auto Hidden

Int Property bDanFinishedIntro Auto Conditional

Int Property bDanPromisesCapsUpFront Auto Conditional

Int Property bSwansonSpeechChallenge Auto Conditional
