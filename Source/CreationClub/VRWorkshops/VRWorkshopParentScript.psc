Scriptname CreationClub:VRWorkshops:VRWorkshopParentScript extends Quest Conditional
{Handles crafting restrictions, VR settlers, companions, etc.}

Group TerminalData
	bool Property bDisableTerminalFunctions = false Auto Conditional
	{Disables terminal options when selecting EXIT or TRAVEL functions. Referenced by VR terminal entries.}
EndGroup

Group Settings
	Int Property MaxVRSettlers = 20 Auto Const
	{Total number of VR Settlers allowed in VR Settlements}
EndGroup

Group Quests
	CreationClub:VRWorkshops:VRWorkshopAttacksQuestScript Property VRAttackQuest Auto Const Mandatory
EndGroup

Group FormLists
	FormList Property VRWorkshopShared_DisallowedObjectsList Auto Mandatory
	{Formlist updated at runtime on save load with DLC objects player cannot craft in VR.}
EndGroup

Group Messages
	Message Property VRWorkshop_Message_MaxSettlers Auto Const Mandatory
	{Message shown when hitting max settlers}
	Message Property VRWorkshopShared_Message_AlreadyInCurrentWorkshop Auto Const Mandatory
	{When player tries to travel to VR workshop they are already in}
EndGroup

Group Keywords
	Keyword Property WorkshopLinkSpawn Auto Const Mandatory
	Keyword Property VRWorkshopShared_Keyword_WorkshopTypeVR Auto Const Mandatory
	Keyword Property VRWorkshopShared_Keyword_LinkedRefMapMarker Auto Const Mandatory
EndGroup

Group ReferenceAliases
	ReferenceAlias Property CompanionReturnMarkerREF Auto Mandatory
	{Where to move the companion to when dismissed from VR. Updated upon entry to be the center marker of the entry cell.}
	ReferenceAlias Property CurrentReturnPodREF Auto Mandatory
	{Pod we will return the player into to when they exit VR.}
	ReferenceAlias Property CurrentTravelMarkerREF Auto Mandatory
	{The current destination marker for the player.}
EndGroup

Group Workshop
	WorkshopParentScript Property WorkshopParent Auto Const Mandatory
	{Hook into the main Workshop system}
EndGroup

Group Effects
	EffectShader Property TeleportOutFXS Auto Const Mandatory
	Sound Property TeleportSound Auto Const Mandatory
EndGroup

Group AnimationProperties
{Visual/sound FX and timers for the pod animations.}
	ImageSpaceModifier Property VRWorkshop_MemoryLoungerEnterImod Auto Const Mandatory
	ImageSpaceModifier Property VRWorkshop_MemoryLoungerExitImod Auto Const Mandatory
	Sound Property VRWorkshop_TravelSoundFX Auto Const Mandatory
	{Sound effect played when leaving}
	Sound Property VRWorkshop_ArriveSoundFX Auto Const Mandatory
	{Sound effect played when arriving}
EndGroup

Group SpellsAndPerks
	Perk Property crNoFallDamage Auto Const Mandatory
	{Perk to eliminate fall damage}
	Perk Property VRWorkshopShared_ImmuneToDamagePerk Auto Const Mandatory
	{Give player and companions immunity to damage while in VR}
	Perk Property ImmuneToRadiation Auto Const Mandatory
	Perk Property ImmuneToPoison Auto Const Mandatory
	Perk Property ImmuneToAcid Auto Const Mandatory
	Perk Property VRWorkshopShared_BlockXP Auto Const Mandatory
EndGroup

;Treated like key/value pairs. The ref of the destination pod, and the display message.
Struct VRDestinationData
	ReferenceAlias VRDestinationMarkerRef
	Message VRDestinationName
EndStruct

Group VRPodArray
	VRDestinationData[] Property ArrayVRDestinations Auto Const Mandatory
	{Holds VR marker destination refs and their names as messages for display and text replacement purposes.}
EndGroup

