;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN070_TerminalSecurityO_01007F6E Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Actor p = akTerminalRef.GetLinkedRef(LinkTerminalProtectron) as Actor
p.SetValue(ProtectronPodStatus, 0)
GlowingKlaxonLightScript k = p.GetLinkedRef(LinkCustom01) as GlowingKlaxonLightScript
k.StopLights()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalProtectron Auto Const

ActorValue Property ProtectronPodStatus Auto Const

Keyword Property LinkCustom01 Auto Const
