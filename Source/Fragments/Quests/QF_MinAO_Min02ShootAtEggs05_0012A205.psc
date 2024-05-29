;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MinAO_Min02ShootAtEggs05_0012A205 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
debug.trace(self + "stage 0: startup")
objectReference ShootingPosition = Alias_MyObject.GetReference().GetLinkedRef(LinkCustom01)
ObjectReference MyActorRef = Alias_MyActor.GetReference()
Actor MyActor = Alias_MyActor.GetActorRef()

if ShootingPosition 
	Alias_ShootingPosition.ForceRefTo(ShootingPosition)
	MyActorRef .SetLinkedRef(ShootingPosition, AO_Min02EggShootingPosition)

else
	Alias_ShootingPosition.ForceRefTo(Alias_MyObject.GetReference())
	MyActorRef .SetLinkedRef(Alias_MyObject.GetReference(), AO_Min02EggShootingPosition)

endif
MyActor.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;If our target egg is destroyed, move a new on into the target alias if we have any more nearby
ObjectReference MyActorRef = Alias_MyActor.GetReference()
Actor MyActor = Alias_MyActor.GetActorRef()

if Alias_NearbyObjects.GetCount() >= 1
	objectReference TargetRef = Alias_NearbyObjects.GetAt(0)
	Alias_MyObject.ForceRefTo(TargetRef )
	
	objectReference ShootingPosition = TargetRef.GetLinkedRef(LinkCustom01)
	if ShootingPosition 
		Alias_ShootingPosition.ForceRefTo(ShootingPosition)
		MyActorRef .SetLinkedRef(ShootingPosition, AO_Min02EggShootingPosition)
	else
		Alias_ShootingPosition.ForceRefTo(TargetRef)
		MyActorRef .SetLinkedRef(TargetRef, AO_Min02EggShootingPosition)
	endif

	Alias_NearbyObjects.RemoveRef(TargetRef )
	myActor.EvaluatePackage()
;if we don't have any more, then set the stage to bail out
else
	SetStage(100)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_MyActor.GetReference().SetLinkedRef(NONE, AO_Min02EggShootingPosition)
Alias_MyActor.GetActorRef().EvaluatePackage()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_myObject Auto Const

Scene Property AO_LightsOutGJ_Scene Auto Const

ReferenceAlias Property Alias_myActor Auto Const

RefCollectionAlias Property Alias_ActorAllies Auto Const

Faction Property AO_SuspicionFaction Auto Const

RefCollectionAlias Property Alias_OtherMissingLights Auto Const

RefCollectionAlias Property Alias_NearbyObjects Auto Const

ReferenceAlias Property Alias_ShootingPosition Auto Const Mandatory

Keyword Property LinkCustom01 Auto Const Mandatory

Keyword Property AO_Min02EggShootingPosition Auto Const Mandatory
