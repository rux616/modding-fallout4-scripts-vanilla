;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoS101ArcJetComputerScene_0001D8BC Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
;Set BoS101Arcjet stage 20.
GetOwningQuest().SetStage(20)

;Begin the synth assault.
if (!DN017.GetStageDone(86))
     BoS101ArcJetComputerScene01c.Start()
     DN017.SetStage(86)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN017 Auto Const

Scene Property BoS101ArcJetComputerScene01c Auto Const
