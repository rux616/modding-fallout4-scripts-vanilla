;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_testDefaultProtectronTe_000F39DD Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Actor myProtectron = akTerminalRef.GetLinkedRef(LinkTerminalProtectron) as actor
myProtectron.activate(akTerminalRef)
myProtectron.setValue(ProtectronPodStatus, 0)
myProtectron.evaluatePackage()
debug.trace("Protectron Terminal: Sent Shut Down Signal")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
Actor myProtectron = akTerminalRef.GetLinkedRef(LinkTerminalProtectron) as actor
(akTerminalRef.getLinkedRef(LinkTerminalProtectron)).activate(akTerminalRef)
myProtectron.setValue(ProtectronPodStatus, 1)
myProtectron.setUnconscious(FALSE)
myProtectron.evaluatePackage()
debug.trace("Protectron Terminal: Sent Wake Up Signal")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property ProtectronPodStatus Auto Const

Keyword Property LinkTerminalProtectron Auto Const
