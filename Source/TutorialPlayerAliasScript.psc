Scriptname TutorialPlayerAliasScript extends ReferenceAlias

Potion Property Stimpak Auto Mandatory
FormList Property WeaponGrenadesList Auto Mandatory
FormList Property PowerArmorFramesList Auto Mandatory
FormList Property ShipmentItemList Auto Mandatory
Weapon Property LaserMusket Auto Const Mandatory
Weapon Property GaussRifle Auto Const Mandatory
Weapon Property PipeSyringer Auto Const Mandatory
Weapon Property JunkJet Auto Const Mandatory
Ammo Property AmmoFusionCore Auto Const
Quest Property MQ102 Auto Const Mandatory
Quest Property DialogueCodsworthPostWar Auto Const Mandatory
TutorialScript Property Tutorial Auto Const Mandatory
GlobalVariable Property MessageBoxTutorialBlocked Auto Const Mandatory
Location Property SanctuaryHillsLocation Auto Const Mandatory
Location Property Vault111Location Auto Const Mandatory
Location Property ConcordLocation Auto Const Mandatory
Keyword Property Tutorial_DamageResistanceObject Auto Const Mandatory
Keyword Property ObjectTypeWeapon Auto Const Mandatory
Message Property TutorialDamageTypes Auto Const Mandatory
Message Property TutorialDamageTypes01 Auto Const Mandatory
Message Property TutorialJunkJet01 Auto Const Mandatory
Message Property TutorialJunkJet02 Auto Const Mandatory
ActorValue Property CoreHealth Auto Const Mandatory
ActorValue Property PAHealthHelmet Auto Const Mandatory
ActorValue Property PAHealthTorso Auto Const Mandatory
ActorValue Property PAHealthRArm Auto Const Mandatory
ActorValue Property PAHealthLArm Auto Const Mandatory
ActorValue Property PAHealthRLeg Auto Const Mandatory
ActorValue Property PAHealthLLeg Auto Const Mandatory
ActorValue Property BrainCondition Auto Const Mandatory
ActorValue Property EnduranceCondition Auto Const Mandatory
ActorValue Property LeftAttackCondition Auto Const Mandatory
ActorValue Property RightAttackCondition Auto Const Mandatory
ActorValue Property LeftMobilityCondition Auto Const Mandatory
ActorValue Property RightMobilityCondition Auto Const Mandatory
ActorValue Property Health Auto Const Mandatory

Float PanelHealthLevel = 25.0
Actor PlayerRef
Bool bBlockCrippleTutorial = false
Bool bBlockPACrippleTutorial = false
Bool bTriggerCripplePanelTutorial
Bool bBlockDamageTutorial = false
Bool bDamageTutorialOnce = false
Bool bJunkJetTutorialOnce = false

Event OnInit()
	AddInventoryEventFilter(Stimpak)
	AddInventoryEventFilter(WeaponGrenadesList)
	AddInventoryEventFilter(ShipmentItemList)
	AddInventoryEventFilter(LaserMusket)
	AddInventoryEventFilter(GaussRifle)
	AddInventoryEventFilter(PipeSyringer)
	AddInventoryEventFilter(JunkJet)

	PlayerRef = Game.GetPlayer()
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
;debug.trace(self + "akBaseItem: " + akBaseItem)

	if MQ102.GetStageDone(10) 

		;If player acquires Laser Musket, show tutorial
		if akBaseItem == LaserMusket
			if !Tutorial.GetStageDone(2610)
				RemoveInventoryEventFilter(LaserMusket)
				Tutorial.Setstage(2600)
			endif

		;If player acquires Gauss Rifle, show tutorial
		elseif akBaseItem == GaussRifle
			if !Tutorial.GetStageDone(2710)
				RemoveInventoryEventFilter(GaussRifle)
				Tutorial.Setstage(2700)
			endif

		;If player acquires Syringer, show tutorial
		elseif akBaseItem == PipeSyringer
			if !Tutorial.GetStageDone(2820)
				RemoveInventoryEventFilter(PipeSyringer)
				Tutorial.Setstage(2800)
			endif

		;If player acquires Junk Jet, show tutorial
		elseif akBaseItem == JunkJet
			if !bJunkJetTutorialOnce
				RemoveInventoryEventFilter(JunkJet)
				JunkJetTutorial()
			endif

		;Player has acquired a shipment item. Fire tutorial
		elseif ShipmentItemList.HasForm(akBaseItem)
			If !Tutorial.GetStageDone(4010)
				RemoveInventoryEventFilter(ShipmentItemList)
				Tutorial.Setstage(4000)
			EndIf


		;Player has picked up a grenade or mine. Fire tutorial
		elseif WeaponGrenadesList.HasForm(akBaseItem)
			If !Tutorial.GetStageDone(2910)
				RemoveInventoryEventFilter(WeaponGrenadesList)
				Tutorial.Setstage(2900)
			EndIf
		endif


	endif

