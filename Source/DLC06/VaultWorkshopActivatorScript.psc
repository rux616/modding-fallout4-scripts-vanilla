Scriptname DLC06:VaultWorkshopActivatorScript extends ObjectReference conditional 

DLC06:DLC06WorkshopParent property DLC06WorkshopParent auto const mandatory 

Quest property DLC06MQ04 auto const mandatory 

int property firstActivateStage auto const 
int property turnOnStage auto const 

bool property bActive = false auto conditional
{ set to true when player can use this build area }

bool property bActivated = false auto conditional 
{ set to true first time player activates }

MiscObject property DLC06WorkshopControlBoard auto const mandatory 
{ my control board base object }

; add to main workshop build budget when activated:
group BuildingBudget
	int property MaxTriangles = 1000000 auto
	{ if > 0, initialize WorkshopMaxTriangles to this value }
	int property MaxDraws = 1000 auto
	{ if > 0, initialize WorkshopMaxDraws to this value }
	int property CurrentTriangles = 850000 auto
	{ if > 0, initialize WorkshopCurrentTriangles to this value }
	int property CurrentDraws = 500 auto
	{ if > 0, initialize WorkshopCurrentDraws to this value }
endGroup

auto state ready
; default state

	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == Game.GetPlayer()
			gotoState("busy")
			if bActive == false
				Actor player = Game.GetPlayer()
				if player.GetItemCount(DLC06WorkshopControlBoard) > 0
					;if DLC06WorkshopParent.DLC06WorkshopInsertControlBoardMessage.Show() == 0
						player.RemoveItem(DLC06WorkshopControlBoard)
						AddBuildArea()
						DLC06MQ04.SetStage(turnOnStage)
					;endif
				else
					bActivated = true
					DLC06MQ04.SetStage(firstActivateStage)
					DLC06WorkshopParent.DLC06WorkshopNeedControlBoardMessage.Show()
				endif
			endif 

			if bActive 
				; start workshop menu when activated while active
				DLC06WorkshopParent.VaultWorkshop.StartWorkshop()
			endif
			gotoState("ready")
		endif
	EndEvent

endState 

state busy 
	Event OnActivate(ObjectReference akActionRef)
		; do nothing
	endEvent
endState

function AddBuildArea()
		DLC06WorkshopParent.AddBuildArea(self)
		bActive = true
endFunction