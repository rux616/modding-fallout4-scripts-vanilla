Scriptname DialogueRailroadScript extends Quest Conditional

int nRRR07Tracker

Location Property pGoodneighborLocation Auto Const
Scene Property pRadioSilverShroudQuest_MS04Logic Auto Const
Quest Property pMS04 Auto Const


Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	; watch for player to change location
	if akSender == Game.GetPlayer()

        ; !!! PATCH FIX FOR MS04 RADIO DROPPING
        if ( pMS04.GetStageDone(400) ) && ( pMS04.IsRunning() )					; Are you looking for Kent? AND You haven't heard the kidnapping yet?
            if akSender == Game.GetPlayer() && akNewLoc == pGoodneighborLocation   	; Is the player entering Goodneighbor?
                if !pRadioSilverShroudQuest_MS04Logic.IsPlaying()        			; Is the MS04 Logic scene NOT running?
                    pRadioSilverShroudQuest_MS04Logic.Start()                      	; If so start it up so the quest works
                endif
            endif
        endif
        ; !!! END PATCH FIX


		; Fires when leaving the Railroad
		if ( akOldLoc == pRailroadHQLocation )
			if ( pDialogRailroadLiamFuneral.GetStageDone(75) )    ; Funeral is complete
				pRRLiamFuneralState.SetValue(3)
				pDialogRailroadLiamFuneral.SetStage(100)   ; End the funeral
			endif

			; If the game is won handle Patriot's funeral
			if ( pMQWonRR.GetValue() == 1 && pRRLiamFuneralState.GetValue() == 0 )
				; Game won and first time leaving HQ
				pRRLiamFuneralState.SetValue(1)
				pDialogRailroadLiamFuneral.SetStage(50)   ; Run the funeral
			endif

			; Is the Institute announcement still running? If so close it
			if ( pConvRailroadAnnouncementInstitute.IsRunning() )
				pConvRailroadAnnouncementInstitute.SetStage(100)
			endif

			; Is the BoS announcement still running? If so close it
			if ( pConvRailroadAnnouncementBoS.IsRunning() )
				pConvRailroadAnnouncementBoS.SetStage(100)
			endif

		endif

		; Is the player entering Railroad HQ?
		if ( Game.GetPlayer().IsInLocation(pRailroadHQLocation) )
			ChalkboardUpdate()

			; RRLiamFuneralState
			; 0 - not happening
			; 1 - happening next Railroad HQ visit
			; 2 - in process
			; 3 - complete

			; Is "Weathervane" available?
			; Has Tink been talked to? (200) and has "Tradecraft" been completed (800)
			if ( GetStageDone(200) && pRR102.GetStageDone(800) && !pRRR05.GetStageDone(50) )
				pRRR05.SetStage(50)
			endif

			; Is "Butcher's Bill 2" pre-queued to start?
			if ( pRRR01b.GetStageDone(25) && !pRRR01b.GetStageDone(50) )
				pRRR01b.SetStage(50)
			endif

			; Is "Buther's Bill 2" done?
			if ( pRRR01b.GetStageDone(400) && !pRRM02.GetStageDone(50) )
				pRRM02.SetStage(50)		; If so, queue up "Memory Interrupted"
			endif

			;============================================================================
			; OPERATION TICONDEROGA
			; This is super complicated because it goes through Dez who is deeply hooked 
			; into the MQ. bDezBustWithMQ gates whether the intro will play for Operation
			; Ticonderoga. When the player is turning in RR201 the window is closed.
			;============================================================================
			; Has the player been to the Institute?
			if ( PlayerBeenToInstitute.GetValue() > 0 && pRR201.GetStage() >= 50 && bDezBusyWithMQ < 2 && pRRM01.GetStageDone(800) )

				; First Dez Blackout - ready to report about the Institute 
				if ( !pRR201.GetStageDone(400) )
					Debug.Trace("RR301: 1 Blackout")
					bDezBusyWithMQ = 0
				; Second Dez Blackout - reported back and now carrying info about PATRIOT
				elseif ( pRR201.GetStageDone(375) && !pRR201.GetStageDone(450) )
					Debug.Trace("RR301: 2 Blackout")
					bDezBusyWithMQ = 0
				; Third Dez Blackout - giving update on Code Defender
				elseif ( pRR201.GetStageDone(500) && !pRR201.GetStageDone(550) )
					Debug.Trace("RR301: 3 Blackout")
					bDezBusyWithMQ = 0
				; Last Dez Blackout - warning about Bunker Hill
				elseif ( pInst302_RR.IsRunning() && !pInst302_RR.GetStageDone(100) )
					Debug.Trace("RR301: 4 Blackout")
					bDezBusyWithMQ = 0
				; If you are about to do end game, close off Ticonderoga - window missed
				elseif ( pRR201.GetStageDone(1050) )
					; End the quest
					bDezBusyWithMQ = 2
					pRR301.SetStage(9000)
				else
					; This means Dez is free - yay
					bDezBusyWithMQ = 1
					pRR301.SetStage(50)    ; Queue up the quest
				endif

			endif

			; Is "Battle for Bunker Hill" done?
			;if ( pInst302.GetStageDone(200) && !pRR301.GetStageDone(50) )
			;	pRR301.SetStage(50)		; If so, queue up "Operation Ticonderoga"
			;endif

			Debug.Trace("Quest queue = " + pRRQuestsAvailable.GetValue() + ", " + pRRM01.GetStageDone(800) + ", " + pRRR06.IsRunning())

			; "Variable Removal" only shows up in Act 3 if you've done "Mercer Station" (RRR04)
			if ( pRRQuestsAvailable.GetValue() == 0.0 && pRRR04.GetStageDone(400) && PlayerBeenToInstitute.GetValue() > 0 && !pRRR07.IsRunning() )
				if ( nRRR07Tracker == 0 || pRRR06Global.GetValue() >= 6.0 || !pRRM01.GetStageDone(800) )  ; Makes sure it doesn't keep picking this quest (unless it has to)
					nRRR07Tracker = 1
					pRRR07.Reset()
					pRRR07.SetStage(50)
				endif
			endif

			; "Clearing Randolph" only shows up if nothing else is active, you've done "Boston After Dark",
			; you haven't finished all 6 radiants, and it's not running already... whew
			if ( pRRQuestsAvailable.GetValue() == 0.0 && pRRM01.GetStageDone(800) && !pRRR06.IsRunning() && pRRR06Global.GetValue() < 6.0 )
				nRRR07Tracker = 0		; This makes sure Clearing Randolph and Variable Removal ping pong
				pRRR06.Reset()
				pRRR06.SetStage(50)
			endif

			if ( pRRQuestsAvailable.GetValue() > 0.0 )		; Are there any quests available?
				pRRQuestDrummerBoyComing.SetValue(1)        ; If so, flag Drummer Boy to alert PC
				Alias_DrummerBoy.GetActorRef().EvaluatePackage()
			endif
		endif

	endif
