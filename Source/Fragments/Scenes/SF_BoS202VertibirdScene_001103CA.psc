;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoS202VertibirdScene_001103CA Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE BoS202Quest
BoS202Quest kmyQuest = GetOwningQuest() as BoS202Quest
;END AUTOCAST
;BEGIN CODE
if BoS202VbirdWin.GetValue() == 0
kmyQuest.EnableLayer.EnableFastTravel()
kmyQuest.EnableLayer.Delete()
endif
(GetOwningQuest() as CompanionVertibirdQuestScript).EndSceneGhostCheck()
if CompanionVertibirdEntryType.GetValue() != CompanionVertibirdEntryType_Exit.GetValue()
(GetOwningQuest() as CompanionVertibirdQuestScript).CompanionsShouldExitVertibird()
endif
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

;BEGIN FRAGMENT Fragment_Phase_06_Begin
Function Fragment_Phase_06_Begin()
;BEGIN AUTOCAST TYPE BoS202Quest
BoS202Quest kmyQuest = GetOwningQuest() as BoS202Quest
;END AUTOCAST
;BEGIN CODE
MUSReward.Add()
VertibirdTurretScript turret = BoS202VB.GetReference() as VertibirdTurretScript
if(turret)
  turret.BlockPlayerActivation(False)
endif
kmyQuest.EnableLayer.EnableFastTravel()
kmyQuest.EnableLayer.Delete()
BoS202VbirdWin.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN AUTOCAST TYPE companionvertibirdquestscript
companionvertibirdquestscript kmyQuest = GetOwningQuest() as companionvertibirdquestscript
;END AUTOCAST
;BEGIN CODE
VertibirdTurretScript turret = BoS202VB.GetReference() as VertibirdTurretScript
if(turret)
  turret.BlockPlayerActivation()
endif
kmyquest.CompanionsShouldExitVertibird()
kmyQuest.GhostOff()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property BoS202VB Auto Const

Action Property ActionPropellersOn Auto Const

Quest Property BoS202 Auto Const

MusicType Property MUSReward Auto Const

ReferenceAlias Property BoS202CompanionAlias Auto Const

ReferenceAlias Property BoS202DogmeatAlias Auto Const

GlobalVariable Property BoS202VbirdWin Auto Const

GlobalVariable Property CompanionVertibirdEntryType Auto Const Mandatory

GlobalVariable Property CompanionVertibirdEntryType_Exit Auto Const Mandatory
