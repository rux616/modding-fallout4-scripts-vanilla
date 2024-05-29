Scriptname DLC03:MQ04Script extends Quest

ReferenceAlias Property VRPlayerStartMarkerAlias Auto Const mandatory
{ alias for player start marker }

ReferenceAlias Property CurrentVRStartMarkerAlias auto const mandatory
{ alias of current start marker - updated each time player enters a memory }

ReferenceAlias Property VRWorkshopAlias auto const mandatory
{ alias of VR workshop reference }

ReferenceAlias Property VRDataMarkerAlias Auto Const mandatory
{ alias for data marker, used to visually display data to collect }

RefCollectionAlias Property VRActors auto const mandatory
{ collection of VR actors }

LocationAlias Property VRLocation auto const mandatory

Message Property DLC03MQ04ExitVRMessage auto const mandatory
{ exit VR message }


MiscObject property DLC03DataItem auto const mandatory
{ inventory object used to track data retrieval }

Scene property IntroScene auto const
{ OPTIONAL - scene for VO when first entering memory }

Scene property DataReturnScene auto const mandatory
{ scene for VO when returning data - usually local to the quest }

Scene property DataCompleteScene auto const mandatory
{ scene for VO when all data recovered - usually local to the quest }

ActorValue property JumpHeightMult auto const mandatory
{ used to set jump height in VR }

float property fVRJumpHeightMultValue = 2.5 auto const
{ value JumpHeightMult gets set to in the simulation }

DLC03:MQ04MasterScript property MQ04 auto const mandatory
{ master MQ04 quest }

DLC03:MQ04Script property nextMemory auto const
{ OPTIONAL - if set, player will move to this memory start when entering data stream after iAccessNextMemory stage is set }

Group QuestStages
	int property iStartStage = 100 auto const
	{ stage set when VR entered for the first time }

	int property iDataGrabStage = 150 auto const
	{ stage set when first data item is grabbed }

	int property iMemoryCompleteStage = 200 auto const
	{ stage set when all data is retrieved }

	int property iAccessNextMemory = 250 auto const
	{ stage set when player can access next memory from data rings }

	int property iPlayHolotapeStage = 300 auto const
	{ stage set after exiting simulation after getting all data }

endGroup

bool VRActive = false  ; set to true when player enters VR

int property maxDataItems = 5 auto const
{ how many data items are there to steal? }

struct VRObjective
	Package objectivePackage
	Quest objectiveQuest
	int objectiveID
	int doneStage
	GlobalVariable currentCount
	GlobalVariable totalCount
	GlobalVariable percentComplete
endStruct

VRObjective[] property VRObjectives auto const

int iObjectiveDisplayTimerID = 1 const
float fObjectiveDisplayTime = 10.0 const

int iPlayHolotapeTimerID = 2 const
float fPlayHolotapeTime = 3.0 const

int iStartWorkshopFailsafeTimerID = 3 const
float fStartWorkshopFailsafeTime = 0.5 const

int property iTurretCount = 5 auto const 
{ how many turrets can the player build in this level? }

float property iMaxDataReturnDistance = 500.0 auto const 
{ how close to indexers need to get to data return target to count}

Event OnQuestInit()
	; register for exit workshop menu
	RegisterForRemoteEvent(VRWorkshopAlias.GetRef(), "OnWorkshopMode")
	RegisterForRemoteEvent(VRWorkshopAlias.GetRef(), "OnCellLoad")
endEvent

