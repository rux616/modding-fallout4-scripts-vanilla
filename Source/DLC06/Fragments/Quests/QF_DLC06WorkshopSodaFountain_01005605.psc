;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Quests:QF_DLC06WorkshopSodaFountain_01005605 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; move marker to node
DLC06:WorkshopIdleObjectScript idleObject = Alias_TargetObject.GetRef() as DLC06:WorkshopIdleObjectScript
ObjectReference targetMarker = Alias_TargetMarker.GetRef()
targetMarker.MoveToNode(idleObject, idleObject.TargetMarkerNode)
; make sure marker is on navmesh
targetMarker.MoveToNearestNavmeshLocation()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_targetMarker Auto Const Mandatory

ReferenceAlias Property Alias_targetObject Auto Const Mandatory
