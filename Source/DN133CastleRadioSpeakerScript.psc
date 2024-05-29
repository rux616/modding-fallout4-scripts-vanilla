Scriptname DN133CastleRadioSpeakerScript extends ObjectReference Const



GlobalVariable Property DN133CastleRadioSpeakersAreOn Auto Const
ObjectReference Property DN133CastleSpeakerControllerRef Auto Const
Quest Property Min02 Auto Const
int Property Min02Stage = 600 Auto Const

Event onCellAttach()
	CheckRadioState()
	RegisterForCustomEvent(DN133CastleSpeakerControllerRef as DN133CastleSpeakerControllerScript, "DN133SpeakerSet")
EndEvent

Event onCellDetach()
	UnRegisterForCustomEvent(DN133CastleSpeakerControllerRef as DN133CastleSpeakerControllerScript, "DN133SpeakerSet")
EndEvent


Event DN133CastleSpeakerControllerScript.DN133SpeakerSet(DN133CastleSpeakerControllerScript akSender, Var[] args)
	Debug.Trace(self + " Has recieved DN133SpeakerSet from " + akSender)
	CheckRadioState()
EndEvent


Function CheckRadioState()
	;if Min02.GetStageDone(Min02Stage)
		if DN133CastleRadioSpeakersAreOn.GetValue() == 1
			SetRadioOn()
		else
			SetRadioOn(False)
		endif
	;endif
EndFunction

Event OnActivate(ObjectReference akActivateRef)
	Debug.Trace(self + " Has recieved OnActivate from " + akActivateRef)
	CheckRadioState()
EndEvent