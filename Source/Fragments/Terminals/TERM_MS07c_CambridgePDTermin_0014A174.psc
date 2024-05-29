;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_MS07c_CambridgePDTermin_0014A174 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
BADTFLMapMarker.AddToMap()
MaldenMapMarker.AddToMap()

if pMS07c.GetStageDone(10)
  if !pMS07c.GetStageDone(20)
    pMS07c.SetStage(20)
  endif
else
  if !pMS07cTapes.GetStageDone(20)
    pMS07cTapes.SetStage(20)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pMS07c Auto Const

Quest Property pMS07cTapes Auto Const

ObjectReference Property BADTFLMapMarker Auto Const

ObjectReference Property MaldenMapMarker Auto Const
