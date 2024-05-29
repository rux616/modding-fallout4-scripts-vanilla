Scriptname DmndChapelPlayerScript extends ReferenceAlias

ReferenceAlias Property Pew Auto Const
Spell Property QuietReflection Auto Const
MagicEffect Property QuietReflectionEffect Auto Const

Event OnSit(ObjectReference akFurniture)
	IF akFurniture == Pew.GetRef()
		Actor myPlayerREF = Game.GetPlayer()
		If myPlayerREF.HasMagicEffect(QuietReflectionEffect) == 0
			debug.trace(self + "Casting Quiet Reflection on Player")
			QuietReflection.Cast(myPlayerREF, myPlayerREF)
		EndIf
	EndIf
EndEvent