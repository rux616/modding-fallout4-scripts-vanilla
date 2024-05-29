;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN121_JakeFreePrisoner_0103FF78 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN CODE
(Prisoner01 as DefaultCaptiveAlias).FreePrisoner(Prisoner01.GetActorRef(), playerIsLiberator= false, OpenPrisonerInventory = False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Prisoner01 Auto Const
