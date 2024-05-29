;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoS303_02_Vertibird_00156914 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE companionvertibirdquestscript
companionvertibirdquestscript kmyQuest = GetOwningQuest() as companionvertibirdquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.EndSceneGhostCheck()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE companionvertibirdquestscript
companionvertibirdquestscript kmyQuest = GetOwningQuest() as companionvertibirdquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CompanionsShouldSnapIntoVertibird()
kmyQuest.VBCrimeWipe()
kmyQuest.GhostOn()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN AUTOCAST TYPE BoS303QuestScript
BoS303QuestScript kmyQuest = GetOwningQuest() as BoS303QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.EnableLayer = InputEnableLayer.Create()
kmyQuest.EnableLayer.EnableFastTravel(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_14_End
Function Fragment_Phase_14_End()
;BEGIN CODE
;Display the 'Jump from the Vertibird' tutorial message.
Tutorial.SetStage(2400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_15_End
Function Fragment_Phase_15_End()
;BEGIN CODE
;Make sure Ingram gets off vbird
Alias_BoS303Ingram.GetActorRef().Dismount()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_16_Begin
Function Fragment_Phase_16_Begin()
;BEGIN AUTOCAST TYPE BoS303QuestScript
BoS303QuestScript kmyQuest = GetOwningQuest() as BoS303QuestScript
;END AUTOCAST
;BEGIN CODE
VertibirdTurretScript turret = BoS303Vertibird.GetReference() as VertibirdTurretScript
if(turret)
  turret.BlockPlayerActivation(False)
endif
kmyQuest.EnableLayer.EnableFastTravel()
kmyQuest.EnableLayer.Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_16_End
Function Fragment_Phase_16_End()
;BEGIN AUTOCAST TYPE companionvertibirdquestscript
companionvertibirdquestscript kmyQuest = GetOwningQuest() as companionvertibirdquestscript
;END AUTOCAST
;BEGIN CODE
VertibirdTurretScript turret = BoS303Vertibird.GetReference() as VertibirdTurretScript
if(turret)
  turret.BlockPlayerActivation()
endif
kmyquest.CompanionsShouldExitVertibird()
kmyQuest.GhostOff()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property BoS303Vertibird Auto Const

Quest Property Tutorial Auto Const


ReferenceAlias Property Alias_BoS303Ingram Auto Const
