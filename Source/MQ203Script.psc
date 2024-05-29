Scriptname MQ203Script extends Quest Conditional

InputEnableLayer EnableLayer

ObjectReference Property MQ202MemoryDenMovePlayerFromLounge Auto const
ObjectReference Property MQ203MemoryDenMagicDoor Auto const

TalkingActivator Property MQ203MemoryB_Baby auto const
Sound Property QSTMQ203MemoryDenMemoryEnter Auto const
Sound Property QSTMQ203MemoryDenMemoryExit Auto const

Ammo Property AmmoFusionCell auto const
{ ammo for the synth weapons }

function StartQuest()
	EnableLayer = InputEnableLayer.Create()
	EnableLayer.DisablePlayerControls(abMovement = false, abFighting = true, abCamSwitch = true, abLooking = false, abSneaking = true, \
		abMenu = true, abActivate = false, abJournalTabs = true, abVATS = true, abFavorites = true)
	EnableLayer.EnableSprinting(false)
	; turn off radio
	Game.TurnPlayerRadioOn(false)

	;force preloader if needed
	MQ203MemoryDenMagicDoor.PreloadTargetArea()

	MemoryLoungerEnterImod.Apply()

	;fade game out
	Game.FadeOutGame(abFadingOut=True, abBlackFade=False, afSecsBeforeFade=0.0, afFadeDuration=3.0, abStayFaded=True)

	;play memory transition soundfx
	QSTMQ203MemoryDenMemoryEnter.Play(Game.GetPlayer())

	; initialize Kellogg sequence before moving player so actors can load into position
	MQ101KelloggSequence.StartKelloggSequence(2)

	;wait a few seconds, then move player
	Utility.Wait(5.0)

	Game.GetPlayer().Moveto(MQ202MemoryDenMovePlayerFromLounge)
	Utility.Wait(1.0)
	MQ203MemoryDenMagicDoor.Activate(Game.GetPlayer())

	; make player invisible
	Game.GetPlayer().AddSpell(MQ203PlayerInvisibility, abVerbose=False)
	EnableLayer.EnableMovement(false)

	; enable stuff that was disabled for earlier uses of this cell
	int i = 0
	while i < EnableOnStart.GetCount()
		EnableOnStart.GetAt(i).Enable()
		i += 1
	endWhile

	; turn on ambient lights in memories
	MQ203AmbientLightsEnableMarker.Enable()

	SetStage(100)

	PausedImod.apply()

	; sound category snapshot
	CSKelloggsBrain.Push(0.0)

	EnableLayer.EnableMovement(true)

	;start fading game in
	Game.FadeOutGame(abFadingOut=False, abBlackFade=False, afSecsBeforeFade=0.0, afFadeDuration=3.0, abStayFaded=False)

	;wait for fade-in
	Utility.Wait(4.0)
	SetStage(20)

	; remove HUD
	game.SetInsideMemoryHUDMode(true)
endFunction

function IntroDone()
	InitializeMemoryScene(GetMemoryScenes(MemoryA_ID), GetMemoryActors(MemoryA_ID))	
	PauseMemoryScenes(MemoryA_ID)


	; show intro bridge
	MQ203MemoryAIntroBridge.MakeVisible()
	; remove collision
	MQ203MemoryAIntroBridgeCollision.Disable()

	; hacking to get them to appear
	MemoryActor[] actorArray = GetMemoryActors(MemoryA_ID)
	EnableMemoryActorAI(actorArray, true)
	utility.wait(2.0)
	EnableMemoryActorAI(actorArray, false)
	; end hacking


	; enable ambient light
	MemoryData[0].AmbientLightMarker.Enable()
endFunction

; test function to make all the scenes visible
function TestEnableAllLights(bool benable = true)
	int i = 0
	while i < MemoryData.Length
		if bEnable
			MemoryData[i].LightMarker.Enable()
			MemoryData[i].AmbientLightMarker.Enable()
		else
			MemoryData[i].LightMarker.Disable()
			MemoryData[i].AmbientLightMarker.Disable()
		endif			
		i += 1
	endWhile
endFunction


; call at start to:
; * start all scenes, but paused
; * disable all AI
function InitializeAllScenes()
	myTrace(self + " InitializeAllScenes")

	; enable all actors
	InitializeMemoryScene(GetMemoryScenes(MemoryB_ID), GetMemoryActors(MemoryB_ID))	
	InitializeMemoryScene(GetMemoryScenes(MemoryC_ID), GetMemoryActors(MemoryC_ID))	
	InitializeMemoryScene(GetMemoryScenes(MemoryD_ID), GetMemoryActors(MemoryD_ID))	
	InitializeMemoryScene(GetMemoryScenes(MemoryE_ID), GetMemoryActors(MemoryE_ID))	
	InitializeMemoryScene(GetMemoryScenes(MemoryF_ID), GetMemoryActors(MemoryF_ID))	
;	InitializeMemoryScene(GetMemoryScenes(MemoryG_ID), GetMemoryActors(MemoryG_ID))	
	InitializeMemoryScene(GetMemoryScenes(MemoryH_ID), GetMemoryActors(MemoryH_ID))	

	; give them a chance to initialize
	utility.wait(2.0)

	; start all the other scenes here to give them more init time
	PauseMemoryScenes(MemoryB_ID, bPause = true, bUseImod = false)
	PauseMemoryScenes(MemoryC_ID, bPause = true, bUseImod = false)
	PauseMemoryScenes(MemoryD_ID, bPause = true, bUseImod = false)
	PauseMemoryScenes(MemoryE_ID, bPause = true, bUseImod = false)
	PauseMemoryScenes(MemoryF_ID, bPause = true, bUseImod = false)
;	PauseMemoryScenes(MemoryG_ID, bPause = true, bUseImod = false)
	PauseMemoryScenes(MemoryH_ID, bPause = true, bUseImod = false)
endFunction

; memoryID: which scene to start/stop
bool startMemoryLock = false