EndEvent

;disable player controls, play the needle animation, fade out, fade up
Function StartMedical()
	InputEnableLayer myLayer = InputEnableLayer.Create()
	Actor myPlayer = Game.GetPlayer()

	myLayer.DisablePlayerControls()
	Alias_TinkerTom.GetActorRef().PlayIdle(pIdlePreppingNeedle)
	Utility.Wait(2.0)
	Game.FadeOutGame(True, True, 0.0, 3.0, True)
	Utility.Wait(4.0)
	Game.FadeOutGame(False, True, 0.0, 3.0)
	Utility.Wait(1.0)
	
	;InputEnableLayer clears when the function ends, but let's clear it just in case
	myLayer=None

	SetStage(250)    ; Signal that the player has got the shot
EndFunction

Function RailroadMiscQuestCompleted()

	; Check the number of Misc and Radiant quests done by the Railroad
	float nQuestsCompleted = pRRQuestsCompleted.GetValue()

	; At certain breakpoints, get a special Deliverer upgrade
	if ( nQuestsCompleted == 2.0 )
		pVendorAspirationTinkerTom.AddItem(pmiscmod_mod_Deliverer_Receiver_MoreDamage2)
	elseif ( nQuestsCompleted == 5.0 )
		pVendorAspirationTinkerTom.AddItem(pmiscmod_mod_Deliverer_Grip_Better2)
	elseif ( nQuestsCompleted == 8.0 )
		pVendorAspirationTinkerTom.AddItem(pmiscmod_mod_Deliverer_Receiver_MoreDamage2_and_BetterCriticals)
		pVendorAspirationTinkerTom.AddItem(pmiscmod_mod_Deliverer_Mag_LargeQuick)
	endif

	; Increment the number of quests completed
	pRRQuestsCompleted.Mod(1)

