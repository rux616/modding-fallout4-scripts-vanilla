;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_DogmeatIntroHangAtRedRock_0019EE50 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(Actor akActor)
;BEGIN CODE
(dogmeatRefAlias.getActorRef() as DogmeatActorScript).makeDogmeatSniffy(TRUE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Change
Function Fragment_Change(Actor akActor)
;BEGIN CODE
(dogmeatRefAlias.getActorRef() as DogmeatActorScript).makeDogmeatSniffy(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property dogmeatRefAlias Auto Const
