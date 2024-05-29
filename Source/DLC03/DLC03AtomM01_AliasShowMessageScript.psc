Scriptname DLC03:DLC03AtomM01_AliasShowMessageScript extends ReferenceAlias Const

Quest Property DLC03AtomM01 Auto Const Mandatory
{Quest to watch}

Message Property CombatNoActivate Auto Const Mandatory
{Message to play if the player cannot activate due to being in Combat.}

int Property iFailStage = 750 Auto Const
{Quest has failed. Turn this off.}

int Property iCompletedStage = 70 Auto Const
{This section of quest completed. Turn this off.}

int Property iPrereqStage = 20 Auto Const
{Don't allow this to trigger until player has hit proper stage of quest.}

Event OnActivate(ObjectReference akActionRef)
	Actor PlayerREF = Game.GetPlayer()

	;If the player's activated this object and is in combat and the appropriate stages have been set, show message
	If akActionRef == PlayerREF && PlayerREF.IsInCombat()
		if DLC03AtomM01.GetStageDone(iPrereqStage) && !DLC03AtomM01.GetStageDone(iFailStage) && !DLC03AtomM01.GetStageDone(iCompletedStage)
			CombatNoActivate.Show()
		endif
	endif
EndEvent