; called when player enters/exits VR space
function EnterVR(bool bEnter = true, bool bExitMessage = true, bool bMoveToNextMemory = false, bool bTransitionBetweenMemories = false )
	debug.trace(self + " EnterVR " + bEnter + " VRActive=" + VRActive + " bMoveToNextMemory=" + bMoveToNextMemory)
	; save current value of VRActive
	bool currentVRActive = VRActive

	actor player = Game.GetPlayer()
	
	if bEnter
		VRActive = true

		InputEnableLayer EnableLayer = MQ04.GetEnableLayer()

		EnableLayer.DisablePlayerControls(abMovement = true, abFighting = true, abCamSwitch = true, abLooking = true, abSneaking = true, \
			abMenu = true, abActivate = true, abJournalTabs = true, abVATS = true, abFavorites = true)
		debug.trace(self + " EnterVR: player controls disabled (including activate)")
		Utility.WaitMenuMode(2.0)
		; turn off radio
		Game.TurnPlayerRadioOn(false)

		MQ04.DLC03VRWorldEnter.Apply()

		;fade game out
		Game.FadeOutGame(abFadingOut=True, abBlackFade=true, afSecsBeforeFade=0.0, afFadeDuration=3.0, abStayFaded=True)

		; play transition soundfx
		if bTransitionBetweenMemories
			MQ04.DLC03QSTVRTransitionWhooshC.Play(Game.GetPlayer())
		else
			MQ04.DLC03QSTVRTransitionWhooshA.Play(Game.GetPlayer())
		endif
	
		ObjectReference startMarker = VRPlayerStartMarkerAlias.GetRef()
		CurrentVRStartMarkerAlias.ForceRefTo(startMarker)
		player.SetEssential(true)
		player.SetValue(JumpHeightMult, fVRJumpHeightMultValue)

		ResetActors(true)

		debug.trace(self + " EnterVR: moving player to " + startMarker)
		player.MoveTo(startMarker)

		Game.ForceFirstPerson()

		;start fading game in
		Game.FadeOutGame(abFadingOut=False, abBlackFade=true, afSecsBeforeFade=0.0, afFadeDuration=3.0, abStayFaded=False)

		EnableLayer.EnableMovement(true)
		EnableLayer.EnableLooking(true)

		; add player spell
		player.AddSpell(MQ04.DLC03MQ04PlayerAbility, abVerbose=False)
		player.AddPerk(MQ04.crNoFallDamage, abNotify = false)

		; first time - setstage
		if GetStageDone(iStartStage) == false
			SetStage(iStartStage)
			if IntroScene
				IntroScene.Start()
			endif
		else
			if IntroScene.IsPlaying()
				; unpause
				IntroScene.Pause(false)
			endif
		endif
		; start objective display timer
		StartTimer(fObjectiveDisplayTime, iObjectiveDisplayTimerID)

		; failsafe timer to make sure in workshop mode
		StartTimer(fStartWorkshopFailsafeTime, iStartWorkshopFailsafeTimerID)

	elseif currentVRActive ; only do this if VRActive was TRUE when EnterVR() was called
		; exiting workshop - ask about exiting VR
		if bExitMessage == false || DLC03MQ04ExitVRMessage.Show() == 1
			VRActive = false

			; shut down intro scene
			if IntroScene && IntroScene.IsPlaying()
				IntroScene.Pause(true)
			endif

			if bMoveToNextMemory && nextMemory
				nextMemory.EnterVR(true, bTransitionBetweenMemories = true)
				nextMemory.VRWorkshopAlias.GetRef().StartWorkshop()
			else
				InputEnableLayer EnableLayer = MQ04.GetEnableLayer()
				EnableLayer.DisablePlayerControls(abMovement = true, abFighting = true, abCamSwitch = true, abLooking = true, abSneaking = true, \
					abMenu = true, abActivate = true, abJournalTabs = true, abVATS = true, abFavorites = true)

				MQ04.DLC03VRWorldExit.Apply()

				;fade game out
				Game.FadeOutGame(abFadingOut=True, abBlackFade=true, afSecsBeforeFade=0.0, afFadeDuration=3.0, abStayFaded=True)

				; play transition soundfx
				MQ04.DLC03QSTVRTransitionWhooshB.Play(Game.GetPlayer())

				;wait a few seconds, then move player
				Utility.Wait(3.0)

				player.MoveTo(MQ04.DLC03MQ04PlayerReturnMarker)

				;start fading game in
				Game.FadeOutGame(abFadingOut=False, abBlackFade=true, afSecsBeforeFade=0.0, afFadeDuration=3.0, abStayFaded=False)

				; remove player spell
				player.RemoveSpell(MQ04.DLC03MQ04PlayerAbility)
				player.RemovePerk(MQ04.crNoFallDamage)

				ResetActors(false)
				player.SetEssential(false)
				player.SetValue(JumpHeightMult, 1)
				MQ04.ResetVOSceneFlags()

				EnableLayer.EnablePlayerControls()
				EnableLayer = NONE

				; try saving here
				debug.trace(self + " EnterVR - exit done: request autosave")
				Game.RequestAutoSave()
			endif
		else
			VRActive = true
			VRWorkshopAlias.GetRef().StartWorkshop()
		endif
	endif
