Scriptname DLC04:DLC04BotAddMiscMod extends Actor Const

Group AutofillProperties
DLC04BotModQuestScript Property DLC04BotModQuest const auto mandatory
{Autofill}
EndGroup

Event OnDying(Actor akKiller)
	DLC04BotModQuest.AddMiscModToMe(self)
EndEvent