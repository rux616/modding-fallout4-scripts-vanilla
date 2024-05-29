Scriptname WorkshopApplyAliasDataScript extends ReferenceAlias Const
{stamps the actor with WorkshopActorApply data onInit
for any aliased actor at a workshop location
}

WorkshopParentScript Property WorkshopParent Auto Const

Event OnAliasInit()
	if GetActorRef()
		WorkshopParent.ApplyWorkshopAliasData(GetActorRef())
	endif
endEvent