;Passing this data in via plugin instead of hard-coding it, for better code and to ensure it can be updated later with new forms
Struct StructBlacklistObject
	String PluginFilename
	Int FormID
	String Description
EndStruct

Group BlacklistedForms
	StructBlacklistObject[] Property ArrayStructBlacklistObjects Auto Const
	{Struct of blacklisted forms disallowed from being crafted in VR.}
EndGroup

Group MusicForms
	MusicType Property VRWorkshopShared_MUS_NONE Auto Const Mandatory
	{Used as a high-priority spacer to properly change music in the VR worldspaces}
EndGroup

;=============
;Internal Vars
;=============

WorkshopScript CurrentWorkshopRef
FollowersScript Followers ;set in onInit()
ObjectReference SettlerSpawnMarker
Float AnimationDuration = 1.2 Const
Float AnimationDurationExit = 2.35 Const
Bool bIsExitingVR = false
ObjectReference MarkerRefNewLocation ;placeholder to change VR locations from inside VR
ImageSpaceModifier CurrentImageSpace ;set via terminal but stored here so we can clear it upon exit
MusicType CurrentMusic ;set via terminal but stored here so we can clear it out upon exit

;=========
;Events
;=========

Event OnInit()

	Followers = FollowersScript.GetScript()
	RegisterForCustomEvent(Followers, "CompanionChange")

	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
	BuildDLCObjectBlacklist()

EndEvent

Event Actor.OnPlayerLoadGame(Actor akActorRef)
	debug.trace("VR WORKSHOPS: Save game loaded, re-build disallowed object list")
	BuildDLCObjectBlacklist()
EndEvent

