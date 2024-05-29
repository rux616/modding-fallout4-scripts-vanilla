Scriptname DLC01:DLC01CodsworthCompanionDataUpdate extends Quest

CompanionActorScript Property CodsworthCompanionActor const auto mandatory
{Fill with Codsworth1Ref}

GlobalVariable Property DLC01_Codsworth_AffinityCondition_HatredAllowed const auto mandatory
{autofill}

GlobalVariable Property CA_T5_Hatred const auto mandatory
{autofill}

GlobalVariable Property CA_T4_Disdain const auto mandatory
{autofill}

ActorValue Property CA_CurrentThreshold const auto mandatory

FollowersScript Property Followers const auto
{autofill}

Function UpdateDataAndUndoHatred()
	debug.trace(self + "UpdateDataAndUndoHatred() setting Codsworth's hatred affinity level to be conditional")

	;find the hatred threshold struct
	int i = CodsworthCompanionActor.ThresholdData_Array.findStruct("Threshold_Global",  CA_T5_Hatred)

	;give the hatred struct a conditional global
	CodsworthCompanionActor.ThresholdData_Array[i].ConditionalGlobal = DLC01_Codsworth_AffinityCondition_HatredAllowed

	;if currently at hatred, set it to disdain
	if CodsworthCompanionActor.GetValue(CA_CurrentThreshold) == CA_T5_Hatred.GetValue()
		debug.trace(self + "UpdateDataAndUndoHatred() Codsworth currently hates player, so we will set him to disdain")

		CodsworthCompanionActor.UnsetHasLeftPlayerPermanently() ;new function added in patch
		CodsworthCompanionActor.SetAffinity(CA_T4_Disdain.GetValue())
		Followers.AllowCompanion(CodsworthCompanionActor,  MakeCompanionIfNoneCurrently = false, ForceCompanion = false)

		
	endif

EndFunction


