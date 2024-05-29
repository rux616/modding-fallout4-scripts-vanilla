;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN084_BoS303Battle_010027C9 Extends Quest Hidden Const

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
Alias_BoSAlly1.TryToKill()
Alias_BoSAlly2.TryToKill()
Alias_BoSAlly3.TryToKill()
Alias_BoSAlly4.TryToKill()
Alias_SynthEnemy1.TryToKill()
Alias_SynthEnemy2.TryToKill()
Alias_SynthEnemy3.TryToKill()
Alias_SynthEnemy4.TryToKill()
Alias_SynthEnemy5.TryToKill()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN084 Auto Const

ReferenceAlias Property Alias_BoSAlly1 Auto Const

ReferenceAlias Property Alias_BoSAlly2 Auto Const

ReferenceAlias Property Alias_BoSAlly3 Auto Const

ReferenceAlias Property Alias_BoSAlly4 Auto Const

ReferenceAlias Property Alias_SynthEnemy1 Auto Const

ReferenceAlias Property Alias_SynthEnemy2 Auto Const

ReferenceAlias Property Alias_SynthEnemy3 Auto Const

ReferenceAlias Property Alias_SynthEnemy4 Auto Const

ReferenceAlias Property Alias_SynthEnemy5 Auto Const
