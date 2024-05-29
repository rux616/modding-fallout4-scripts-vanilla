;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Scenes:SF_DLC01Lair_MBattle_1150_Se_0100282D Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
Mechanist.GetActorRef().PlayIdle(MechanistCommandPointing)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property MechanistCommandPointing Auto Const Mandatory

ReferenceAlias Property Mechanist Auto Const