function StartMemory(int memoryID, bool bRestart = true, bool moveToStartMarker = false)
	myTrace(self + " StartMemory " + memoryID + " bRestart=" + bRestart)
	; wait for thread lock to clear
	while startMemoryLock
		debug.trace(self + " waiting for memory lock to clear...")
		utility.wait(1.0)
	endWhile
	startMemoryLock = true

	if memoryID == 0
		CurrentMemoryID = 0
	elseif memoryID > 0
		MemoryDataItem CurrentMemoryData = MemoryData[memoryID - 1]
		MemoryActor[] CurrentMemoryActors = GetMemoryActors(memoryID)
		Scene[] CurrentMemoryScenes = GetMemoryScenes(memoryID)

		; only reset currentMemoryID if player is in trigger - failsafe
		if CurrentMemoryData.SceneTrigger && CurrentMemoryData.SceneTrigger.playerInTrigger
			myTrace(self + " StartMemory - player in trigger " + CurrentMemoryData.SceneTrigger + ": set current memoryID to " + memoryID)
			CurrentMemoryID = memoryID
		else
			myTrace(self + " StartMemory - WARNING: player not in trigger - CurrentMemoryID remains " + CurrentMemoryID)
		endif

		if bRestart
			CurrentMemoryData.isDone = false
			SetMemoryDone(memoryID, false)
		endif

		; special case:
		if memoryID == MemoryC_ID
			if bRestart
				myTrace(self + " StartMemory C: close door")
				MQ203MemoryC_Door.PlayAnimation("Reset")
			endif
		elseif memoryID == MemoryE_ID
			if bRestart
				ObjectReference synth01 = MemoryE_Actors[MemoryESynth01Index].ActorAlias.GetRef()
				ObjectReference synth02 = MemoryE_Actors[MemoryESynth02Index].ActorAlias.GetRef()
				ObjectReference synth03 = MemoryE_Actors[MemoryESynth03Index].ActorAlias.GetRef()

				synth01.AddItem(MemoryE_Synth01Weapon.GetRef())
				synth02.AddItem(MemoryE_Synth02Weapon.GetRef())
				synth03.AddItem(MemoryE_Synth03Weapon.GetRef())

				synth01.AddItem(AmmoFusionCell)
				synth02.AddItem(AmmoFusionCell)
				synth03.AddItem(AmmoFusionCell)
			endif
		elseif memoryID == MemoryF_ID
			if bRestart
				MQ101KelloggSequence.StartKelloggSequence(2, true)
			endif
		elseif memoryID == MemoryH_ID
			; special handling
			if bRestart
				myTrace(self + " disable MQ203MemoryHVirgilsFileRef")
				MQ203MemoryHVirgilsFileRef.Disable()
			endif
		endif

		if moveToStartMarker
			Game.GetPlayer().MoveTo(CurrentMemoryData.StartMarker)
		endif

		if bRestart
			SetMemoryStage(memoryID, 0)
		endif

		if memoryID == MemoryExit_ID
			myTrace(self + " exiting MQ203 cell")
			SetStage(1000)
		elseif memoryID > 0		
			if bRestart
				myTrace(self + " restarting memory " + memoryID)
				
				; scene start sound
				myTrace(self + " start memory: PLAY QSTMQ203SceneStart")
				if CurrentMemoryData.SceneTrigger.playerInTrigger
					QSTMQ203SceneStart.Play(Game.GetPlayer())
				endif

				StartMemoryScenes(memoryID, true)
				; enable current light marker
				if CurrentMemoryData.SceneTrigger.playerInTrigger
					myTrace(self + " StartMemory: enabling light marker " + CurrentMemoryData.LightMarker)			
					CurrentMemoryData.LightMarker.Enable()
				else
					; failsafe - player isn't in trigger - pause this so it doesn't play while player is elsewhere
					myTrace(self + " StartMemory - WARNING: player not in trigger " + CurrentMemoryData.SceneTrigger + " - PAUSING memory " + memoryID)

					PauseMemoryScenes(memoryID, true, false)
				endif
			else
				myTrace(self + " unpausing memory " + memoryID)

				; unpause UNLESS current voiceover is from this memory
				if CurrentVoiceoverScene && memoryID == voiceoverMemoryID
					; do nothing
				else
					; otherwise unpause
					PauseMemoryScenes(memoryID, false)
				endif
				; FAILSAFE: pause all other scenes
				PauseAllOtherMemoryScenes(memoryID)

				; enable current light marker
				myTrace(self + " StartMemory: enabling light marker " + CurrentMemoryData.LightMarker)			
				CurrentMemoryData.LightMarker.Enable()
			endif
		endif

	endif


	; release lock
	startMemoryLock = false
endFunction

; call at start to:
; * reset actor positions
; * enable all the actors
function InitializeMemoryScene(Scene[] sceneArray, MemoryActor[] actorArray)
	ResetActors(actorArray)
	HideActors(actorArray, false)
	; try doing this again
	ResetActors(actorArray)
endFunction

; utility function called by StartMemory
; bStart: true = start memory scenes; false = stop memory scenes
function StartMemoryScenes(int memoryID, bool bStart = true)
	myTrace(self + " StartMemoryScenes " + memoryID + " " + bStart)

	Scene[] sceneArray = GetMemoryScenes(memoryID)
	MemoryActor[] actorArray = GetMemoryActors(memoryID)
	if bStart
		ResetActors(actorArray)
		HideActors(actorArray, false)
		; try doing this again
		ResetActors(actorArray)
	endif

	int i = 0
	while i < sceneArray.Length
		sceneArray[i].Stop()
		if bStart
			myTrace(self + " StartMemoryScenes: starting scene " + sceneArray[i])
			sceneArray[i].Start()
		endif
		i += 1
	endWhile

	;EnableMemoryActorAI(actorArray, bStart)
	; TRY THIS instead - more threadsafe
	PauseMemoryScenes(memoryID, !bStart, false)

endFunction

; pass in the scene we just paused so we don't do it again
function PauseAllOtherMemoryScenes(int memoryID)
	if memoryID != MemoryA_ID
		PauseMemoryScenes(MemoryA_ID, bPause = true, bUseImod = false)
	EndIf

	if memoryID != MemoryB_ID
		PauseMemoryScenes(MemoryB_ID, bPause = true, bUseImod = false)
	EndIf

	if memoryID != MemoryC_ID
		PauseMemoryScenes(MemoryC_ID, bPause = true, bUseImod = false)
	EndIf

	if memoryID != MemoryD_ID
		PauseMemoryScenes(MemoryD_ID, bPause = true, bUseImod = false)
	EndIf

	if memoryID != MemoryE_ID
		PauseMemoryScenes(MemoryE_ID, bPause = true, bUseImod = false)
	EndIf

	if memoryID != MemoryF_ID
		PauseMemoryScenes(MemoryF_ID, bPause = true, bUseImod = false)
	EndIf

	if memoryID != MemoryG_ID
		PauseMemoryScenes(MemoryG_ID, bPause = true, bUseImod = false)
	EndIf

	if memoryID != MemoryH_ID
		PauseMemoryScenes(MemoryH_ID, bPause = true, bUseImod = false)
	EndIf
endFunction