endFunction

; remote event from workshop ref - so we know when area is fully loaded
event ObjectReference.OnCellLoad(ObjectReference akSource)
	if akSource == VRWorkshopAlias.GetRef() && VRActive
		debug.trace(self + " OnCellLoad: VRActive - start workshop mode " + akSource)
		VRWorkshopAlias.GetRef().StartWorkshop()
	endif
endEvent

; called to reset actors when player enters/exits VR space
function ResetActors(bool bReset = true)
	int i = 0
	while i < VRActors.GetCount()
		Actor theActor = VRActors.GetAt(i) as Actor
		if theActor
			if bReset
				; reset and enable actors
				theActor.Reset()
				theActor.Enable()
			else
				; disable actors
				theActor.Disable()
			endif
		endif
		i += 1
	endWhile
endFunction

Event ObjectReference.OnWorkshopMode(ObjectReference akSource, bool aStart)
	debug.trace(self + " OnWorkshopMode akSource=" + akSource + " aStart=" + aStart + " VRActive=" + VRActive)
	if VRActive && akSource == VRWorkshopAlias.GetRef() && aStart == false
		EnterVR(false)
	endif
endEvent

function DataGrab(Actor dataRetriever, bool bGrabbingData)
	debug.trace(self + " DataGrab: " + dataRetriever + " " + bGrabbingData)
	ObjectReference workshopRef = VRWorkshopAlias.GetRef()
	if bGrabbingData
		if dataRetriever.HasSpell(MQ04.DLC03MQ04DataRetrieverAbility) == false
			; try to grab data from workshop
			workshopRef.RemoveItem(DLC03DataItem, akOtherContainer = dataRetriever)
			; if we got it, add spell
			if dataRetriever.GetItemCount(DLC03DataItem) > 0
				if GetStageDone(iDataGrabStage) == false
					setStage(iDataGrabStage) ; set stage to indicate data has been grabbed
					VRActors.EvaluateAll() ; update packages
				endif
				MQ04.DLC03VRRetrieverFXS.Stop(dataRetriever)
				MQ04.DLC03VRRetriever02FXS.Play(dataRetriever)
	   			dataRetriever.AddSpell(MQ04.DLC03MQ04DataRetrieverAbility)
				dataRetriever.EvaluatePackage(true)
				; VO response
				MQ04.StartVOScene(dataRetriever, 0)
			endif
		endif
	else
		; return data to workshop
		dataRetriever.RemoveItem(DLC03DataItem, akOtherContainer = workshopRef)
		dataRetriever.RemoveSpell(MQ04.DLC03MQ04DataRetrieverAbility)
	endif
	UpdateDataDisplay()
endFunction

bool bUpdateObjectiveBusy = false ; threading blocker

function DataReturn(Actor dataRetriever, Package currentPackage)
	debug.trace(self + " DataReturn " + dataRetriever + ", " + currentPackage)
	; make sure close enough to package target
	float dataReturnDistance = dataRetriever.GetDistance(VRPlayerStartMarkerAlias.GetRef())
	if dataReturnDistance <= iMaxDataReturnDistance
		if dataRetriever.GetItemCount(DLC03DataItem) > 0
			UpdateObjective(currentPackage)
			; remove data item permanently
			dataRetriever.RemoveItem(DLC03DataItem)
		endif
		dataRetriever.RemoveSpell(MQ04.DLC03MQ04DataRetrieverAbility)
		MQ04.DLC03VRRetriever02FXS.Stop(dataRetriever)
		MQ04.DLC03VRRetrieverFXS.Play(dataRetriever)
	else 
		debug.trace(self + " DataReturn " + dataRetriever + ": too far from data return marker (" + dataReturnDistance + ")")
	endif 

	; resetAI to restart package
	dataRetriever.EvaluatePackage(true)
endFunction

