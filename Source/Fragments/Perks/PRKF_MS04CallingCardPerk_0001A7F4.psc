;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF_MS04CallingCardPerk_0001A7F4 Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
if ( akTargetRef.HasKeyword(pMS04SilverShroudTargetKeyword) )

	; Make it so you can't place another calling card
	;akTargetRef.SetValue(pMS04SilverShroudTarget, 0)
	akTargetRef.RemoveKeyword(pMS04SilverShroudTargetKeyword)

	; Remove 1 calling card from the player
	Game.GetPlayer().RemoveItem(pMS04CallingCard, 1, FALSE)

	; Put a calling card on the body
	ObjectReference oCallingCardMoveable = Game.GetPlayer().PlaceAtMe(pMS04CallingCardMS)
	oCallingCardMoveable .SetPosition(akTargetRef.GetPositionX(), akTargetRef.GetPositionY(), akTargetRef.GetPositionZ() + 18.0)

	; If a Calling Card is placed on Wayne Delancy's corpse set the propert stage
	if ( akTargetRef == pAlias_WayneDelancy.GetReference() )
		pMS04.SetStage(599)
	endif

	; If a Calling Card is placed on Rex's corpse set the propert stage
	if ( akTargetRef == pAlias_Rex.GetReference() )
		pMS04.SetStage(490)
	endif

	; If a Calling Card is placed on Cato's corpse set the propert stage
	if ( akTargetRef == pAlias_Cato.GetReference() )
		pMS04.SetStage(440)
	endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property pMS04CallingCard Auto Const

ActorValue Property pMS04SilverShroudTarget Auto Const

MovableStatic Property pMS04CallingCardMS Auto Const

	Quest Property pMS04 Auto Const
	ReferenceAlias Property pAlias_WayneDelancy Auto Const
	ReferenceAlias Property pAlias_Rex Auto Const
	ReferenceAlias Property pAlias_Cato Auto Const

Keyword Property pMS04SilverShroudTargetKeyword Auto Const