bool pauseMemoryLock = false
function PauseMemoryScenes(int memoryID, bool bPause = true, bool bUseImod = true)
	myTrace(self + " PauseMemoryScenes " + memoryID + " bPause=" + bPause + " bUseImod=" + bUseImod)
	int waitCount = 0
	while pauseMemoryLock && waitCount < 5
		utility.wait(1.0)
		waitCount += 1
	endWhile
	; get lock
	pauseMemoryLock = true

	MemoryDataItem theMemoryDataItem = GetMemoryData(memoryID)
	if theMemoryDataItem == NONE
		myTrace(self + "PauseMemoryScenes: invalid memoryID=" + memoryID)
		; RELEASE LOCK
		pauseMemoryLock = false
		return
	endif

	theMemoryDataItem.isPaused = bPause

	Scene[] sceneArray = GetMemoryScenes(memoryID) 
	MemoryActor[] actorArray = GetMemoryActors(memoryID)

	myTrace(self + " PauseMemoryScenes " + sceneArray + " bPause=" + bPause)
	if bPause
		if bUseImod
			; scene pause sound
			myTrace(self + " pause memory: PLAY QSTMQ203ScenePause")
			int soundID = QSTMQ203ScenePause.Play(Game.GetPlayer())
			myTrace(self + "    soundID=" + soundID)

			PausedImod.apply()
		endif
		; kill AI for all actors in current scene
		EnableMemoryActorAI(actorArray, false)
	else
		; always kill voiceover if we are unpausing
		StartVoiceover(NONE)
	endif

	; don't try to pause or unpause scenes if memory is over
	; SEEMS OBSOLETE - removing
	;/
	if theMemoryDataItem.isDone
		myTrace(self + " PauseMemoryScenes: memoryID " + memoryID + " is DONE so returning without pausing/unpausing - NOT ANY MORE")
		; TRY REMOVING THIS
	;	return
	endif
	/;

	int i = 0
	while i < sceneArray.Length
		myTrace(self + "  PauseMemoryScenes: pausing scene " + sceneArray[i] + "=" + bPause)
		sceneArray[i].Pause(bPause)
		i += 1
	endWhile

	if !bPause
		; scene pause sound
		myTrace(self + " unpausing: PLAY QSTMQ203ScenePlay")
		int soundID = QSTMQ203ScenePlay.Play(Game.GetPlayer())
		myTrace(self + "    soundID=" + soundID)

		PausedImod.remove()
		; enable AI for all actors in current scene
		EnableMemoryActorAI(actorArray, true)
	endif

	; release lock
	pauseMemoryLock = false
endFunction

function EnableMemoryActorAI(MemoryActor[] actorArray, bool bEnable)
	myTrace(self + " EnableMemoryActorAI " + actorArray + " " + bEnable)
	int i = 0
	while i < actorArray.Length
		; ref alias or ref collection?
		if actorArray[i].ActorAlias
			ObjectReference theRef = actorArray[i].ActorAlias.GetRef()
			EnableActorAI(theRef, bEnable)
		elseif actorArray[i].CollectionAlias
			RefCollectionAlias theCollection = actorArray[i].CollectionAlias
			int collIndex = 0
			while collIndex < theCollection.GetCount()
				ObjectReference theRef = theCollection.GetAt(collIndex)
				EnableActorAI(theRef, bEnable)
				collIndex += 1
			endWhile
		endif
		i += 1
	endWhile
endFunction

; helper function used by EnableMemoryActorAI
function EnableActorAI(ObjectReference theRef, bool bEnable)
	actor theActor = theRef as Actor
	if theActor
		myTrace(self + " actor " + theActor)
		theActor.EnableAI(bEnable, abPauseVoice = true)
		if bEnable
			; make sure avoiding player mode
			theActor.SetAvoidPlayer(false)
		endif
	elseif theRef
		myTrace(self + " ref " + theRef)
		; for non-actors, pause/resume audio
		if bEnable
			theRef.ResumeAudio()
		else
			theRef.PauseAudio()
		endif
		if theRef.GetBaseObject() == MQ203MemoryB_Baby
			myTrace(self + " baby bEnable=" + bEnable)
			if bEnable
				theRef.PlayAnimation("To_UnfrozenIdle")
				if GetMemoryStage(MemoryB_ID) >= MemoryBStageBabyCrying
					theRef.PlayAnimation("To_Crying")
				else
					myTrace(self + " baby audio ENABLE")
					AudioBabyIdleRef.Enable()
				endif
			else
				theRef.PlayAnimation("To_FrozenIdle")
				myTrace(self + " baby audio DISABLE")
				AudioBabyIdleRef.Disable()
			endif
		endif
	endif

endFunction


