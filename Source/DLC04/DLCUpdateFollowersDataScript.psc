Scriptname DLC04:DLCUpdateFollowersDataScript extends Quest
{Used to add DLC03 Companion Custom Affinity Events to the main game's Follower's script data.}

FollowersScript:AffinityEventData[] property AffinityEvents const auto

Event OnInit()
    
	int i = 0
	While (i < AffinityEvents.length)
		FollowersScript:AffinityEventData curItem = AffinityEvents[i]
		
		FollowersScript.GetScript().AffinityEvents.add(curItem)

		i += 1
	EndWhile
   

EndEvent