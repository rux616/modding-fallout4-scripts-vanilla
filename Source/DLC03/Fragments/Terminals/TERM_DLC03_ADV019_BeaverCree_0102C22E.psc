;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Terminals:TERM_DLC03_ADV019_BeaverCree_0102C22E Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
if DLC03_HasBowlingBallAmmoRecipe.GetValue() != 1
	DLC03_HasBowlingBallAmmoRecipe.SetValue(1)
	;utility.wait(1.0)
	DLC03_ADV019_BowlingBallSchematicMessage.Show()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC03_HasBowlingBallAmmoRecipe Auto Const Mandatory

MiscObject Property DLC03_ADV019_BowlingBallSchematic Auto Const Mandatory

Message Property DLC03_ADV019_BowlingBallSchematicMessage Auto Const Mandatory
