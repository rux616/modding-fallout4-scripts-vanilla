;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoS201_02_VertibirdFlight_00121F31 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE bos201questscript
bos201questscript kmyQuest = GetOwningQuest() as bos201questscript
;END AUTOCAST
;BEGIN CODE
Debug.Trace("Scene Done")
kmyQuest.EnableLayer.EnableFastTravel()
kmyQuest.EnableLayer.Delete()
(GetOwningQuest() as CompanionVertibirdQuestScript).EndSceneGhostCheck()

;This allows the player to exit the vertibird and re-enter as many times as they want.
VertibirdTurretScript turret = BoS201Vertibird.GetReference() as VertibirdTurretScript
if(turret)
   turret.BlockPlayerActivation(false)
endif

BoS201.SetStage(90)
Debug.Trace("Stuff Ran")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE companionvertibirdquestscript
companionvertibirdquestscript kmyQuest = GetOwningQuest() as companionvertibirdquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.CompanionsShouldSnapIntoVertibird()
kmyQuest.VBCrimeWipe()
kmyquest.GhostOn()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN AUTOCAST TYPE bos201questscript
bos201questscript kmyQuest = GetOwningQuest() as bos201questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SilenceCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_05_End
Function Fragment_Phase_05_End()
;BEGIN AUTOCAST TYPE bos201questscript
bos201questscript kmyQuest = GetOwningQuest() as bos201questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SilenceCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN AUTOCAST TYPE bos201questscript
bos201questscript kmyQuest = GetOwningQuest() as bos201questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SilenceCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_End
Function Fragment_Phase_07_End()
;BEGIN AUTOCAST TYPE bos201questscript
bos201questscript kmyQuest = GetOwningQuest() as bos201questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SilenceCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_08_End
Function Fragment_Phase_08_End()
;BEGIN AUTOCAST TYPE bos201questscript
bos201questscript kmyQuest = GetOwningQuest() as bos201questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SilenceCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_09_End
Function Fragment_Phase_09_End()
;BEGIN AUTOCAST TYPE bos201questscript
bos201questscript kmyQuest = GetOwningQuest() as bos201questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SilenceCombat()
BoSPrydwenVertibirdMainPerch.PlayAnimation("opened")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_10_End
Function Fragment_Phase_10_End()
;BEGIN AUTOCAST TYPE bos201questscript
bos201questscript kmyQuest = GetOwningQuest() as bos201questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SilenceCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_11_Begin
Function Fragment_Phase_11_Begin()
;BEGIN CODE
MUSReward.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_11_End
Function Fragment_Phase_11_End()
;BEGIN AUTOCAST TYPE bos201questscript
bos201questscript kmyQuest = GetOwningQuest() as bos201questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SilenceCombat()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property BoS201Vertibird Auto Const

Quest Property BoS201 Auto Const

MusicType Property MUSReward Auto Const

ObjectReference Property BoSPrydwenVertibirdMainPerch Auto Const
