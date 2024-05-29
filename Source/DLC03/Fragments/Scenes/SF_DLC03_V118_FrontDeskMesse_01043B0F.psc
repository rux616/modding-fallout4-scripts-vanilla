;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DLC03_V118_FrontDeskMesse_01043B0F Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
ObjectReference myDoor = IntroDoor.GetReference()
myDoor.SetOpen()
myDoor.Unlock()
myDoor.SetLockLevel(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property IntroDoor Auto Const
