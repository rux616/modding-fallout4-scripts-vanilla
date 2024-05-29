Scriptname RESceneKMK_MQ202KelloggScript extends ReferenceAlias

int hitCount
int hitCountMax

Event OnAliasInit()
	RegisterForHitEvent(self, Game.GetPlayer())
	hitCountMax = utility.RandomInt(1,5)
	ObjectReference myRef = GetRef()
	if myRef
		myRef.BlockActivation(abBlocked = true, abhideActivateText = false)
	endif
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	hitCount += 1
    if hitCount >= hitCountMax
    	GetActorRef().kill()
    else
		RegisterForHitEvent(self, Game.GetPlayer())
		; enable linked ref now?
		if utility.RandomInt() >= 75
			debug.trace(self + "OnHit: timer to enable linked Kellogg...")
		   	StartTimer(utility.RandomFloat(0.0, 3.0))
		endif
    endif
EndEvent

Event OnDeath(Actor akKiller)
    ; disable with fade
    GetRef().Disable(true)
   	StartTimer(utility.RandomFloat(0.0, 3.0))
EndEvent

Event OnTimer(int aiTimerID)
    ; enable linked ref (if any)
    EnableNextKellogg()
EndEvent

function EnableNextKellogg()
	RESceneKMK_MQ202Script myQuest = GetOwningQuest() as RESceneKMK_MQ202Script
	if myQuest && myQuest.currentKelloggCount < myQuest.maxKelloggCount
	    ObjectReference myLink = GetRef().GetLinkedRef()
	    if myLink
			debug.trace(self + "enabling linked Kellogg " + myLink)
			myQuest.IncrementKelloggCount()
	    	myLink.Enable(true)
	    endif
	endif
endFunction

event OnLoad()
	RESceneKMK_MQ202Script myQuest = GetOwningQuest() as RESceneKMK_MQ202Script
	; make sure they stay hostile
	myQuest.RESceneKMK_MQ202Faction.SetPlayerEnemy(true)
endEvent