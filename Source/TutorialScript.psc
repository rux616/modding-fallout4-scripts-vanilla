Scriptname TutorialScript extends Quest

group TutorialMessages
Message Property TutorialIronSights Auto Const
Message Property TutorialIronSightsNoGun Auto Const
Message Property TutorialStealth01 Auto Const
Message Property TutorialStealth02 Auto Const
Message Property TutorialStealth02_MK Auto Const
Message Property TutorialStimpaks01 Auto Const
Message Property TutorialHotkeysMessage_GunBaton Auto Const
Message Property TutorialHotkeysMessage_GunBaton_MK Auto Const
Message Property TutorialHotkeysMessage_GunStimBaton Auto Const
Message Property TutorialHotkeysMessage_GunStimBaton_MK Auto Const
Message Property TutorialHotkeysMessage_GunStims Auto Const
Message Property TutorialHotkeysMessage_GunStims_MK Auto Const
Message Property TutorialHotkeysMessage_StimsBaton Auto Const
Message Property TutorialHotkeysMessage_StimsBaton_MK Auto Const
Message Property TutorialHotkeysMessage Auto Const
Message Property TutorialHotkeysMessage_MK Auto Const
Message Property TutorialFaceGen01 Auto Const
Message Property TutorialFaceGen01_MK Auto Const
Message Property TutorialFaceGen02 Auto Const
Message Property TutorialFaceGen03 Auto Const
Message Property TutorialFaceGen03_MK Auto Const
Message Property TutorialPowerArmorNoDamageMessage03 Auto Const
Message Property TutorialPowerArmorWorkbenchExitArmor Auto Const
Message Property TutorialPowerArmorWorkbenchFindArmor Auto Const
Message Property TutorialPipboyNavigation Auto Const
Message Property TutorialPipboyNavigation_MK Auto Const
Message Property TutorialPipboyNavigation01 Auto Const
Message Property TutorialPipboyNavigation_MK01 Auto Const
Message Property TutorialCompanionsIntro03 Auto Const
Message Property TutorialVATS01 Auto Const
Message Property TutorialVATS01_MK Auto Const
Message Property TutorialVATS02 Auto Const
Message Property TutorialVATS02_MK Auto Const
Message Property TutorialGrenades01 Auto Const
Message Property TutorialVanityCam Auto Const
Message Property TutorialVanityCam_MK Auto Const
Message Property TutorialPipboyRadio Auto Const
Message Property TutorialWorkbenchSharing Auto Const
endGroup

struct MenuTutorialOpenCloseEvent
	String MenuName
	int StageToSetOnOpen = -1
	int StageToSetOnClose = -1
endStruct

MenuTutorialOpenCloseEvent[] Property MenuOpenCloseEvents Auto Const

group MenuNames
	String Property LockpickingMenu = "LockpickingMenu" Auto Const
	String Property CookingMenu = "CookingMenu" Auto Const
	String Property LevelUpMenu = "LevelUpMenu" Auto Const
	String Property PipboyMenu = "PipboyMenu" Auto Const
	String Property VATSMenu = "VATSMenu" Auto Const
endGroup

group MiscProperties
Quest Property Tutorial Auto Const
Quest Property MQ102 Auto Const
Perk Property TutorialDrinkWater Auto Const
Ammo Property Ammo10mm Auto Const
Ammo Property AmmoFusionCore Auto Const
Weapon Property Gun10mm Auto Const
Weapon Property Baton Auto Const
Potion Property Stimpak Auto Const
Spell Property abDeathMessage Auto Const
Keyword Property LocTypeWorkshopSettlement Auto Const
Location Property ConcordLocation Auto Const
ActorValue Property CoreHealth Auto Const
ActorValue Property PAHealthHelmet Auto Const
ActorValue Property PAHealthTorso Auto Const
ActorValue Property PAHealthRArm Auto Const
ActorValue Property PAHealthLArm Auto Const
ActorValue Property PAHealthRLeg Auto Const
ActorValue Property PAHealthLLeg Auto Const
GlobalVariable Property MessageBoxTutorialBlocked Auto Const
bool Property bPABenchFindMessageActive Auto Conditional
bool Property bPABenchExitMessageActive Auto Conditional
bool Property bPanelDamageMessageAvailable Auto Conditional
bool Property bPanelDamageTutorialDone Auto Conditional
bool Property bPanelLowCoreTutorialDone Auto Conditional
bool Property bNoCoreRepeat Auto Conditional
String Property ContextStringWorkbench Auto Conditional
float Property fBatteryTimer = 2.0 Auto Const
float Property fSprintTimer = 24.0 Auto Const
float Property fRomanceTimer = 3.0 Auto Const
float Property fRepeatCoreWarningTimer = 600.0 Auto Const
float Property fBatteryHealthPercent = 0.25 Auto Const
EndGroup

