;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Packages:PF_DLC01REObjectKMK01GroupMo_0100AF6B Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
Alias_SentryBot.GetRef().RemoveAllItems(akActor)
GetOwningQuest().SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_SentryBot Auto Const
