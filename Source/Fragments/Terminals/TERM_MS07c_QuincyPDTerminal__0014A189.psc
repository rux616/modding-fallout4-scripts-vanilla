;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_MS07c_QuincyPDTerminal__0014A189 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
CoastGuardMapMarker.AddtoMap()
SouthBostonMapMarker.AddtoMap()

if pMS07c.GetStageDone(10)
  if !pMS07c.GetStageDone(90)
    pMS07c.SetStage(90)
  endif
else
  if !pMS07cTapes.GetStageDone(90)
    pMS07cTapes.SetStage(90)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pMS07c Auto Const

Quest Property pMS07cTapes Auto Const

ObjectReference Property CoastGuardMapMarker Auto Const

ObjectReference Property SouthBostonMapMarker Auto Const
