;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_Mq106DogmeatToFortHagenDo_00167A6F Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(Actor akActor)
;BEGIN CODE
dogmeatActorScript dogScript = akActor as DogmeatActorScript
dogScript.makeDogmeatSniffy(TRUE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
dogmeatActorScript dogScript = akActor as DogmeatActorScript
dogScript.makeDogmeatSniffy(FALSE)
DogmeatIdles.FoundSomething()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
