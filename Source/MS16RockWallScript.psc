Scriptname MS16RockWallScript extends ObjectReference 

scene property SonyaBlastScene auto mandatory
ReferenceAlias property sonyaBlastTarget auto mandatory
ReferenceAlias property Bobbi_Alias auto mandatory
ReferenceAlias property Mel_Alias auto mandatory
ReferenceAlias property Sonya_Alias auto mandatory
ObjectReference property moveToTarget auto mandatory

auto State Waiting
Event onActivate(ObjectReference akActionRef)
	if SonyaBlastScene.IsPlaying() == false
		sonyaBlastTarget.ForceRefTo(self.getLinkedRef())
		SonyaBlastScene.start()
		if Game.GetPlayer().GetDistance(Sonya_Alias.GetReference()) >=1500
			Sonya_Alias.GetReference().moveto(moveToTarget)
		endif
		if Game.GetPlayer().GetDistance(Mel_Alias.GetReference()) >=1500
			Mel_Alias.GetReference().moveto(moveToTarget)
		endif
		if Game.GetPlayer().GetDistance(Bobbi_Alias.GetReference()) >=1500
			Bobbi_Alias.GetReference().moveto(moveToTarget)
		endif
		gotoState("Done")
		self.disable()
	endif
EndEvent

endstate

state Done
	;Do Nothing
EndState