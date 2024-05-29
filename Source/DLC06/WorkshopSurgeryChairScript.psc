Scriptname DLC06:WorkshopSurgeryChairScript extends workshopobjectscript

group SurgeryChairProperties
	Faction property DLC06WorkshopVendorFactionSurgery auto const mandatory

	ActorValue Property BoughtSurgeryAV auto Const
	{Used to Condition dialogue}

	Keyword Property AnimFaceArchetypePlayer Auto Const
	{Store Player Face Archetype. We need to switch player to Neutral while in the menu.}

	InputEnableLayer Property FaceSurgeryInputLayer Auto Hidden
endGroup

Bool var_SkeletonResetDone

function AssignActor(WorkshopNPCScript newActor = None)
	; add/remove special combat faction
	; also protected status
	if newActor
		AssignFacegenVendor(newActor, true)
	else
		WorkshopNPCScript oldActor = GetActorRefOwner() as WorkshopNPCScript
		if oldActor
			AssignFacegenVendor(oldActor, false)
		endif
	endif
	Parent.AssignActor(newActor)
endFunction

function AssignFacegenVendor(WorkshopNPCScript assignedActor, bool bAssign)
	WorkshopScript workshopRef = WorkshopParent.GetWorkshop(workshopID)

	if bAssign
		assignedActor.AddToFaction(DLC06WorkshopVendorFactionSurgery)
	else
		assignedActor.RemoveFromFaction(DLC06WorkshopVendorFactionSurgery)
	endif
	ResetSurgeryGurney()
endFunction



; purchase surgery
function BoughtSurgery(Actor surgeon)
	Actor PlayerREF = Game.GetPlayer()
	debug.trace(self + " BoughtSurgery called on WorkshopSurgeryChairScript - Gurney is available")
	BlockActivation(True, False)
	; used to condition dialogue and packages
	surgeon.SetValue(BoughtSurgeryAV, 1.0)
	surgeon.EvaluatePackage()
	RegisterForRemoteEvent(PlayerREF, "OnSit")
	RegisterForRemoteEvent(PlayerREF, "OnGetup")
	RegisterForMenuOpenCloseEvent("LooksMenu")
endFunction

;reset everything
function ResetSurgeryGurney()
	Actor PlayerREF = Game.GetPlayer()
 	debug.trace(self + " ResetSurgeryGurney called on WorkshopSurgeryChairScript - surgery used or expired")
	BlockActivation(True, True)

	; used to conditionalize dialogue and packages
	ObjectReference[] surgeons = GetLinkedRefChildren(AssignedActorLinkKeyword) ; should be only 1
	int i = 0
	while i < surgeons.Length
		Actor surgeon = surgeons[i] as Actor 
		if surgeon
			; used to conditionalize dialogue
			surgeon.SetValue(BoughtSurgeryAV, 0.0)
			surgeon.EvaluatePackage()
		endif
		i += 1
	endwhile

	UnRegisterForRemoteEvent(PlayerREF, "OnSit")
	UnRegisterForRemoteEvent(PlayerREF, "OnGetup")
	UnRegisterForMenuOpenCloseEvent("LooksMenu")
endFunction

;if I load again, reset the chair
Event OnLoad()
	ResetSurgeryGurney()
	Parent.OnLoad()
EndEvent

Event OnActivate(ObjectReference akActionRef)
	Actor PlayerREF = Game.GetPlayer()
	If akActionRef == PlayerREF
		If PlayerREF.IsInCombat()
			;do nothing
		ElseIf PlayerREF.IsInPowerArmor()
			;do nothing
		ElseIf PlayerREF.GetSitState() != 0
			;do nothing
		Else
			;disable controls and force player into the chair
			FaceSurgeryInputLayer = InputEnableLayer.Create()
			FaceSurgeryInputLayer.DisablePlayerControls()

			;must force the player into first person is order to get the proper animation events
			Game.ForceFirstPerson()

			;start fading the game out during activation to hide resetting the chargen skeleton
			Game.FadeOutGame(True, True, 0.0, 2.0, True)		

			;make sure player has CharGen Skeleton for editing
			;we also need to know when the player's skeleton has re-initialized before we force them into furniture, so listen for that anim event
			RegisterForAnimationEvent(PlayerREF, "FirstPersonInitialized")
			PlayerREF.SetHasCharGenSkeleton()

			;wait until the player graph has been fully re-initialized from the chargenskeleton set
			;failsafe the wait to last 10 seconds, if we haven't gotten the animation event by then, move forward
			int var_SkeletonResetFailsafeCount = 0
			While (var_SkeletonResetDone == False) && (var_SkeletonResetFailsafeCount < 10)
				Utility.Wait(1.0)
				var_SkeletonResetFailsafeCount += 1
			EndWhile

			UnRegisterForAnimationEvent(PlayerREF, "initiateStart")
			var_SkeletonResetDone=False

			;give the chargen skeleton one more moment to take and then force player into chair
			Utility.Wait(1.0)
			Activate(PlayerREF, True)
		EndIf
	EndIf

	Parent.OnActivate(akActionRef)
