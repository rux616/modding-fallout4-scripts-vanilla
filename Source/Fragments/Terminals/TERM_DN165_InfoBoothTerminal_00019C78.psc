;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN165_InfoBoothTerminal_00019C78 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
JamaicaPlainMapMarkerRef.AddToMap()

;Display objective to find the treasure.
DN070.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
BostonCommonMapMarkerRef.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
BostonPublicLibraryMapMarkerRef.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN070 Auto Const

ObjectReference Property BostonCommonMapMarkerRef Auto Const

ObjectReference Property JamaicaPlainMapMarkerRef Auto Const

ObjectReference Property BostonPublicLibraryMapMarkerRef Auto Const
