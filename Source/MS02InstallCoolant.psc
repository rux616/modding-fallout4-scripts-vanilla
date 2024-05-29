ScriptName MS02InstallCoolant extends ReferenceAlias

Quest Property MS02 auto
MiscObject Property MS02Coolant auto
int Property Stage auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		if Game.GetPlayer().GetItemCount(MS02Coolant) != 0
			MS02.SetStage(Stage)
		endif	
	endif	
endEvent