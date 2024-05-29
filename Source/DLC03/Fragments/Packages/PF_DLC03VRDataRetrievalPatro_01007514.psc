;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Packages:PF_DLC03VRDataRetrievalPatro_01007514 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
DLC03MQ04.DataReturn(akActor, self)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC03:MQ04Script Property DLC03MQ04 Auto Const Mandatory
