Scriptname EyebotRadioScript extends Actor

Group Radio_Properties
	float Property radioFreq = 103.0 Auto Const
	{Radio frequency to play, default to Boston Emergency Broadcast}

	float Property radioVol = 1.0 Auto Const
	{Radio volume, default to full volume}

	bool Property bRadioOff = false Auto
	{set to turn the radio off}

	OutputModel Property radioOutputModel Auto Const
	{The OutputModel to use. Default: None / Default Object.}
EndGroup

Event OnLoad()
	if (!bRadioOff && !self.IsDead())
		; Make eyebot into a radio, and use the special output model we've set up for Eyebots.
    		self.MakeRadioReceiver(radioFreq, radioVol, radioOutputModel, True)
    	ElseIf (bRadioOff)
    		self.MakeRadioReceiver(radioFreq, radioVol, radioOutputModel, False)
    	EndIf
EndEvent

Event OnDeath(Actor akKiller)
	;Turn off the radio when dead
	self.MakeRadioReceiver(radioFreq, radioVol, radioOutputModel, False)
EndEvent