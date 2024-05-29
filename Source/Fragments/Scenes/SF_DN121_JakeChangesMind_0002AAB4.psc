;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN121_JakeChangesMind_0002AAB4 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
DN121_CoABossRoomFaction.SetEnemy(DN121_JakeFaction, 1, 1)
DN121_JakeFaction.setEnemy(ChildrenOfAtomFaction, 1, 1)
GetOwningQuest().SetStage(450)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property DN121_JakeFaction Auto Const

Faction Property DN121_CoABossRoomFaction Auto Const

Faction Property ChildrenOfAtomFaction Auto Const
