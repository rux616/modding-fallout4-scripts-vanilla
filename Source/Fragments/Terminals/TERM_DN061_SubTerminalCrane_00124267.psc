;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN061_SubTerminalCrane_00124267 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
if akTerminalRef.getLinkedRef()
	;if !akTerminalRef.getLinkedRef().isOpen()
		akTerminalRef.getLinkedRef().SetOpen(false)
	;endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
if akTerminalRef.getLinkedRef()
	;if !akTerminalRef.getLinkedRef().isOpen()
		akTerminalRef.getLinkedRef().SetOpen()
	;endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
