Scriptname MS02PeriscopeScript extends ObjectReference

Quest Property MS02 Auto Const
;PlayDown01
;PlayLeft01
;PlayRight01
;PlayMid01
;PlayUp01

bool isRaised = false
int currentFacingPosition = 0
int mid = 0
int left = -1
int right = 1

Auto State Active
	Event OnCellAttach()
		if true ;MS02.GetStage() < Something
			StartTimer(15.0)
		else
			GoToState("Done")
		endif
	EndEvent
EndState

State Done
	event OnBeginState(string asOldState)
		PlayAnimation("PlayDown01")
	EndEvent
EndState

Event OnCellDetach()
	CancelTimer()
EndEvent


Event onTimer(int aiTimerID)
	if !isRaised
		PlayAnimation("PlayUp01")
		isRaised = True
		StartTimer(7.0)
	else
		int newFacing = utility.RandomInt(-1, 1)
		if currentFacingPosition == mid
			if newFacing == mid
				PlayAnimation("PlayDown01")
				isRaised = False
				StartMyTimer(false)
			elseif newFacing == left
				PlayAnimation("PlayLeft01")
				StartMyTimer()
			elseif newFacing == right
				PlayAnimation("PlayRight01")
				StartMyTimer()
			endif
		elseif currentFacingPosition == left
			if newFacing == Left || newFacing == mid
				PlayAnimation("PlayMid01")
				newFacing = mid
				StartMyTimer()
			else
				PlayAnimation("PlayRight01")
				StartMyTimer()
			endif
		elseif currentFacingPosition == right
			if newFacing == Right || newFacing == mid
				PlayAnimation("PlayMid01")
				newFacing = mid
				StartMyTimer()
			else
				PlayAnimation("PlayLeft01")
				StartMyTimer()
			endif

		endif
		currentFacingPosition = newFacing
	Endif
EndEvent

Function StartMyTimer(bool goUp = true)
	if is3dLoaded()
		if goUp
			StartTimer(utility.RandomFloat(5.0, 12.0))
		else
			StartTimer(utility.RandomFloat(10.0, 20.0))
		endif
	endif
EndFunction