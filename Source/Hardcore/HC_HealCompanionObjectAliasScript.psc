Scriptname Hardcore:HC_HealCompanionObjectAliasScript extends ReferenceAlias conditional

HC_ManagerScript Property HC_Manager const auto mandatory
{autofill}

int Property HealCompanionObjective = 10 const auto

int Property RepairCompanionObjective = 20 const auto

faction Property CurrentCompanionFaction const auto mandatory
{autofill}



Event OnEnterBleedout()
	if HC_Manager.IsGlobalTrue(HC_Manager.HC_Rule_CompanionNoHeal) == false
		;BAIL OUT, not in hardcore mode
		RETURN
	endif

	actor actorRef = GetActorReference()

	HC_Manager.Trace(self, "OnEnterBleedout() actorRef:" + actorRef)

	if HC_Manager.PlayerCanHealOrRepair(actorRef) == false
		HC_Manager.Trace(self, "OnEnterBleedout() PlayerCanHealOrRepair == false, BAILING OUT")
		RETURN
	endif

	actorRef.evaluatePackage() ;so they pick a package that turns off the warping to player functionality

	if HC_Manager.PlayerCanHeal(actorRef)
		HC_Manager.Trace(self, "OnEnterBleedout() PlayerCanHeal setting objective displayed: " + HealCompanionObjective)
		GetOwningQuest().SetActive(True)
		HC_Manager.SetObjectiveDisplayed(HealCompanionObjective, abForce = true)
	
	elseif HC_Manager.PlayerCanRepair(actorRef)
		HC_Manager.Trace(self, "OnEnterBleedout() PlayerCanRepair setting objective displayed: " + RepairCompanionObjective)
		GetOwningQuest().SetActive(True)
		HC_Manager.SetObjectiveDisplayed(RepairCompanionObjective, abForce = true)

	endif

	while (actorRef.IsBleedingOut() && actorRef.IsInFaction(CurrentCompanionFaction)) 
		utility.wait(1)
	endwhile

	HC_Manager.SetObjectiveDisplayed(HealCompanionObjective, abDisplayed = false)
	HC_Manager.SetObjectiveDisplayed(RepairCompanionObjective, abDisplayed = false)
EndEvent

