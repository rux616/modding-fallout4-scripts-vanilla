;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN083_SubTerminalPasswo_00128219 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference TurretRef = akTerminalRef.GetLinkedRef(LinkCustom01)
Actor Turret = TurretRef as Actor
ObjectReference TurretRefB = akTerminalRef.GetLinkedRef(LinkCustom02)
Actor TurretB = TurretRefB as Actor

if ((Turret.IsUnconscious() == True) || (TurretB.IsUnconscious() == True))
	Turret.SetUnconscious(false)
	TurretB.SetUnconscious(false)

	If DN083_Barney.ModObjectiveGlobal(1,DN083_TurretX,30, DN083_TurretY.Value)
     		DN083_Barney.SetStage(40)
	endIf
	
	Turret.SetEssential(false)
	TurretB.SetEssential(False)

endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkCustom01 Auto Const

GlobalVariable Property DN083_TurretX Auto Const

Quest Property DN083_Barney Auto Const

GlobalVariable Property DN083_TurretY Auto Const

Keyword Property LinkCustom02 Auto Const
