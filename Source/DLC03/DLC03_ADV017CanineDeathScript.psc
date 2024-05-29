Scriptname DLC03:DLC03_ADV017CanineDeathScript extends ReferenceAlias


DLC03:ADV017QuestScript Property DLC03_ADV017 Auto Const Mandatory
int Property CanineType Auto Const Mandatory
{Tells which type of canine this is to tell the quest
	0 = Dog
	1 = Wolf
	2 = FEV Hound}

;This should not be DoOnce, as the alias can be refilled
Event OnDeath(Actor akKiller)
	if CanineType
		DLC03_ADV017.CanineKilled(CanineType)
	endif
EndEvent