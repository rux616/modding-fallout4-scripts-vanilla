Scriptname CreationClub:VRWorkshops:VRWorkshopLoungerTravelScript extends ObjectReference
{Handles traveling in and out of VR and the various animation states.}

;/
CONTEXT: This script is on a VR Pod that the player is able to craft in a settlement
Once connected to power/and a Workshop terminal, the destination can be set on the VR Pod, similar to a contraptions builder.
When the pod used to enter into VR, it is stored in the parent quest's RefAlias so we know where to return the player to.

Once inside VR, the player returns to this pod in the 'real world' using a pre-placed terminal.
This terminal calls up into the quest to read the refalias that was set on entry, and sets the state to receive the player so it can animate propertly.
/;

Group DestinationData
	ObjectReference Property DestinationMarkerRef Auto
	{Where to send the player to. Updated at runtime by player using Workshop Terminal.}
	Message Property VRWorkshop01_Menu_EnterVR_MessageBox Auto Mandatory
	{Yes/No prompt to travel to VR Workshop with name of worldspace. Updated at runtime by player using Workshop Terminal.}
EndGroup

Group Keywords
	Keyword Property VRWorkshopShared_Keyword_WorkshopTypeVR Auto Const Mandatory
	Keyword Property VRWorkshopShared_Keyword_LinkedRefMapMarker Auto Const Mandatory
	{Used to check link with map marker and show/hide it when entering VR; workaround for base game Pip-Boy map bug.}
EndGroup

Group Misc
	Bool Property RequiresPower = False Auto Const Mandatory
	{Requires power in Real settlement but does not in VR.}
EndGroup

Group AnimationProperties
{Visual/sound FX and timers for the lounger animations.}
	ImageSpaceModifier Property VRWorkshop_MemoryLoungerEnterImod Auto Const Mandatory
	ImageSpaceModifier Property VRWorkshop_MemoryLoungerExitImod Auto Const Mandatory
	Sound Property VRWorkshop_TravelSoundFX Auto Const Mandatory
	{Sound effect played when leaving}
	Sound Property VRWorkshop_ArriveSoundFX Auto Const Mandatory
	{Sound effect played when arriving}
EndGroup

Group Messages
	Message property PowerArmorNoActivate Auto Const Mandatory 
	{Message to show when player tries to use lounger in Power Armor}
	Message Property CombatNoActivate Auto Const Mandatory
	{Message to show when player tries to use lounger while in Combat}
	Message Property VRWorkshopShared_Message_RequiresPower Auto Const Mandatory
	{Message to show when player tries to use lounger while in Combat}
	Message Property VRWorkshopShared_Message_NoDestination Auto Const Mandatory
	{Message to show when player tries to use lounger with no destination.}
EndGroup

Group Companions
	RefCollectionAlias Property ActiveCompanions Auto Const Mandatory
	ReferenceAlias Property DogmeatRef Auto Const Mandatory
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

Group Quests
	CreationClub:VRWorkshops:VRWorkshopAttacksQuestScript Property VRAttackQuest Auto Const Mandatory
	{VR Attack Quest}
EndGroup

Group ReferenceAliases
	ReferenceAlias Property CompanionReturnMarkerREF Auto
	{Previous workshop marker ref to dismiss companions to from VR}
	ReferenceAlias Property WorkshopCenterMarker Auto Mandatory
	{WorkshopParent Reference Alias for Current Workshop Center Marker}
	ReferenceAlias Property CurrentReturnPodREF Auto Mandatory
	{Pod we will return the player into to when they exit VR.}
	ReferenceAlias Property CurrentTravelMarkerREF Auto Mandatory
	{Marker we will be sending the player to. Used by parent quest to move player around VR worldspaces as well.}
EndGroup


;Internal Vars
;==============
Float AnimationDuration = 2.35 Const
Float AnimationWaitDuration = 1.0 Const
Float MenuDelaySeconds = 1.5 Const
Float TutorialDelaySeconds = 3.0 Const
Int iHasPower = 0

;=========
;EVENTS
;==========

Event OnInit()
	self.BlockActivation(True, False) ;Block default activation so we can first check if player is wearing Power Armor before initiating sitting
EndEvent

Event OnPowerOn(ObjectReference akPowerGenerator)
	iHasPower += 1
	debug.trace("VR WORKSHOPS: " + self + " has received a power connection. " + iHasPower)	
EndEvent

Event OnPowerOff()
	iHasPower -= 1
	Debug.Trace("VR WORKSHOPS: " + Self + ": Lost Power -> Turning Off. " + iHasPower)
EndEvent

;EMPTY STATE EVENT(s)
Event Actor.OnSit(Actor akSender, ObjectReference akActionRef)
EndEvent

;=========
;STATES
;=========

