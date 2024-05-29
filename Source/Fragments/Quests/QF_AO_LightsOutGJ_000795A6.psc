;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_AO_LightsOutGJ_000795A6 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
debug.trace(self + "stage 0: startup")
; mark this object as "busy" so it won't keep getting picked until state changes
AttractionObjectScript myObject = Alias_myObject.GetRef() as AttractionObjectScript
if myObject
	myObject.busy = true
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; count number of times this has happened
actor myActor = Alias_myActor.GetActorRef()
EEScript.GetScript().IncrementSuspicionEventCount(myActor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
; make suspicious if this has happened multiple times
actor myActor = Alias_myActor.GetActorRef()
ObjectReference myObject = Alias_myObject.GetRef()

EEScript.GetScript().CheckSuspicionFaction(myActor, myObject, Alias_ActorAllies)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
AttractionObjectScript attrObject = Alias_myObject.GetReference() as AttractionObjectScript
if attrObject 
	attrObject.DoMything()
	;if this was a missing light marker, it deletes the object (a marker palce when the light was taken)
	;since we don't want any more events associated with it

	DefaultRemoteControlObjectReference remoteObject = Alias_myObject.GetRef() as DefaultRemoteControlObjectReference
	if remoteObject
		; if switch isn't in default toggle state, clear busy
		if remoteObject.ToggleIsInDefaultState == false
			attrObject.busy = false
		endif
	endif

endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_myObject Auto Const

Scene Property AO_LightsOutGJ_Scene Auto Const

ReferenceAlias Property Alias_myActor Auto Const

RefCollectionAlias Property Alias_ActorAllies Auto Const

Faction Property AO_SuspicionFaction Auto Const
