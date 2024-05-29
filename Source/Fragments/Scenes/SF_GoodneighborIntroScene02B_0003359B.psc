;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_GoodneighborIntroScene02B_0003359B Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN CODE
debug.trace(self + "Hancock kills Finn anim start")

if Hancock.GetActorRef().PlayIdleWithTarget(PairedKillGoodneighbor, Finn.GetActorRef())
  debug.trace(self + "Hancock kills Finn anim SUCCESSFUL")
Else
  debug.trace(self + "Hancock kills Finn anim FAILED")
  Finn.GetActorRef().Kill()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Finn Auto Const

ReferenceAlias Property Hancock Auto Const

Idle Property PairedKillGoodNeighbor Auto Const
