ScriptName DLC04:GrandchesterFlDummyScript Extends TrapFlamethrowerDummy

Event OnLoad()
	Debug.Trace(self + ": Onload")
	ObjectReference objSelf = self as ObjectReference
	WorkshopTrapFlamethrowerSpell.Cast(objSelf)
EndEvent

Function FireSpell()
	Debug.Trace(self + ": FireSpell")
	ObjectReference objSelf = self as ObjectReference
	WorkshopTrapFlamethrowerSpell.Cast(objSelf)
EndFunction