ScriptName defaultCounter extends objectReference Default
{A simple counter. Place on an object, then increment with another script (such as defaultCounterIncrementOnDeath). When the target value is reached (or, optionally, exceeded), the counter:
 - Activates itself.
 - Optionally, sets a quest stage.
 - Optionally, performs a specified action on a specified linkedref.
}

Group Required_Properties
	int property TargetValue Auto Const
	{The first value at which the counter will trigger.}
EndGroup

Group Optional_Properties
	Quest property MyQuest Auto Const
	{Optional. If Desired, when the counter reaches its target, sets MyQuest to MyStage.}

	int property MyStage Auto Const
	{Optional. If Desired, when the counter reaches its target, sets MyQuest to MyStage.}
	 
	Keyword property MyLinkedRefKeyword Auto Const
	{The keyword for the LinkedRef to perform the action on. Defaults to the unnamed linkedref.}

	int property MyLinkedRefAction Auto Const
	{Optional; defaults to 0. Determines what action to perform on the object's linkedref.
	 - 0 -- Activate
	 - 1 -- Toggle Enable/Disable
	 - 2 -- Enable Only
	 - 3 -- Disable Only
	 }

	 bool property AllowDecrementing Auto Const
	 {Optional; default FALSE. Do we allow other scripts to Decrement the counter, undoing the specified action (where possible) if the value falls below the target?}
EndGroup

int count
bool hasHitThreshold

Auto STATE AllowCounting
	Function Increment()

		count = count + 1

			; Has count reached it's TargetValue?
		if (count >= TargetValue)
			hasHitThreshold = True
			if (!AllowDecrementing)
				GoToState("StopCounting")
			EndIf

			; It has, so activate myself and check if there's anything else I should do
			Self.Activate(Self)
			if (MyQuest != None)
				MyQuest.SetStage(MyStage)
			EndIf
			if (MyLinkedRefAction == 0)
					;Activates Linked Ref
				Self.GetLinkedRef(MyLinkedRefKeyword).Activate(Self)
			ElseIf (MyLinkedRefAction == 1)
					; Toggles Enable/Disable
				if (Self.GetLinkedRef(MyLinkedRefKeyword).IsDisabled())
					Self.GetLinkedRef(MyLinkedRefKeyword).Enable()
				Else
					Self.GetLinkedRef(MyLinkedRefKeyword).Disable()
				EndIf	
			ElseIf (MyLinkedRefAction == 2)
					; Enables Only
				Self.GetLinkedRef(MyLinkedRefKeyword).Enable()
			ElseIf (MyLinkedRefAction == 3)
					; Disables Only
				Self.GetLinkedRef(MyLinkedRefKeyword).Disable()
			EndIf
		EndIf
		
	EndFunction

	Function Decrement()
		if (AllowDecrementing)
		;Decrement the counter (to a minimum of 0).
			count = count - 1
			if (count <= 0)
				count = 0
			EndIf

			;If we previously exceeded our threshold, and are now less than it, undo the threshold action if possible.
			if (count < TargetValue && hasHitThreshold)
				hasHitThreshold = False
				; Activate myself and check if there's anything else I should do
				Self.Activate(Self)
				;Can't Undo setting a stage.
				if (MyLinkedRefAction == 0)
						;Undo Activate Linked Ref: Activate it again.
					Self.GetLinkedRef(MyLinkedRefKeyword).Activate(Self)
				ElseIf (MyLinkedRefAction == 1)
						; Undo Toggle Enable/Disable: Toggle again.
					if (Self.GetLinkedRef(MyLinkedRefKeyword).IsDisabled())
						Self.GetLinkedRef(MyLinkedRefKeyword).Enable()
					Else
						Self.GetLinkedRef(MyLinkedRefKeyword).Disable()
					EndIf	
				ElseIf (MyLinkedRefAction == 2)
						; Undo Enable: Disable
					Self.GetLinkedRef(MyLinkedRefKeyword).Disable()
				ElseIf (MyLinkedRefAction == 3)
						; Undo Disable: Enable
					Self.GetLinkedRef(MyLinkedRefKeyword).Enable()
				EndIf
			EndIf
		EndIf
	EndFunction
EndSTATE

STATE StopCounting
	;Do Nothing
EndSTATE


Function Increment()
	;Do Nothing
EndFunction

Function Decrement()
	;Do Nothing
EndFunction