Auto State UnoccupiedWaiting
;Fully unoccupied pod, lid open animation state, ready for player to sit/animate into place. Shows menu when sit animation completes OnSit.

	Event OnActivate(ObjectReference akActionRef)
		GoToState("Busy")
		debug.trace("VR WORKSHOPS: Lounger activated")
		If(akActionRef == Game.GetPlayer() && CanPlayerEnterPod())
			debug.trace("VR WORKSHOPS: " + self + " All conditions have been met for use, enter the pod")
			GoToState("EnteringPod")
			Game.ForceFirstPerson() ;put player into 1st person because 3rd person camera gets glitchy with this animation sometimes			
			RegisterForRemoteEvent(Game.GetPlayer(), "OnSit") ;Capture when the player is fully seated so we can show the menu at the right time; can't use timers due to pathing variance, etc.
			Self.Activate(Game.GetPlayer(), true) ;activate on behalf of the player so they get into the pod
		Else
			GoToState("UnoccupiedWaiting")
		EndIf
	EndEvent

EndState

State Busy
	Event OnActivate(ObjectReference akActionRef)
		;do nothing
	EndEvent
EndState

State EnteringPod
	Event OnActivate(ObjectReference akActionRef)
		;do nothing
	EndEvent

	Event Actor.OnSit(Actor akActor, ObjectReference akFurniture)
		debug.trace("VR WORKSHOPS: Sitting animation is complete, player is fully seated in the pod.")

		GoToState("OccupiedAwaitingPlayerChoice")

		UnregisterForRemoteEvent(Game.GetPlayer(), "OnSit") ;Unregister so we do not trigger this for every piece of furniture
		InputEnableLayer VRWorkshopInputLayer = InputEnableLayer.Create()
		VRWorkshopInputLayer.DisablePlayerControls() ;temporarily disable player controls

		;Show confirmation menu
		VRLoungerTravelWithConfirmation(VRWorkshop01_Menu_EnterVR_MessageBox)
	EndEvent

EndState

State OccupiedAwaitingPlayerChoice
	;Player has entered the VR pod, animated into place, 
	;Do Nothing
EndState

State ReturnSnapPlayerIntoPod
;Snaps the player into the seated/occupied animation state, plays VFX and exits the lounger.

	Event OnLoad()
		GoToState("UnoccupiedWaiting") ;Return to default state
		debug.trace("VR WORKSHOP: VR Pod is loaded, snapping player into closed position.")
		Game.GetPlayer().SnapIntoInteraction(Self) ;Snap the player into the VR pod so they are seated, and it's closed
		InputEnableLayer VRWorkshopInputLayer = InputEnableLayer.Create()
		VRWorkshopInputLayer.DisablePlayerControls() ;temporarily disable player controls for animation
		Utility.Wait(AnimationWaitDuration) ;wait a second to give it some breathing room
		VRWorkshop_MemoryLoungerExitImod.Apply() ;fade screen from white to normal
		VRWorkshop_ArriveSoundFX.Play(Game.GetPlayer()) ;play the sound effect
		Utility.Wait(AnimationDuration) ;wait for whiteout imagespace animation to finish
		Self.Activate(Game.GetPlayer(), true) ;Force the player to exit the VR pod
	EndEvent

EndState

;=========
;FUNCTIONS
;=========

Bool Function CanPlayerEnterPod()

	bool canEnterPod = True

	If(Game.GetPlayer().IsInPowerArmor())
		debug.trace("VR WORKSHOPS: Player is in power armor, do nothing and show message")
		PowerArmorNoActivate.Show()
		canEnterPod = False
	ElseIf(Game.GetPlayer().IsInCombat())
		debug.trace("VR WORKSHOPS: Player is in combat, do nothing and show message")
		CombatNoActivate.Show()
		canEnterPod = False
	ElseIf(RequiresPower && iHasPower <= 0)
		debug.trace("VR WORKSHOPS: " + self + " requires power, but it is not present, show message")
		VRWorkshopShared_Message_RequiresPower.Show()
		canEnterPod = False
	ElseIf(DestinationMarkerRef == NONE)
		debug.trace("VR WORKSHOPS: " + self + " has no destination set!", 1)
		VRWorkshopShared_Message_NoDestination.Show()
		canEnterPod = False
	EndIf

	return canEnterPod

EndFunction

;"Setters" for use by external scripts to change states, as changing states directly via external means is generally not preferred
Function SetStateUnoccupied()
	GoToState("UnoccupiedWaiting")
EndFunction

Function SetStateOccupied()
	GoToState("OccupiedAwaitingPlayerChoice")
EndFunction

Function SetStateReturn()
	;Called externally to prep the pod to be in the correct state to perform exit animation, VFX, SFX
	GoToState("ReturnSnapPlayerIntoPod")
EndFunction