EndFunction

Function RunRRR05Again()

	Debug.Trace("RunRRR05Again is running.")

	; Should Weathervane start up again?
	if ( !pRRR05.GetStageDone(275) )
		; Queue up a timer
		StartTimer(1, 0)
	endif

EndFunction

Event OnTimer(int aiTimerID)
    if aiTimerID == 0
		if ( !pRRR05.IsRunning() )
			; This snippet is to re-run the RRR05 quest again and make everything get filled right
		 	pRRR05.SetStage(50)
			pRRR05.SetStage(100)
		else
			StartTimer(1, 0)
		endif
    endif
EndEvent

Function ChalkboardUpdate()

	; Augusta update - confirmed killed at end of Butcher's Bill 1
	if ( pRRR01a.GetStageDone(400) )
		pRRChalkboardQuestionAugusta.Disable()
		pRRChalkboardStrikeAugusta.Enable()
	endif

	; Dayton mentioned as evacuated during the beginning of RR301
	if ( pRR301.GetStageDone(100) )
		pRRChalkboardXXXDayton.Enable()
	endif

	; Randolph is confirmed alive at Raldolph Safehouse 1
	; Then Randolph is evacced at the end of Randolph Safehouse 6
	if ( pRRR06Global.GetValue() == 5 && pRRR06.GetStageDone(300) )
		pRRChalkboardXXXRandolph.Enable()
	elseif ( pRRR06Global.GetValue() == 1 )
		pRRChalkboardQuestionRandolph.Disable()
	endif

	; Ticonderoga is confirmed killed at the end of Operation Ticonderoga
	if ( pRR301.GetStageDone(400) )
		pRRChalkboardStrikethroughTicon.Enable()
	endif	

	; Mercer is built at Mercer Safehouse quest
	if ( pRRR04.GetStageDone(300) )
		pRRChalkboardMercer.Enable()
	endif		

	; Glory is killed during Precipice of War
	if ( pRR303.GetStageDone(400) )
		pRRChalkboardStrikethroughGlory.Enable()
	endif		

	; Player's name is added after Tradecraft
	if ( !GetStageDone(50) )
		if ( pRR102.GetStageDone(830) )
			if ( pRRCodeNameBullseye.GetValue() > 0 )
				pRRChalkboardPCBullseye.Enable()
			elseif ( pRRCodeNameCharmer.GetValue() > 0 )
				pRRChalkboardPCCharmer.Enable()
			elseif ( pRRCodeNameFixer.GetValue() > 0 )
				pRRChalkboardPCFixer.Enable()
			elseif ( pRRCodeNameProfessor.GetValue() > 0 )
				pRRChalkboardPCProfessor.Enable()
			elseif ( pRRCodeNameWhisper.GetValue() > 0 )
				pRRChalkboardPCWhisper.Enable()
			else
				pRRChalkboardPCWanderer.Enable()
			endif
			SetStage(50)
		endif
	endif

	; Player's name is crossed off once he gets to the Institute
	if ( pRR201.GetStageDone(400) || GetStageDone(475) )
		pRRChalkboardStrikethroughPC.Disable()   ; Cleared once you talk with Dez
	elseif ( pRR201.GetStageDone(100) )
		pRRChalkboardStrikethroughPC.Enable()
	endif

EndFunction

function InitializeQuest()
	if initialized
		return
	endif

	RegisterForCustomEvent(pMQ00, "MQFactionKickOut")

	Debug.Trace("DialogueRailroadScript Intialized")

	initialized = true
endFunction

; handle faction kickout event
Event MQ00Script.MQFactionKickOut(MQ00Script akSender, Var[] akArgs)
	;store off which faction we just got kicked out of
	int kickoutFactionNumber = (akArgs[0] as int)

	Debug.Trace(SELF + " has received kickout event: " + kickoutFactionNumber)

	if ( kickoutFactionNumber == 4 )     ; 4 is the Insitute
		; Were you ever in Underground Undercover? AND
		; You're not doing the final mission for the Railroad
		if ( pRR201.GetStageDone(100) && !pMQ302RR.GetStageDone(330) )
			pRRAct3Lost.SetStage(100)	; If so, queue up Desdemona for losing
		endif
	endif

