;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CaravanTradePostWeathers_001E07AB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
; Move the caravan to the location
ObjectReference oHitchingPost = Alias_HitchingPost.GetRef()
ObjectReference oAttackMarker = Alias_WorkshopAttackMarker.GetRef()
ObjectReference oTeleportTo

; If the player is too close to the hitching post and there's a valid hidding waypoint
; then have the caravan teleport there, instead.
if ( Game.GetPlayer().GetDistance(oHitchingPost) < 3000 && oAttackMarker )
  oTeleportTo = oAttackMarker
else
  oTeleportTo = oHitchingPost
endif

Alias_CaravanTrader.GetActorRef().MoveTo(oTeleportTo)
Alias_CaravanBrahmin.GetActorRef().MoveTo(oTeleportTo)
Alias_CaravanGuard01.GetActorRef().MoveTo(oTeleportTo)
Alias_CaravanGuard02.GetActorRef().MoveTo(oTeleportTo)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CaravanTrader Auto Const

ReferenceAlias Property Alias_HitchingPost Auto Const

ReferenceAlias Property Alias_CaravanBrahmin Auto Const

ReferenceAlias Property Alias_CaravanGuard01 Auto Const

ReferenceAlias Property Alias_CaravanGuard02 Auto Const

ReferenceAlias Property Alias_WorkshopAttackMarker Auto Const
