Scriptname AffinitySceneHandlerScript extends Quest


ReferenceAlias Property CompanionAlias const auto
{The alias in this quest that is filled with the companion}

Group AutoFillProperties
GlobalVariable Property CA_T1_Infatuation const auto
GlobalVariable Property CA_T2_Admiration const auto
GlobalVariable Property CA_T3_Neutral const auto
GlobalVariable Property CA_T4_Disdain const auto
GlobalVariable Property CA_T5_Hatred const auto
GlobalVariable Property CA_TCustom1_Confidant const auto
GlobalVariable Property CA_TCustom2_Friend const auto
	
EndGroup

Function EndSceneInfatuation()
	(CompanionAlias.GetActorReference() as CompanionActorScript).FinishedSceneRemoveThresholdFromQueueAndSetSceneToPlay(CA_T1_Infatuation)
EndFunction

Function EndSceneAdmiration()
	(CompanionAlias.GetActorReference() as CompanionActorScript).FinishedSceneRemoveThresholdFromQueueAndSetSceneToPlay(CA_T2_Admiration)
EndFunction

Function EndSceneNeutral()
	(CompanionAlias.GetActorReference() as CompanionActorScript).FinishedSceneRemoveThresholdFromQueueAndSetSceneToPlay(CA_T3_Neutral)
EndFunction

Function EndSceneDisdain()
	(CompanionAlias.GetActorReference() as CompanionActorScript).FinishedSceneRemoveThresholdFromQueueAndSetSceneToPlay(CA_T4_Disdain)
EndFunction

Function EndSceneHatred()
	(CompanionAlias.GetActorReference() as CompanionActorScript).FinishedSceneRemoveThresholdFromQueueAndSetSceneToPlay(CA_T5_Hatred)
EndFunction

Function EndSceneConfidant()
	(CompanionAlias.GetActorReference() as CompanionActorScript).FinishedSceneRemoveThresholdFromQueueAndSetSceneToPlay(CA_TCustom1_Confidant)
EndFunction

Function EndSceneFriend()
	(CompanionAlias.GetActorReference() as CompanionActorScript).FinishedSceneRemoveThresholdFromQueueAndSetSceneToPlay(CA_TCustom2_Friend)
EndFunction

Function UnlockedInfatuation()
	(CompanionAlias.GetActorReference() as CompanionActorScript).UnlockInfatuationPerk()
EndFunction