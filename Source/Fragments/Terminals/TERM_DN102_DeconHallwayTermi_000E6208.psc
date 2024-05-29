;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN102_DeconHallwayTermi_000E6208 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
;Clear the gas.
DN102.SetStage(90)

;Activate the decontamination arches.
int i = 0
While (i < Alias_DN102_DeconHallArchRefs.GetCount())
     (Alias_DN102_DeconHallArchRefs.GetAt(i) as Default2StateActivator).SetOpenNoWait(True)
     i = i + 1
EndWhile
;Enable the decontamination 'hazards'.
i = 0
While (i < Alias_DN102_DeconHallDeconMistRefs.GetCount())
     Alias_DN102_DeconHallDeconMistRefs.GetAt(i).EnableNoWait()
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
;Deactivate the decontamination arches.
int i = 0
While (i < Alias_DN102_DeconHallArchRefs.GetCount())
     (Alias_DN102_DeconHallArchRefs.GetAt(i) as Default2StateActivator).SetOpenNoWait(False)
     i = i + 1
EndWhile
;Enable the decontamination 'hazards'.
i = 0
While (i < Alias_DN102_DeconHallDeconMistRefs.GetCount())
     Alias_DN102_DeconHallDeconMistRefs.GetAt(i).DisableNoWait()
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN102 Auto Const

RefCollectionAlias Property Alias_DN102_DeconHallArchRefs Auto Const

RefCollectionAlias Property Alias_DN102_DeconHallDeconMistRefs Auto Const