Actor PlayerRef
String MessageDoneDisplaying
Float PanelHealthLevel = 25.0
Bool bTriggerPostVaultOnce

Event OnInit()
	int i = 0

	;Register menu events
	while i < MenuOpenCloseEvents.Length
		RegisterForMenuOpenCloseEvent(MenuOpenCloseEvents[i].MenuName)
		i += 1
	endWhile

	PlayerRef = Game.GetPlayer()

	MessageDoneDisplaying = "MessageDoneDisplaying"

	;Give player drinking water perk
	;Kicks off Tutorial stage 500
	PlayerRef.AddPerk(TutorialDrinkWater)

	RegisterForHitEvent(PlayerRef)
	RegisterForTutorialEvent("LooksMenuFaceModeEntered")
	RegisterForTutorialEvent("IronsightsExited")
	RegisterForTutorialEvent("MessageDoneDisplaying")
	RegisterForRemoteEvent(PlayerRef, "OnSpeechChallengeAvailable")
	
	;debug.trace("Tutorial init")
EndEvent

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening) 
; Used
	;debug.trace("Tutorial OnMenuOpenCloseEvent")
	; check open/close menu events array
	int i = 0
	while i < MenuOpenCloseEvents.Length
		MenuTutorialOpenCloseEvent theEvent = MenuOpenCloseEvents[i]
		if asMenuName == theEvent.MenuName
			if abOpening && theEvent.StageToSetOnOpen > -1
				SetStage(theEvent.StageToSetOnOpen)
			elseif !abOpening && theEvent.StageToSetOnClose > -1
				SetStage(theEvent.StageToSetOnClose)
			endif
		endif
		i += 1
	endWhile

EndEvent

Event OnTimer(int aiTimerID) 

	if aiTimerID == 3 && !GetStageDone(690)
		;Romance tutorial timer complete. Kick off tutorial
		SetStage(685)


	;Used for Power Armor Fusion Core Health Low Tutorial
	elseif aiTimerID == 155 && PlayerRef.IsInPowerArmor() && !Tutorial.GetStageDone(1550)

		Float CurrentPowerMax = 0.0

		;If core isn't empty, figure out the health percentage
		if PlayerRef.GetValue(CoreHealth) != -1.0
			CurrentPowerMax = PlayerRef.GetValuePercentage(CoreHealth)
		endif
		;debug.trace("Current power max is: "+ CurrentPowerMax + ". Battery health threshold is: "+ fBatteryHealthPercent)

		if CurrentPowerMax < fBatteryHealthPercent
			;debug.trace("Power currently low enough to fire message")

			;If the player's totally out of juice and has another core, just start the timer again
			if CurrentPowerMax <= 0
				if PlayerRef.GetItemCount(AmmoFusionCore) > 0
					StartTimer(fBatteryTimer, 155)
					return
				endif
			endif
		
			;Otherwise, eval to see which stage we should set
			if PlayerRef.GetCombatState() == 1 
				debug.trace(self + "Low core: Allow low core")
		 		Tutorial.Setstage(1540)
		 	else
		 		debug.trace(self + "Low core: Fire low core from tutorial event timer")
		 		bPanelLowCoreTutorialDone = true
				Tutorial.Setstage(1545)
			endIf
  		endif

  		;Restart timer tutorial hasn't been completed
  		if !bPanelLowCoreTutorialDone
			StartTimer(fBatteryTimer, 155)
		endif



	elseif aiTimerID == 1 && !Tutorial.GetStageDone(1550)
		;Set if first suit player enters doesn't have a core. Wait set amount of time before allowing
		bNoCoreRepeat = false
		if PlayerRef.IsInPowerArmor()
			StartTimer(fBatteryTimer, 155)
		endif
	endif

EndEvent

Event OnTimerGameTime(int aiTimerID)
	;If the player's been out of the Vault for a game day and hasn't hit the sprint tutorial, kill it
	if aiTimerID == 2 && !self.GetStageDone(370)
		Tutorial.SetStage(370)
	endif
EndEvent

Event OnRadiationDamage(ObjectReference akTarget, bool abIngested)
  if akTarget == PlayerRef && !Tutorial.GetStageDone(1810)
  	Tutorial.SetStage(1805)
  endif
EndEvent

