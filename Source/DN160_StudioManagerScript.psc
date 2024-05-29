Scriptname DN160_StudioManagerScript extends ObjectReference Hidden Conditional
{Script for a DefaultDummy in HubrisComics01, responsible for managing the TV studio light and sound events.}

;Speaker source markers in the studio.
ObjectReference property DN160_Speaker_1 auto const
ObjectReference property DN160_Speaker_2 auto const

;Sounds available to be played.
Sound property UIPipBoyRadioStaticTuningLP auto const
Sound property MUSRadioSilverShroudMainTheme auto const

;Sound event IDs.
int soundInstanceID1
int soundInstanceID2

;Enable parents for lights in the studio.
ObjectReference property DN160_Lights_A auto const
ObjectReference property DN160_Lights_B auto const
ObjectReference property DN160_Lights_C auto const
ObjectReference property DN160_Lights_Off auto const

;Conditional properties for reference by the studio control terminal. See values in functions below.
int property soundState auto conditional
int property lightingState auto conditional


;When the cell loads, make sure the lights and audio are in the correct state.
Event OnCellLoad()
	StudioSound(soundState)
	StudioLights(lightingState)
EndEvent

;Play sounds from the studio's speakers.
Function StudioSound(int soundID)
	soundState = soundID
	if (soundID == 0) ;Off
		Sound.StopInstance(soundInstanceID1)
		Sound.StopInstance(soundInstanceID2)
	ElseIf (soundID == 1) ;Static
		Sound.StopInstance(soundInstanceID1)
		Sound.StopInstance(soundInstanceID2)
		soundInstanceID1 = UIPipBoyRadioStaticTuningLP.Play(DN160_Speaker_1)
		soundInstanceID2 = UIPipBoyRadioStaticTuningLP.Play(DN160_Speaker_2)
	ElseIf (soundID == 2) ;Silver Shroud Theme
		Sound.StopInstance(soundInstanceID1)
		Sound.StopInstance(soundInstanceID2)
		soundInstanceID1 = MUSRadioSilverShroudMainTheme.Play(DN160_Speaker_1)
		soundInstanceID2 = MUSRadioSilverShroudMainTheme.Play(DN160_Speaker_2)
	Else
		Debug.Trace("Invalid soundID", 2)
	EndIf
EndFunction

;Change the lighting state on the studio set.
Function StudioLights(int lightID)
	lightingState = lightID
	if (lightID == 0) ;Off
		DN160_Lights_A.DisableNoWait()
		DN160_Lights_B.DisableNoWait()
		DN160_Lights_C.DisableNoWait()
		DN160_Lights_Off.EnableNoWait()
	ElseIf (lightID == 1) ;A
		DN160_Lights_A.EnableNoWait()
		DN160_Lights_B.DisableNoWait()
		DN160_Lights_C.DisableNoWait()
		DN160_Lights_Off.DisableNoWait()
	ElseIf (lightID == 2) ;B
		DN160_Lights_A.DisableNoWait()
		DN160_Lights_B.EnableNoWait()
		DN160_Lights_C.DisableNoWait()
		DN160_Lights_Off.DisableNoWait()
	ElseIf (lightID == 3) ;C
		DN160_Lights_A.DisableNoWait()
		DN160_Lights_B.DisableNoWait()
		DN160_Lights_C.EnableNoWait()
		DN160_Lights_Off.DisableNoWait()
	Else
		Debug.Trace("Invalid lightID", 2)
	EndIf
EndFunction