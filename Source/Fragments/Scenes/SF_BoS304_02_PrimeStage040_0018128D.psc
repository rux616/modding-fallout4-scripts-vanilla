;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoS304_02_PrimeStage040_0018128D Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
BoS304PrimeAlias.GetActorRef().playSubgraphAnimation("lightsStartup")
BoSLPLightsOnForever.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DNPrime_BoS304 Auto Const

ReferenceAlias Property BoS304PrimeAlias Auto Const

GlobalVariable Property BoSLPLightsOnForever Auto Const