EndEvent

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
	;debug.trace("Player has equipped " + akBaseObject)

	;First time player equips a weapon or piece of armor outside Sanctuary, Vault 111, or after having spoken to Cods,
	;Throw the damage tutorial
	if !bBlockDamageTutorial && (akBaseObject.HasKeyword(Tutorial_DamageResistanceObject) || akBaseObject.HasKeyword(ObjectTypeWeapon))

		if MQ102.GetStageDone(10) && Utility.IsInMenuMode()
			Location PlayerCurrentLoc = PlayerRef.GetCurrentLocation()

			if (PlayerCurrentLoc != SanctuaryHillsLocation && PlayerCurrentLoc != Vault111Location) || DialogueCodsworthPostWar.GetStageDone(50)
				bBlockDamageTutorial = true
				DamageTutorial()
			endIf

		endif

	;If grenade equipped tutorial hasn't fired before, the other grenades message is done, 
	;and the player equipped a grenade or mine, throw tutorial
	elseif !Tutorial.GetStageDone(2930) && Tutorial.GetStageDone(2915) && WeaponGrenadesList.HasForm(akBaseObject)
		Tutorial.SetStage(2920)

	;If the player just equipped a power armor frame...
	elseif PowerArmorFramesList.HasForm(akBaseObject) 
		;debug.trace("Item " + akBaseObject + " is in list")

		;If the panel damage tutorial isn't done, register for hit events in Tutorial script
		if !Tutorial.bPanelDamageTutorialDone
			Tutorial.RegisterTutorialPlayerHitEvent()
		endif

		;If that frame has a Fusion Core in it and the low core tutorial hasn't run,
		;and we're not waiting on the core message repeat delay timer (set in tutorial event),
		;turn on core health timer
		if !Tutorial.GetStageDone(1550) && Tutorial.bNoCoreRepeat == false
			if PlayerRef.GetValue(CoreHealth) > 0
				;debug.trace("Battery timer set")
				if !Tutorial.bPanelLowCoreTutorialDone
					Tutorial.StartPlayerBatteryTimer()
				endif

			;If the player has gotten in a suit of power armor with no core and has 
			;already seen the initial tutorial, throw the low core tutorial 
			elseif PlayerRef.GetValue(CoreHealth) <= 0 && Tutorial.GetStageDone(1502)
				if PlayerRef.GetCombatState() == 1 
					debug.trace(self + "Low core: Allow from Alias event On item equipped")
		 			Tutorial.Setstage(1540)
		 		else
		 			debug.trace(self + "Low core: Trigger from Alias event On item equipped")
		 			Tutorial.bPanelLowCoreTutorialDone = true
					Tutorial.Setstage(1545)
				endIf
			endif
		endif

		;If the player hasn't enter power armor before, fire tutorial
		if (!Tutorial.GetStageDone(1510))
			Tutorial.SetStage(1500)
		endif
	endif

endEvent

Event OnItemUnequipped(Form akBaseObject, ObjectReference akReference)
	;If the player just unequipped a power armor frame...
	if PowerArmorFramesList.HasForm(akBaseObject) 

		;Player's out of Power Armor. Doesn't need on Hit events anymore
		if !Tutorial.bPanelDamageTutorialDone
			Tutorial.UnregisterTutorialPlayerHitEvent()
		endif

		;Turn off standard "Exiting Power Armor" tutorial message
		if Tutorial.GetStageDone(1502) && !Tutorial.GetStageDone(1512)
			Tutorial.SetStage(1512)
		EndIf

		;If low core tutorial hasn't played, cancel timer watching for player battery health
		if !Tutorial.GetStageDone(1550)
			Tutorial.CancelPlayerBatteryTimer()
		endif

		;Turn off Workbench "Exit Armor" message
		if Tutorial.bPABenchExitMessageActive
			Tutorial.SetStage(1775)
		endif
	endif
endEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
;debug.trace(self + "Panel damage: CombatStateChanged")
if (aeCombatState != 1)
	;debug.trace(self + "Panel damage: Player has left combat")
  	;The player's core has dropped below acceptable levels during combat
  	;Now combat's over, fire the low core tutorial
  	;Tutorial stage 1540 set in OnTimer event in tutorial script
	if Tutorial.GetStageDone(1540) && !Tutorial.GetStageDone(1550) && PlayerRef.IsInPowerArmor()

		Float CurrentPowerMax = 0.0

		;If core isn't empty, figure out the health percentage
		if PlayerRef.GetValue(CoreHealth) != -1.0
			CurrentPowerMax = PlayerRef.GetValuePercentage(CoreHealth)
		endif
		;debug.trace("Current power max is: "+ CurrentPowerMax + ". Battery health threshold is: "+ fBatteryHealthPercent)

		if CurrentPowerMax < Tutorial.fBatteryHealthPercent
			debug.trace(self + "Low core: Trigger from Alias event OnCombatStateChanged")
			Tutorial.bPanelLowCoreTutorialDone = true
			Tutorial.Setstage(1545)
		endif
	endif

  	;Check to see if we should fire Power Armor panel damage tutorial
  	if !Tutorial.GetStageDone(1590)
  		;debug.trace(self + "Panel damage: Stage passed")
  		if PlayerRef.IsInPowerArmor()

  			Location CurrentLocation = PlayerRef.GetCurrentLocation()

  			;If the player's not in Concord, or is in Concord and the right section of the main quest is done...
  			if CurrentLocation != ConcordLocation || (CurrentLocation == ConcordLocation && MQ102.GetStageDone(122) && MQ102.GetStageDone(123))

				float PAHealthHelmetCurrent = PlayerRef.GetValue(PAHealthHelmet)
				float PAHealthRArmCurrent = PlayerRef.GetValue(PAHealthRArm)
				float PAHealthLArmCurrent = PlayerRef.GetValue(PAHealthLArm)
	 			float PAHealthLLegCurrent = PlayerRef.GetValue(PAHealthLLeg)
				float PAHealthRLegCurrent = PlayerRef.GetValue(PAHealthRLeg)
	  			float PAHealthTorsoCurrent = PlayerRef.GetValue(PAHealthTorso)

	  			;If the player has previously had a panel crippled
	  			if bTriggerCripplePanelTutorial
	 				
	 				;Make sure the suit the player's in is still missing armor pieces
					if (PAHealthHelmetCurrent < PanelHealthLevel) || (PAHealthRArmCurrent < PanelHealthLevel) || (PAHealthLArmCurrent < PanelHealthLevel) || (PAHealthRLegCurrent < PanelHealthLevel) || (PAHealthLLegCurrent < PanelHealthLevel) || (PAHealthTorsoCurrent < PanelHealthLevel)
						debug.trace(self + "Panel damage: Kick-off tutorial from post-combat crippled limb")
						Tutorial.SetStage(1580)
	 					Tutorial.bPanelDamageTutorialDone = true
						Tutorial.UnRegisterTutorialPlayerHitEvent()
					else
						;Suit doesn't have any missing armor. Reset cripple tutorial.
						debug.trace(self + "Panel damage: Reset cripple tutorial.")
						bBlockPACrippleTutorial = false
						bTriggerCripplePanelTutorial = false
					endif

	  			else
		  			debug.trace(self + "Panel damage: Player in Power Armor")

					;If power armor actor value is below threshold but above zero
					; (to avoid false positives from player removing armor), fire tutorial
	 	 			if (PAHealthHelmetCurrent < PanelHealthLevel && PAHealthHelmetCurrent > 0) || (PAHealthRArmCurrent < PanelHealthLevel && PAHealthRArmCurrent > 0) || (PAHealthLArmCurrent < PanelHealthLevel && PAHealthLArmCurrent > 0) || (PAHealthRLegCurrent < PanelHealthLevel && PAHealthRLegCurrent > 0) || (PAHealthLLegCurrent < PanelHealthLevel && PAHealthLLegCurrent > 0) || (PAHealthTorsoCurrent < PanelHealthLevel && PAHealthTorsoCurrent > 0)
	 	 				debug.trace(self + "Panel damage: Kick-off tutorial")
	 					Tutorial.SetStage(1580)
		 				Tutorial.bPanelDamageTutorialDone = true
	 					Tutorial.UnRegisterTutorialPlayerHitEvent()
	 				else
	 					;Otherwise, lock down tutorial availability again
	 					;debug.trace(self + "Panel damage: Lock tutorial down again")
		 				;Tutorial.bPanelDamageMessageAvailable = false
		 			endif
		 		endif
		 	endif
	 	endif
 	endif

 	;Radiation damage tutorial
 	if (aeCombatState != 1) && Tutorial.GetStageDone(1805) && !Tutorial.GetStageDone(1810)
 		Tutorial.Setstage(1805)
  	endIf
