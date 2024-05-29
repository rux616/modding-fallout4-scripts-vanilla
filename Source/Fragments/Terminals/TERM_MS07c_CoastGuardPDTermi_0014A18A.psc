;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_MS07c_CoastGuardPDTermi_0014A18A Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
QuincyMapMarker.AddtoMap()
NatickMapMarker.AddtoMap()

if pMS07c.GetStageDone(10)
  if !pMS07c.GetStageDone(100)
    pMS07c.SetStage(100)
  endif
else
  if !pMS07cTapes.GetStageDone(100)
    pMS07cTapes.SetStage(100)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pMS07c Auto Const

Quest Property pMS07cTapes Auto Const

ObjectReference Property QuincyMapMarker Auto Const

ObjectReference Property NatickMapMarker Auto Const
