;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_ProtectronShutDownComplet_000F3A70 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE DNMasterQuestScript
DNMasterQuestScript kmyQuest = GetOwningQuest() as DNMasterQuestScript
;END AUTOCAST
;BEGIN CODE
Actor Protectron = AliasProtectron.getActorReference()
Protectron.setUnconscious()
protectronScript ProScript = Protectron as protectronScript
ProScript.busy = false
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property AliasProtectron Auto Const
