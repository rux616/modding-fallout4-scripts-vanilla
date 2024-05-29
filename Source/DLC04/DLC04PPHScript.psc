Scriptname DLC04:DLC04PPHScript extends Quest

;Markers
ObjectReference Property DLC04BPPreStateEnableMarker Auto Const Mandatory
ObjectReference Property DLC04BPDisciplesEnableMarker Auto Const Mandatory
ObjectReference Property DLC04BPOperatorsEnableMarker Auto Const Mandatory
ObjectReference Property DLC04BPPackEnableMarker Auto Const Mandatory
ObjectReference Property DLC04GZPreStateEnableMarker Auto Const Mandatory
ObjectReference Property DLC04GZDisciplesEnableMarker Auto Const Mandatory
ObjectReference Property DLC04GZOperatorsEnableMarker Auto Const Mandatory
ObjectReference Property DLC04GZPackEnableMarker Auto Const Mandatory
ObjectReference Property DLC04DRGPreStateEnableMarker Auto Const Mandatory
ObjectReference Property DLC04DRGDisciplesEnableMarker Auto Const Mandatory
ObjectReference Property DLC04DRGOperatorsEnableMarker Auto Const Mandatory
ObjectReference Property DLC04DRGPackEnableMarker Auto Const Mandatory
ObjectReference Property DLC04KKPreStateEnableMarker Auto Const Mandatory
ObjectReference Property DLC04KKDisciplesEnableMarker Auto Const Mandatory
ObjectReference Property DLC04KKOperatorsEnableMarker Auto Const Mandatory
ObjectReference Property DLC04KKPackEnableMarker Auto Const Mandatory
ObjectReference Property DLC04SAPreStateEnableMarker Auto Const Mandatory
ObjectReference Property DLC04SADisciplesEnableMarker Auto Const Mandatory
ObjectReference Property DLC04SAOperatorsEnableMarker Auto Const Mandatory
ObjectReference Property DLC04SAPackEnableMarker Auto Const Mandatory
ObjectReference Property DLC04MQ03GZQTMarker Auto Const Mandatory
ObjectReference Property DLC04MQ03KKQTMarker Auto Const Mandatory
ObjectReference Property DLC04MQ03WWQTMarker Auto Const Mandatory
ObjectReference Property DLC04MQ03SAQTMarker Auto Const Mandatory
ObjectReference Property DLC04MQ03BottlingPlantQTMarker Auto Const Mandatory

;Globals denote which gang holds which zone 1 = Disciples, 2 = Operators, 3 = Pack
GlobalVariable Property DLC04MQ03ClaimedBP Auto Const Mandatory
GlobalVariable Property DLC04MQ03ClaimedGZ Auto Const Mandatory
GlobalVariable Property DLC04MQ03ClaimedDRG Auto Const Mandatory
GlobalVariable Property DLC04MQ03ClaimedKK Auto Const Mandatory
GlobalVariable Property DLC04MQ03ClaimedSA Auto Const Mandatory
GlobalVariable Property DLC04EnemyGang Auto Const Mandatory

Location Property DLC04BottlingPlantLocation Auto Const Mandatory
Location Property DLC04GalacticZoneLocation Auto Const Mandatory
Location Property DLC04KiddieKingdomLocation Auto Const Mandatory
Location Property DLC04SafariAdventureLocation Auto Const Mandatory
Location Property DLC04WildWestLocation Auto Const Mandatory

Quest Property DLC04MQ03 Auto Const Mandatory
Quest Property DLC04MQ05 Auto Const Mandatory
Quest Property DLC04ParkPopulationHandler Auto Const Mandatory

;This handles setup the enable/disable markers in the park zones using a Change Location
;If the Player travels to the Commonwealth, the zone will be set up and populated
;This also handles post-quest state in case any of the zones were Enemy Gang occupied

