Scriptname CZKillAliasScript extends ReferenceAlias


Group ScriptData
int Property StageToDie = -1 const auto	
{After this stage has been set, the actor should die}

int Property StageToSetOnDeath = -1 const auto
{After this actor actually dies, set this stage}

float Property MaxAliveTime = 15.0 const auto
{Default: 15.0; Max amount of time to allow actor to live after StageToDie, after this time, just script kill him regardless/}

bool Property KillAfterNextOnHit = true const auto
{Default: true; Kill actor in the next OnHit event after StageToDie}

bool Property Decapitate = true const auto
{Default: true; Decapitate actor when he dies}

ReferenceAlias Property Killer const auto
{The person we want to deal the killing blow (to avoid damage from falling killing character)}
EndGroup


float deathFailsafeTimerInterval 	;set to MaxAliveTime in OnInit()

Event OnAliasInit()
	if StageToDie >= 0
		RegisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
	endif

	RegisterForHitEvent(GetActorReference())	

	deathFailsafeTimerInterval = MaxAliveTime

EndEvent


Event Quest.OnStageSet(Quest akSender,int auiStageID, int auiItemID)
	if auiStageID == StageToDie
		startTimer(deathFailsafeTimerInterval)
	endif
EndEvent


Event OnTimer(int aiTimerID)
	;debug.trace(self +"Killed by timer!")
	GetActorReference().Kill()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	;debug.trace("Hit by" + akAggressor + " with " + akSource)

	if KillAfterNextOnHit && (GetOwningQuest().GetStageDone(StageToDie) || StageToDie < 0) && (akAggressor == Killer.GetReference() || akAggressor == Game.GetPlayer())
		;debug.trace("And the one that killed him was: Hit by" + akAggressor + " with " + akSource)
		GetActorReference().Kill()
		UnregisterForHitEvent(GetActorReference())
	endif

	if akAggressor == Game.GetPlayer()
		GetOwningQuest().setStage(243)
	endif
	;debug.trace(self + " Register for CZkill event")
	RegisterForHitEvent(GetActorReference())
EndEvent


Event OnDeath(Actor akKiller)
	if Decapitate
		GetActorReference().Dismember("Head1", abForceExplode = false,  abForceDismember = true )
	endif

	GetOwningQuest().setStage(StageToSetOnDeath)
	UnregisterForHitEvent(GetActorReference())	

EndEvent


