Scriptname MinRecruit03_Locket extends ReferenceAlias

Quest Property MinRecruit03 Auto Const

Event OnContainerChanged(ObjectReference newContainer, ObjectReference oldContainer)
	If (newContainer == Game.GetPlayer())
		MinRecruit03.SetStage(200)
	EndIf
EndEvent