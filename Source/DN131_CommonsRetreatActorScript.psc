Scriptname DN131_CommonsRetreatActorScript extends ReferenceAlias Hidden Const
{Script on the DN131_Commons RetreatSceneActor alias. Actors who enter a Commons entry trigger are forced into this alias to play a scene indicating that they're staying out of the Commons.}

Scene property DN131_CommonsRetreatScene Auto Const Mandatory
{Retreat scene to play.}

float property RetreatSceneDelay = 30.0 Auto Const
{Amount of time to wait before clearing this alias. Until this alias clears, DN131_CommonsTriggerScript will not force anyone else in, so this limits how often the scene plays.}


Function StartRetreatScene()
	;Debug.Trace("Now playing " + DN131_CommonsRetreatScene + " with " + Self.GetActorRef())
	DN131_CommonsRetreatScene.Start()
	StartTimer(RetreatSceneDelay)
EndFunction

Event OnTimer(int aiTimerID)
	;Debug.Trace("Retreat Scene ready.")
	Self.Clear()
EndEvent