function AdvanceMemory(int memoryID, int newStage)
	myTrace(self + " AdvanceMemory: memoryID=" + memoryID + ", newStage=" + newStage)
	int memoryStage = GetMemoryStage(memoryID)

	if newStage > memoryStage
		memoryStage = newStage
		SetMemoryStage(memoryID, newStage)
		; special handling
		if memoryID == MemoryA_ID
			if memoryStage == 2
				myTrace(self + " AdvanceMemory: stop reading")
				MemoryA_Actors[MemoryAMomIndex].ActorAlias.GetActorRef().PlayIdle(IdleBookReadStop)
			elseif memoryStage == 3
				myTrace(self + " AdvanceMemory: start hand gun sequence")
				; started synced animations
				MemoryA_Actors[MemoryAMomIndex].ActorAlias.GetActorRef().PlayIdle(mq203KelloggAndMomSyncStart)
			endif
		elseif memoryID == MemoryB_ID
			if memoryStage == 1
				myTrace(self + " AdvanceMemory: start animation sequence")
				; register for animation events and reset timing number
				MemoryBAnimationTimingNumber = 0
				ObjectReference kelloggRef = MemoryB_Actors[MemoryBKelloggIndex].ActorAlias.GetRef()
				
				RegisterForAnimationEvent(kelloggRef, "Stage01")
				RegisterForAnimationEvent(kelloggRef, "Stage02")
				RegisterForAnimationEvent(kelloggRef, "Stage03")
				RegisterForAnimationEvent(kelloggRef, "Stage04")
				RegisterForAnimationEvent(kelloggRef, "Stage05")
				RegisterForAnimationEvent(kelloggRef, "Stage06")
				RegisterForAnimationEvent(kelloggRef, "Stage07")
				RegisterForAnimationEvent(kelloggRef, "Stage08")
				RegisterForAnimationEvent(kelloggRef, "Stage09")
				RegisterForAnimationEvent(kelloggRef, "Stage10")
				RegisterForAnimationEvent(kelloggRef, "Stage11")
				RegisterForAnimationEvent(kelloggRef, "Stage12")
				RegisterForAnimationEvent(kelloggRef, "Stage13")
				RegisterForAnimationEvent(kelloggRef, "Stage14")
				RegisterForAnimationEvent(kelloggRef, "Stage15")
				RegisterForAnimationEvent(kelloggRef, "Stage16")
				RegisterForAnimationEvent(kelloggRef, "Stage17")
				RegisterForAnimationEvent(kelloggRef, "Stage18")
				; started synced animations
				MemoryB_Actors[MemoryBKelloggIndex].ActorAlias.GetActorRef().PlayIdle(IdleKelloggWifeSceneStart)
				MemoryB_Actors[MemoryBSarahIndex].ActorAlias.GetActorRef().PlayIdle(IdleKelloggWifeSceneStart)
			elseif memoryStage == 2
				myTrace(self + " AdvanceMemory: baby crying")
				; baby cries
				MemoryB_Actors[MemoryBBabyIndex].ActorAlias.GetRef().PlayAnimation("To_Crying")
			endif
		elseif memoryID == MemoryC_ID
			if memoryStage == 1
				myTrace(self + " AdvanceMemory: open door")
				MQ203MemoryC_Door.SetOpen()
			endif
		elseif memoryID == MemoryE_ID
			if memoryStage == 1
				; started synced animations
				myTrace(self + " AdvanceMemory: trigger scientist reaction")
				MemoryE_Actors[MemoryEScientistIndex].ActorAlias.GetActorRef().PlayIdle(IdleSitFemaleReactingToViolence)
			endif
		elseif memoryID == MemoryH_ID
			if memoryStage == 2
				myTrace(self + " AdvanceMemory: trigger Kellogg pointing gun at courser")
				; get courser through load door
				;MQ203MemoryHCourserLoadDoor.Activate(MemoryH_Actors[MemoryHCourserIndex].ActorAlias.GetRef())

				; courser activates load door
				; Kellogg reacts
				MemoryH_Actors[MemoryHKelloggIndex].ActorAlias.GetActorRef().PlayIdle(KelloggPointGun)
			elseif memoryStage == 3
				myTrace(self + " AdvanceMemory: trigger hand file synced anim")
				MemoryH_Actors[MemoryHCourserIndex].ActorAlias.GetActorRef().PlayIdle(IdleKelloggReadfileFull)
			elseif memoryStage == 4
				; watch for folder being put down
				myTrace(self + " AdvanceMemory: register for put down folder event")
				RegisterForAnimationEvent(MemoryH_Actors[MemoryHKelloggIndex].ActorAlias.GetActorRef(), "AnimObjUnequipAlt")
			elseif memoryStage == 5
				; enable book
				myTrace(self + " AdvanceMemory: enable MQ203MemoryHVirgilsFileRef")
				MQ203MemoryHVirgilsFileRef.Enable()
			elseif memoryStage == 6
				; teleport courser and Shaun out

				; special effects
				TeleportActorScript courser = MemoryH_Actors[MemoryHCourserIndex].ActorAlias.GetActorRef() as TeleportActorScript
				TeleportActorScript shaun = MemoryH_Actors[MemoryHShaunIndex].ActorAlias.GetActorRef() as TeleportActorScript

				; Register for TeleportDone events
				RegisterForCustomEvent(courser, "TeleportDone")
				RegisterForCustomEvent(shaun, "TeleportDone")
 
				courser.TeleportOut()
				utility.wait(0.8)
				shaun.TeleportOut()
			endif
		endif
	endif
endFunction

Event TeleportActorScript.TeleportDone(TeleportActorScript akSender, Var[] akArgs)
	myTrace(self + "TeleportActorScript.TeleportDone " + akSender)

	if akSender == MemoryH_Actors[MemoryHCourserIndex].ActorAlias.GetActorRef() || akSender == MemoryH_Actors[MemoryHShaunIndex].ActorAlias.GetActorRef()
		ObjectReference teleportOutMarker = MemoryH_Actors[MemoryHCourserIndex].ActorStartMarker
		akSender.MoveTo(teleportOutMarker)

		AdvanceMemory(MemoryH_ID, 7)
	endif
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	myTrace(self + " OnAnimationEvent: akSource=" + akSource + ", asEventName=" + asEventName)
	if akSource == MemoryH_Actors[MemoryHKelloggIndex].ActorAlias.GetActorRef()
		; memory H
		if asEventName == "AnimObjUnequipAlt"
			AdvanceMemory(MemoryH_ID, 5)
		endif
	elseif akSource == MemoryB_Actors[MemoryBKelloggIndex].ActorAlias.GetActorRef()
		If (asEventName == "Stage01")
			MemoryBAnimationTimingNumber = 1
		elseif (asEventName == "Stage02")
			MemoryBAnimationTimingNumber = 2
		elseif (asEventName == "Stage03")
			MemoryBAnimationTimingNumber = 3
		elseif (asEventName == "Stage04")
			MemoryBAnimationTimingNumber = 4
		elseif (asEventName == "Stage05")
			MemoryBAnimationTimingNumber = 5
		elseif (asEventName == "Stage06")
			MemoryBAnimationTimingNumber = 6
		elseif (asEventName == "Stage07")
			MemoryBAnimationTimingNumber = 7
		elseif (asEventName == "Stage08")
			MemoryBAnimationTimingNumber = 8
		elseif (asEventName == "Stage09")
			MemoryBAnimationTimingNumber = 9
		elseif (asEventName == "Stage10")
			MemoryBAnimationTimingNumber = 10
		elseif (asEventName == "Stage11")
			MemoryBAnimationTimingNumber = 11
		elseif (asEventName == "Stage12")
			MemoryBAnimationTimingNumber = 12
		elseif (asEventName == "Stage13")
			MemoryBAnimationTimingNumber = 13
		elseif (asEventName == "Stage14")
			MemoryBAnimationTimingNumber = 14
		elseif (asEventName == "Stage15")
			MemoryBAnimationTimingNumber = 15
		elseif (asEventName == "Stage16")
			MemoryBAnimationTimingNumber = 16
		elseif (asEventName == "Stage17")
			MemoryBAnimationTimingNumber = 17
		elseif (asEventName == "Stage18")
			MemoryBAnimationTimingNumber = 18
		EndIf

	endif
EndEvent

