;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Site05_ClothingScrap_00147711 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
if player.GetActorRef().PlayIdleWithTarget(PairedDogmeatHumanInspectObject, Dogmeat.GetActorRef())
  debug.trace(self + "Player/Dogmeat anim SUCCESSFUL")
Else
  debug.trace(self + "Player/Dogmeat anim FAILED")
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Dogmeat Auto Const

ReferenceAlias Property Player Auto Const

Idle Property PairedDogmeatHumanInspectObject Auto Const
