;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueVault114_00102255 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
DialogueVault114_IntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Alias_TriggermanGhoul01.GetActorRef().SetValue(Aggression, 2)
Alias_TriggermanHuman01.GetActorRef().SetValue(Aggression, 2)
Alias_TriggermanHuman01B.GetActorRef().SetValue(Aggression, 2)
Alias_TriggermanGhoul01B.GetActorRef().SetValue(Aggression, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
DialogueVault114_Scene02b.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Alias_TriggermanInsideVault.GetActorRef().SetValue(Aggression, 2)
Alias_TriggermanInsideVault.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
DialogueVault114_Scene03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
Alias_TriggermanGhoul03.GetActorRef().SetValue(Aggression, 2)
Alias_TriggermanHuman03.GetActorRef().SetValue(Aggression, 2)
Alias_TriggermanGhoulMeleeRestrict.GetActorRef().SetValue(Aggression, 2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DialogueVault114_IntroScene Auto Const

Scene Property DialogueVault114_Scene02 Auto Const

Scene Property DialogueVault114_Scene03 Auto Const

ReferenceAlias Property Alias_TriggermanHuman01 Auto Const

ReferenceAlias Property Alias_TriggermanGhoul01 Auto Const

ActorValue Property Aggression Auto Const

ReferenceAlias Property Alias_TriggermanInsideVault Auto Const

Scene Property DialogueVault114_Scene02b Auto Const

ReferenceAlias Property Alias_TriggermanHuman03 Auto Const

ReferenceAlias Property Alias_TriggermanGhoul03 Auto Const

ReferenceAlias Property Alias_TriggermanGhoulMeleeRestrict Auto Const

ReferenceAlias Property Alias_TriggermanHuman01B Auto Const

ReferenceAlias Property Alias_TriggermanGhoul01B Auto Const Mandatory
