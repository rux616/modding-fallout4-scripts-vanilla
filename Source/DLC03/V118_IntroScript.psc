Scriptname DLC03:V118_IntroScript extends Quest Conditional

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;		Collect Money Objective
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MiscObject Property PrewarMoney Auto Const Mandatory
ReferenceAlias Property PlayerAlias Auto Const Mandatory
GlobalVariable Property DLC03_V118_DepositCurrent Auto Const Mandatory
GlobalVariable Property DLC03_V118_DepositAmount Auto Const Mandatory

int Property MoneyObjectiveStage = 30 Auto Const
int Property myObjective = 0 Auto Const

Function StartTrackingMoneyObjective()
	DLC03_V118_DepositCurrent.SetValue(Game.GetPlayer().GetItemCount(PrewarMoney))
	SetObjectiveDisplayed(0, abDisplayed = true)
	(PlayerAlias as DLC03:DLC03_V118_PlayerAliasScript).StartTrackingMoney()
EndFunction

Function StopTrackingMoneyObjective()
	(PlayerAlias as DLC03:DLC03_V118_PlayerAliasScript).StopTrackingMoney()
EndFunction

Function CheckMoney()
	Debug.Trace(Self + "************** CheckMoney **************")
	int CurrentMoney = Game.GetPlayer().GetItemCount(PrewarMoney)
	;DLC03_V118_DepositCurrent
	int currentGlobalVal = (DLC03_V118_DepositCurrent.Getvalue() as int)
	Debug.Trace(Self + "currentGlobalVal = " + currentGlobalVal)
	int ModNum = CurrentMoney - currentGlobalVal
	Debug.Trace(Self + "ModNum = " + ModNum)
	;ExteriorDefenderTotal.value
	bool reDisplayGlobal = false
	; If the amount of money the player has has gone down
	if ModNum < 0
			;if we have gone over a 10 change EG: 10, 20, 30, etc
		if (currentGlobalVal/10) > ((currentGlobalVal + ModNum)/10)
			reDisplayGlobal = true
		endif
	else	;if the amount of money the player has has gone up
		;if we have gone over a 10 change EG: 10, 20, 30, etc
		if (currentGlobalVal/10) < ((currentGlobalVal + ModNum)/10)
			reDisplayGlobal = true
		endif
	endif
	Debug.Trace(Self + "reDisplayGlobal = " + reDisplayGlobal)
	if ModObjectiveGlobal(ModNum, DLC03_V118_DepositCurrent, myObjective, DLC03_V118_DepositAmount.value, abRedisplayObjective = reDisplayGlobal)
	 	SetStage(MoneyObjectiveStage)
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;		Vault Door Stuff
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Script for opening the Vault door

ReferenceAlias Property VaultDoorControl Auto Mandatory Const
ReferenceAlias Property VaultDoor Auto Mandatory Const
RefCollectionAlias Property	VaultDoorKlaxonLights Auto Mandatory Const
;ReferenceAlias Property	GearStrobeLight Auto ;Mandatory Const
ReferenceAlias Property KlaxonSoundMarker Auto Const ;Mandatory 
Sound Property OBJKlaxon2DLP Auto Mandatory Const
Int KlaxonSoundID

Bool Property ControlPanelDONE = False Auto hidden
Bool Property GearDoorDONE = False Auto hidden


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	;wait for the gear door to finish animating, then stop Klaxon
	If (akSource == VaultDoor.GetRef()) && (asEventName == "KlaxonStop") && (GearDoorDONE == False)
		StopKlaxonSound()
		UnregisterForAnimationEvent(VaultDoor.GetRef(), "KlaxonStop")
		;never run this again
		GearDoorDONE = True
		
	EndIf
EndEvent

Function StartKlaxonSound()
	if KlaxonSoundMarker
		KlaxonSoundID = OBJKlaxon2DLP.Play(KlaxonSoundMarker.GetRef())
	endif
EndFunction

Function StopKlaxonSound()
	Sound.StopInstance(KlaxonSoundID)
EndFunction

Function OpenGearDoor()
	VaultDoor.GetRef().PlayAnimation("Stage2")
	;enable the Klaxon lights. Animations play in the RefAlias scripts for each KlaxonLight
	LocalEnableAll(VaultDoorKlaxonLights)
	;LocalActivate(GearKlaxonLights)
	;UnregisterForAnimationEvent(ControlPanel.GetRef(), "Stage4")
	;wait for the gear door to finish animating, then stop Klaxon
	RegisterForAnimationEvent(VaultDoor.GetRef(), "KlaxonStop")
	;never run this again
	;ControlPanelDONE = True
	;SetStage(8)
	utility.wait(10)
	LocalEnableAll(VaultDoorKlaxonLights, false)
EndFunction

; Enable everyone in the collection
function LocalEnableAll(refCollectionAlias myCollectionAlias, bool bEnabled = true)
	int index = 0
	ObjectReference currentRef
	int count = myCollectionAlias.GetCount()
	while index < count
		currentRef = myCollectionAlias.GetAt(index)
		if currentRef
			if bEnabled
				currentRef.Enable(bEnabled)
				currentRef.Activate(currentRef)
			else
				currentRef.Activate(currentRef)
				currentRef.Disable()
			endif
		endif
		index += 1		
	endWhile
endFunction



