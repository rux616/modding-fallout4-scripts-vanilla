;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04_BottlingPlantReleas_0103D7D8 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
ObjectReference QueenActivator = NukalurkQueenActivator.GetReference()
QueenActivator.Activate(QueenActivator)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property NukalurkQueenActivator Auto Const