; called when main scene is over
function EndMemory(int memoryID)
	myTrace(self + " EndMemory " + memoryID)
	
	MemoryDataItem theMemoryDataItem = MemoryData[memoryID - 1]

	if theMemoryDataItem
		theMemoryDataItem.isDone = true
		SetMemoryDone(memoryID, true)

		AdvanceMemory(memoryID, MemoryStage_Done)

		if theMemoryDataItem.EndQuestStage > 0
			myTrace(self + " setting stage " + theMemoryDataItem.EndQuestStage)
			SetStage(theMemoryDataItem.EndQuestStage)
		endif

		myTrace(self + " EndMemory: disabling light marker " + theMemoryDataItem.LightMarker)			
		theMemoryDataItem.LightMarker.Disable()

		; remove rollover text from actors
		MemoryActor[] theActors = GetMemoryActors(memoryID)

		QSTMQ203SceneEnd.Play(Game.GetPlayer())

		HideActors(theActors, true)

		; special handling
		if memoryID == MemoryA_ID
			; stop radio
			MemoryA_Scenes[MemoryARadioSceneIndex].Stop()
		elseif memoryID == MemoryH_ID
			myTrace(self + " disable MQ203MemoryHVirgilsFileRef")
			MQ203MemoryHVirgilsFileRef.Disable()
			; stop radio
			MemoryH_Scenes[MemoryHRadioSceneIndex].Stop()
		endif
		
		utility.wait(2.0) ; make sure faded before we reset

		; resurrect/reset as needed
		; KMK 5/1/15 - try removing this - actors are not running start packages at this point
		;ResetActors(theActors)

		; remove rollover text from actors again (seems bashed by resurrect)
		HideActors(theActors, true)
	endif
endFunction

function SetMemoryDone(int memoryID, bool bIsDone)
	if memoryID == MemoryA_ID
		MemoryA_Done = bIsDone
	elseif memoryID == MemoryB_ID
		MemoryB_Done = bIsDone
	elseif memoryID == MemoryC_ID
		MemoryC_Done = bIsDone
	elseif memoryID == MemoryC_ID
		MemoryC_Done = bIsDone
	elseif memoryID == MemoryD_ID
		MemoryD_Done = bIsDone
	elseif memoryID == MemoryE_ID
		MemoryE_Done = bIsDone
	elseif memoryID == MemoryF_ID
		MemoryF_Done = bIsDone
	elseif memoryID == MemoryG_ID
		MemoryG_Done = bIsDone
	elseif memoryID == MemoryH_ID
		MemoryH_Done = bIsDone
	endif		

endFunction

; called by Dr. Amari scene - turn on ambient light in specified memory
function MakeMemoryVisible(int memoryID)
	myTrace(self + " MakeMemoryVisible " + memoryID)
	; enable ambient light for next memory (if any)
	ObjectReference ambientLightMarker = MemoryData[memoryID-1].AmbientLightMarker
	ambientLightMarker.enable()
endFunction

; called by Dr. Amari scene
function OpenMemoryExit(int memoryID)
	myTrace(self + " OpenMemoryExit " + memoryID)
	ObjectReference exitDoor = MemoryData[memoryID - 1].ExitDoor
	MQ203NeuronBridgeScript exitBridge = MemoryData[memoryID - 1].ExitBridge

	; open exit door
	if exitDoor
		exitDoor.SetOpen(true)
		; for final memory exit, enable the terminal
		if memoryID == MemoryH_ID
			exitDoor.Enable(true)
			exitDoor.BlockActivation(abBlocked = true, abhideActivateText = false )
			exitDoor.PlayAnimation("stage2")
			; TODO - instead, make TV turn on
		else
			; otherwise, disable the collision blocker
			exitDoor.Disable()
		endif
	endif
	if exitBridge
		exitBridge.MakeVisible()
	endif
endFunction

; called by memory scenes when "restart" sequence completes - all actors return to starting positions
function RestartMemory(int memoryID)
	debug.trace(self + "RestartMemory " + memoryID)
	; run timer instead so scene can stop
	StartTimer(1.0, restartMemoryTimerID + memoryID)
	; repeat scene
	;StartMemory(memoryID)
endFunction

ObjectReference Property MQ203MagicDoortoMemoryDen Auto
ObjectReference Property MQ203PlayerMovetoForQuickLoadMarker Auto
ReferenceAlias Property LoungerInstantEnter Auto
function FinishQuest()
	MemoryLoungerEnterImod.Apply()
	
	;fade game out
	Game.FadeOutGame(abFadingOut=True, abBlackFade=False, afSecsBeforeFade=0.0, afFadeDuration=3.0, abStayFaded=True)

	;play memory transition sounds
	QSTMQ203MemoryDenMemoryExit.Play(Game.GetPlayer())

	; kill any current voiceover
	if CurrentVoiceoverScene
		CurrentVoiceoverScene.Stop()
	endif
		
	PauseMemoryScenes(memoryID = MemoryH_ID, bPause = true)

	; make sure fade is finished
	Utility.Wait(5.0)

	; remove invisibility
	Game.GetPlayer().RemoveSpell(MQ203PlayerInvisibility)
	; remove sound category snapshot
	CSKelloggsBrain.Remove()

	; restore HUD
	game.SetInsideMemoryHUDMode(false)

	;Use invisible quick load door back to Memory Den
	debug.trace(self + " activate MQ203MagicDoortoMemoryDen")
	MQ203MagicDoortoMemoryDen.Activate(Game.GetPlayer())

	Utility.Wait(0.1)

	;snap to furniture
	debug.trace(self + " snap into lounger")
	LoungerInstantEnter.GetRef().Activate(Game.GetPlayer(), True)
	;close cover
	LoungerInstantEnter.GetRef().PlayAnimation("g_idleSitInstant")

	;remove invisibility
	Game.GetPlayer().RemoveSpell(MQ203PlayerInvisibility)

	;wait for player to be in furniture before fading in
	Utility.Wait(3.0)

	;start fading game in
	Game.FadeOutGame(abFadingOut=False, abBlackFade=False, afSecsBeforeFade=0.0, afFadeDuration=3.0, abStayFaded=False)

	;wait for fade-in before we kick player out of furniture
	Utility.Wait(3.0)

	; make sure imods are cleaned up
	PausedImod.remove()

	;exit furniture
	debug.trace(self + " exit lounger")
	LoungerInstantEnter.GetRef().Activate(Game.GetPlayer(), True)

	MQ204.SetStage(10)

	; enable player controls completely
	EnableLayer.Delete()

	; clean up
	MQ101KelloggSequence.Stop()
endFunction

function ExitMessage()
	StartMemory(MemoryData[MemoryData.Length-1].NextMemoryID)
endFunction