Function SetDestination(ObjectReference travelTarget)
	If(travelTarget)
		debug.trace("VR WORKSHOPS: Setting target on " + self + " to " + travelTarget)
		DestinationMarkerRef = travelTarget
	Else
		debug.trace("VR WORKSHOP: Attempted to set the travel destination to an invald/none value")
	EndIf
EndFunction

Function SetDestinationMessage(Message destinationMessage)
	VRWorkshop01_Menu_EnterVR_MessageBox = destinationMessage
EndFunction

ObjectReference Function GetDestination()
	return DestinationMarkerRef
EndFunction


Function VRLoungerTravelWithConfirmation(Message menuMessage)
{Handles fast traveling from VR Pod in settelements to VR Workshops}

	debug.trace("VR WORKSHOP: Lounger travel function called, displaying options to player")

	Utility.Wait(MenuDelaySeconds) ;brief pause to let animation finish

	Int iButton = menuMessage.Show()

	If iButton == 0 ;No, exit pod
		GoToState("UnoccupiedWaiting")
		Self.Activate(Game.GetPlayer(), true) ;Force the player exit the lounger
	ElseIf iButton == 1 ;Yes, travel to destination

		;Make sure our destination reference is still available
		If(DestinationMarkerRef)
			HandlePlayerTravel()
			HandleCompanionTravel()
		Else
			;This should never be reached but this is here as a failsafe to avoid script errors.
			debug.trace("VR WORKSHOP: " + self + " ERROR no destination available for VR Pod. Nowhere to go.")
			GoToState("UnoccupiedWaiting") ;return to default state
			Self.Activate(Game.GetPlayer()) ;Force the player exit the lounger
			VRWorkshopShared_Message_NoDestination.Show() ;show the 'no destination' message so the player can reset it with a terminal
		EndIf
	EndIf

EndFunction

Function HandlePlayerTravel()
{Move player to destination with VFX/SFX, apply or remove perks}

	debug.trace("VR WORKSHOPS: Sending player to destination " + DestinationMarkerRef)

	;Update the RefAlias in the VR Parent Quest so we know where to return the player to
	CurrentReturnPodREF.ForceRefTo(self)

	;Store the return location center marker for companion dismissal while inside of VR
	ObjectReference CompanionReturnMarker = WorkshopCenterMarker.GetReference()
	debug.trace("VR WORKSHOPS: " + self + " updating return marker to " + CompanionReturnMarker)
	CompanionReturnMarkerREF.ForceRefTo(CompanionReturnMarker)

	Game.GetPlayer().AddPerk(crNoFallDamage)
	Game.GetPlayer().AddPerk(VRWorkshopShared_ImmuneToDamagePerk)
	Game.GetPlayer().AddPerk(ImmuneToAcid)
	Game.GetPlayer().AddPerk(ImmuneToPoison)
	Game.GetPlayer().AddPerk(ImmuneToRadiation)
	Game.GetPlayer().AddPerk(VRWorkshopShared_BlockXP)

	VRWorkshop_MemoryLoungerEnterImod.Apply() ;fade screen white
	VRWorkshop_TravelSoundFX.Play(Game.GetPlayer()) ;Play sound effects
	Utility.Wait(AnimationDuration) ;wait for whiteout animation to finish
	Self.PlayAnimation("Reset") ;Reset the animation state so when we return it isn't closed without the player inside
	Game.GetPlayer().MoveTo(DestinationMarkerRef) ;move player to destination

	;enable the destination map marker (Pip-Boy map worldspace bug workaround)
	DestinationMarkerRef.GetLinkedRef(VRWorkshopShared_Keyword_LinkedRefMapMarker).Enable()

	;fill the refalias with the marker we're traveling to to "bookmark" it
	CurrentTravelMarkerREF.ForceRefTo(DestinationMarkerRef)

	;queue up VFX/SFX for arrival
	VRWorkshop_MemoryLoungerExitImod.Apply() ;fade screen from white to normal
	VRWorkshop_ArriveSoundFX.Play(Game.GetPlayer()) ;play the sound effect
	
EndFunction

Function HandleCompanionTravel()
{Move all active companion(s) to destination, apply or remove perks}

	Actor[] Followers = Game.GetPlayerFollowers()

	If (Followers.Length > 0)

		debug.trace("VR WORKSHOP: Begin moving " + Followers.Length +  " companion(s)")

		Int i = 0
		While(i < Followers.Length)
			Actor CompanionActor = Followers[i]
			If(CompanionActor)
				debug.trace("VR WORKSHOP: Moving actor " + CompanionActor + " with player into VR.")
				CompanionActor.MoveTo(Game.GetPlayer())

				;Give companions fall immunity while in VR
				If(!CompanionActor.HasPerk(crNoFallDamage))
					CompanionActor.AddPerk(crNoFallDamage)
					CompanionActor.AddPerk(VRWorkshopShared_ImmuneToDamagePerk)
				EndIf
			EndIf
			i += 1
		Endwhile

	EndIf

EndFunction