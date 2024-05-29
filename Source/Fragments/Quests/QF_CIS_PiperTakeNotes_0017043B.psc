;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CIS_PiperTakeNotes_0017043B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
FollowersScript.Trace(self, "Stage 0 - startup")

;REMINDER! Set "Scene to Stop" data on the BailOut script attached to the Companion Alias
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
FollowersScript.Trace(self, "Stage 255 - shutdown")
AttractionObjectScript AOS = Alias_Target.GetReference() as AttractionObjectScript
if AOS
   AOS.DoMything()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Target Auto Const
