;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_AO_Dogmeat_FindHostile_0004926A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RefCollectionAliasManager
Quest __temp = self as Quest
RefCollectionAliasManager kmyQuest = __temp as RefCollectionAliasManager
;END AUTOCAST
;BEGIN CODE
debug.trace(self + "stage 0, startup")

;THIS STAGE IS NEEDED BECAUSE OF THE AODogmeatQuestScript HAS A OnStageSet() EVENT
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;scene started Dogmeat escorting toward hostiles
DogmeatIdles.SetDogmeatAlert()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
DogmeatIdles.SetDogmeatAgitated()
DogmeatIdles.FaceAngry(AutomaticallyBackToNeutralFace = false) ;set to neutral in stage 255
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;THIS STAGE IS NEEDED BECAUSE OF THE AODogmeatQuestScript HAS A OnStageSet() EVENT

DogmeatIdles.SetDogmeatNeutral()
DogmeatIdles.FaceNeutral()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment



ReferenceAlias Property Alias_myActor Auto Const

ReferenceAlias Property Alias_myObject Auto Const
