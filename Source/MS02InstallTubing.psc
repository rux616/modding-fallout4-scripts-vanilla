ScriptName MS02InstallTubing extends ReferenceAlias

Quest Property MS02 auto
MiscObject Property MS02Tubing auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		if Game.GetPlayer().GetItemCount(MS02Tubing) != 0
			MS02.SetStage(340)
		endif	
	endif	
endEvent