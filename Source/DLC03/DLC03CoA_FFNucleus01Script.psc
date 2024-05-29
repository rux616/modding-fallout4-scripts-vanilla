Scriptname DLC03:DLC03CoA_FFNucleus01Script extends Quest

Quest Property DLC03CoA_Kickout Auto Const Mandatory
{Manages shutting down quest on kick out from Children}

DLC03:DLC03MQ06_NukeHandlingScript Property DLC03MQ06_NukeHandlingScript Auto Const Mandatory
{Manages firing nuke, which fails all quests}

int Property iCoAKickOutStage = 700 Auto Const 
{Stage for Children of Atom kick out on kickout quest}

FormList Property DLC03_FFNucleus01_ChildrenofAtomClothes Auto Const Mandatory
{Used to know if the player has CoA robes equipped}

Armor Property Clothes_RaiderMod_Hood1 Auto Const Mandatory
{Sack hood player needs to wear}

float Property fRadTimerLength = 4.0 Auto Const 
{Used to check if the player has the right amount of rads}

GlobalVariable Property DLC03_FFNucleus01_RadThreshold Auto Const Mandatory
{Amount of rads player must have to trigger convo with Devin}

ActorValue Property Rads Auto Const Mandatory
{Check the player's rads}

;Local vars
int iRadTimerID = 1 Const

Event OnQuestInit()
	;Register for Nuke firing custom event
	RegisterforCustomEvent(DLC03MQ06_NukeHandlingScript, "NukeCountdownStarted")

	;When quest starts, register for OnStageSet event on kickout quest
	RegisterforRemoteEvent(DLC03CoA_Kickout, "OnStageSet")

EndEvent

Event Quest.OnStageSet(Quest aksender, int auiStageID, int auiItemID)
	;If this stage gets set on kickout quest, shut this quest down
	if aksender == DLC03CoA_Kickout && auiStageID == iCoAKickOutStage
		SetStage(750)
	endif
EndEvent

Event DLC03:DLC03MQ06_NukeHandlingScript.NukeCountdownStarted(DLC03:DLC03MQ06_NukeHandlingScript akSender, Var[] akArgs)
	;If the nuke countdown has started, fail this quest
	SetStage(750)
EndEvent

Event OnTimer(int aiTimerID) 
	;If the player hasn't bypassed this stage of the quest or failed it
	if aiTimerID == iRadTimerID && !GetStageDone(100) && !GetStageDone(750)
		Actor Player = Game.GetPlayer()

		;If the player's rad threshold is below the right level,
		;throw the objective
		;If it's above, complete it
		if Player.GetValue(Rads) < DLC03_FFNucleus01_RadThreshold.GetValue()
			if IsObjectiveCompleted(40)
				SetObjectiveCompleted(40, false)
			endif
			
		else
			if IsObjectiveDisplayed(40) && !IsObjectiveCompleted(40)
				SetObjectiveCompleted(40)
			endif
		endif

		;Check to see if player has rags equipped
		if PlayerHasRagsEquipped()
			SetRagsObjComplete()
		else
			SetRagsObjUncomplete()
		endif

		;Check to see if player has rags equipped
		if PlayerHasHoodEquipped()
			SetHoodObjComplete()
		else
			SetHoodObjUncomplete()
		endif

		;Check to see if all objectives are completed. If so, update
		if IsObjectiveCompleted(30) && IsObjectiveCompleted(35) && IsObjectiveCompleted(40)
			;debug.trace("FFNuc01: All appropriate objectives completed.")
			if !IsObjectiveDisplayed(10)
				;debug.trace("FFNuc01: Obj 10 is not displayed. Show it now.")
				SetObjectiveDisplayed(10)
			endif
		else
			;debug.trace("FFNuc01: All appropriate objectives NOT completed.")
			if IsObjectiveDisplayed(10)
				;debug.trace("FFNuc01: Obj 10 is  displayed. Remove it.")
				SetObjectiveDisplayed(10, false)
			endif
		endif

		StartTimer(fRadTimerLength, iRadTimerID)
	endif
EndEvent

bool Function PlayerHasRagsEquipped()
	int i = 0
	int iSize = DLC03_FFNucleus01_ChildrenofAtomClothes.GetSize()
	Actor Player = Game.GetPlayer()

	;Roll through the form list of Children of Atom clothes
	while i < iSize

		if Player.IsEquipped(DLC03_FFNucleus01_ChildrenofAtomClothes.GetAt(i))
			;If the player has any equipped, return true
			return true
		endif
		i += 1
	endwhile

	;Otherwise, return false
	return false
EndFunction

bool Function PlayerHasHoodEquipped()
	if Game.GetPlayer().IsEquipped(Clothes_RaiderMod_Hood1)
		return true
	else
		return false
	endif
EndFunction

Function StartRadsTimer()
	StartTimer(fRadTimerLength, iRadTimerID)
EndFunction

Function CancelRadsTimer()
	CancelTimer(iRadTimerID)
EndFunction

;Used to unset Equip Rags objective from player alias script
Function SetRagsObjUncomplete()
	if IsObjectiveCompleted(30)
		SetObjectiveCompleted(30, false)
	endif
EndFunction

;Used to complete Equip Rags objectives from player alias script
Function SetRagsObjComplete()
	if IsObjectiveDisplayed(30) && !IsObjectiveCompleted(30)
		SetObjectiveCompleted(30)
	endif
EndFunction

;Used to unset Equip Hood from player alias script
Function SetHoodObjUncomplete()
	if IsObjectiveCompleted(35)
		SetObjectiveCompleted(35, false)
	endif
EndFunction

;Used to complete Equip Hood from player alias script
Function SetHoodObjComplete()
	if IsObjectiveDisplayed(35) && !IsObjectiveCompleted(35)
		SetObjectiveCompleted(35)
	endif
EndFunction