;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN084_Inst303Battle_01002D8E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Call back to DN084 to notify it that the battle has ended.
DN084.SetStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Kill any actors that are still alive.
Alias_SynthAlly1.TryToKill()
Alias_SynthAlly2.TryToKill()
Alias_SynthAlly3.TryToKill()
Alias_SynthAlly4.TryToKill()
Alias_BoSEnemy1.TryToKill()
Alias_BoSEnemy2.TryToKill()
Alias_BoSEnemy3.TryToKill()
Alias_BoSEnemy4.TryToKill()
Alias_BoSEnemy5.TryToKill()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN084 Auto Const

ReferenceAlias Property Alias_SynthAlly1 Auto Const

ReferenceAlias Property Alias_SynthAlly2 Auto Const

ReferenceAlias Property Alias_SynthAlly3 Auto Const

ReferenceAlias Property Alias_SynthAlly4 Auto Const

ReferenceAlias Property Alias_BoSEnemy1 Auto Const

ReferenceAlias Property Alias_BoSEnemy2 Auto Const

ReferenceAlias Property Alias_BoSEnemy3 Auto Const

ReferenceAlias Property Alias_BoSEnemy4 Auto Const

ReferenceAlias Property Alias_BoSEnemy5 Auto Const
