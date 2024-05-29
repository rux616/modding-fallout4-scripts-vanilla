;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN015_IsotopeContainmen_00099CCE Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
(DN015 as DN015QuestScript).HasIsotopeContainmentBeenUnlocked = True
akTerminalRef.GetLinkedRef().SetOpen()
;Comment this out later
akTerminalRef.GetLinkedRef(LinkCustom01).Activate(akTerminalRef.GetLinkedRef(LinkCustom01))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
(DN015 as DN015QuestScript).HasIsotopeConsoleBeenUnlocked = True
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
(DN015 as DN015QuestScript).HasIsotopeConsoleBeenUnlocked = True
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN015 Auto Const

Keyword Property LinkCustom01 Auto Const
