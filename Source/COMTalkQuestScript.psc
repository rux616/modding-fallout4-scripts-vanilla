Scriptname COMTalkQuestScript extends Quest
{Script on COM<Companion>Quest used in Relationship scene to call function on related CompanionActorScript}

Group Companion
CompanionActorScript Property CompanionActor const auto mandatory
{Pointer to the CompanionActorScript on the ActorRef of the corresponding companion}
EndGroup

Group Autofill
GlobalVariable Property CA_T1_Infatuation const auto mandatory
{AUTOFILL}

GlobalVariable Property CA_T2_Admiration const auto mandatory
{AUTOFILL}

GlobalVariable Property CA_T3_Neutral const auto mandatory
{AUTOFILL}

GlobalVariable Property CA_T4_Disdain const auto mandatory
{AUTOFILL}

GlobalVariable Property CA_T5_Hatred const auto mandatory
{AUTOFILL}
EndGroup

Function ShowInfatuationMessage()
	CompanionActor.ShowThresholdMessage(CA_T1_Infatuation)
EndFunction

Function ShowAdmirationMessage()
	CompanionActor.ShowThresholdMessage(CA_T2_Admiration)
EndFunction

Function ShowNeutralMessage()
	CompanionActor.ShowThresholdMessage(CA_T3_Neutral)
EndFunction

Function ShowDisdainMessage()
	CompanionActor.ShowThresholdMessage(CA_T4_Disdain)
EndFunction

Function ShowHatredMessage()
	CompanionActor.ShowThresholdMessage(CA_T5_Hatred)
EndFunction

Function ShowRomanticInfatuationMessage()
	CompanionActor.ShowRomanticInfatuationMessage()
EndFunction