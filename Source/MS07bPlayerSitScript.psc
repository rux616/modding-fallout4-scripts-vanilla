Scriptname MS07bPlayerSitScript extends ReferenceAlias

Quest Property MS07b Auto Const
int Property iMyStage Auto Const
ReferenceAlias Property DigFurn Auto Const

Event OnSit(ObjectReference akFurniture)
	If !MS07b.GetStageDone(iMyStage)
		If akFurniture == DigFurn.GetRef()
			MS07b.GetStageDone(iMyStage)
		EndIf
	EndIf
EndEvent