;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueTheSlogJonesDogme_010A0FCF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Play paired anim
alias_Jones.getActorRef().playIdleWithTarget(pairedDogmeatHumanGreetPetKneel, alias_Dogmeat.getActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Jones Auto Const

ReferenceAlias Property Alias_dogmeat Auto Const

Idle Property PairedDogmeatHumanGreetPetKneel Auto Const
