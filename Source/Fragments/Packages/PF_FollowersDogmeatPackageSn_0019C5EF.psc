;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_FollowersDogmeatPackageSn_0019C5EF Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(Actor akActor)
;BEGIN CODE
;DogmeatIdles.setDogmeatALERT()
DogmeatIdles.setDogmeatAGITATED()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Change
Function Fragment_Change(Actor akActor)
;BEGIN CODE
DogmeatIdles.setDogmeatNeutral()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
