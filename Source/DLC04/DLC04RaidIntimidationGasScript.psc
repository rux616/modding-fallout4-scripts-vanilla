Scriptname DLC04:DLC04RaidIntimidationGasScript extends activemagiceffect Const

Quest Property DLC04RaidCoerce Auto Const Mandatory
{Quest watching for change in intimidation value}

Quest Property DLC04RaidChaseOff Auto Const Mandatory
{Quest watching for change in intimidation}

ReferenceAlias Property CoerceSpokesperson Auto Const Mandatory
{Alias for the Coerce intimidation quest spokesperson}

ReferenceAlias Property ChaseSpokesperson Auto Const Mandatory
{Alias for the Chase Off intimidation quest spokesperson}

GlobalVariable Property DLC04OperatorsToolsConversationComplete Auto Const Mandatory
{Global managing when we should start allowing completion of the grenade related objectives}

Event OnEffectStart(Actor akTarget, Actor akCaster)
	;Effect has started. Check if we need to recalc intimidation
	CheckForRecalc(akTarget)

	;If the player has completed their conversation with Lizzie, update objectives
	if DLC04OperatorsToolsConversationComplete.GetValue() > 0
		if DLC04RaidCoerce.IsRunning()
			DLC04RaidCoerce.SetStage(31)
		elseif DLC04RaidChaseOff.IsRunning()
			DLC04RaidChaseOff.SetStage(31)
		endif
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	;Once effect has worn off, check if we need to recalc intimidation
	CheckForRecalc(akTarget)
EndEvent

Function CheckForRecalc(Actor akTarget)
	;If we have a spokesperson and they're the target, trigger intimidation recalc
	if CoerceSpokesperson.GetRef() && akTarget == CoerceSpokesperson.GetActorRef() && DLC04RaidCoerce.IsRunning() || ChaseSpokesperson.GetRef() && akTarget == ChaseSpokesperson.GetActorRef() && DLC04RaidChaseOff.IsRunning()
		RecalcIntimidation()
	endif
EndFunction

Function RecalcIntimidation()
	;If one of the intimidation quests is running, recalc intimidation now
	if DLC04RaidCoerce.IsRunning()
		(DLC04RaidCoerce as DLC04:DLC04RaidCoerceScript).CalculateIntimidationValue() 
	elseif DLC04RaidChaseOff.IsRunning()
		(DLC04RaidChaseOff as DLC04:DLC04RaidChaseOffScript).CalculateIntimidationValue() 
	endif
EndFunction