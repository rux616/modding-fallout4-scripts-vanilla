scriptName defaultDisableOnResetOtherCondition extends ScriptedResetRef
{This script checks on reset if the object it is linked to was disabled
	if so it then disables itself allowing for new objects to be enabled on reset
	this is not OnCleared, but on whatever other criteria is needed}

;;;;;;;;;;;;;This uses a linkedRef instead of a property because properties are reset when the cell is;;;;;;;;;;
Function ScriptedReset()
	; 	;debug.Trace(self + ": has called onReset - hasBeenCleared = " + hasBeenCleared)
		if getLinkedRef().isEnabled()
	; 		;debug.Trace(self + ": has found that my linkedRef is enabled, enabling self")
			Self.Enable()
		Else
	; 		;debug.Trace(self + ": has found that my linkedRef is disabled, disabling self")
			Self.Disable()
			if RefsToDisable != none
				DisableAll(RefsToDisable)
				RefsToDisable.Clear()
			endif

			if RefsToEnable != none
				EnableAll(RefsToEnable)
				RefsToEnable.Clear()
			endif
		EndIf
EndFunction

ObjectReference[] property RefsToDisable auto
{If any refs are in this, they will be disabled when this object is disabled
	if empty, it is ignored}
ObjectReference[] property RefsToEnable auto
{If any refs are in this, they will be enabled when this object is
	if empty, it is ignored}

 Function DisableAll(ObjectReference[] objects)
   int currentElement = 0
   while (currentElement < objects.Length)
     objects[currentElement].Disable()
     currentElement += 1
   endWhile
 EndFunction

  Function EnableAll(ObjectReference[] objects)
   int currentElement = 0
   while (currentElement < objects.Length)
     objects[currentElement].Enable()
     currentElement += 1
   endWhile
 EndFunction