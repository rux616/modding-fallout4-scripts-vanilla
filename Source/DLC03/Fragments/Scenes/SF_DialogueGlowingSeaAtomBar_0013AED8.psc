;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DialogueGlowingSeaAtomBar_0013AED8 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
Actor PA = Game.GetPlayer()

if !PA.HasPerk(ImmuneToRadiation)
  PA.AddPerk(ImmuneToRadiation)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
Actor PA = Game.GetPlayer()

if PA.HasPerk(ImmuneToRadiation)
  PA.RemovePerk(ImmuneToRadiation)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Perk Property ImmuneToRadiation Auto Const Mandatory
