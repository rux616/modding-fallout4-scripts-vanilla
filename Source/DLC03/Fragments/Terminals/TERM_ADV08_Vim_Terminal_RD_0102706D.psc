;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Terminals:TERM_ADV08_Vim_Terminal_RD_0102706D Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
DLC03_HasVimDrinkRecipes.SetValue(1)
DLC03_VimDrinkRecipesMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property DLC03_VimDrinkRecipesMessage Auto Const Mandatory

GlobalVariable Property DLC03_HasVimDrinkRecipes Auto Const Mandatory
