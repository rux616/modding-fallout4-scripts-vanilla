Scriptname vaultExitElevatorSCRIPT extends ObjectReference
{Handle the RESPEC options and then the one-time elevator on the interior-side. Separate trigger for exterior animations.}

IMAGESPACEMODIFIER PROPERTY VaultExitISFX AUTO
OBJECTREFERENCE PROPERTY elevator AUTO
ARMOR PROPERTY FXVault111ExitIdleLookUpInElevatorArmor AUTO
IDLE PROPERTY elevatorLook AUTO

FLOAT PROPERTY blindWait AUTO
FLOAT PROPERTY elevatorWait AUTO
FLOAT PROPERTY animWait AUTO

BOOL DOONCE=TRUE

QUEST PROPERTY MQ102 Auto
Message Property CharGenFinalChangesMenu Auto
int ButtonPressed = 0
Quest Property DialogueVault111 Auto
ObjectReference Property RespecMoveMarker Auto
Idle Property ElevatorFaceCamera Auto
Idle Property ElevatorBodyCamera Auto
Int MovedPlayer = 0

InputEnableLayer Property RespecEnableLayer Auto Hidden

ObjectReference Property RespecLightingEnableMarker Auto
OBJECTREFERENCE Property V111EnableRaiseElevatorTriggerEnableMarker Auto

Keyword Property AnimFaceArchetypePlayer Auto Const
{Store Player Face Archetype. We need to switch player to Neutral while in the menu.}

ObjectReference Property V111ExitLightingEnableMarker Auto Const

EVENT ONTRIGGERENTER(OBJECTREFERENCE obj)

	IF(obj == game.getPlayer() && DOONCE)
		DOONCE = FALSE
		;update QT
		(MQ102 as MQ03QuestScript).ReSpecDone=1
		;WJS - Disable Pipboy Controls
		(MQ102 as MQ03QuestScript).DisablePipboy()
		RegisterForMenuOpenCloseEvent("SPECIALMenu")
		RegisterForMenuOpenCloseEvent("LooksMenu")
		RegisterForLooksMenuEvent()
		;disable controls
		RespecEnableLayer = InputEnableLayer.Create()
		RespecEnableLayer.DisablePlayerControls(abCamSwitch = True)
		;disable exit vault lighting
		V111ExitLightingEnableMarker.Disable()
		; pop character menu
		DialogueVault111.SetStage(98)
		Utility.Wait(1.0)
		ShowCharacterMenus()
	ENDIF

ENDEVENT

Function ShowCharacterMenus()
	Actor PlayerREF = Game.GetPlayer()
	ButtonPressed = CharGenFinalChangesMenu.Show()
	If ButtonPressed == 0		
		Game.ShowSPECIALMenu()
	ElseIf ButtonPressed == 1
		Game.FadeOutGame(True, True, 0.0, 1.0, True)
		;make sure player has CharGen Skeleton for editing
		PlayerREF.SetHasCharGenSkeleton()
		;make sure player face is neutral
		PlayerREF.ChangeAnimFaceArchetype(None)
		;enable lighting
		RespecLightingEnableMarker.Enable()
		Utility.Wait(2.0)
		If MovedPlayer == 0
			MovedPlayer == 1
			PlayerREF.Moveto(RespecMoveMarker)
		EndIf
		Game.ForceThirdPerson()
		Utility.Wait(1.0)
		PlayerREF.PlayIdle(ElevatorFaceCamera)
		Utility.Wait(3.0)
		Game.FadeOutGame(False, True, 0.0, 1.0)
		Game.ShowRaceMenu(uimode = 1)
	ElseIf ButtonPressed == 2
		UnRegisterForMenuOpenCloseEvent("SPECIALMenu")
		UnRegisterForMenuOpenCloseEvent("LooksMenu")
		MenusDone()
	ENDIF
EndFunction

Function MenusDone()
	Actor PlayerREF = Game.GetPlayer()
	RespecLightingEnableMarker.Disable()
	;Game.RequestSave()
	Game.ForceFirstPerson()
	; Vault tec message
	DialogueVault111.SetStage(100)
	; start the elevator
	elevator.PlayAnimation("stage3")
	;utility.wait(blindWait)

	; play the blind FX
	;VaultExitISFX.apply(1)
	;emergency lights in the vault turn off
	(MQ102 as MQ03QuestScript).ResetVaultLights()
	;turn on a trigger that's used to allow the player to use the elevator again
	V111EnableRaiseElevatorTriggerEnableMarker.Enable()
	;clear out cached facegen data
	PlayerREF.SetHasCharGenSkeleton(False)
	;set player face back
	PlayerREF.ChangeAnimFaceArchetype(AnimFaceArchetypePlayer)
	;Game.PrecacheCharGenClear()
	Utility.wait(5.0)
	Game.FadeOutGame(true, true, 0.5, 1.0, true)
EndFunction

;when menus close, re-pop the main menu
Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
	if (asMenuName == "SpecialMenu") && (abOpening == False)		
		ShowCharacterMenus()
	ElseIf (asMenuName == "LooksMenu") && (abOpening == False)		
		ShowCharacterMenus()
	EndIf
EndEvent

;handle player transitioning between body and face 
Event OnLooksMenuEvent(int aiFlavor)
	;player edits body
	If aiFlavor == 10
		Game.GetPlayer().PlayIdle(ElevatorBodyCamera)
	;player edits face
	ElseIf aiFlavor == 11
		Game.GetPlayer().PlayIdle(ElevatorFaceCamera)
	EndIf
EndEvent

Function DeleteMyInputLayer()
	RespecEnableLayer = none
	Self.Disable()
EndFunction