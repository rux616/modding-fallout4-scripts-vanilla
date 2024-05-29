Scriptname DLC04:DLC04RaiderOutpostTrackerScript extends Quest

DLC04WorkshopParentScript Property DLC04WorkshopParent Auto Const Mandatory
{DLC04 Workshop Parent script}

GlobalVariable Property DLC04MQ04Warlord02Threshold Auto Const Mandatory
{Number of Raider Outposts player must have to get second rank of Wasteland Warlord}

GlobalVariable Property DLC04MQ04Warlord03Threshold Auto Const Mandatory
{Number of Raider Outposts player must have to get third rank of Wasteland Warlord}

GlobalVariable Property DLC04MQ04RaiderOutpostCount Auto Const Mandatory
{Number of Raider Outposts player has}

Event OnQuestInit()
	; keep nearby raider settlements collection up to date
	RegisterForCustomEvent(DLC04WorkshopParent, "DLC04WorkshopRaiderSettlementEvent")
endEvent

Event DLC04:DLC04WorkshopParentScript.DLC04WorkshopRaiderSettlementEvent(DLC04:DLC04WorkshopParentScript akSender, Var[] akArgs)
	WorkshopScript workshopRef = akArgs[0] as WorkshopScript
	bool bCreated = akArgs[1] as bool
	int raiderGangValue = akArgs[2] as int
	; only update when losing control - taking control is handled directly by DLC04RaidParentScript.UpdateMQ04OutpostCount()
	if bCreated == false || workshopRef.OwnedByPlayer == false
		UpdateOutpostCount()
	endif
endEvent 

function UpdateOutpostCount()
	; update quest global value
	UpdateCurrentInstanceGlobal(DLC04MQ04RaiderOutpostCount)

	int currentCount = DLC04MQ04RaiderOutpostCount.GetValueInt()

	; give player perks
	actor player = Game.GetPlayer()
	if currentCount > 0
		player.AddPerk(DLC04WorkshopParent.WastelandWarlordPerks[0])
	endif 

	if GetStageDone(50) == false && Player.HasPerk(DLC04WorkshopParent.WastelandWarlordPerks[0])
		if currentCount >= DLC04MQ04Warlord02Threshold.GetValue()
			player.AddPerk(DLC04WorkshopParent.WastelandWarlordPerks[1])
			SetStage(50)
		else 
			SetObjectiveDisplayed(10, true, true)
		endif 
	endif 

	if GetStageDone(100) == false && Player.HasPerk(DLC04WorkshopParent.WastelandWarlordPerks[1])
		if currentCount >= DLC04MQ04Warlord03Threshold.GetValue()
			player.AddPerk(DLC04WorkshopParent.WastelandWarlordPerks[2])
			SetStage(100)
		else 
			SetObjectiveDisplayed(50, true, true)
		endif 
	endif
endFunction
