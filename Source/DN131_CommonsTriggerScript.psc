Scriptname DN131_CommonsTriggerScript extends ObjectReference Hidden Const
{Script for the ring of triggers that surround Boston Common. These keep enemies out of the Commons by putting them into a RefCollectionAlias, DN131_Commons RetreatRefCollection, that repackages them.}

Group Retreat_Properties
	Faction[] Property IgnoreFactions Auto Const Mandatory
	{If triggering actors are in any of these factions, ignore them. They don't avoid the Commons in any way.}

	RefCollectionAlias Property RetreatRefCollection Auto Const Mandatory
	{Triggering actors placed in this collection will be packaged to avoid the Commons.}

	ReferenceAlias Property RetreatSceneActor Auto Const Mandatory
	{The 'first' actor to approach the Commons will play a scene, generally calling for allies to fall back.}

	Keyword Property DN131_Commons_RetreatLink Auto Const Mandatory
	{Story manager keyword used to start the DN131_Commons quest by script event. Also used to link actors to their hold position triggers.}

	Quest property DN131_Commons Auto Const Mandatory
	{DN131_Commons quest.}
EndGroup

Group Commentary_Properties
	ReferenceAlias property Companion Auto Const Mandatory
	{The player's companion, if any.}

	Keyword property AOT_DN131_1 Auto Const Mandatory
	{Follower commentary to play when the player enters Boston Commons. All lines set to SayOnce.}
EndGroup


;As actors enter the trigger, decide what to do with them.
Event OnTriggerEnter(ObjectReference akActionRef)
	if (DN131_Commons.IsRunning())
		ProcessCommonsTriggerEvent(akActionRef, True)
	Else
		Self.Disable()
	EndIf
EndEvent

;As actors leave the trigger, check again. Handles an edge case where the player hits the trigger a second time (clearing the collection)
;while enemies are still inside it.
Event OnTriggerLeave(ObjectReference akActionRef)
	ProcessCommonsTriggerEvent(akActionRef, False)
EndEvent

Function ProcessCommonsTriggerEvent(ObjectReference akActionRef, bool isEnterEvent)
	Actor akActionActor = akActionRef as Actor
	Debug.Trace("COMMON: " + akActionActor + " entered or left Common Trigger " + Self)

	if (isEnterEvent && (akActionActor == Game.GetPlayer()))
		;If the player just entered, that means they've crossed the border to the Commons. Actors that have already retreated can be released 'early' to reengage.
		(RetreatRefCollection as DN131_CommonsRetreatRefColScript).AdjustAllTimers()
		RetreatRefCollection.StartTimer(0)
	ElseIf (isEnterEvent && (akActionActor == Companion.GetRef()))
		;If the player's companion just entered, have them say their follower commentary line.
		akActionActor.SayCustom(AOT_DN131_1)
	Else
		;If this isn't an actor, if it's already in the collection, or if it's riding a vertibird, abort.
		if ((akActionActor == None) || (RetreatRefCollection.Find(akActionActor) >= 0) || akActionActor.IsOnMount())
			return
		EndIf

		;If this actor is in any of the ignore factions, abort.
		int i = 0
		While (i < IgnoreFactions.Length)
			if (akActionActor.IsInFaction(IgnoreFactions[i]))
				return
			EndIf
			i = i + 1
		EndWhile

		;Otherwise:
		;- Give it a linkedref to a random retreat point. (Retreat points associated with each trigger are linked in a chain of DN131_Commons_RetreatLink linkedrefs.)
		ObjectReference[] retreatPoints = Self.GetLinkedRefChain(DN131_Commons_RetreatLink)
		akActionActor.SetLinkedRef(retreatPoints[Utility.RandomInt(0, retreatPoints.Length - 1)], DN131_Commons_RetreatLink)

		;- Add the actor to the retreat ref collection.
		(RetreatRefCollection as DN131_CommonsRetreatRefColScript).AddRetreatActor(akActionActor)

		;- If the RetreatSceneActor is empty, push this actor into it and start the retreat scene. DN131_CommonsRetreatActorScript runs a timer and eventually clears itself.
		if (RetreatSceneActor.GetActorRef() == None)
			RetreatSceneActor.ForceRefTo(akActionActor)
			(RetreatSceneActor as DN131_CommonsRetreatActorScript).StartRetreatScene()
		EndIf

		;- EVP to get the Actor to respond immediately.
		Debug.Trace("COMMON: " + akActionActor + " retreated from Common.")
		akActionActor.EvaluatePackage()
	EndIf
EndFunction
