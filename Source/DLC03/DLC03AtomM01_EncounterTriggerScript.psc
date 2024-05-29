Scriptname DLC03:DLC03AtomM01_EncounterTriggerScript extends ObjectReference

Quest Property DLC03AtomM01 Auto Const Mandatory
{Vision quest quest}

Quest Property DLC03AtomM01_EncounterHandler Auto Const Mandatory
{Vision quest encounter handler quest}

ReferenceAlias Property SpringTrigger Auto Const Mandatory
{The trigger around the spring. Set from DLC03AtomM01_EncounterHandler.}

ReferenceAlias Property MotherofTheFog Auto Const Mandatory
{Mother of the Fog reference alias. Set from DLC03AtomM01.}

int Property iStageToSet Auto Const
{Stage to set in EncounterHandler quest when trigger is entered}

int Property iPreqStage = 20 Auto Const
{Stage that must be set before stages start getting set}

int Property iShutdownStage = 60 Auto Const
{Once this stage is set, stop activating triggers}

bool Property bCheckforMother = true Auto
{Trigger will normally check for Mother of the Fog entrance only.}

bool Property bCheckforPlayer = false Auto
{Trigger will normally only check for Mother of the Fog. Check this to also check for player}

Event OnTriggerEnter(ObjectReference akActionRef)
	;When player or Mother of Fog enters trigger, kick off hallucination effect
	;debug.trace("Triggered by: "+ akActionRef)
	if (bCheckforMother && akActionRef == MotherofTheFog.GetRef()) || (bCheckforPlayer && Game.GetPlayer() == akActionRef)
		if DLC03AtomM01.IsRunning() && DLC03AtomM01.GetStageDone(iPreqStage) && !DLC03AtomM01.GetStageDone(iShutdownStage)

			;Check to make sure the player has the effect going
			DLC03AtomSpringScript myTrigger = (SpringTrigger.GetRef() as DLC03AtomSpringScript)

			;If the player has the spring effect going (handled in DLC03AtomSpringScript),
			;set my stage and disable me.
			if myTrigger.bEffectActive
				DLC03AtomM01_EncounterHandler.SetStage(iStageToSet)
				self.Delete()
			endif
		endif
	endif
EndEvent