ScriptName TestCrippleEventScript extends Actor

Event OnLoad()
	Debug.Trace("TestCrippleEventScript is running.")
EndEvent

Event OnCripple(ActorValue akActorValue, bool abCrippled)
	Debug.Trace("OnCripple Received: " + akActorValue + ", " + abCrippled)
EndEvent