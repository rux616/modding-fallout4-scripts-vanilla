Scriptname MQ302DetonatorScript extends ObjectReference Conditional


Quest Property MQ302 Auto Const

Int Property CaseOpen Auto Conditional


Event OnActivate(ObjectReference ActiveRef)

	if ActiveRef == Game.GetPlayer()
		if MQ302.GetStage() == 800
			if CaseOpen==0
				Self.PlayAnimationAndWait("play01","done")
				CaseOpen=1
			elseif CaseOpen==1
				Self.PlayAnimationAndWait("Play01","done")
	
				MQ302.SetStage(850)
				CaseOpen=2
			endif
		endif
	endif

endEvent