Scriptname MS16FinalRockWallScript extends ObjectReference 

;scene property SonyaBlastScene auto
;ReferenceAlias property sonyaBlastTarget auto
quest property bigDig auto
ReferenceAlias property Mel auto
scene property MS16MelLastBarrier auto
ReferenceAlias property Bobbi_Alias auto mandatory
ReferenceAlias property Sonya_Alias auto mandatory
ObjectReference property moveToTarget auto mandatory

auto State Waiting
Event onActivate(ObjectReference akActionRef)	
	if bigDig.getstage() < 160
		Mel.GetReference().disable()
		Mel.GetReference().enable()
		if !game.getplayer().IsSneaking()
			mel.getReference().Activate(game.getplayer())
		else
			MS16MelLastBarrier.start()
		endif
		if Game.GetPlayer().GetDistance(Sonya_Alias.GetReference()) >=1500
			Sonya_Alias.GetReference().moveto(moveToTarget)
		endif
		if Game.GetPlayer().GetDistance(Mel.GetReference()) >=1500
			Mel.GetReference().moveto(moveToTarget)
		endif
		if Game.GetPlayer().GetDistance(Bobbi_Alias.GetReference()) >=1500
			Bobbi_Alias.GetReference().moveto(moveToTarget)
		endif
		if bigDig.getstage() != 150
			bigDig.setstage(150)
		endif
	endif
	;if bigDig.getstage() == 160
	;	if SonyaBlastScene.IsPlaying() == false
	;		gotoState("Done")
	;		sonyaBlastTarget.ForceRefTo(self.getLinkedRef())
	;		SonyaBlastScene.start()
	;		self.disable()
	;	endif
	;endif
EndEvent

endstate

state Done
	;Do Nothing
EndState