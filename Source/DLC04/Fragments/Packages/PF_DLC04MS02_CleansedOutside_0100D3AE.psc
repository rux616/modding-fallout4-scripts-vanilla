;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Packages:PF_DLC04MS02_CleansedOutside_0100D3AE Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
if DLC04MS02.GetStageDone(65) == true
    DLC04MS02.SetSTage(750)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC04MS02 Auto Const Mandatory