endif
endEvent

;Crippled limb tutorial management
Event OnCripple(ActorValue akActorValue, bool abCrippled)
	;debug.trace(self + "bBlockCrippleTutorial is " + bBlockCrippleTutorial)
	;debug.trace(self + "MessageBoxTutorialBlocked is " + MessageBoxTutorialBlocked.GetValue())
	;debug.trace("Player 's " + akActorValue + " has been crippled.")

	if abCrippled
		if !bBlockCrippleTutorial && !Tutorial.GetStageDone(2250) && MQ102.GetStageDone(10) && PlayerRef.GetValue(Health) > 0 && MessageBoxTutorialBlocked.GetValue() == 0
			;debug.trace("Player crippled")

			if akActorValue == BrainCondition
				bBlockCrippleTutorial = true
				;debug.trace("Brian crippled")
				Tutorial.Setstage(2200)
			elseif akActorValue == LeftAttackCondition || akActorValue == RightAttackCondition
				bBlockCrippleTutorial = true
				;debug.trace("Arm crippled")
				Tutorial.Setstage(2210)
			elseif akActorValue == LeftMobilityCondition || akActorValue == RightMobilityCondition
				bBlockCrippleTutorial = true
				;debug.trace("Leg crippled")
				Tutorial.Setstage(2220)
			elseif akActorValue == EnduranceCondition
				bBlockCrippleTutorial = true
				;debug.trace("Torso crippled")
				Tutorial.Setstage(2230)
			endif
		endif

		;If player hasn't already seen power armor panel damaged tutorial and isn't dead
		if !bBlockPACrippleTutorial && !Tutorial.GetStageDone(1590) && PlayerRef.GetValue(Health) > 0

  			Location CurrentLocation = PlayerRef.GetCurrentLocation()

  			;If the player's not in Concord, or is in Concord and the right section of the main quest is done...
  			if CurrentLocation != ConcordLocation || (CurrentLocation == ConcordLocation && MQ102.GetStageDone(122) && MQ102.GetStageDone(123))

				if akActorValue == PAHealthHelmet || akActorValue == PAHealthRArm || akActorValue == PAHealthLArm || akActorValue == PAHealthLLeg || akActorValue == PAHealthRLeg || akActorValue == PAHealthTorso
					;debug.MessageBox("Passed crippled bool")
					bBlockPACrippleTutorial = true
					debug.trace(self + "Panel damage: one of player's limbs has been crippled")
					;If this wasn't set in the tutorial "on hit" event, allow the tutorial to fire
			  		;if Tutorial.bPanelDamageMessageAvailable == false
				    ;	Tutorial.bPanelDamageMessageAvailable = true
			    	;endif

			    	if PlayerRef.GetCombatState() != 1
			    		debug.trace(self + "Panel damage: Kick-off tutorial from out-of-combat crippled limb")
						Tutorial.SetStage(1580)
						Tutorial.bPanelDamageTutorialDone = true
						Tutorial.UnRegisterTutorialPlayerHitEvent()
					else 
						debug.trace(self + "Panel damage: Set up tutorial to fire when combat is exited")
						bTriggerCripplePanelTutorial = true
					endif
				endif
			endif
		endif
	endif
EndEvent

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Function DamageTutorial()
	if !bDamageTutorialOnce
		bDamageTutorialOnce = true

		TutorialDamageTypes.ShowAsHelpMessage("DamageTypes", 9, 0, 1, "PipboyMenu", 17)
		TutorialDamageTypes01.ShowAsHelpMessage("DamageTypes01", 9, 0, 1, "PipboyMenu", 17)
	endif
EndFunction

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Function JunkJetTutorial()
	if !bJunkJetTutorialOnce
		bJunkJetTutorialOnce = true

		TutorialJunkJet01.ShowAsHelpMessage("JunkJet01", 8, 0, 1, "NoMenu", 18)
		TutorialJunkJet02.ShowAsHelpMessage("JunkJet02", 12, 0, 1, "NoMenu", 18)
	endif
EndFunction