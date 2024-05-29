Scriptname DLC04:DLC04AudioLoopingDuringTopic extends TopicInfo
{Script to allow music to play along entire topic}

Import ObjectReference

Sound Property SoundCue auto

int SoundID = 1

bool bSoundisPlaying = False

Function PlaySound(ObjectReference akSpeakerRef)
	If(bSoundisPlaying == False)
	SoundID = SoundCue.play(akSpeakerRef)
	bSoundisPlaying = True
	else
		;do nothing
	EndIf
EndFunction

Function StopSound()
	Sound.StopInstance(SoundID)
	bSoundisPlaying = False
EndFunction

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	PlaySound(akSpeakerRef)
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	StopSound()
EndEvent