bool exitMemoryLock = false
function ExitMemory(int memoryID)
	myTrace(self + " ExitMemory: memoryID=" + memoryID, true)

	while exitMemoryLock
		utility.wait(1.0)
	endWhile

	; get lock
	exitMemoryLock = true

	if memoryID > 0
		MemoryDataItem CurrentMemoryData = MemoryData[memoryID - 1]
		MemoryActor[] CurrentMemoryActors = GetMemoryActors(memoryID)
		Scene[] CurrentMemoryScenes = GetMemoryScenes(memoryID)

		myTrace(self + " ExitMemory: disable light marker " + CurrentMemoryData.LightMarker)
		CurrentMemoryData.LightMarker.Disable()
		; pause current scenes
		PauseMemoryScenes(memoryID, true)
		; clear current memory variables
		StartMemory(0, false)
	endif

	; release lock
	exitMemoryLock = false
endFunction

; "hide" actors by turning on effect to make them "invisible"
; also temporarily turning off rollover
function HideActors(MemoryActor[] actorArray, bool bHide)
	myTrace(self + " HideActors " + actorArray + " " + bHide)
	int i = 0
	while i < actorArray.Length
		MemoryActor theMemoryActor = actorArray[i]
		myTrace(self + " " + i + ":  " + theMemoryActor)
		ObjectReference theRef = theMemoryActor.ActorAlias.GetRef()
		actor theActor = theRef as Actor
		if theRef
			if bHide
				if theMemoryActor.DisableOnEnd
					myTrace(self + " 	HideActors: DISABLING " + theRef)
					if theActor && theActor.IsDead() == false && theMemoryActor.DisableActorOnEnd == false
						;theActor.SetAlpha(0, true)
						theActor.AddSpell(MQ203NPCAbility)
						myTrace(self + "	HideActors: SetAlpha on " + theActor)
					else
						theRef.DisableNoWait(true)
					endif
				endif
			else
				myTrace(self + " 	HideActors: ENABLING " + theRef)
				if theActor
					theActor.RemoveSpell(MQ203NPCAbility)
				endif
				theRef.EnableNoWait(true)
				myTrace(self + " 	HideActors: theRef.IsDisabled()= " + theRef.IsDisabled())
				; make sure
				if theActor
					theActor.SetAlpha(1.0)
					theActor.SetAvoidPlayer(false)
				endif
				; special case for MQ101 furniture:
				if theActor == MQ101Spouse.GetActorRef()
					MQ101KelloggSequence.ResetSpouse(theActor)
				endif			
			endif
			MQ203ActivationBlockerScript theBlockerScript = theMemoryActor.ActorAlias as MQ203ActivationBlockerScript
			if theBlockerScript
				theBlockerScript.HideActivation(bHide)
			endif
		endif
		i += 1
	endWhile
endFunction

function ResetActors(MemoryActor[] actorArray, bool bResetPosition = true)
	myTrace(self + " ResetActors " + actorArray + " bResetPosition=" + bResetPosition)
	int i = 0
	while i < actorArray.Length
		ReferenceAlias theAlias = actorArray[i].ActorAlias
		actor theActor = theAlias.GetActorRef()
		ObjectReference theMarker = actorArray[i].ActorStartMarker
		; for now (until/unless we get an OnAliasChanged event), make sure activation is blocked
		if theAlias.GetRef()
			(theAlias as MQ203ActivationBlockerScript).OnAliasInit()
		endif
		if theActor && actorArray[i].ResurrectOnReset
			if theActor.IsDead()
				theActor.Resurrect()
				; make sure avoiding player mode
				theActor.SetAvoidPlayer(false)
			endif
		endif
		if theActor && theMarker
			if theActor.IsDisabled()
				myTrace(self + " 	" + theActor + " DISABLED - moving to marker " + theMarker)
				theActor.MoveTo(theMarker)
			else
				theActor.EvaluatePackage()
				myTrace(self + " 	" + theActor + " ENABLED - moving to package location " + theActor.Getcurrentpackage() + " package=" + theActor.GetCurrentPackage() + " IsAIEnabled=" + theActor.IsAIEnabled())
				theActor.MoveToPackageLocation() ; try this instead
			endif
			; make sure avoiding player mode
			theActor.SetAvoidPlayer(false)
		endif
		i += 1
	endWhile
endFunction

bool bVoiceoverBusy = false
int voiceoverMemoryID = 0
function StartVoiceover(Scene newVoiceoverScene, int memoryID = 0)
	myTrace(self + " StartVoiceover " + newVoiceoverScene + " memoryID=" + memoryID)
	while bVoiceoverBusy
		utility.wait(0.05)
	endWhile
	bVoiceoverBusy = true

	; save memoryID so we know whether to unpause or not when voiceover is done
	voiceoverMemoryID = memoryID

	; cancel failsafe timer
	CancelTimer(voiceoverFailsafeTimerID) 

	if newVoiceoverScene == CurrentVoiceoverScene && CurrentVoiceOverScene && CurrentVoiceoverScene.IsPlaying()
		myTrace(self + "	already playing")
		; scene is already playing - toggle it off
		newVoiceoverScene = NONE
	endif

	myTrace(self + "	stopping current scene: " + CurrentVoiceoverScene)

	; otherwise start new scene
	; first, stop current scene
	if CurrentVoiceoverScene
		CurrentVoiceoverScene.Stop()
	endif

	; start new scene
	CurrentVoiceoverScene = newVoiceoverScene
	if CurrentVoiceoverScene
;		voiceoverSceneRunning = true

		; pause scenes
		PauseMemoryScenes(memoryID, true)		
		utility.wait(0.3)

		CurrentVoiceoverScene.Start()
		; start failsafe timer
		StartTimer(voiceoverFailsafeTimer, voiceoverFailsafeTimerID)
		; pause all other scenes - failsafe
		PauseAllOtherMemoryScenes(memoryID)
	endif

	bVoiceoverBusy = false
endFunction

Event OnTimer(int aiTimerID)
    if aiTimerID == voiceoverFailsafeTimerID
    	myTrace(self + " voiceover failsafe timer expires")
    	; failsafe timer for voiceover
    	EndVoiceover()
    elseif aiTimerID > restartMemoryTimerID
    	; restart scene: restartMemoryTimerID - 100 = memoryID
    	int memoryID = aiTimerID - restartMemoryTimerID
    	StartMemory(memoryID)
    endif
EndEvent

function EndVoiceover()
	myTrace(self + " EndVoiceover " + CurrentVoiceoverScene)

	; in the middle of starting new voiceover - do nothing
	if bVoiceoverBusy
		return
	endif

	CurrentVoiceoverScene = NONE

	; enable AI for all actors in current scene
	; don't turn back on when current memory is finished
	MemoryDataItem CurrentMemoryData = NONE
	int memoryID = CurrentMemoryID
	if memoryID > 0 && memoryID <= MemoryData.Length
		CurrentMemoryData = MemoryData[memoryID - 1]
	endif

	myTrace(self + " EndVoiceover: memoryID=" + memoryID + ", voiceoverMemoryID=" + voiceoverMemoryID)
	; if still in current memory, restart it
	if CurrentMemoryData && memoryID == voiceoverMemoryID ;  && CurrentMemoryData.isDone == false ; REMOVED - seems obsolete
		; restart current scenes
		PauseMemoryScenes(memoryID, false)
	endif
