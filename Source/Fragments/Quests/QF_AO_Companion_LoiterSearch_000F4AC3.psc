;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_AO_Companion_LoiterSearch_000F4AC3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE RefCollectionAliasManager
Quest __temp = self as Quest
RefCollectionAliasManager kmyQuest = __temp as RefCollectionAliasManager
;END AUTOCAST
;BEGIN CODE
debug.trace(self + "stage 0, startup")

((self as quest) as RefCollectionAliasManager).ProcessCollection()

debug.trace(self + "stage 0, done processing.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
ObjectReference myObjectRef = Alias_myObject.GetReference()

if myObjectRef
  ; myObjectRef.addKeyword(AO_Companion_AlreadySearched)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
AttractionObjectScript AOS = Alias_myObject.GetReference() as AttractionObjectScript
if AOS
   AOS.DoMything()
endif

AOScript.FlagObjectAliasFinished(Alias_myObject)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment



ReferenceAlias Property Alias_myActor Auto Const

ReferenceAlias Property Alias_myObject Auto Const

