;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Companion_PrestonHero_000849B0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
Alias_Preston.GetReference().AddItem(LL_Companion_PrestonHero)
;Companion_PrestonHero_msg.show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property Companion_PrestonHero_msg Auto Const

LeveledItem Property LL_Companion_PrestonHero Auto Const

ReferenceAlias Property Alias_Preston Auto Const
