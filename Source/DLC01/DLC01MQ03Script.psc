Scriptname DLC01:DLC01MQ03Script extends Quest

Keyword property DLC01MQRadiantKeyword auto const mandatory

bool function StartRadiantQuest()
	return DLC01MQRadiantKeyword.SendStoryEventAndWait()
endFunction