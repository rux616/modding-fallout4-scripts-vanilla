Scriptname DLC04:DLC04_GZStarCorePanelScript Extends ObjectReference
{Script for the Star Core console panel activator. This panel can 'hold' a Star Core misc item; the player can place or take the Star Core from it.}

Group Reference_Properties
	bool property isInitiallyFilled Auto Const 
	{Should this panel start with a Star Core? Only Mainframe panels are initially empty. Only non-Mainframe panels are initially full.}
EndGroup

Group Autofill_Properties
	DLC04:DLC04GZTrackingQuestScript Property DLC04GZTrackingQuest Auto Const Mandatory
	{Galactic Zone Tracking Quest}

	DLC04:DLC04GZMainQuestScript property DLC04GZMainQuest Auto Const Mandatory

	DLC04:DLC04GZTrackingQuestStarCoreCollection property GalacticZoneOutsideCores Auto Const Mandatory

	Message property DLC04GZ_StarCoreActivateTextInstall Auto Const Mandatory
	{"Install" Activate Text.}

	Message property DLC04GZ_StarCoreActivateTextTake Auto Const Mandatory
	{"Take" Activate Text.}

	Message property DLC04GZ_StarCoreActivateTextBlank Auto Const Mandatory
	{"" Activate Text.}

	Message property DLC04GZ_NoStarCoresMessage Auto Const Mandatory
	{Message to display when the player activates a Star Core panel with no cores in their inventory.}

	Sound Property DLC04OBJStarCoreInstall Auto Const Mandatory
	{Sound to play when a Star Core is inserted.}

	Sound Property DLC04OBJStarCoreUnInstall Auto Const Mandatory
	{Sound to play when a Star Core is removed.}

	Sound Property OBJKeyCardSwipeDeny Auto Const Mandatory
	{Sound to play when the player tries to insert a Star Core, but doesn't have one.}

	Keyword Property LinkCustom01 Auto Const Mandatory
	{Link to an optional ref that should be enabled when the panel is Empty, and disabled when it's Full.}

	Keyword Property LinkCustom02 Auto Const Mandatory
	{Link to an optional ref that should be disabled when the panel is Empty, and enabled when it's Full.}	

	Keyword Property LinkCustom03 Auto Const Mandatory
	{Link to an optional ref that should be activated when the panel is filled.}

	Keyword Property LinkCustom04 Auto Const Mandatory
	{Link to an optional ref that should be activated when the panel is emptied.}
EndGroup

;Local variables.
bool initialized 								;Have we initialized?
Actor player 									;Player
DLC04:DLC04GZTrackingQuestStarCoreCollection myCollection 	;RefCollectionAlias on DLC04GZMainQuest, if any.


;Register this Star Core's colleciton when DLC04GZMainQuest starts up.
Function RegisterCollection(DLC04:DLC04GZTrackingQuestStarCoreCollection c)
	myCollection = c
EndFunction


;Initialize OnLoad instead of OnInit because state changes involve playing an animation.
Event OnLoad()
	if (!initialized)
		if (isInitiallyFilled)
			GoToState("Filled")
		Else
			GoToState("Empty")
		EndIf
		player = Game.GetPlayer()
		initialized = True
	EndIf
EndEvent	


State Empty
	Event OnBeginState(string asOldState)
		;The player isn't supposed to be able to remove panels 'locked' into the Mainframe.
		if (initialized && !isInitiallyFilled)
			Debug.Trace("ERROR: Player removed a Star Core from Mainframe activator " + Self, 2)
			return
		EndIf

		;Play the 'remove' sound effect unless we're just initializing.
		if (initialized)
			DLC04OBJStarCoreUnInstall.Play(Self)
		EndIf

		;Play the visual state change.
		Self.PlayAnimation("Stage1NoTransition")
		
		if (isInitiallyFilled)
			;If this is not part of the Mainframe, lock the panel.
			DLC04GZTrackingQuest.LockStarCorePanel(Self)
			;Update the tracking quest.
			if (myCollection != None)
				myCollection.StarCoreTaken(Self)
			Else
				GalacticZoneOutsideCores.StarCoreTaken(Self)
			EndIf
		Else
			;Otherwise, switch the activate text to "Install"
			Self.SetActivateTextOverride(DLC04GZ_StarCoreActivateTextInstall)
		EndIf

		;Update dependent objects.
		UpdateDependents(False)
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		if (akActionRef == player)
			if (DLC04GZTrackingQuest.PlayerHasCore())
				if (!isInitiallyFilled)
					DLC04GZTrackingQuest.RemoveCoreFromPlayerMainframe()
				Else
					Debug.Trace("ERROR: Player placed a Star Core in a non-Mainframe activator " + Self, 2)
					return
				EndIf
				GoToState("Filled")
			Else
				DLC04GZ_NoStarCoresMessage.Show()
				OBJKeyCardSwipeDeny.Play(Self)
			EndIf
		EndIf	    
	EndEvent
EndState

State Filled
	Event OnBeginState(string asOldState)
		;Play the 'add' sound effect unless we're just initializing.
		if (initialized)
			DLC04OBJStarCoreInstall.Play(Self)
		EndIf

		;Play the visual state change.
		Self.PlayAnimation("Stage2NoTransition")

		if (!isInitiallyFilled)
			;If this is part of the Mainframe, lock the panel and update the quest objectives.
			DLC04GZTrackingQuest.LockStarCorePanel(Self)
			DLC04GZTrackingQuest.MainframeCoreInstalled()
		Else
			;Otherwise, switch the activate text to "Take"
			Self.SetActivateTextOverride(DLC04GZ_StarCoreActivateTextTake)
		EndIf

		;Update dependent objects.
		UpdateDependents(True)
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		if ((akActionRef == player) && (isInitiallyFilled))
			DLC04GZTrackingQuest.AddCoreToPlayer()
			GoToState("Empty")
		EndIf		    
	EndEvent
EndState


;Enable, Disable, and Activate dependent objects (LinkCustom01-04 linkedref chains) when this panel changes state.
Function UpdateDependents(bool isFilled)
	ObjectReference[] refsToEnable
	ObjectReference[] refsToDisable
	ObjectReference[] refsToActivate

	if (isFilled)
		refsToEnable = Self.GetLinkedRefChain(LinkCustom02)
		refsToDisable = Self.GetLinkedRefChain(LinkCustom01)
		refsToActivate = Self.GetLinkedRefChain(LinkCustom03)
	Else
		refsToEnable = Self.GetLinkedRefChain(LinkCustom01)
		refsToDisable = Self.GetLinkedRefChain(LinkCustom02)
		refsToActivate = Self.GetLinkedRefChain(LinkCustom04)
	EndIf

	int i = 0
	While (i < refsToActivate.Length)
		refsToActivate[i].Activate(Self)
		i = i + 1
	EndWhile	

	i = 0
	While (i < refsToEnable.Length)
		refsToEnable[i].Enable(False)
		i = i + 1
	EndWhile

	i = 0
	While (i < refsToDisable.Length)
		refsToDisable[i].DisableNoWait(False)
		i = i + 1
	EndWhile
EndFunction