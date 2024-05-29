;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_BoS302BPAMUnlockTermina_0014A0E9 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
if BoS302B.GetStageDone(130) == 0
BoS302B.SetStage(130)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BoS302B Auto Const

GlobalVariable Property BoS302BPAMDead Auto Const