endFunction


; utility functions

MemoryActor[] function GetMemoryActors(int memoryID)
	MemoryActor[] theActors

	if memoryID == MemoryA_ID
		theActors = MemoryA_Actors
	elseif memoryID == MemoryB_ID
		theActors = MemoryB_Actors
	elseif memoryID == MemoryC_ID
		theActors = MemoryC_Actors
	elseif memoryID == MemoryD_ID
		theActors = MemoryD_Actors
	elseif memoryID == MemoryE_ID
		theActors = MemoryE_Actors
	elseif memoryID == MemoryF_ID
		theActors = MemoryF_Actors
	elseif memoryID == MemoryG_ID
		theActors = MemoryG_Actors
	elseif memoryID == MemoryH_ID
		theActors = MemoryH_Actors
	endif

	return theActors
endFunction

Scene[] function GetMemoryScenes(int memoryID)
	Scene[] theScenes

	if memoryID == MemoryA_ID
		theScenes = MemoryA_Scenes
	elseif memoryID == MemoryB_ID
		theScenes = MemoryB_Scenes
	elseif memoryID == MemoryC_ID
		theScenes = MemoryC_Scenes
	elseif memoryID == MemoryD_ID
		theScenes = MemoryD_Scenes
	elseif memoryID == MemoryE_ID
		theScenes = MemoryE_Scenes
	elseif memoryID == MemoryF_ID
		theScenes = MemoryF_Scenes
	elseif memoryID == MemoryG_ID
		theScenes = MemoryG_Scenes
	elseif memoryID == MemoryH_ID
		theScenes = MemoryH_Scenes
	endif

	return theScenes
endFunction

MemoryDataItem function GetMemoryData(int memoryID)
	myTrace(self + " GetMemoryData " + memoryID)
	MemoryDataItem theMemoryDataItem = NONE
	if memoryID > 0
		theMemoryDataItem = MemoryData[memoryID - 1]
	endif
	return theMemoryDataItem
endFunction

int function GetMemoryStage(int memoryID)
	int stage = -1
	MemoryDataItem theData = GetMemoryData(memoryID)
	if theData
		stage = theData.CurrentStageGlobal.GetValueInt()
	endif
	return stage
endFunction

function SetMemoryStage(int memoryID, int newStage)
	int index = memoryID - 1
	if index >= 0 && index < MemoryData.Length
		GlobalVariable currentStageGlobal =  MemoryData[index].CurrentStageGlobal
		if currentStageGlobal
			currentStageGlobal.SetValue(newStage)
		endif
	endif
endFunction

bool property bShowTraces = true auto hidden
function myTrace(string traceString, bool bTraceStack = false)
	if bShowTraces
		if bTraceStack
			debug.tracestack(traceString)
		else
			debug.trace(traceString)
		endif
	endif
endFunction

group effects
	ImageSpaceModifier Property PausedImod Auto Const

	SoundCategorySnapshot Property CSKelloggsBrain auto const

	Sound property QSTMQ203SceneEnd Auto Const Mandatory
	{to play when the scene ends and NPCs fade out}

	Sound property QSTMQ203ScenePause Auto Const Mandatory
	{to play when a scene is paused (when activating something)}

	Sound property QSTMQ203SceneStart Auto Const Mandatory
	{called to play when a scene first starts}

	Sound property QSTMQ203ScenePlay Auto Const Mandatory
	{called to play when a scene unpauses}
endGroup

group quests
	Quest Property MQ204 const auto
	MQ101KelloggSequenceScript Property MQ101KelloggSequence const auto
endGroup

group miscellaneous
	Message Property MQ203ExitMessage const auto
	{ message box used when exiting a memory }

	Message Property MQ203ActivationText const auto
	{ activation text override }

	Faction Property MQ203NPCFaction const auto
	{ faction all NPCs are in - used for hit filter }

	Spell Property MQ203PlayerInvisibility const auto
	{ spell to prevent actors from headtracking player }

	Spell Property MQ203NPCAbility const auto
	{ spell to hide actors resetting their positions }

	Idle property mq203KelloggAndMomSyncStart const auto
	{ Memory A - Mom hands gun to Kellogg }

	Idle property KelloggOnBedTalkingToMom const auto
	{ Memory A - Kellogg talking idle }

	Idle property IdleBookReadStart const auto
	Idle property IdleBookReadStop const auto

	Idle property IdleKelloggWifeSceneStart const auto
	{ Memory B - synced anim sequence }

	Idle property IdleSitFemaleReactingToViolence const auto
	{ Memory E - Institute agent watching Kellogg kill synths }

	Idle property KelloggPointGun const auto
	{ Memory H - Kellogg point gun at door }

	Idle property IdleKelloggReadfileFull const auto
	{ Memory H - courser hand Kellogg the file }

	ActorValue property MQ203HideMe const auto
	{ used to condition "invisible" ability effect }
endGroup

group references
	ObjectReference Property MQ203MemoryDenReturnMarker const auto

	ObjectReference Property MQ203MemoryAStartMarker const auto

	ObjectReference Property MQ203MemoryC_Door const auto

	ObjectReference Property MQ203MemoryHCourserLoadDoor const auto
	ObjectReference Property MQ203MemoryHVirgilsFileRef const auto

	ObjectReference Property MQ203AmbientLightsEnableMarker const auto
endGroup

RefCollectionAlias Property EnableOnStart const auto
{ anything in here will be enabled when quest starts }

; enums
group MemoryIDs
	int property MemoryA_ID = 1 const auto conditional hidden
	int property MemoryB_ID = 2 const auto conditional hidden
	int property MemoryC_ID = 3 const auto conditional hidden
	int property MemoryD_ID = 4 const auto conditional hidden
	int property MemoryE_ID = 5 const auto conditional hidden
	int property MemoryF_ID = 6 const auto conditional hidden
	int property MemoryG_ID = 7 const auto conditional hidden
	int property MemoryH_ID = 8 const auto conditional hidden

	int property MemoryExit_ID = 9 const auto conditional hidden
endGroup

; which memory am I currently on?
int CurrentMemoryID Conditional

int MemoryStage_Done = 99 ; used for the final "done" stage of all memories

