Scriptname DLC03:DLC03AtomSpringScript extends ObjectReference
;The script lives on an activatable trigger at Atom's Spring in DLC03
;When the player activates it, we place a trippy effect on them
;If they're also on the DLC03AtomM01 quest, we have that quest proceed

sound Property DrinkingSound Auto Const Mandatory
{plays each drink}

sound Property ChokingSoundMale Auto Const Mandatory
sound Property ChokingSoundFemale Auto Const Mandatory
{Plays after drinking}

sound Property DLC03QSTAtomM01TransitionWhooshA2D Auto Const Mandatory
{Sound that plays when IMod starts}

sound Property DLC03QSTAtomM01TransitionWhooshB2D Auto Const Mandatory
{Sound that plays when IMod shuts down}

Sound Property DLC03QSTAtomM01Whisper2D Auto Const Mandatory
{Hallucination whisper sound}

Sound Property DLC03QSTAtomM01Laugh2D Auto Const Mandatory
{Mother of the Fog laughter sound}

Sound Property DLC03QSTAtomM01Cry2D Auto Const Mandatory
{Mother of the Fog cry sound}

Sound Property DLC03QSTAtomM01AmbientA Auto Const Mandatory
{Repeating ambient sound played through audio loop}

Sound Property DLC03QSTAtomM01AmbientPulseA2D Auto Const Mandatory
{Ambient pulse hit played through random hallucination function}

float Property fSpringIModTimerLength = 30.0  Auto Const
{Timer length for hallucination effect}

float Property fSpringAudioTimerLength = 30.0  Auto Const
{Timer length for audio hallucination}

