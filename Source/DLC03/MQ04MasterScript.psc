Scriptname DLC03:MQ04MasterScript extends Quest conditional

int[] property StagesToComplete auto const
{ array of quest stages that need to be completed before quest can shut down }

int[] property StagesToRetrieveMemories auto const
{ array of quest stages that need to be completed before "retrieve memories" objective is complete }

int property CompletionStage = 2000 auto const
{ stage to set when all stages in StagesToComplete are done }

int property RetrievalStage = 1500 auto const
{ stage to set when all stages in StagesToComplete are done }

ReferenceAlias Property Alias_Terminal const auto Mandatory
{ terminal - so we can exit player out of it }

struct VOSceneData
	Scene theScene ; scene to play
	ReferenceAlias speakerAlias ; alias to put speaker in
	float VOChance = 0.3 ; chance to get a bark for this scene (0.0 - 1.0)
	bool bFirstBark = false ; set to true after first bark (100% until this is true). This is reset when you exit/return to VR space.
	Faction requiredFaction  ; optional - if included, speaker must be in this faction
endStruct

VOSceneData[] property VOScenes auto const
{ list of scenes for VO barks - use to check if scene is already running before starting a new one }

group VOSceneEnums
	int property VOScene00_DataGrab = 0 auto const hidden
	int property VOScene01_OnDeath = 1 auto const hidden
	int property VOScene02_StartCombat = 2 auto const hidden
endGroup

ObjectReference Property DLC03MQ04PlayerReturnMarker Auto Const Mandatory
{ a marker we can warp the player to when we need to force him out of the terminal }

group OnDeathFlags
	bool property bIndexerHadData = false auto hidden conditional
	{ set to true if indexer died with data, otherwise false }
	bool property bIndexerWasHit = false auto hidden conditional
	{ set to true if indexer had been hit when it died, otherwise false }
endGroup

ObjectReference Property DLC03VRDataRetrieverEmptyMarkerRef Auto Const Mandatory
{ a marker used for VO bark conditions to indicate empty Data Retriever died }

ObjectReference Property DLC03VRDataRetrieverFullMarkerRef Auto Const Mandatory
{ a marker used for VO bark conditions to indicate full Data Retriever died }

group dataRetrieverEffects
	Spell Property DLC03MQ04DataRetrieverAbility auto const mandatory
	EffectShader Property DLC03VRRetrieverFXS Auto const mandatory
	EffectShader Property DLC03VRRetriever02FXS Auto const mandatory
	explosion Property DLC03VRDataRetrieverExplosion const auto mandatory
endGroup

group simulationEffects
	Sound Property DLC03QSTVRTransitionWhooshA Auto const mandatory
	Sound Property DLC03QSTVRTransitionWhooshB Auto const mandatory
	Sound Property DLC03QSTVRTransitionWhooshC Auto const mandatory
	ImageSpaceModifier Property DLC03VRWorldEnter Auto Const Mandatory
	ImageSpaceModifier Property DLC03VRWorldExit Auto Const Mandatory
endGroup 

Spell Property DLC03MQ04PlayerAbility const auto mandatory
{ spell to allow player to not be encumbered }

Perk property crNoFallDamage const auto mandatory 
{ perk to eliminate fall damage }

ActorBase Property DLC03VRDefender01 const auto mandatory
{ base actor for turret - used to prestore them on the workshops }

function CheckForCompletion()
	; check to see if all memories have been retrieved - if so, set stage to complete retrieval objective
	if GetStageDone(RetrievalStage) == false
		int i = 0
		bool allComplete = true
		while i < StagesToRetrieveMemories.Length && allComplete == true
			if GetStageDone(StagesToRetrieveMemories[i]) == false
				allComplete = false
			endif
			i += 1
		endWhile

		if allComplete
			SetStage(RetrievalStage)
		endif
	endif

	; check to see if all objectives are complete - if so, set stage to complete quest
	if GetStageDone(CompletionStage) == false
		int i = 0
		bool allComplete = true
		while i < StagesToComplete.Length && allComplete == true
			if GetStageDone(StagesToComplete[i]) == false
				allComplete = false
			endif
			i += 1
		endWhile

		if allComplete
			SetStage(CompletionStage)
		endif
	endif
endFunction

; sceneIndex:
;  0 = Data Grab
;  1 = on death
;  2 = start combat
function StartVOScene(ObjectReference speaker, int sceneIndex, bool onDeathHadData = false, bool onDeathWasHit = false)
	debug.trace(self + " StartVOScene START: speaker=" + speaker + " sceneIndex=" + sceneIndex)
	; if no scene running, start this one
	bool bSceneRunning = false
	int i = 0
	while i < VOScenes.Length && bSceneRunning == false
		if VOScenes[i].theScene.IsPlaying()
			bSceneRunning = true
			debug.trace(self + " StartVOScene: " + VOScenes[i].theScene + " already playing - NO BARK")
		endif
		i += 1
	endWhile

	if bSceneRunning == false
		; put speaker into alias, start scene
		VOSceneData theSceneData = VOScenes[sceneIndex]
		;float randomRoll = utility.RandomFloat()
		if theSceneData ; && ( randomRoll <= theSceneData.VOChance || theSceneData.bFirstBark == false )
			; special case - set OnDeath flags
			if sceneIndex == VOScene01_OnDeath
				bIndexerHadData = onDeathHadData
				bIndexerWasHit = onDeathWasHit
			endif
			debug.trace(self + " StartVOScene: PLAY SCENE " + theSceneData.theScene + " with " + speaker)
			theSceneData.speakerAlias.ForceRefTo(speaker)
			theSceneData.theScene.Start()
		;	theSceneData.bFirstBark = true
		endif
	endif
endFunction

function ResetVOSceneFlags()
	int i = 0
	while i < VOScenes.Length
		VOScenes[i].bFirstBark = false
		i += 1
	endWhile
endFunction

;Input layer for locking player controls during transitions
InputEnableLayer DLC03MQ04TransitionEnableLayer

InputEnableLayer function GetEnableLayer()
	;debug.trace(self + " GetEnableLayer(): DLC03MQ04TransitionEnableLayer = " + DLC03MQ04TransitionEnableLayer)
	if DLC03MQ04TransitionEnableLayer == NONE 
		;debug.trace(self + "   creating new enable layer")
		DLC03MQ04TransitionEnableLayer = InputEnableLayer.Create()
	endif 
	return DLC03MQ04TransitionEnableLayer
endFunction