struct MemoryActor 
	ReferenceAlias ActorAlias 
	{ alias of actor }	

	RefCollectionAlias CollectionAlias 
	{ alias of actor collection }	

	ObjectReference ActorStartMarker
	{ actor's start marker - optional - will move to this marker on memory reset if not NONE }

	bool ResurrectOnReset = true
	{ true = make sure alive on reset }

	bool DisableOnEnd = true
	{ true = disable when scene ends
	  false = kill rollover
	}

	bool DisableActorOnEnd = false
	{ if true and DisableOnEnd = true, actor will get fully disabled instead of just alphaed out
	 special case for cryopod NPCs to ensure they get animation state fully reset }

endStruct

struct MemoryDataItem 
	ObjectReference StartMarker
	ObjectReference ExitDoor ; TEMP
	MQ203NeuronBridgeScript ExitBridge
	ObjectReference LightMarker
	ObjectReference AmbientLightMarker
	int EndQuestStage
	int NextMemoryID
	GlobalVariable CurrentStageGlobal
	MQ203SceneTriggerScript SceneTrigger

	bool isDone
	{ currently in "done" (resetting) state }

	bool isPaused
	{ TRUE = currently paused}
endStruct

MemoryDataItem[] Property MemoryData auto const
{ array for storing data for each memory
	indexed by (memoryID - 1)
}

Group MemoryA
	MemoryActor[] Property MemoryA_Actors auto 
	{ array of actors in the scene, used to toggle AI }

	Scene[] Property MemoryA_Scenes auto
	{ array of scenes for this memory }

	MQ203NeuronBridgeScript property MQ203MemoryAIntroBridge auto const
	{ intro bridge }

	ObjectReference property MQ203MemoryAIntroBridgeCollision auto const
	{ intro collision marker }

	int Property MemoryAKelloggIndex = 1 auto const
	int Property MemoryAMomIndex = 2 auto const
	int Property MemoryARadioSceneIndex = 1 auto const

	bool property MemoryA_Done auto conditional ; true when memory is in the "end" state (ready to loop back, actors hidden)
endGroup

Group MemoryB
	MemoryActor[] Property MemoryB_Actors auto 
	{ array of actors in the scene, used to toggle AI }

	Scene[] Property MemoryB_Scenes auto
	{ array of scenes for this memory }

	int Property MemoryBKelloggIndex = 0 auto const
	int Property MemoryBSarahIndex = 1 auto const
	int Property MemoryBBabyIndex = 2 auto const

	int Property MemoryBStageBabyCrying = 2 auto const

	bool property MemoryB_Done auto conditional ; true when memory is in the "end" state (ready to loop back, actors hidden)

	ObjectReference Property AudioBabyIdleRef auto const
	{ ref to baby idle audio marker}

endGroup

Group MemoryC
	MemoryActor[] Property MemoryC_Actors auto 
	{ array of actors in the scene, used to toggle AI }

	Scene[] Property MemoryC_Scenes auto
	{ array of scenes for this memory }

	bool property MemoryC_Done auto conditional ; true when memory is in the "end" state (ready to loop back, actors hidden)

endGroup

Group MemoryD
	MemoryActor[] Property MemoryD_Actors auto 
	{ array of actors in the scene, used to toggle AI }

	Scene[] Property MemoryD_Scenes auto
	{ array of scenes for this memory }

	bool property MemoryD_Done auto conditional ; true when memory is in the "end" state (ready to loop back, actors hidden)

endGroup

Group MemoryE
	MemoryActor[] Property MemoryE_Actors auto 
	{ array of actors in the scene, used to toggle AI }

	Scene[] Property MemoryE_Scenes auto
	{ array of scenes for this memory }

	int Property MemoryEKelloggIndex = 0 auto const
	int Property MemoryEScientistIndex = 1 auto const

	int Property MemoryESynth01Index = 2 auto const
	int Property MemoryESynth02Index = 3 auto const
	int Property MemoryESynth03Index = 4 auto const
	{ indices in the MemoryActor array of the synths - used for giving the guns back on reset }

	ReferenceAlias Property MemoryE_Synth01Weapon auto const
	ReferenceAlias Property MemoryE_Synth02Weapon auto const
	ReferenceAlias Property MemoryE_Synth03Weapon auto const

	bool property MemoryE_Done auto conditional ; true when memory is in the "end" state (ready to loop back, actors hidden)
endGroup

Group MemoryF
	MemoryActor[] Property MemoryF_Actors auto 
	{ array of actors in the scene, used to toggle AI }

	Scene[] Property MemoryF_Scenes auto
	{ array of scenes for this memory }

	bool property MemoryF_Done auto conditional ; true when memory is in the "end" state (ready to loop back, actors hidden)

	ReferenceAlias Property MQ101Spouse auto const Mandatory
	{ MQ101KelloggSequence Spouse alias }
endGroup

Group MemoryG
	MemoryActor[] Property MemoryG_Actors auto 
	{ array of actors in the scene, used to toggle AI }

	Scene[] Property MemoryG_Scenes auto
	{ array of scenes for this memory }

	bool property MemoryG_Done auto conditional ; true when memory is in the "end" state (ready to loop back, actors hidden)
endGroup

Group MemoryH
	MemoryActor[] Property MemoryH_Actors auto 
	{ array of actors in the scene, used to toggle AI }

	Scene[] Property MemoryH_Scenes auto
	{ array of scenes for this memory }

	int Property MemoryHCourserIndex = 0 auto const
	{ index in the MemoryActor array of the courser - used for teleporting him in and out }

	int Property MemoryHKelloggIndex = 1 auto const
	{ index in the MemoryActor array of Kellogg - used for playing animations }

	int Property MemoryHShaunIndex = 2 auto const
	{ index in the MemoryActor array of Shaun - used for teleporting him out }

	int Property MemoryHRadioSceneIndex = 1 auto const

	bool property MemoryH_Done auto conditional ; true when memory is in the "end" state (ready to loop back, actors hidden)
endGroup

Scene Property CurrentVoiceoverScene auto hidden
{ filled by MQ203ActivationBlockerScript - if non-empty, means a voiceover scene is playing }

bool voiceoverSceneRunning = false Conditional 	;	set to true while voiceover scene is running - used for scene conditions to pause during voiceover

Int MemoryBAnimationTimingNumber = 0 Conditional    ;	How far has the animation with Kellogg/Sarah progressed?


int voiceoverFailsafeTimerID = 1
float voiceoverFailsafeTimer = 45.0 ; seconds

int restartMemoryTimerID = 100 ; restartMemoryTimerID + memoryID = restart timer ID

ImageSpaceModifier Property MemoryLoungerEnterImod Auto Const Mandatory
