Scriptname RadioInstituteDynamicQuestScript extends Quest Conditional


;has Control become aware of player's presence
Int Property MasterAlert Auto Conditional

;Current zone player is in
Int Property PlayerZone Auto Conditional

;Last known zone of player
Int Property LastPlayerZone Auto Conditional

;what type of weapon is player using
Int Property PlayerWeaponType Auto Conditional

;Is player in combat
Bool Property InCombat Auto Conditional

;Which group has player engaged
Int Property GroupInCombat Auto Conditional

;Is player currently detected
Bool Property PlayerDetected Auto Conditional

;Which zone are troops being deployed to
Int Property DeployZone Auto Conditional


;References for spawning reinforcements
ObjectReference Property ReinforcementMarker1_1 Auto Const

ObjectReference Property ReinforcementMarker1_2 Auto Const

ObjectReference Property ReinforcementMarker1_3 Auto Const

ObjectReference Property ReinforcementMarker1_4 Auto Const

ObjectReference Property ReinforcementMarker2_1 Auto Const

ObjectReference Property ReinforcementMarker2_2 Auto Const

ObjectReference Property ReinforcementMarker2_3 Auto Const

ObjectReference Property ReinforcementMarker2_4 Auto Const


;Quest Aliases for Reinforcements
ReferenceAlias Property Reinforcement2_01 Auto Const
ReferenceAlias Property Reinforcement2_02 Auto Const
ReferenceAlias Property Reinforcement2_03 Auto Const
ReferenceAlias Property Reinforcement2_04 Auto Const

ReferenceAlias Property Reinforcement1_01 Auto Const
ReferenceAlias Property Reinforcement1_02 Auto Const
ReferenceAlias Property Reinforcement1_03 Auto Const
ReferenceAlias Property Reinforcement1_04 Auto Const


;Actor to use for spawning Reinforcements
ActorBase Property EncRaider01 Auto Const



Function DeployReinforcements(Int GroupNumber)

	if GroupNumber == 1
		Reinforcement1_01.ForceRefTo(ReinforcementMarker1_1.PlaceAtMe(EncRaider01))
		Reinforcement1_01.GetActorRef().EvaluatePackage()
		Reinforcement1_02.ForceRefTo(ReinforcementMarker1_2.PlaceAtMe(EncRaider01))
		Reinforcement1_02.GetActorRef().EvaluatePackage()
		Reinforcement1_03.ForceRefTo(ReinforcementMarker1_3.PlaceAtMe(EncRaider01))
		Reinforcement1_03.GetActorRef().EvaluatePackage()
		Reinforcement1_04.ForceRefTo(ReinforcementMarker1_4.PlaceAtMe(EncRaider01))
		Reinforcement1_04.GetActorRef().EvaluatePackage()

	elseif GroupNumber ==2
		Reinforcement2_01.ForceRefTo(ReinforcementMarker2_1.PlaceAtMe(EncRaider01))
		Reinforcement2_01.GetActorRef().EvaluatePackage()
		Reinforcement2_02.ForceRefTo(ReinforcementMarker2_2.PlaceAtMe(EncRaider01))
		Reinforcement2_02.GetActorRef().EvaluatePackage()
		Reinforcement2_03.ForceRefTo(ReinforcementMarker2_3.PlaceAtMe(EncRaider01))
		Reinforcement2_03.GetActorRef().EvaluatePackage()
		Reinforcement2_04.ForceRefTo(ReinforcementMarker2_4.PlaceAtMe(EncRaider01))
		Reinforcement2_04.GetActorRef().EvaluatePackage()
	endif

	ReinforcementsDeployed=1

EndFunction

Int Property ZoneOneCount Auto Conditional

Int Property ZoneTwoCount Auto Conditional

Int Property ZoneThreeCount Auto Conditional

Int Property ZoneFourCount Auto Conditional

Int Property ReinforcementACount Auto Conditional

Int Property ReinforcementBCount Auto Conditional

Int Property ReinforcementsDeployed Auto Conditional

Int Property AttackSceneLoop Auto Conditional


Int Property GroupAlerted Auto Conditional

Bool Property MasterStart Auto Conditional