EndEvent

;we registered for the FirstPersonIntitialized event, but what we really want to know is when it unregisters, because the CharGenSkeleton reset unregisters automatically when called
Event OnAnimationEventUnregistered(ObjectReference akSource, string asEventName)
	If asEventName == "FirstPersonInitialized"
		;now register for the event that fires when the third person graph is fully available
		RegisterForAnimationEvent(Game.GetPlayer(), "initiateStart")		
	EndIf
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	;CharGenSkeleton has finished being removed or added, let any scripting waiting for this to move forward
	If (asEventName == "initiateStart")
		var_SkeletonResetDone = True
	EndIf
EndEvent

Event Actor.OnSit(Actor akSender, ObjectReference akFurniture)
	Actor PlayerREF = Game.GetPlayer()
	If (akFurniture == self) && (akSender == PlayerREF)
		debug.trace(self + "Player is in Surgery Chair")				
		;make sure player face is Neutral
		PlayerREF.ChangeAnimFaceArchetype(None)
		;allow player to get up out of the chair when the menu closes
		BlockActivation(False, False)
		Game.ShowRaceMenu(uimode = 3)
		UnRegisterForRemoteEvent(PlayerREF, "OnSit")
		;fade the game back up
		Game.FadeOutGame(False, True, 1.0, 2.0)
	EndIf
EndEvent

;fade out the game as soon as the player leaves the face menu to hide resetting the chargen skeleton
Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
	if (asMenuName == "LooksMenu")
		If abOpening == False
			Game.FadeOutGame(True, True, 0.0, 2.0, True)
			UnRegisterForMenuOpenCloseEvent("LooksMenu")
		EndIf
	EndIf	
EndEvent

Event Actor.OnGetUp(Actor akSender, ObjectReference akFurniture)
	Actor PlayerREF = Game.GetPlayer()
	If (akFurniture == self) && (akSender == PlayerREF)
		;reset the surgery
		ResetSurgeryGurney()
		;we need to know when the player's skeleton has re-initialized before we can let them move
		RegisterForAnimationEvent(PlayerREF, "FirstPersonInitialized")
		;make sure the CharGen skeleton has been removed
		PlayerREF.SetHasCharGenSkeleton(False)
		;make sure player face is back to Player archetype
		PlayerREF.ChangeAnimFaceArchetype(AnimFaceArchetypePlayer)

		;wait until the player graph has been fully re-initialized from the chargenskeleton set
		;failsafe the wait to last 10 seconds, if we haven't gotten the animation event by then, move forward
		int var_SkeletonResetFailsafeCount = 0
		While (var_SkeletonResetDone == False) && (var_SkeletonResetFailsafeCount < 10)
			Utility.Wait(1.0)
			var_SkeletonResetFailsafeCount += 1
			debug.trace(var_SkeletonResetDone)
			debug.trace(var_SkeletonResetFailsafeCount)
		EndWhile

		UnRegisterForAnimationEvent(PlayerREF, "initiateStart")
		var_SkeletonResetDone=False

		;enable controls
		FaceSurgeryInputLayer.EnablePlayerControls()
		FaceSurgeryInputLayer = None
		UnRegisterForRemoteEvent(PlayerREF, "OnGetUp")
		Game.FadeOutGame(False, True, 1.0, 2.0)
	EndIf
EndEvent
