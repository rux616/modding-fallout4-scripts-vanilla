Scriptname REAliasScript extends ReferenceAlias
{Should be attached to all aliases in Random Encounter quests. 
NOTE: changes here should also be made to RECollectionAliasScript
}

bool Property StartsDead = false auto
{Default = FALSE; should the actor be killed when they spawn? To be replaced by code solution.}

bool Property RegisterAlias = true auto
{Default = TRUE; for now, all aliases should register - this property may end up being removed}

bool Property TrackDeath = false auto
{Default = FALSE; set to true if you want the quest to track when this alias dies and set a stage
 NOTE: need to set GroupIndex if you are tracking multiple groups. See REScript for more details
 }
int Property GroupIndex = 0 auto
{ Default = 0; used for tracking death, if you have more than one group.
This index needs to match how you've set up DeadCounts arrays in REScript
}

int Property OnHitStage auto
{ stage to set if actor is hit }
Faction Property OnHitFaction auto
{ faction of attacking actor which triggers OnHitStage 
 Default = trigger on hit from player}

bool Property IgnoreForCleanup = false auto hidden
{ when set to true, this actor will be considered dead/unloaded for purposes of the cleanup check 
  used when actor needs to persist for some other reason but still allow the quest to shut down
  e.g. assigned to a workshop
  }

Event OnAliasInit()
	; tell parent quest script about me
	if RegisterAlias
		debug.trace(self + "OnInit - registering alias")
		(GetOwningQuest() as REScript).RegisterAlias(self as ReferenceAlias)
	endif
	CustomRegisterForHit()
EndEvent

Event OnLoad()
	if (StartsDead)
		debug.trace(self + " StartsDead = true : killing")
		Actor a = Self.GetActorRef()
		a.MoveToMyEditorLocation()
		(Self.GetOwningQuest() as REScript).REParent.KillWithForce(a)
	endif
;	if GetReference().Is3DLoaded()
;		RegisterForHitEvent(self, OnHitFaction) ; listen for a hit from this faction
;	endIf
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

Event OnDeath(Actor akKiller)
	if TrackDeath
		(GetOwningQuest() as REScript).IncrementDeadCount(GroupIndex)
	endif
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	debug.trace(self + " OnHit " + akTarget + ", " + akAggressor + ", " + akSource)
    if OnHitStage > 0 && (akAggressor as Actor)
    	Actor attackingActor = akAggressor as Actor
    	if (OnHitFaction && attackingActor.IsInFaction(OnHitFaction)) || (OnHitFaction == NONE && attackingActor == Game.GetPlayer())
    		GetOwningQuest().SetStage(OnHitStage)
    	endif
    endif
	CustomRegisterForHit()
EndEvent

function CustomRegisterForHit()
	debug.trace(self + "CustomRegisterForHit")
    ; register if necessary
    if OnHitStage > 0 && GetOwningQuest().GetStageDone(OnHitStage) == false
		if OnHitFaction
			debug.trace(self + " RegisterForHitEvent from " + OnHitFaction)
			RegisterForHitEvent(self, OnHitFaction)
		else
			debug.trace(self + " RegisterForHitEvent from player")
			RegisterForHitEvent(self, Game.GetPlayer())
		endif
	endif
endFunction