Scriptname DLC01:DLC01BotAddMiscMod extends Actor Const

Group AutofillProperties
DLC01BotModQuestScript Property DLC01BotModQuest const auto mandatory
{Autofill}
EndGroup

Event OnDying(Actor akKiller)
	DLC01BotModQuest.AddMiscModToMe(self)
EndEvent