;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN019_000BDB0E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; start DN019JoinCult- otherwise linked aliases keep if from starting correctly
DN019JoinCult.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE DN019Script
Quest __temp = self as Quest
DN019Script kmyQuest = __temp as DN019Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.PlayerTalkedToLeader= true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE DN019Script
Quest __temp = self as Quest
DN019Script kmyQuest = __temp as DN019Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.PlayerKilledLeader = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DN019Script
Quest __temp = self as Quest
DN019Script kmyQuest = __temp as DN019Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.ResetLocation()
DN019JoinCult.SetStage(50) ; indicate MS09 Mission02
; lock door
objectReference theDoor = Alias_AmphitheaterDoor.GetRef()
theDoor.Lock()
theDoor.SetOpen(false)
; disable generic boss
Alias_CultistBoss.TryToDisable()
; enable Thomas and put him in Leader alias
Alias_Thomas.TryToEnable()
Alias_Leader.ForceRefTo(Alias_Thomas.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
; EVP Emogene to get her into forcegreet
Alias_Emogene.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; for now just a flag that normal reset can resume
DN019JoinCult.SetStage(750)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN019JoinCult Auto Const

ReferenceAlias Property Alias_Leader Auto Const

ReferenceAlias Property Alias_CultistBoss Auto Const

ReferenceAlias Property Alias_AmphitheaterDoor Auto Const

ReferenceAlias Property Alias_Thomas Auto Const

ReferenceAlias Property Alias_Emogene Auto Const
