Scriptname DLC04:DLC04RedRocketWorkshopScript extends workshopscript

group DLC04Properties
	GlobalVariable property DLC04PlayerKickedOut auto const mandatory 
	Quest property DLC04MQ05 auto const mandatory 
	Message property DLC04WorkshopRedRocketPickGangMessage auto const mandatory 
	DLC04:DLC04WorkshopParentScript property DLC04WorkshopParent auto const mandatory 
endGroup 

; override parent function
function CheckOwnership()
	if !OwnedByPlayer
		if DLC04PlayerKickedOut.GetValue() > 0
			DLC04WorkshopParent.ClearRaiderSettlement(self)
			SetOwnedByPlayer(true)
		elseif DLC04MQ05.IsCompleted()
			; show gang message
			int playerChoice = DLC04WorkshopRedRocketPickGangMessage.Show()
			if playerChoice < 3
				int myGang = playerChoice + 1
				DLC04WorkshopParent.SetRaiderSettlement(self, myGang)
				DLC04WorkshopParent.CreateRaider(self)
				DLC04WorkshopParent.CreateRaider(self)
				DLC04WorkshopParent.CreateRaider(self)
				DLC04WorkshopParent.CreateRaider(self)
			endif
		else 
			CustomUnownedMessage.Show()
		endif
	endif
endFunction

