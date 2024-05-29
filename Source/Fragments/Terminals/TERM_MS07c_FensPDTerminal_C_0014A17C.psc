;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_MS07c_FensPDTerminal_C_0014A17C Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
SouthBostonMapMarker.AddtoMap()
NatickMapMarker.AddtoMap()

if pMS07c.GetStageDone(10)
  if !pMS07c.GetStageDone(50)
    pMS07c.SetStage(50)
  endif
else
  if !pMS07cTapes.GetStageDone(50)
    pMS07cTapes.SetStage(50)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pMS07c Auto Const

Quest Property pMS07cTapes Auto Const

ObjectReference Property SouthBostonMapMarker Auto Const

ObjectReference Property NatickMapMarker Auto Const
