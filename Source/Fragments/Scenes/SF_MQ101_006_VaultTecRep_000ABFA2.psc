;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ101_006_VaultTecRep_000ABFA2 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_08_End
Function Fragment_Phase_08_End()
;BEGIN CODE
Game.ShowSPECIALMenu()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_09_End
Function Fragment_Phase_09_End()
;BEGIN CODE
Game.StopDialogueCamera()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_11_End
Function Fragment_Phase_11_End()
;BEGIN CODE
VaultTecRep.GetActorRef().ChangeAnimFlavor()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property VaultTecRep Auto Const
