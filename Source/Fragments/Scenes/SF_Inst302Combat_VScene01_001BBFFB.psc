;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Inst302Combat_VScene01_001BBFFB Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE Inst302CombatQuestScript
Inst302CombatQuestScript kmyQuest = GetOwningQuest() as Inst302CombatQuestScript
;END AUTOCAST
;BEGIN CODE
Alias_Pilot01.TryToEnable()
Alias_VPA01.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BHExtVScene01 Auto Const

ActorValue Property REVertibirdLandAirport Auto Const

Alias Property Alias_Vertibird01 Auto Const

ReferenceAlias Property Alias_Pilot01 Auto Const

ReferenceAlias Property Alias_VPA01 Auto Const
