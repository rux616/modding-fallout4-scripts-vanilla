Scriptname DLC06:VaultWorkshopScript extends workshopscript


group VaultWorkshopData
	
	DLC06:DLC06WorkshopParent property DLC06WorkshopParent auto const mandatory 
	
	Quest property DLC06MQ02 auto const mandatory 
	int property MQ02WorkshopStage = 400 auto const

	Quest property DLC06MQ03 auto const mandatory 
	int property MQ03AllowRecruitmentStage = 700 auto const
	GlobalVariable property DLC06PlayerIsOverseer auto const mandatory 

	MiscObject property DLC06WorkshopControlBoard auto const mandatory 
	{ my control board base object }

	int property VaultBonusNPCs = 10 auto const
endGroup

Event OnActivate(ObjectReference akActionRef)
	debug.trace(self + " OnActivate")
	if akActionRef == Game.GetPlayer()
		if OwnedByPlayer
			debug.trace(self + " owned by player - start workshop")
			StartWorkshop()
		else 
			debug.trace(self + " not owned - check for control board")
			Actor player = Game.GetPlayer()
			if player.GetItemCount(DLC06WorkshopControlBoard) > 0
				;if DLC06WorkshopParent.DLC06WorkshopInsertControlBoardMessage.Show() == 0
					player.RemoveItem(DLC06WorkshopControlBoard)
					SetOwnedByPlayer(true)
					DLC06MQ02.SetStage(MQ02WorkshopStage)
					StartWorkshop()
				;endif
			else
				; workshop script already has this as the custom unowned message
				DLC06WorkshopParent.DLC06WorkshopNeedControlBoardMessage.Show()
			endif
		endif
	endif
EndEvent

; Override parent function - prevent new NPC recruits until after MQ03
int function GetMaxWorkshopNPCs()
	if DLC06MQ03.GetStageDone(MQ03AllowRecruitmentStage) == false && DLC06PlayerIsOverseer.GetValue() == 0.0
		return 0
	else 
		return ( Parent.GetMaxWorkshopNPCs() + VaultBonusNPCs)
	endif
endFunction
