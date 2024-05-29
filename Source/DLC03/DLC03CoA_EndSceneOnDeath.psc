Scriptname DLC03:DLC03CoA_EndSceneOnDeath extends ReferenceAlias Const

Scene Property DLC03MQ06a_HCSynthQuest_SermonScene Auto Const Mandatory
{Scene to end on death}

Event OnDeath(Actor akKiller)
	if DLC03MQ06a_HCSynthQuest_SermonScene.IsPlaying()
		DLC03MQ06a_HCSynthQuest_SermonScene.Stop()
	endif
EndEvent