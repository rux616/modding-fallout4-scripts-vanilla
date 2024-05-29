Scriptname Patch_1_6_Script extends Quest

ReferenceAlias property Alias_MarcyLong auto const mandatory 
ReferenceAlias property Alias_JunLong auto const mandatory 

bool bJunMarcyDone = false 

function JunMarcyUnessential()
	if bJunMarcyDone == false
		bJunMarcyDone = true
		WorkshopNPCScript marcy = Alias_MarcyLong.GetRef() as WorkshopNPCScript
		WorkshopNPCScript jun = Alias_JunLong.GetRef() as WorkshopNPCScript

		if marcy.IsDead() == false
			marcy.GetActorBase().SetEssential(false)
			marcy.GetActorBase().SetProtected(true)
			marcy.SetAllowMove(true)
			marcy.SetAllowCaravan(true)
		endif

		if jun.IsDead() == false
			jun.GetActorBase().SetEssential(false)
			jun.GetActorBase().SetProtected(true)
			jun.SetAllowMove(true)
			jun.SetAllowCaravan(true)
		endif
	endif
endFunction