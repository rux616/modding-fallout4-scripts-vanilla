;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN112_0016250B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_MrHandy01Greeter.GetActorRef().AddToFaction(PlayerEnemyFaction)
Alias_MrHandy02.GetActorRef().AddToFaction(PlayerEnemyFaction)
Alias_MrHandy03.GetActorRef().AddToFaction(PlayerEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_MrHandy01Greeter Auto Const

ReferenceAlias Property Alias_MrHandy02 Auto Const

Faction Property PlayerEnemyFaction Auto Const

ReferenceAlias Property Alias_MrHandy03 Auto Const
