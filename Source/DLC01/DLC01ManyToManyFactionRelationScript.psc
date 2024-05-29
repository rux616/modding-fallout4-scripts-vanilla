Scriptname DLC01:DLC01ManyToManyFactionRelationScript extends Quest  
{Used to set Many to Many Faction Relationships. Where multiple factions need to have the same relationship between all of them.

NOTE: This will not make a faction have a relationship with itself (do that on the faction base object)}

Faction[] Property AllyFactions auto
{All factions in here will be made allies}

Faction[] Property FriendFactions auto
{All factions in here will be made Friends}

Faction[] Property EnemyFactions auto
{All factions in here will be made Enemies}

Faction[] Property NeutralFactions auto
{All factions in here will be made Neutral}


Event OnInit()
	ProcessArrays()
EndEvent

Function ProcessArrays()
	ProcessArray(AllyFactions, 1)
	ProcessArray(FriendFactions, 2)
	ProcessArray(EnemyFactions, 3)
	ProcessArray(NeutralFactions, 4)
EndFunction

Function ProcessArray(faction[] Array, int relation)
	int currentOuterElement = 0

	faction CurrentOuterFaction

	While (currentOuterElement < Array.Length - 1)
		CurrentOuterFaction = Array[currentOuterElement]
		
		int currentInnerElement = currentOuterElement + 1

	   	While (currentInnerElement < Array.Length)
	   		if relation == 1
	   		  	Array[currentInnerElement].SetAlly(CurrentOuterFaction)
	   		Elseif relation == 2
	    			Array[currentInnerElement].SetAlly(CurrentOuterFaction, true, true)
	   		Elseif relation == 3
	    			Array[currentInnerElement].SetEnemy(CurrentOuterFaction)
	   		Elseif relation == 4
	    			Array[currentInnerElement].SetEnemy(CurrentOuterFaction, true, true)
	    	Endif
			currentInnerElement += 1
		EndWhile
		currentOuterElement += 1
	Endwhile
EndFunction