EndEvent

Location Property pRailroadHQLocation Auto Const

GlobalVariable Property PlayerBeenToInstitute Auto Const
GlobalVariable Property pMQWonRR Auto Const
GlobalVariable Property pRRR06Global Auto Const
GlobalVariable Property pRRQuestsCompleted Auto Const
GlobalVariable Property pRRQuestsAvailable Auto Const
GlobalVariable Property pRRQuestDrummerBoyComing Auto Const
GlobalVariable Property pRRCodeNameBullseye Auto Const
GlobalVariable Property pRRCodeNameCharmer Auto Const
GlobalVariable Property pRRCodeNameFixer Auto Const
GlobalVariable Property pRRCodeNameProfessor Auto Const
GlobalVariable Property pRRCodeNameWhisper Auto Const
GlobalVariable Property pRRDesdemonaBusy Auto Const Mandatory

Quest Property pRRR01a Auto Const
Quest Property pRRR01b Auto Const
Quest Property pRRR04 Auto Const
Quest Property pRRR05 Auto Const
Quest Property pRRR06 Auto Const
Quest Property pRRR07 Auto Const
Quest Property pRR102 Auto Const
Quest Property pRR201 Auto Const
Quest Property pRR301 Auto Const
Quest Property pRR302 Auto Const
Quest Property pRR303 Auto Const
Quest Property pRRM01 Auto Const
Quest Property pRRM02 Auto Const
Quest Property pDialogRailroadLiamFuneral Auto Const
Quest Property pInst302 Auto Const
Quest Property pInst302_RR Auto Const
Quest Property pMQ302RR Auto Const
Quest Property pConvRailroadAnnouncementBoS Auto Const Mandatory
Quest Property pConvRailroadAnnouncementInstitute Auto Const Mandatory
Quest Property pRRAct3Lost Auto Const Mandatory
MQ00Script property pMQ00 auto const

ObjectReference Property pRRChalkboardQuestionAugusta Auto Const
ObjectReference Property pRRChalkboardStrikeAugusta Auto Const
ObjectReference Property pRRChalkboardXXXDayton Auto Const
ObjectReference Property pRRChalkboardQuestionRandolph Auto Const
ObjectReference Property pRRChalkboardXXXRandolph Auto Const
ObjectReference Property pRRChalkboardStrikethroughTicon Auto Const
ObjectReference Property pRRChalkboardMercer Auto Const
ObjectReference Property pRRChalkboardStrikethroughGlory Auto Const
ObjectReference Property pRRChalkboardPCBullseye Auto Const
ObjectReference Property pRRChalkboardPCCharmer Auto Const
ObjectReference Property pRRChalkboardPCFixer Auto Const
ObjectReference Property pRRChalkboardPCProfessor Auto Const
ObjectReference Property pRRChalkboardPCWanderer Auto Const
ObjectReference Property pRRChalkboardPCWhisper Auto Const
ObjectReference Property pRRChalkboardStrikethroughPC Auto Const

ReferenceAlias Property Alias_DrummerBoy Auto Conditional
ReferenceAlias Property Alias_TinkerTom Auto Conditional

Idle Property pIdlePreppingNeedle Auto Const

Int Property bDezBusyWithMQ Auto Conditional

; RRLiamFuneralState
; 0 - not happening
; 1 - happening next Railroad HQ visit
; 2 - in process
; 3 - complete
GlobalVariable Property pRRLiamFuneralState Auto Const

bool initialized = false
Int Property bTinkerTomFooledInIntro Auto Conditional

ObjectReference Property pVendorAspirationTinkerTom Auto Const Mandatory

MiscObject Property pmiscmod_mod_Deliverer_Receiver_MoreDamage2 Auto Const Mandatory
MiscObject Property pmiscmod_mod_Deliverer_Receiver_MoreDamage2_and_BetterCriticals Auto Const Mandatory
MiscObject Property pmiscmod_mod_Deliverer_Grip_Better2 Auto Const Mandatory
MiscObject Property pmiscmod_mod_Deliverer_Mag_LargeQuick Auto Const Mandatory