Event OnHit(objectReference akTarget, objectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
    if akTarget == PlayerRef
    	;debug.trace(self + "Tutorial player hit event")

    	;If player if being damaged and out of 10mm ammo before leaving vault or seeing weapon bash tutorial, show it
    	if PlayerRef.GetEquippedWeapon() == Gun10mm && !MQ102.GetStageDone(10) && PlayerRef.GetItemCount(Ammo10mm) == 0 &&  !Tutorial.GetStageDone(960)
    		Tutorial.SetStage(955)


    	;Check for damaged power armor panels. If panels are damaged, fire tutorial
    	elseif PlayerRef.IsInPowerArmor() && !Tutorial.GetStageDone(1590)

 			Location CurrentLocation = PlayerRef.GetCurrentLocation()

  			;If the player's not in Concord, or is in Concord and the right section of the main quest is done...
  			if CurrentLocation != ConcordLocation || (CurrentLocation == ConcordLocation && MQ102.GetStageDone(122) && MQ102.GetStageDone(123))

		  		if PlayerRef.GetCombatState() != 1
		  			debug.trace(self + "Panel damage: not in combat")
		  			float PAHealthHelmetCurrent = PlayerRef.GetValue(PAHealthHelmet)
	  				float PAHealthRArmCurrent = PlayerRef.GetValue(PAHealthRArm)
	  				float PAHealthLArmCurrent = PlayerRef.GetValue(PAHealthLArm)
	  				float PAHealthLLegCurrent = PlayerRef.GetValue(PAHealthLLeg)
	  				float PAHealthRLegCurrent = PlayerRef.GetValue(PAHealthRLeg)
	  				float PAHealthTorsoCurrent = PlayerRef.GetValue(PAHealthTorso)

	  				;If power armor actor value is below threshold but above zero
	  				; (to avoid false positives from player removing armor), fire tutorial
		 	 		if (PAHealthHelmetCurrent < PanelHealthLevel && PAHealthHelmetCurrent > 0) || (PAHealthRArmCurrent < PanelHealthLevel && PAHealthRArmCurrent > 0) || (PAHealthLArmCurrent < PanelHealthLevel && PAHealthLArmCurrent > 0) || (PAHealthRLegCurrent < PanelHealthLevel && PAHealthRLegCurrent > 0) || (PAHealthLLegCurrent < PanelHealthLevel && PAHealthLLegCurrent > 0) || (PAHealthTorsoCurrent < PanelHealthLevel && PAHealthTorsoCurrent > 0)
		 	 			debug.trace(self + "Panel damage: Kick off tutorial")
	 					Tutorial.SetStage(1580)
	 					bPanelDamageTutorialDone = true
	 					return
	 				endif
	 			endif
	  		endif
	    endif
    endif

    ;If the panel damage tutorial is done, stop registering
    if !bPanelDamageTutorialDone
    	;debug.trace(self + "Register for hit again")
	    RegisterForHitEvent(PlayerRef)
	endif
EndEvent

Event Actor.OnSpeechChallengeAvailable(Actor akSender, ObjectReference akActionRef)
	;Player has entered dialogue with a speech challenge
	if !Tutorial.GetStageDone(2110)
		UnRegisterForRemoteEvent(PlayerRef, "OnSpeechChallengeAvailable")
		Tutorial.SetStage(2100)
	endif
EndEvent

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;                                           TUTORIAL EVENT											;
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Event OnTutorialEvent(String asEventName, Message aMessage)
;debug.trace("Tutorial event:" + asEventName + ", " + aMessage)

if asEventName == MessageDoneDisplaying

    ;Exit Power Armor at Workbench tutorial message Completed
    if aMessage == TutorialPowerArmorWorkbenchExitArmor
    	bPABenchExitMessageActive = 0
	
    ;Find Power Armor at Workbench tutorial message Completed
    elseif aMessage == TutorialPowerArmorWorkbenchFindArmor
    	bPABenchFindMessageActive = 0

    ;Power Armor Reduced Damage tutorial message Completed, show "Hold A to Exit" tutorial
    elseif aMessage == TutorialPowerArmorNoDamageMessage03
	    if !Tutorial.GetStageDone(1512)
	    	Tutorial.SetStage(1502)
	    endif
	
	;Companion command tutorial complete. Trigger "Exit command mode" stage
    elseif aMessage == TutorialCompanionsIntro03
    	if !Tutorial.GetStageDone(618)
    	    	Tutorial.SetStage(617)
	    endIf

    ;Using grenade message finished displaying. Used by Grenade reminder stage to know it's okay to fire
   	elseif aMessage == TutorialGrenades01
    	Tutorial.SetStage(2915)

    ;FaceGen tutorial messages Completed
    elseif aMessage == TutorialFaceGen02 || aMessage == TutorialFaceGen01_MK
    	if !Tutorial.GetStageDone(2025)
            Tutorial.SetStage(2015)
        endif
    
    ;Hold hotkey message completed, try Using hotkeys tutorial
    elseif aMessage == TutorialHotkeysMessage || aMessage == TutorialHotkeysMessage_MK
    	;Used for baton, stimpak triggering of hotkeys tutorial
    	;debug.trace("Tutorial hotkeys message complete")
    	bHoldHotkeysTutorialComplete = true
        UsingHotkeysTutorial()

	;Iron Sights tutorial message completed
    elseif aMessage == TutorialIronSights || aMessage == TutorialIronSightsNoGun
   	    if !Tutorial.GetStageDone(212)
	    	Tutorial.SetStage(202)
	    endif

	;Stealth message 01 complete, fire stealth 02
	;Triggered in Tutorial stage 900
   	elseif aMessage == TutorialStealth01
	    if !Tutorial.GetStageDone(930)
	   		Tutorial.SetStage(920)
	    endif
    
	;Stealth message 02 complete, fire weapon bash
    elseif aMessage == TutorialStealth02 || aMessage == TutorialStealth02_MK
   	    if !Tutorial.GetStageDone(960)
	    	Tutorial.SetStage(950)
	    endif
    
    ;If player hasn't exited Pip-Boy, play pip-boy navigation tutorials
    elseif aMessage == TutorialPipboyNavigation || aMessage == TutorialPipboyNavigation_MK
   	    if !Tutorial.GetStageDone(255)
    		Tutorial.SetStage(252)
		endif
	 
    elseif aMessage == TutorialPipboyNavigation01 || aMessage == TutorialPipboyNavigation_MK01
   	    if !Tutorial.GetStageDone(255)
    		Tutorial.SetStage(253)
		endif
	endif


    ;Need this all game, so reregister
    RegisterForTutorialEvent("MessageDoneDisplaying")

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;If it's not a Message complete entry, check the list
else
	;debug.trace("Non-Message ending tutorial event.")
    ;Looks menu face section entered
    if asEventName == "LooksMenuFaceModeEntered"
	    if !Tutorial.GetStageDone(2025)
	   		Tutorial.SetStage(2000)
	   	endif

	;Iron Sights exited. If player has trigger iron sight tutorial and hasn't entered vats, trigger unshow tutorial
	elseif asEventName == "IronsightsExited"
		if !Tutorial.GetStageDone(200)
			RegisterForTutorialEvent("IronsightsExited")
			;debug.trace("Tutorial register event: exit ironsights")
		else
			if !Tutorial.GetStageDone(212) && !Tutorial.GetStageDone(3400)
		   		Tutorial.SetStage(202)
		   	endif
    	endif

    ;Hacking menu entered
 	elseif asEventName == "HackingEntered"
 		;debug.trace("Tutorial event: hacking entered")
		Tutorial.SetStage(1200)

    ;Player locked out of terminal. Allow tutorial to fire on next exit 
    elseif asEventName == "TerminalLockout"
    	;debug.trace("Tutorial event: terminal lockout")
    	RegisterForTutorialEvent("HackingExited")
	   	Tutorial.SetStage(1250)

	;Hacking menu exited. Used for "Terminal lock out tutorial"
	elseif asEventName == "HackingExited"
		if !Tutorial.GetStageDone(1260)
			;debug.trace("Tutorial register event: Hacking exited")
			;RegisterForTutorialEvent("HackingExited")
			Tutorial.SetStage(1210)
		endif

    ;Map page entered in Pip Boy. Show fast travel tutorial
   	elseif asEventName == "OnEnterPipBoyMapPage"
   		;debug.trace("Tutorial event: maps page opened")
    	Tutorial.SetStage(1900)

    ;Player entered inventory for the first time. Fire Adding Hotkeys tutorial
	elseif asEventName == "OnEnterPipBoyInvWeaponsPage" || asEventName == "OnEnterPipBoyInvApparelPage" || asEventName == "OnEnterPipBoyInvAidPage"
		;debug.trace("Tutorial event: Weapons page opened")
		UnRegisterForTutorialEvent("OnEnterPipBoyInvWeaponsPage")
		UnRegisterForTutorialEvent("OnEnterPipBoyInvApparelPage")
		UnRegisterForTutorialEvent("OnEnterPipBoyInvAidPage")
        Tutorial.SetStage(4100)

	;Player entered pickpocket mode. Fire tutorial
   	elseif asEventName == "PickpocketingEntered"
   		;debug.trace("Tutorial event: pickpocket")
    	Tutorial.SetStage(3130)

	;Player entered Pipboy favorites menu. Fire tutorial
    elseif asEventName == "OnEnterPipBoyFavorites"
    	;debug.trace("Tutorial event: favorites page opened")
		UnRegisterForTutorialEvent("OnEnterPipBoyInvWeaponsPage")
		UnRegisterForTutorialEvent("OnEnterPipBoyInvApparelPage")
		UnRegisterForTutorialEvent("OnEnterPipBoyInvAidPage")
		Tutorial.SetStage(1070)

	;Player entered 3rd person. Fire tutorial
    elseif asEventName == "ThirdPersonEntered"
    	;debug.trace("Tutorial event: Third person entered")
    	if !bVanityCamTutorialOnce
   			VanityCamTutorial()
		endif

	;Player entered Pip-Boy radio tab. Fire tutorial
    elseif asEventName == "OnEnterPipBoyRadioPage"
    	;debug.trace("Tutorial event: Pip Boy Radio tab entered")
    	if !bPipboyRadioTutorialOnce
   			PipboyRadioTutorial()
		endif
    
	;Player exited a workbench. Check to see if we're in a workshop location. 
	;If so, fire tutorial "Workbench sharing" tutorial
    elseif asEventName == "PowerArmorWorkbenchExited"
    	;debug.trace("Tutorial event: Power Armor bench exited")

    	;Are we in a workshop location?
    	if PlayerRef.GetCurrentLocation().HasKeyword(LocTypeWorkshopSettlement)
	    	if !bWorkbenchSharedTutorialOnce
   				UnregisterForTutorialEvent("PowerArmorWorkbenchExited")
				UnregisterForTutorialEvent("ArmorWorkbenchExited")
				UnregisterForTutorialEvent("WeaponsWorkbenchExited")
				UnRegisterForTutorialEvent("OnExitChemWorkbench")
				UnRegisterForTutorialEvent("OnExitCookingWorkbench")
   				WorkbenchSharingTutorial()
			endif
    	else
    		RegisterForTutorialEvent("PowerArmorWorkbenchExited")
    	endif

    elseif asEventName == "ArmorWorkbenchExited"
    	;debug.trace("Tutorial event: Armor bench exited")

    	;Are we in a workshop location?
    	if PlayerRef.GetCurrentLocation().HasKeyword(LocTypeWorkshopSettlement)
	    	if !bWorkbenchSharedTutorialOnce
   				UnregisterForTutorialEvent("PowerArmorWorkbenchExited")
				UnregisterForTutorialEvent("ArmorWorkbenchExited")
				UnregisterForTutorialEvent("WeaponsWorkbenchExited")
				UnRegisterForTutorialEvent("OnExitChemWorkbench")
				UnRegisterForTutorialEvent("OnExitCookingWorkbench")
   				WorkbenchSharingTutorial()
			endif
    	else
    		RegisterForTutorialEvent("ArmorWorkbenchExited")
    	endif

    elseif asEventName == "WeaponsWorkbenchExited"
    	;debug.trace("Tutorial event: Weapons bench exited")

    	;Are we in a workshop location?
    	if PlayerRef.GetCurrentLocation().HasKeyword(LocTypeWorkshopSettlement)
	    	if !bWorkbenchSharedTutorialOnce
   				UnregisterForTutorialEvent("PowerArmorWorkbenchExited")
				UnregisterForTutorialEvent("ArmorWorkbenchExited")
				UnregisterForTutorialEvent("WeaponsWorkbenchExited")
				UnRegisterForTutorialEvent("OnExitChemWorkbench")
				UnRegisterForTutorialEvent("OnExitCookingWorkbench")
   				WorkbenchSharingTutorial()
			endif
    	else
    		RegisterForTutorialEvent("WeaponsWorkbenchExited")
    	endif

    elseif asEventName == "OnExitChemWorkbench"
    	;debug.trace("Tutorial event: Chem bench exited")

    	;Are we in a workshop location?
    	if PlayerRef.GetCurrentLocation().HasKeyword(LocTypeWorkshopSettlement)
	    	if !bWorkbenchSharedTutorialOnce
   				UnregisterForTutorialEvent("PowerArmorWorkbenchExited")
				UnregisterForTutorialEvent("ArmorWorkbenchExited")
				UnregisterForTutorialEvent("WeaponsWorkbenchExited")
				UnRegisterForTutorialEvent("OnExitChemWorkbench")
				UnRegisterForTutorialEvent("OnExitCookingWorkbench")
   				WorkbenchSharingTutorial()
			endif
    	else
    		RegisterForTutorialEvent("OnExitChemWorkbench")
    	endif
    	
    elseif asEventName == "OnExitCookingWorkbench"
    	;debug.trace("Tutorial event: Cooking bench exited")

    	;Are we in a workshop location?
    	if PlayerRef.GetCurrentLocation().HasKeyword(LocTypeWorkshopSettlement)
	    	if !bWorkbenchSharedTutorialOnce
   				UnregisterForTutorialEvent("PowerArmorWorkbenchExited")
				UnregisterForTutorialEvent("ArmorWorkbenchExited")
				UnregisterForTutorialEvent("WeaponsWorkbenchExited")
				UnRegisterForTutorialEvent("OnExitChemWorkbench")
				UnRegisterForTutorialEvent("OnExitCookingWorkbench")
   				WorkbenchSharingTutorial()
			endif
    	else
    		RegisterForTutorialEvent("OnExitCookingWorkbench")
    	endif
    endif
endif

endEvent

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;                                           GEN FUNCTIONS    										;
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Function RegisterPostVaultTutorialEvents()
	;Register for out in the world tutorial events
	if !bTriggerPostVaultOnce
		bTriggerPostVaultOnce = true
		
		;Register tutorial events
		RegisterForTutorialEvent("PickpocketingEntered")
		RegisterForTutorialEvent("HackingEntered")
		RegisterForTutorialEvent("TerminalLockout")
		RegisterForTutorialEvent("OnEnterPipBoyMapPage")
		RegisterForTutorialEvent("OnEnterPipBoyInvWeaponsPage")
		RegisterForTutorialEvent("OnEnterPipBoyInvApparelPage")
		RegisterForTutorialEvent("OnEnterPipBoyInvAidPage")
		RegisterForTutorialEvent("OnEnterPipBoyFavorites")
		RegisterForTutorialEvent("OnEnterPipBoyRadioPage")
		RegisterForTutorialEvent("ThirdPersonEntered")
		RegisterForTutorialEvent("PowerArmorWorkbenchExited")
		RegisterForTutorialEvent("ArmorWorkbenchExited")
		RegisterForTutorialEvent("WeaponsWorkbenchExited")
		RegisterForTutorialEvent("OnExitChemWorkbench")
		RegisterForTutorialEvent("OnExitCookingWorkbench")
		RegisterPlayerRadiationEvents()

		;Player won't be needing tutorial On Hit events again until he enters Power Armor
		UnRegisterTutorialPlayerHitEvent()

		;Add player low health spell
		PlayerRef.AddSpell(abDeathMessage, false)

		;Start count down to turn off Sprint tutorial triggers
		StartSprintTimer()

		;if VATS main tutorial isn't shut down, close it off now
		if !self.GetStageDone(3999)
			self.SetStage(3999)
		endif

		debug.trace("Post-Vault tutorial events registered!")

	endif
EndFunction

Function TScriptRegisterForTutorialEvent(string asEventName)
	RegisterForTutorialEvent(asEventName)
EndFunction

Function UnregisterMenuEvent(string asEventName)
	;debug.trace("Unregister " + asEventName + " menu event.")
	UnregisterForMenuOpenCloseEvent(asEventName)
endFunction

Function RegisterTutorialPlayerHitEvent()
	;debug.trace(self + "Player registered for tutorial OnHit event")
	RegisterForHitEvent(PlayerRef)
endFunction

Function UnRegisterTutorialPlayerHitEvent()
	;debug.trace(self + "Player unregistered for tutorial OnHit event")
	UnregisterForHitEvent(PlayerRef)
endFunction

Function RegisterPlayerRadiationEvents()
	RegisterForRadiationDamageEvent(PlayerRef)
endFunction

Function UnRegisterPlayerRadiationEvents()
	UnRegisterForRadiationDamageEvent(PlayerRef)
endFunction

Function StartPlayerBatteryTimer()
	;Called first time player enters Power armor that has a Fusion Core
	StartTimer(fBatteryTimer, 155)
EndFunction

Function RepeatNoCoreTimer()
	;Called in Tutorial stage 1500 if the first suit of power armor the player enters doesn't have a core
	StartTimer(fRepeatCoreWarningTimer, 1)
	CancelPlayerBatteryTimer()
EndFunction

Function CancelPlayerBatteryTimer()
	;Called once player exits power armor if low core health tutorial hasn't played
	CancelTimer(155)
EndFunction

Function StartSprintTimer()
	;Called when player exits Vault111
	StartTimerGameTime(fSprintTimer, 2)
EndFunction

Function CancelSprintTimer()
	;Called when stage 370 is hit (either from timer running out or player hitting tutorial)
	CancelTimerGameTime(2)
EndFunction

Function StartRomanceTimer()
	;Called when player exits Vault111
	StartTimer(fRomanceTimer, 3)
EndFunction

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;                                           TUTORIAL FUNCTIONS										;
;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

bool bStimTutorialOnce
bool bPistolTutorialOnce
bool bBatonTutorialOnce
bool bHoldHotkeysTutorialOnce
bool bHoldHotkeysTutorialComplete
bool bUsingHotkeysTutorialOnce
bool bVanityCamTutorialOnce
bool bPipboyRadioTutorialOnce

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

;Player has acquired the stimpak in the Overseer's office, show hotkeys message
;Fired from DefaultRefOnContainerChangedTo on stimpak
Function StimpakTutorial() 
if !bStimTutorialOnce && !MQ102.GetStageDone(10)
  bStimTutorialOnce = true

  int BatonCount = PlayerRef.GetItemCount(Baton)
  int GunCount = PlayerRef.GetItemCount(Gun10mm)

  TutorialStimpaks01.ShowAsHelpMessage("Stimpaks01", 9, 0, 1, "")

  ;If the hotkeys tutorial hasn't already fired and the player has the baton or pistol, fire it now
	if !bHoldHotkeysTutorialOnce && (BatonCount >= 1 || GunCount >= 1)
		HoldHotkeysTutorial()
	elseif bHoldHotkeysTutorialComplete && !bUsingHotkeysTutorialOnce && (BatonCount >= 1 || GunCount >= 1)
		UsingHotkeysTutorial()
	endif 
endif
EndFunction

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Function PistolTutorial()
if !bPistolTutorialOnce && !MQ102.GetStageDone(10)
  bPistolTutorialOnce = true

  int BatonCount = PlayerRef.GetItemCount(Baton)
  int StimCount = PlayerRef.GetItemCount(Stimpak)

  ;If the hotkeys tutorial hasn't already fired and the player has the baton or pistol, fire it now
  if !bHoldHotkeysTutorialOnce && (BatonCount >= 1 || StimCount >= 1)
    HoldHotkeysTutorial()
  elseif bHoldHotkeysTutorialComplete && !bUsingHotkeysTutorialOnce && (BatonCount >= 1 || StimCount >= 1)
		UsingHotkeysTutorial()
  endif 
endif
EndFunction

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Function BatonTutorial()
if !bBatonTutorialOnce && !MQ102.GetStageDone(10)
  bBatonTutorialOnce = true

  int GunCount = PlayerRef.GetItemCount(Gun10mm)
  int StimCount = PlayerRef.GetItemCount(Stimpak)

  ;If the hotkeys tutorial hasn't already fired and the player has already picked up the pistol, or stims
  ;fire it now

  if !bHoldHotkeysTutorialOnce && (StimCount >= 1 || GunCount >= 1)
    HoldHotkeysTutorial()
  elseif bHoldHotkeysTutorialComplete && !bUsingHotkeysTutorialOnce && (StimCount >= 1 || GunCount >= 1)
  	UsingHotkeysTutorial()
  endif 
endif
EndFunction

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

;Triggered when player picks up pistol or if player picks up stims and baton.
;Kicks off Using Hotkeys tutorial when messages are complete
Function HoldHotkeysTutorial()
if !bHoldHotkeysTutorialOnce && !MQ102.GetStageDone(10)
  bHoldHotkeysTutorialOnce = true

  ;Change message displayed if player is using the Gamepad
  if Game.UsingGamePad()
    Utility.Wait(1.0)
    TutorialHotkeysMessage.ShowAsHelpMessage("Quickkeys", 6, 0, 1, "")
  else
    Utility.Wait(1.0)
    TutorialHotkeysMessage_MK.ShowAsHelpMessage("Quickkeys", 6, 0, 1, "")
   endif
endif
EndFunction

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

;Baton, Pistol, and Stim tutorial all use this stage 
;Triggered from completion of Hold Hotkeys message or StimpakTutorial() or BatonTutorial() if hold's complete
Function UsingHotkeysTutorial()
if !bUsingHotkeysTutorialOnce && !MQ102.GetStageDone(10)
  	
	;debug.trace("Using hotkeys go")

	int BatonCount = PlayerRef.GetItemCount(Baton)
	int StimCount = PlayerRef.GetItemCount(Stimpak)
	int GunCount = PlayerRef.GetItemCount(Gun10mm)

	if GunCount >= 1
		;debug.trace("Player has gun")

    	;Player has Stimpack, Baton, and pistol in their inventory. Adjust messages accordingly
    	if BatonCount >= 1 && StimCount >= 1
    		bUsingHotkeysTutorialOnce = true

    		if Game.UsingGamePad()
    			;debug.trace("Hitting three button message")
    			TutorialHotkeysMessage_GunStimBaton.ShowAsHelpMessage("HotkeyAll01_GP", 8, 0, 1, "")
    		else
    			;debug.trace("Hitting three button mk message")
    			TutorialHotkeysMessage_GunStimBaton_MK.ShowAsHelpMessage("HotkeyAll01_MK", 8, 0, 1, "")
    		endif

    	;Player has Baton and pistol in their inventory. Adjust messages accordingly        
	    elseif BatonCount >= 1 && StimCount < 1
    		bUsingHotkeysTutorialOnce = true

    		if Game.UsingGamePad()
    			;debug.trace("Hitting Gun baton button message")
    			TutorialHotkeysMessage_GunBaton.ShowAsHelpMessage("HotkeyAll01_GP", 8, 0, 1, "")
	    	else
    			;debug.trace("Hitting Gun baton button mk message")
    			TutorialHotkeysMessage_GunBaton_MK.ShowAsHelpMessage("HotkeyAll01_MK", 8, 0, 1, "")
    		endif

	    ;Player has Stimpaks and pistol in their inventory. Adjust messages accordingly        
    	elseif BatonCount < 1 && StimCount >= 1
			bUsingHotkeysTutorialOnce = true

	    	if Game.UsingGamePad()
	    		;debug.trace("Hitting Gun stim button message")
    			TutorialHotkeysMessage_GunStims.ShowAsHelpMessage("HotkeyAll01_GP", 8, 0, 1, "")
    		else
    			;debug.trace("Hitting Gun stim button mk message")
	    		TutorialHotkeysMessage_GunStims_MK.ShowAsHelpMessage("HotkeyAll01_MK", 8, 0, 1, "")
    		endif
    	endif

	;Player has acquired baton and stims
	elseif BatonCount >= 1 && StimCount >= 1
  		bUsingHotkeysTutorialOnce = true

  		;debug.trace("Player doesn't have gun")

    	if Game.UsingGamePad()
    		;debug.trace("Hitting stim baton button message")
        	TutorialHotkeysMessage_StimsBaton.ShowAsHelpMessage("HotkeyAll01_GP", 8, 0, 1, "")
    	else
        	;debug.trace("Hitting stim baton button mk message")
        	TutorialHotkeysMessage_StimsBaton_MK.ShowAsHelpMessage("HotkeyAll01_MK", 8, 0, 1, "")
    	endif
	endif
endif
EndFunction

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Function VanityCamTutorial()
if !bVanityCamTutorialOnce
	bVanityCamTutorialOnce = true

	Utility.Wait(1.0)
	if Game.UsingGamePad()
		TutorialVanityCam.ShowAsHelpMessage("VanityCam", 8, 0, 1, "NoMenu")
	else
		TutorialVanityCam_MK.ShowAsHelpMessage("VanityCam_MK", 8, 0, 1, "NoMenu")
	endif

endif
endFunction

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Function PipboyRadioTutorial()
if !bPipboyRadioTutorialOnce
	bPipboyRadioTutorialOnce = true

	TutorialPipboyRadio.ShowAsHelpMessage("PipboyRadio", 10, 0, 1, "PipboyMenu")

endif
endFunction


; \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

bool bCompBleedoutTutorialOnce

bool Function CanDoBleedoutTutorial()

	if !bCompBleedoutTutorialOnce
		bCompBleedoutTutorialOnce = true
		return true

	endif
		return false

EndFunction

; \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

bool bCompRomanceTutorialOnce

bool Function CanDoRomanceTutorial()

	if !bCompRomanceTutorialOnce
		bCompRomanceTutorialOnce = true
		return true

	endif
		return false

EndFunction

; \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

bool bWorkbenchSharedTutorialOnce

Function WorkbenchSharingTutorial()
if !bWorkbenchSharedTutorialOnce
	bWorkbenchSharedTutorialOnce = true

	Utility.Wait(1.0)
	TutorialWorkbenchSharing.ShowAsHelpMessage("WorkbenchSharing", 17, 0, 1, "NoMenu")

endif
endFunction