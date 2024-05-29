;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN047_FourLeafSecurityT_000F9339 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
pDN047SystemOnGlobal.setValue(0)
akTerminalRef.getLinkedRef().setOpen()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property pLinkCustom01 Auto Const

Keyword Property LinkCustom01 Auto Const

ObjectReference Property pDN047SecurityTrigger01 Auto Const

ObjectReference Property pDN047SecurityTrigger02 Auto Const

ObjectReference Property pDN047SecurityTrigger03 Auto Const

ObjectReference Property pDN047SecurityTrigger04 Auto Const

GlobalVariable Property pDN047SystemOnGlobal Auto Const
