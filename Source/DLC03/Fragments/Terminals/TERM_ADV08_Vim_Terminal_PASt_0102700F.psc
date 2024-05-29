;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Terminals:TERM_ADV08_Vim_Terminal_PASt_0102700F Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
DLC03_HasVimPASchematicRed.SetValue(1)
DLC03_HasVimPASchematicGreen.SetValue(1)
DLC03_VimPaintjobScematicMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property DLC03_VimPaintjobScematicMessage Auto Const Mandatory

GlobalVariable Property DLC03_HasVimPASchematicRed Auto Const Mandatory
GlobalVariable Property DLC03_HasVimPASchematicGreen Auto Const Mandatory
