Scriptname WorkshopPoweredSpeakerScript extends ObjectReference Const

function ChangePitch(int iNewPitch = -1)
	String sNewPitch = ""
	if iNewPitch == -1
		; get saved value
		iNewPitch = GetValue(WorkshopTerminalSpeakerPitch) as int
	endif

	if iNewPitch >= 0 && iNewPitch < Pitches.length
		sNewPitch = Pitches[iNewPitch]
	endif
	if sNewPitch != ""
		debug.trace(self + " ChangePitch to " + iNewPitch + ": " + sNewPitch)
		; save the new values
		SetValue(WorkshopTerminalSpeakerPitch, iNewPitch)
		PlayAnimation(sNewPitch)
	endif
EndFunction

String[] Property Pitches Auto Const

ActorValue Property WorkshopTerminalSpeakerPitch auto Const