Event FollowersScript.CompanionChange(FollowersScript akSender, Var[] args)
{This event fires during any recruit or dismiss, but the bool IsNowCompanion lets us know if it's a recruit or dimsiss}
	;args[0] = ActorThatChanged
	;args[1] = IsNowCompanion

	Actor companion = args[0] as Actor
	Bool isCurrentCompanion = args[1] as Bool

	If(companion.GetCurrentLocation().HasKeyword(VRWorkshopShared_Keyword_WorkshopTypeVR) && !isCurrentCompanion)
		debug.trace("VR WORKSHOPS: Dismissing companion from VR and moving to " + CompanionReturnMarkerREF.GetReference())
		TeleportOutFXS.play(companion, AnimationDuration)
		TeleportSound.Play(companion)
		Utility.Wait(AnimationDuration)
		companion.MoveTo(CompanionReturnMarkerREF.GetReference())
	EndIf

EndEvent

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
;Registers when player confirms they want to exit VR using the terminal, then closes the terminal
	If(asMenuName == "TerminalMenu" && !abOpening)
		UnregisterForMenuOpenCloseEvent("TerminalMenu")
		If(bIsExitingVR)
			HandlePlayerExit()
			HandleCompanionMove()
			bIsExitingVR = False ;reset value
		Else
			HandlePlayerChangeVRLocation()
			HandleCompanionMove()
		EndIf
	EndIf
EndEvent

;=========
;Functions
;=========


Function BuildDLCObjectBlacklist()
{Build formlist of disallowed objects so we can block them being crafted in VR. This formlist is re-built on save to make sure we catch users who install or remove DLC or CC content mid-game.}

	;rapid save/load protection
	GoToState("Busy")

	;Only run if we actually have data to iterate through
	If(ArrayStructBlacklistObjects.Length > 0)

		debug.trace("VR WORKSHOPS: Building VR workshop disallowed object list")

		VRWorkshopShared_DisallowedObjectsList.Revert() ;revert/clear it out to rebuild cleanly in case DLC or CC content was added or removed mid-game

		;Begin loop over array of structs with plugin/form information

		String currentPlugin = ""
		Bool pluginInstalled = False

		Int i = 0

		While(i < ArrayStructBlacklistObjects.Length)

			;Re-do plugin check only when filename string changes to avoid constantly checking IsPluginInstalled for every form in the array
			If(currentPlugin != ArrayStructBlacklistObjects[i].PluginFilename)
				currentPlugin = ArrayStructBlacklistObjects[i].PluginFilename ;update the filename

				;Check if the plugin is installed or not
				pluginInstalled = Game.IsPluginInstalled(currentPlugin)
			EndIf

			;Add the forms to the main formlist
			If(pluginInstalled)
				debug.trace("VR WORKSHOPS: Adding form " + ArrayStructBlacklistObjects[i].FormID + " from plugin " + \
					currentPlugin + " to blocked VR crafting list.")
				Form blockedForm = Game.GetFormFromFile(ArrayStructBlacklistObjects[i].FormID, currentPlugin)
				VRWorkshopShared_DisallowedObjectsList.AddForm(blockedForm)
			EndIf

			i += 1

		EndWhile

		debug.trace("VR WORKSHOPS: " + VRWorkshopShared_DisallowedObjectsList.GetSize() + \
			" blacklisted objects stored in formlist " + VRWorkshopShared_DisallowedObjectsList)

	Else
		debug.trace("VR WORKSHOPS: Disallowed object array is empty. No new forms being added.")
	EndIf

	GoToState("Ready")

EndFunction


Function AddVRSettler()

	debug.trace("VR WORKSHOP: Add VR Settler Called")

	;Get which VR Workshop player is currently in
	CurrentWorkshopRef = WorkshopParent.GetWorkshopFromLocation(Game.GetPlayer().GetCurrentLocation())

	debug.trace("VR WORKSHOP: Current workshop ref is " + CurrentWorkshopRef)

	;Get the current workshop's spawn marker
	SettlerSpawnMarker = CurrentWorkshopRef.GetLinkedRef(WorkshopLinkSpawn)

	debug.trace("VR WORKSHOP: Spawn marker is " + SettlerSpawnMarker)

	;Spawn a new settler, but only if we're below the max threshold
	If(CurrentWorkshopRef.GetBaseValue(WorkshopParent.WorkshopRatings[WorkshopParent.WorkshopRatingPopulation].resourceValue) < MaxVRSettlers)
		debug.trace("VR WORKSHOP: Population is less than max, spawn a new settler")
		WorkshopParent.CreateActorPUBLIC(CurrentWorkshopRef, SettlerSpawnMarker, False)
	Else
		debug.trace("VR WORKSHOP: Population is max, show message")
		VRWorkshop_Message_MaxSettlers.Show()
	EndIf

EndFunction


Function SetVRPodDestination(Int VRLocationEnum, ObjectReference TerminalRef, Keyword LinkTerminalKeyword)
{Workshop Terminals send an "enum" here which updates all connected devices with destination refs and display messages. Contraptions DLC was referenced for this method.}
	
	If(ArrayVRDestinations[VRLocationEnum])

		ObjectReference DestinationMarker = ArrayVRDestinations[VRLocationEnum].VRDestinationMarkerRef.GetReference()
		Message DestinationMessage = ArrayVRDestinations[VRLocationEnum].VRDestinationName

		debug.trace("VR WORKSHOPS: " + self + " Set VR Pod destination to " + DestinationMarker + ", with LinkTerminalKeyword=" + LinkTerminalKeyword)
		
		ObjectReference[] linkedRefArray = TerminalRef.GetLinkedRefArray(LinkTerminalKeyword) ;get all connected objects for this terminal type

		;iterate over all of the connected objects to this terminal

		int i = 0

		While(i < linkedRefArray.length)
			CreationClub:VRWorkshops:VRWorkshopLoungerTravelScript podRef = linkedRefArray[i] as CreationClub:VRWorkshops:VRWorkshopLoungerTravelScript
			debug.trace("VR WORKSHOPS: " + self + " " + i + ": " + podRef)
			
			If(podRef)
				debug.trace("VR WORKSHOPS: " + self + "  setting destination on " + podRef + " to " + DestinationMarker)
				podRef.SetDestination(DestinationMarker)
				podRef.SetDestinationMessage(DestinationMessage)
			EndIf
			i += 1
		EndWhile

	Else
		debug.trace("VR WORKSHOPS: " + self + " WARNING invalid destination attempting to be set. ArrayVRDestinations at position " + VRLocationEnum, 1)
	EndIf

EndFunction

Function ExitVRSettlement()
{External: Called from the VR terminals to exit VR worldspace and snap the player back into the pod they entered from in their 'real' settlement.}

	;Temporarily block other terminal functions from being available until the player exits and we actually leave
	bDisableTerminalFunctions = True ;Terminals have conditions that check this value to display or not
	bIsExitingVR = True ;used by the terminal close event to determine if we're leaving or just switching worldspaces

	debug.trace("VR WORKSHOPS:" + self + "player confirmed VR exit, register for terminal closing.")

	;We cannot move the player or play VFX while they're using a terminal, so we have to register to catch player exiting the terminal
	RegisterForMenuOpenCloseEvent("TerminalMenu")

EndFunction


Function ChangeVRLocation(Int VRLocationEnum)
{External: Called by VR Terminal to teleport to a different VR Workshop location}

	If(ArrayVRDestinations[VRLocationEnum])

		MarkerRefNewLocation = ArrayVRDestinations[VRLocationEnum].VRDestinationMarkerRef.GetReference()

		;Check to see if the player is already in the location they selected and show a message
		;I can't do this in the terminal as a condition because they are separate plugins and their data is unreachable
		If(Game.GetPlayer().GetCurrentLocation() == MarkerRefNewLocation.GetCurrentLocation())
			VRWorkshopShared_Message_AlreadyInCurrentWorkshop.Show()
		Else
			debug.trace("VR WORKSHOPS: " + self + " changing VR location to " + MarkerRefNewLocation)
			InputEnableLayer VRWorkshopInputLayer = InputEnableLayer.Create()
			VRWorkshopInputLayer.DisablePlayerControls() ;temporarily disable player controls

			;Temporarily block other terminal functions from being available until the player exits and we actually leave
			bDisableTerminalFunctions = True ;Terminals have conditions that check this value to display or not
			bIsExitingVR = False ;used by the terminal close event to determine if we're leaving or just switching worldspaces

			RegisterForMenuOpenCloseEvent("TerminalMenu")			
		EndIf
	Else
		debug.trace("VR WORKSHOPS: " + self + " WARNING invalid destination attempting to be set. ArrayVRDestinations at position " + VRLocationEnum, 1)
	EndIf

EndFunction

Function HandlePlayerChangeVRLocation()
	;If attack mode is running, stop it
	If(VRAttackQuest.IsRunning())
		VRAttackQuest.StopVRAttack()
	EndIf

	InputEnableLayer VRWorkshopInputLayer = InputEnableLayer.Create()
	VRWorkshopInputLayer.DisablePlayerControls() ;temporarily disable player controls

	VRWorkshop_MemoryLoungerEnterImod.Apply() ;fade screen white
	VRWorkshop_TravelSoundFX.Play(Game.GetPlayer()) ;Play sound effects
	Utility.Wait(AnimationDurationExit) ;wait for whiteout animation to finish
	Game.GetPlayer().MoveTo(MarkerRefNewLocation) ;move player to selected VR location
	bDisableTerminalFunctions = False ;re-enable terminal options

	;Update the refalias to point to the new destination marker
	CurrentTravelMarkerREF.ForceRefTo(MarkerRefNewLocation)

	;queue up VFX/SFX for arrival
	VRWorkshop_MemoryLoungerExitImod.Apply() ;fade screen from white to normal
	VRWorkshop_ArriveSoundFX.Play(Game.GetPlayer()) ;play the sound effect

EndFunction

Function HandlePlayerExit()
{Internal: Move player out or VR and back to origin pod with VFX/SFX and remove buffs and perks}

	;If attack mode is running, stop it
	If(VRAttackQuest.IsRunning())
		VRAttackQuest.StopVRAttack()
	EndIf

	InputEnableLayer VRWorkshopInputLayer = InputEnableLayer.Create()
	VRWorkshopInputLayer.DisablePlayerControls() ;temporarily disable player controls

	CreationClub:VRWorkshops:VRWorkshopLoungerTravelScript ReturnPod
	ReturnPod = (CurrentReturnPodREF.GetReference() as CreationClub:VRWorkshops:VRWorkshopLoungerTravelScript)
	ReturnPod.SetStateReturn() ;prepare the pod to snap the player back into it

	debug.trace("VR WORKSHOPS: " + self + " Sending player out of VR to return pod: " + ReturnPod)
	
	;remove buffs and perks
	Game.GetPlayer().RemovePerk(crNoFallDamage)
	Game.GetPlayer().RemovePerk(VRWorkshopShared_ImmuneToDamagePerk)
	Game.GetPlayer().RemovePerk(ImmuneToAcid)
	Game.GetPlayer().RemovePerk(ImmuneToPoison)
	Game.GetPlayer().RemovePerk(ImmuneToRadiation)
	Game.GetPlayer().RemovePerk(VRWorkshopShared_BlockXP)

	;Disable the map marker (Pip-Boy map bug workaround)
	CurrentTravelMarkerREF.GetReference().GetLinkedRef(VRWorkshopShared_Keyword_LinkedRefMapMarker).Disable()

	;Remove current imagespace overlay if one is set
	ClearImageSpace()
	ClearMusic()

	;Release current weather
	Weather.ReleaseOverride()

	VRWorkshop_MemoryLoungerEnterImod.Apply() ;fade screen white
	VRWorkshop_TravelSoundFX.Play(Game.GetPlayer()) ;Play sound effects
	Utility.Wait(AnimationDurationExit) ;wait for whiteout animation to finish
	Game.ForceFirstPerson() ;the lounger animation can be glitchy if initiated while in third-person
	Game.GetPlayer().MoveTo(ReturnPod) ;move player to origin pod
	bDisableTerminalFunctions = False ;re-enable terminal options

EndFunction

Function HandleCompanionMove()
{Internal: Move all active companion(s) out of VR and remove buffs and perks}

	Actor[] ActiveFollowers = Game.GetPlayerFollowers()

	If (ActiveFollowers.Length > 0)

		debug.trace("VR WORKSHOP: Begin moving " + ActiveFollowers.Length +  " companion(s)")

		Int i = 0
		While(i < ActiveFollowers.Length)
			Actor CompanionActor = ActiveFollowers[i]
			If(CompanionActor)
				debug.trace("VR WORKSHOP: Moving actor " + CompanionActor + " to player.")
				CompanionActor.MoveTo(Game.GetPlayer())
			EndIf
			i += 1
		Endwhile

	EndIf
EndFunction

Function SetImageSpace(ImageSpaceModifier imageSpaceModifierToSet)
	ClearImageSpace()
	CurrentImageSpace = imageSpaceModifierToSet
	CurrentImageSpace.Apply()
EndFunction

Function ClearImageSpace()
	If(CurrentImageSpace)
		CurrentImageSpace.Remove()
	EndIf
EndFunction

Function OverrideMusic(MusicType MusicToPlay)
	ClearMusic()
	CurrentMusic = MusicToPlay
	debug.trace("VR WORKSHOPS: Adding music " + MusicToPlay + " to queue.")	
	CurrentMusic.Add()
EndFunction

Function ClearMusic()
	If(CurrentMusic)
		debug.trace("VR WORKSHOPS: Clearing music selection " + CurrentMusic)
		CurrentMusic.Remove() ;remove whatever track is playing

		;Use a high-priority 1 second spacer track to "reset" the music playback
		;Otherwise lesser priority music (i.e. worldspace defaults) will not play immediately
		VRWorkshopShared_MUS_NONE.Add()
		VRWorkshopShared_MUS_NONE.Remove()
	EndIf
EndFunction