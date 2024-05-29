Scriptname DLC03:DLC03MQ06_OnActivateAliasScript extends ReferenceAlias

Bool Property BlockWhilePlayerIsInCombat = FALSE Auto Const
{If TRUE then the stage will only set if the player isn't in combat.}

int Property iStageToSet Auto Const
{Stage to be set on owning quest}

int Property iPrereqStage = -1 Auto Const
{This stage must be completed first before setting stage}

int Property iTurnOffStage = -1 Auto Const
{If this stage is set, ignore activation events}

Event OnActivate(ObjectReference akActionRef)
	Actor PlayerREF = Game.GetPlayer()
	
	If akActionRef == PlayerREF
		if (BlockWhilePlayerIsInCombat) && (PlayerREF.IsInCombat())
			; Don't do a thing
		else
			;If there's a prereq stage, make sure it's done. If there's a shutdown stage, make sure it's not
			if ((iPrereqStage < 0) || GetOwningQuest().GetStageDone(iPrereqStage)) && ((iTurnOffStage < 0) || !GetOwningQuest().GetStageDone(iTurnOffStage))
				GetOwningQuest().SetStage(iStageToSet)
			endIf
		endIf
	endIf
EndEvent