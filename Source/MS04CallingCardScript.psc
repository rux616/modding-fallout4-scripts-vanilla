Scriptname MS04CallingCardScript extends ObjectReference

;import CommonArrayFunctions

	Quest Property pMS04 Auto Const
	ReferenceAlias Property pAlias_WayneDelancy Auto Const
	ReferenceAlias Property pAlias_Rex Auto Const
	ReferenceAlias Property pAlias_Cato Auto Const


Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	; If a Calling Card is placed on Wayne Delancy's corpse set the propert stage
	if ( akNewContainer == pAlias_WayneDelancy.GetReference() )
		pMS04.SetStage(599)
		RemoveItem(self)
	endif

	; If a Calling Card is placed on Rex's corpse set the propert stage
	if ( akNewContainer == pAlias_Rex.GetReference() )
		pMS04.SetStage(490)
		RemoveItem(self)
	endif

	; If a Calling Card is placed on Cato's corpse set the propert stage
	if ( akNewContainer == pAlias_Cato.GetReference() )
		pMS04.SetStage(440)
		RemoveItem(self)
	endif

EndEvent

