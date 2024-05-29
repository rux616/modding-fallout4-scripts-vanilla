Scriptname DN144CorpseHavokImpulse extends ObjectReference Hidden

Sound Property NormalImpulseSound const auto
Sound Property GibImpulseSound const auto
Sound Property DragImpulseSound const auto

Activator Property FallingDust const auto

MiscObject Property GoreBits const auto

Bool Property StopHavoking = FALSE auto

int DragCorpseTimer = 1

Function StartEatingCorpse()

	int count = 0
	int maxSize = 7
	while (count < maxSize && StopHavoking == FALSE)
		self.ApplyHavokImpulse(utility.RandomFloat(0, 1),utility.RandomFloat(0, 1),utility.RandomFloat(0, 1),100)
		if count == 0 || count == 3
			GetLinkedRef().PlaceAtMe(GoreBits,1)
			int GibSoundInstance = GibImpulseSound.play(self)
		endif
		int NormalSoundInstance = NormalImpulseSound.play(self)
		if count == 4 
			StartTimer(0.1, DragCorpseTimer)
		endif
		utility.Wait(utility.RandomFloat(0.7, 2))
		count += 1
	endwhile
EndFunction


Function StartDraggingCorpse()
	int count = 0
	int maxSize = 5
	while (count < maxSize && StopHavoking == FALSE)
		utility.Wait(utility.RandomFloat(1, 2))
		self.ApplyHavokImpulse(0,-1,1,400)
		int DragSoundInstance = DragImpulseSound.play(self)
		ObjectReference DustRef = self.PlaceAtMe(FallingDust,1)
		DustRef.MoveTo(self,0,0,-180,FALSE)
		DustRef.PlayAnimation("Stage2")
		;DustRef.DeleteWhenAble()
		count += 1
	endwhile
EndFunction


Event OnTimer(int aiTimerID)
    if aiTimerID == DragCorpseTimer
    	StartDraggingCorpse()
    endif
EndEvent