Function GangSwitch()

	;Checking Bottling Plant

	If DLC04MQ03BottlingPlantQTMarker.Is3DLoaded() == 0
		If Game.GetPlayer().IsInLocation(DLC04BottlingPlantLocation) == 0
			If DLC04MQ03.GetStageDone(510) == 1 && 	DLC04MQ05.GetStageDone(255) == 0
	
				If DLC04BPPreStateEnableMarker.IsDisabled() == 0
					DLC04BPPreStateEnableMarker.Disable()
				EndIf

				If DLC04MQ03ClaimedBP.GetValue() == 1
					DLC04BPDisciplesEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedBP.GetValue() == 2
					DLC04BPOperatorsEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedBP.GetValue() == 3
					DLC04BPPackEnableMarker.Enable()
				EndIf

				;Enable Loot Chest Target
				DLC04ParkPopulationHandler.SetStage(20)
	
			ElseIf DLC04MQ03.GetStageDone(510) == 1 && 	DLC04MQ05.GetStageDone(255) == 1

				If DLC04EnemyGang.GetValue() == 1
					DLC04BPDisciplesEnableMarker.Disable()
				ElseIf DLC04EnemyGang.GetValue() == 2
					DLC04BPOperatorsEnableMarker.Disable()		
				ElseIF DLC04EnemyGang.GetValue() == 3
					DLC04BPPackEnableMarker.Disable()
				EndIf

				If DLC04BPPreStateEnableMarker.IsDisabled() == 0
					DLC04BPPreStateEnableMarker.Disable()
				EndIf

				If DLC04MQ03ClaimedBP.GetValue() == 1
					DLC04BPDisciplesEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedBP.GetValue() == 2
					DLC04BPOperatorsEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedBP.GetValue() == 3
					DLC04BPPackEnableMarker.Enable()
				EndIf
			EndIf
		EndIf
	EndIf


	;Checking Galactic Zone
	If DLC04MQ03GZQTMarker.Is3DLoaded() == 0
		If Game.GetPlayer().IsInLocation(DLC04GalacticZoneLocation) == 0
			If DLC04MQ03.GetStageDone(110) == 1 && 	DLC04MQ05.GetStageDone(255) == 0
		
				If DLC04GZPreStateEnableMarker.IsDisabled() == 0
					DLC04GZPreStateEnableMarker.Disable()
				EndIf

				If DLC04MQ03ClaimedGZ.GetValue() == 1
					DLC04GZDisciplesEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedGZ.GetValue() == 2
					DLC04GZOperatorsEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedGZ.GetValue() == 3
					DLC04GZPackEnableMarker.Enable()
				EndIf

				;Enable Loot Chest Target
				DLC04ParkPopulationHandler.SetStage(30)

			ElseIf DLC04MQ03.GetStageDone(110) == 1 && 	DLC04MQ05.GetStageDone(255) == 1

				If DLC04EnemyGang.GetValue() == 1
					DLC04GZDisciplesEnableMarker.Disable()
				ElseIf DLC04EnemyGang.GetValue() == 2
					DLC04GZOperatorsEnableMarker.Disable()		
				ElseIF DLC04EnemyGang.GetValue() == 3
					DLC04GZPackEnableMarker.Disable()
				EndIf

				If DLC04GZPreStateEnableMarker.IsDisabled() == 0
					DLC04GZPreStateEnableMarker.Disable()
				EndIf

				If DLC04MQ03ClaimedGZ.GetValue() == 1
					DLC04GZDisciplesEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedGZ.GetValue() == 2
					DLC04GZOperatorsEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedGZ.GetValue() == 3
					DLC04GZPackEnableMarker.Enable()
				EndIf
			EndIf
		EndIf		
	EndIf

	;Checking Dry Rock Gulch
	If DLC04MQ03WWQTMarker.Is3DLoaded() == 0
		If Game.GetPlayer().IsInLocation(DLC04WildWestLocation) == 0	
			If DLC04MQ03.GetStageDone(210) == 1 && 	DLC04MQ05.GetStageDone(255) == 0
				
				If DLC04DRGPreStateEnableMarker.IsDisabled() == 0
					DLC04DRGPreStateEnableMarker.Disable()
				EndIf

				If DLC04MQ03ClaimedDRG.GetValue() == 1
					DLC04DRGDisciplesEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedDRG.GetValue() == 2
					DLC04DRGOperatorsEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedDRG.GetValue() == 3
					DLC04DRGPackEnableMarker.Enable()
				EndIf

				;Enable Loot Chest Target
				DLC04ParkPopulationHandler.SetStage(60)

			ElseIf DLC04MQ03.GetStageDone(210) == 1 && 	DLC04MQ05.GetStageDone(255) == 1

				If DLC04EnemyGang.GetValue() == 1
					DLC04DRGDisciplesEnableMarker.Disable()
				ElseIf DLC04EnemyGang.GetValue() == 2
					DLC04DRGOperatorsEnableMarker.Disable()		
				ElseIF DLC04EnemyGang.GetValue() == 3
					DLC04DRGPackEnableMarker.Disable()
				EndIf

				If DLC04DRGPreStateEnableMarker.IsDisabled() == 0
					DLC04DRGPreStateEnableMarker.Disable()
				EndIf

				If DLC04MQ03ClaimedDRG.GetValue() == 1
					DLC04DRGDisciplesEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedDRG.GetValue() == 2
					DLC04DRGOperatorsEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedDRG.GetValue() == 3
					DLC04DRGPackEnableMarker.Enable()
				EndIf
			EndIf
		EndIf
	EndIf

	;Checking Kiddie Kingdom
	If DLC04MQ03KKQTMarker.Is3DLoaded() == 0
		If Game.GetPlayer().IsInLocation(DLC04KiddieKingdomLocation) == 0	
			If DLC04MQ03.GetStageDone(310) == 1 && 	DLC04MQ05.GetStageDone(255) == 0
				
				If DLC04KKPreStateEnableMarker.IsDisabled() == 0
					DLC04KKPreStateEnableMarker.Disable()
				EndIf

				If DLC04MQ03ClaimedKK.GetValue() == 1
					DLC04KKDisciplesEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedKK.GetValue() == 2
					DLC04KKOperatorsEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedKK.GetValue() == 3
					DLC04KKPackEnableMarker.Enable()
				EndIf

				;Enable Loot Chest Target
				DLC04ParkPopulationHandler.SetStage(40)

			ElseIf DLC04MQ03.GetStageDone(310) == 1 && 	DLC04MQ05.GetStageDone(255) == 1

				If DLC04EnemyGang.GetValue() == 1
					DLC04KKDisciplesEnableMarker.Disable()
				ElseIf DLC04EnemyGang.GetValue() == 2
					DLC04KKOperatorsEnableMarker.Disable()		
				ElseIF DLC04EnemyGang.GetValue() == 3
					DLC04KKPackEnableMarker.Disable()
				EndIf

				If DLC04KKPreStateEnableMarker.IsDisabled() == 0
					DLC04KKPreStateEnableMarker.Disable()
				EndIf		

				If DLC04MQ03ClaimedKK.GetValue() == 1
					DLC04KKDisciplesEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedKK.GetValue() == 2
					DLC04KKOperatorsEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedKK.GetValue() == 3
					DLC04KKPackEnableMarker.Enable()
				EndIf
			EndIf
		EndIf
	EndIf


	;Checking Safari Adventure
	If DLC04MQ03SAQTMarker.Is3DLoaded() == 0
		If Game.GetPlayer().IsInLocation(DLC04SafariAdventureLocation) == 0	
			If DLC04MQ03.GetStageDone(410) == 1 && 	DLC04MQ05.GetStageDone(255) == 0
				
				If DLC04SAPreStateEnableMarker.IsDisabled() == 0
					DLC04SAPreStateEnableMarker.Disable()
				EndIf

				If DLC04MQ03ClaimedSA.GetValue() == 1
					DLC04SADisciplesEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedSA.GetValue() == 2
					DLC04SAOperatorsEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedSA.GetValue() == 3
					DLC04SAPackEnableMarker.Enable()
				EndIf

				;Enable Loot Chest Target
				DLC04ParkPopulationHandler.SetStage(50)

			ElseIf DLC04MQ03.GetStageDone(410) == 1 && 	DLC04MQ05.GetStageDone(255) == 1

				If DLC04EnemyGang.GetValue() == 1
					DLC04SADisciplesEnableMarker.Disable()
				ElseIf DLC04EnemyGang.GetValue() == 2
					DLC04SAOperatorsEnableMarker.Disable()		
				ElseIF DLC04EnemyGang.GetValue() == 3
					DLC04SAPackEnableMarker.Disable()
				EndIf

				If DLC04SAPreStateEnableMarker.IsDisabled() == 0
					DLC04SAPreStateEnableMarker.Disable()
				EndIf		

				If DLC04MQ03ClaimedSA.GetValue() == 1
					DLC04SADisciplesEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedSA.GetValue() == 2
					DLC04SAOperatorsEnableMarker.Enable()
				ElseIf DLC04MQ03ClaimedSA.GetValue() == 3
					DLC04SAPackEnableMarker.Enable()
				EndIf
			EndIf
		EndIf
	EndIf

EndFunction