function UpdateObjective(Package objectivePackage)
	debug.trace(self + " UpdateObjective START")
	if bUpdateObjectiveBusy
		int UpdateObjectiveBusyCount = 0
		while bUpdateObjectiveBusy && UpdateObjectiveBusyCount < 5
			debug.trace(self + " UpdateObjective BUSY... " + UpdateObjectiveBusyCount)
			utility.wait(0.5)
			UpdateObjectiveBusyCount += 1
		endWhile
	endif
	bUpdateObjectiveBusy = true

	; find this package in VRObjectives array
	int objectiveIndex = VRObjectives.FindStruct("objectivePackage", objectivePackage)
	if objectiveIndex > -1
		VRObjective theObjective = VRObjectives[objectiveIndex]
		Quest theQuest = theObjective.objectiveQuest
		debug.trace(self + " UpdateObjective: currentCount=" + theObjective.currentCount.GetValue())
		; get % complete - if there's a startingCount, reduce both current and max by that amount
		float percentComplete = ((theObjective.currentCount.GetValue() + 1)/theObjective.totalCount.GetValue()) * 100
		percentComplete = math.min(percentComplete, 100)
		theObjective.percentComplete.SetValue(percentComplete)
		theQuest.UpdateCurrentInstanceGlobal(theObjective.percentComplete)
		if theQuest.ModObjectiveGlobal(afModValue = 1, aModGlobal = theObjective.currentCount, aiObjectiveID = theObjective.objectiveID, afTargetValue = theObjective.totalCount.GetValue(), abAllowRollbackObjective = false)
			theQuest.setStage(theObjective.doneStage)
			ResetActors(false)
			DataCompleteScene.Start()
		else
			DataReturnScene.Start()
		endif
		; reset redisplay timer
    	StartTimer(fObjectiveDisplayTime, iObjectiveDisplayTimerID)
	endif
	bUpdateObjectiveBusy = false
	debug.trace(self + " UpdateObjective DONE")
endFunction

function UpdateDataDisplay()
	; update data display to match current number of data items in workshop
	ObjectReference dataRings = VRDataMarkerAlias.GetRef().GetLinkedRef()
	int missingDataCount = maxDataItems - VRWorkshopAlias.GetRef().GetItemCount(DLC03DataItem)

	; get animation string to use
	String animString = "Play0" + missingDataCount
	debug.trace(self + "UpdateDataDisplay: dataRings=" + dataRings + ", missingDataCount=" + missingDataCount + ", animString=" + animString)
	dataRings.PlayAnimation(animString)
endFunction

function SetDataDisplayComplete()
	ObjectReference dataRings = VRDataMarkerAlias.GetRef().GetLinkedRef()
	ObjectReference dataHub = dataRings.GetLinkedRef()
	dataHub.PlayAnimation("Play01")

endFunction

; call to move player to next memory
function MoveToNextMemory()
	if nextMemory
		EnterVR(false, false, true)
	endif
endFunction

Event OnTimer(int aiTimerID)
    ; while in VR, display objective periodically
    if aiTimerID == iObjectiveDisplayTimerID && VRActive
    	RedisplayObjectives()
    	; run timer again
    	StartTimer(fObjectiveDisplayTime, iObjectiveDisplayTimerID)
    elseif aiTimerID == iPlayHolotapeTimerID
		if GetStageDone(iMemoryCompleteStage) && GetStageDone(iPlayHolotapeStage) == false
			if Game.GetPlayer().Is3DLoaded() && VRActive == false
				SetStage(iPlayHolotapeStage)
			else
		    	; run timer again
		    	StartTimer(fPlayHolotapeTime, iPlayHolotapeTimerID)
			endif
		endif
	elseif aiTimerID == iStartWorkshopFailsafeTimerID
		if VRActive
			VRWorkshopAlias.GetRef().StartWorkshop()
			; failsafe timer to make sure in workshop mode while VRActive = true
			debug.trace(self + " start workshop failsafe timer")
			StartTimer(fStartWorkshopFailsafeTime, iStartWorkshopFailsafeTimerID)
		endif
    endif
EndEvent

function RedisplayObjectives()
	int i = 0
	while i < VRObjectives.Length
		; redisplay all currently displayed objectives
		VRObjective theObjective = VRObjectives[i]
		if theObjective.objectiveQuest.IsObjectiveDisplayed(theObjective.objectiveID) && theObjective.objectiveQuest.IsObjectiveCompleted(theObjective.objectiveID) == false
			theObjective.objectiveQuest.SetObjectiveDisplayed(theObjective.objectiveID, abForce = true)
		endif
		i += 1
	endWhile
endFunction

;WJS - For the extra tutorial timers, reset the display timers so they don't double-up
Function ResetDisplayTimer()
	StartTimer(fObjectiveDisplayTime, iObjectiveDisplayTimerID)
EndFunction