Spell Property DLC03AtomSpringImodSpell Auto Const Mandatory
{Atom's spring spell effect}

VisualEffect Property DLC03ScreenDistortFX Auto Const Mandatory
{Player visual effect }

ActorValue Property Rads Auto Const Mandatory
{Used to harm player's rads}

float Property fRadDamage = 150.0 Auto Const
{Amount of rad damage}

Quest Property DLC03AtomM01 Auto Const Mandatory
{Visions in the Fog quest (handles its own audio if running)}

Quest Property DLC03AtomM01_EncounterHandler Auto Const Mandatory
{AtomM01 encounter handler quest}

ReferenceAlias Property MotherofTheFog Auto Const Mandatory
{Mother of the Fog reference alias from DLC03AtomM01}

ReferenceAlias Property ShrineTerminal Auto Const Mandatory
{Shrine terminal reference alias from DLC03AtomM01}

WorldSpace Property DLC03FarHarbor Auto Const Mandatory
{FarHarbor world space}

bool Property bEffectActive = false Auto
{Is the Hallucination effect active?}

;Local vars
bool bAudioActive = false
int iSpringEffectTimerID = 1 Const
int iSpringAudioTimerID = 2 Const
int iSpringAudioLoopID = 3 Const
int iLastSound = -1
bool bM01IntroAudioOnce = false
bool bEncounterHandlerOnce = false

;Custom Event (used to let other scripts know effect has turned off)
CustomEvent EffectExpired

auto State AllowDrinking
	Event OnActivate(ObjectReference akActionRef)
		GoToState("Busy")
		ObjectReference PlayerRef = Game.GetPlayer()

		if akActionRef == PlayerRef
			DrinkingSound.play(self) 

			Utility.Wait(1.0)

			If (Game.GetPlayer().GetBaseObject() as ActorBase).GetSex() == 1
				ChokingSoundFemale.play(PlayerRef) 
			else
				ChokingSoundMale.play(PlayerRef) 
			EndIf

			;If this would kill the player from radiation, don't deal damage
			if fRadDamage < (999 - PlayerRef.GetValue(Rads))
				PlayerRef.DamageValue(Rads, fRadDamage)
			endif

			utility.Wait(1.0)

			;Trigger the hallucination effect
			TriggerHallucination()
		endif
		GoToState("AllowDrinking")
	EndEvent
EndState

State Busy
	Event OnActivate(ObjectReference akActionRef)
		;Do nothing
	EndEvent
EndState

Event OnTimer(int aiTimerID)
	if aiTimerID == iSpringEffectTimerID
		
		if DLC03AtomM01.IsRunning() && DLC03AtomM01.GetStageDone(20) && !DLC03AtomM01.GetStageDone(70) && !DLC03AtomM01.GetStageDone(100) && !DLC03AtomM01.GetStageDone(750) && Game.GetPlayer().GetWorldSpace() == DLC03FarHarbor && (MotherofTheFog.GetRef().Is3DLoaded() || ShrineTerminal.GetRef().Is3DLoaded())
			;If Visions quest is running, quest hasn't passed Mother of Fog section or failed
			;and either Mother or Icon is still loaded, renew timer
			StartTimer(fSpringIModTimerLength, iSpringEffectTimerID)
		else
			DeactivateVisualHallucination()
		endif

	elseif aiTimerID == iSpringAudioLoopID
		
		;Trigger a new hallucination sound, replay the Ambient loop and restart timer (turned off by iSpringAudioTimerID timer)
		TriggerRandomHallucinationAudio()

		if bAudioActive
			DLC03QSTAtomM01AmbientA.Play(Game.GetPlayer())
			int iLoopLength = Utility.RandomInt(8, 10)
			StartTimer(iLoopLength, iSpringAudioLoopID)		
		endif

	elseif aiTimerID == iSpringAudioTimerID
		
		;If Visions quest is running and not failed, Mother hasn't been turned off or bypassed and either Mother or Icon is still loaded, renew timer
		if DLC03AtomM01.IsRunning() && DLC03AtomM01.GetStageDone(20) && !DLC03AtomM01.GetStageDone(55) && !DLC03AtomM01.GetStageDone(70) && !DLC03AtomM01.GetStageDone(100) && !DLC03AtomM01.GetStageDone(750) && Game.GetPlayer().GetWorldSpace() == DLC03FarHarbor && (MotherofTheFog.GetRef().Is3DLoaded() || ShrineTerminal.GetRef().Is3DLoaded())
			StartTimer(fSpringAudioTimerLength, iSpringAudioTimerID)
		else
			DeactivateAudioHallucination()
		endif
	endif
EndEvent

Function TriggerHallucination()
		;Called from "OnActivate" in this script and "OnTriggerEntered" on DLC03AtomM01EnterShrineTriggerScript
		
		;Apply hallucination effect and start effect timer
		if !bEffectActive
			bEffectActive = true

			Actor PlayerRef = Game.GetPlayer()

			;IMod Effect timer
			StartTimer(fSpringIModTimerLength, iSpringEffectTimerID)
			PlayerRef.AddSpell(DLC03AtomSpringImodSpell, false)
			DLC03ScreenDistortFX.Play(PlayerRef)
			DLC03QSTAtomM01TransitionWhooshA2D.Play(PlayerRef)			
		endif

		;If DLC03AtomM01 is running and player hasn't followed the Mother of the Fog yet and quest hasn't failed, check for audio loop, encounter handler, intro audio
		if DLC03AtomM01.IsRunning() && DLC03AtomM01.GetStageDone(10) && !DLC03AtomM01.GetStageDone(55) && !DLC03AtomM01.GetStageDone(60) && !DLC03AtomM01.GetStageDone(100) && !DLC03AtomM01.GetStageDone(750)

			if bEffectActive
				if !bM01IntroAudioOnce
					Actor PlayerRef = Game.GetPlayer()

					;Play Mother of Fog sounds
					bM01IntroAudioOnce = true
					DLC03QSTAtomM01Whisper2D.Play(PlayerRef)
					DLC03QSTAtomM01Laugh2D.Play(PlayerRef)
					DLC03QSTAtomM01Cry2D.Play(PlayerRef)
				endif

				;Trigger encounter handler
				if !bEncounterHandlerOnce
					bEncounterHandlerOnce = true
					DLC03AtomM01_EncounterHandler.Start()
				endif

			endif

			;Start up audio timer if it isn't already live
			if !bAudioActive
				bAudioActive = true

				;Audio timer
				StartTimer(fSpringAudioTimerLength, iSpringAudioTimerID)

				;Audio Loop timer
				int iLoopLength = Utility.RandomInt(8, 10)
				StartTimer(iLoopLength, iSpringAudioLoopID)		
			endif
		endif 
EndFunction


Function TriggerRandomHallucinationAudio()

	;Play a random sound effect near the player
	ObjectReference PlayerRef = Game.GetPlayer()
	int iSoundToPlay = Utility.RandomInt(0, 3)

	if iSoundToPlay == iLastSound
		iSoundToPlay += 1
		iSoundToPlay %= 4
	endif
	
	if iSoundToPlay == 0
		iLastSound = 0
		DLC03QSTAtomM01Whisper2D.Play(PlayerRef)
	elseif iSoundToPlay == 1
		iLastSound = 1
		DLC03QSTAtomM01Laugh2D.Play(PlayerRef)
	elseif iSoundToPlay == 2
		iLastSound = 2
		DLC03QSTAtomM01Cry2D.Play(PlayerRef)
	elseif iSoundToPlay == 3
		iLastSound = 3
		DLC03QSTAtomM01AmbientPulseA2D.Play(PlayerRef)
	endif

	;debug.trace("Most recent sound played: " + iLastSound)

EndFunction

Function DeactivateVisualHallucination()
	;Turn off hallucination effect
	bEffectActive = false
	SendCustomEvent("EffectExpired")

	Actor PlayerRef = Game.GetPlayer()
	DLC03QSTAtomM01TransitionWhooshB2D.Play(PlayerRef)
	PlayerRef.RemoveSpell(DLC03AtomSpringImodSpell)
	DLC03ScreenDistortFX.Stop(PlayerRef)
EndFunction

Function DeactivateAudioHallucination()
	;Turn off audio hallucination effect
	bAudioActive = false
	CancelTimer(iSpringAudioLoopID)	
EndFunction