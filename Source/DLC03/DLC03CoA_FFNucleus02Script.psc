Scriptname DLC03:DLC03CoA_FFNucleus02Script extends Quest Conditional

Quest Property DLC03CoA_Kickout Auto Const Mandatory
{Manages shutting down quest on kick out from Children}

DLC03:DLC03MQ06_NukeHandlingScript Property DLC03MQ06_NukeHandlingScript Auto Const Mandatory
{Manages firing nuke, which fails all quests}

Quest Property DLC03CoA_FFNucleusQuestObjHandler Auto Const Mandatory
{Quest that handles objects for quest}

int Property iCoAKickOutStage = 700 Auto Const 
{Stage for Children of Atom kick out on kickout quest}

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

Function CheckObjectives(bool bFlashObjectives = false)
	;if the player hasn't yet read Aubert's note
	if !GetStageDone(200)

	  ;If player has Aubert's note but hasn't read it, show that obj
	  if DLC03CoA_FFNucleusQuestObjHandler.GetStageDone(70)
	  		;debug.trace(self + "FFQuestObj stage 70 done")
	  	if bFlashObjectives
		    SetObjectiveDisplayed(60, true, true)
		else
			SetObjectiveDisplayed(60)
		endif

	  ;Player has read Edgar's note
	  elseif DLC03CoA_FFNucleusQuestObjHandler.GetStageDone(50)
		  	;debug.trace(self + "FFQuestObj stage 50 done")
	  	if bFlashObjectives
		    SetObjectiveDisplayed(50, true, true)
		else
			SetObjectiveDisplayed(50)
		endif

	  ;Player has Edgar's note, but hasn't read it
	  elseif !DLC03CoA_FFNucleusQuestObjHandler.GetStageDone(50) && DLC03CoA_FFNucleusQuestObjHandler.GetStageDone(40)
	  		;debug.trace(self + "FFQuestObj stage 40 done, 50 not")
	  	if bFlashObjectives
		    SetObjectiveDisplayed(40, true, true)
		else
			SetObjectiveDisplayed(40)
		endif

	  ;Player doesn't have Edgar's note
	  elseif !DLC03CoA_FFNucleusQuestObjHandler.GetStageDone(40)
		  	;debug.trace(self + "FFQuestObj stage not 40 done")
	  	if bFlashObjectives
		    SetObjectiveDisplayed(30, true, true)
		else
			SetObjectiveDisplayed(30)
		endif

	  endif
	endif
EndFunction