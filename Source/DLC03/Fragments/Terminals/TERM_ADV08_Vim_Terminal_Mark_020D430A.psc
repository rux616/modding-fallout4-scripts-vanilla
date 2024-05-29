;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Terminals:TERM_ADV08_Vim_Terminal_Mark_020D430A Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
DLC03_HasVimMarketingMaterials.SetValue(1)
DLC03_VimMarketingScematicMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC03_HasVimMarketingMaterials Auto Const Mandatory

Message Property DLC03_VimMarketingScematicMessage Auto Const Mandatory
