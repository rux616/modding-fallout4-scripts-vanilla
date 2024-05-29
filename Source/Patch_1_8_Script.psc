Scriptname Patch_1_8_Script extends Quest

bool bJunMarcyDone = false 

function JunMarcyUnessential_1_8(WorkshopNPCScript jun, WorkshopNPCScript marcy)
	if bJunMarcyDone == false
		debug.trace(self + " JunMarcyUnessential_1_8 ")
		bJunMarcyDone = true
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