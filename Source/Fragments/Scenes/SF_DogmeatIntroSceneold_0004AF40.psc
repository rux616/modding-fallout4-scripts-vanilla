;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DogmeatIntroSceneold_0004AF40 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
Objectreference Feral01Ref = Feral01RefAlias.getReference()
Feral01Ref.moveTo(Feral01Ref.getLinkedRef(LinkCustom01))
Objectreference Feral02Ref = Feral02RefAlias.getReference()
Feral02Ref.moveTo(Feral02Ref.getLinkedRef(LinkCustom01))
Objectreference Feral03Ref = Feral03RefAlias.getReference()
Feral03Ref.moveTo(Feral03Ref.getLinkedRef(LinkCustom01))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
Objectreference Feral01Ref = Feral01RefAlias.getReference()
;(Feral01Ref as actor).setAV("health", 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property dogmeatRefAlias Auto Const

ReferenceAlias Property Feral01RefAlias Auto Const

ReferenceAlias Property Feral02RefAlias Auto Const

ReferenceAlias Property feral03RefAlias Auto Const

Keyword Property LinkCustom01 Auto Const
