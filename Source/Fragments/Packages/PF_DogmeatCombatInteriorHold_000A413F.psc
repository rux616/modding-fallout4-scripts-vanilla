;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_DogmeatCombatInteriorHold_000A413F Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(Actor akActor)
;BEGIN CODE
debug.trace("Dogmeat: Entering Combat Override Interior")
DogmeatIdles.SetDogmeatAgitated()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Change
Function Fragment_Change(Actor akActor)
;BEGIN CODE
debug.trace("Dogmeat: Changing PKG from Combat Override Interior")
DogmeatIdles.setDogmeatNeutral()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property DogAnimArchetypeAgitated Auto Const
