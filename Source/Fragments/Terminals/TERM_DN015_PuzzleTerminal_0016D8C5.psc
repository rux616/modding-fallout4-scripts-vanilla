;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN015_PuzzleTerminal_0016D8C5 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
if akTerminalRef.GetLinkedRef() && DN015_FabricationBusy.GetValue() != 1
	(akTerminalRef.GetLinkedRef() as DN015Fabricator).StartFabrication()
EndIf
DN015_FabricationComplete.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
(DN015Puzzle as DN015PuzzleScript).RunScan()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DN015_FabricationBusy Auto Const

GlobalVariable Property DN015_FabricationComplete Auto Const

Quest Property DN015Puzzle Auto Const
