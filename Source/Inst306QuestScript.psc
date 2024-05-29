Scriptname Inst306QuestScript extends Quest Conditional

Int Property ActorsKilled Auto Conditional

Int Property TalkedToDesdemona Auto Conditional

ReferenceAlias Property Desdemona Auto Const

ReferenceAlias Property Deacon Auto Const

ReferenceAlias Property Carrington Auto Const

ReferenceAlias Property TinkerTom Auto Const

ReferenceAlias Property Glory Auto Const


Event OnQuestInit()


;at quest start, check for any of the necessary actors that are already dead
;and add them to the total

	if Desdemona.GetActorReference().IsDead() == 1
		DesDead=True
		ActorsKilled += 1
	endif

	if Deacon.GetActorReference().IsDead() == 1
		DeaconDead=True
		ActorsKilled += 1
	endif

	if Carrington.GetActorReference().IsDead() == 1
		CarringtonDead=True
		ActorsKilled += 1
	endif

	if TinkerTom.GetActorReference().IsDead() == 1
		TomDead=True
		ActorsKilled += 1
	endif

	if Glory.GetActorReference().IsDead() == 1
		GloryDead=true
		ActorsKilled += 1
	endif
EndEvent


;Function ActorKilled(ActorBase akActor)

;int Update


;check actor base against corresponding var
; if var hasn't been set, set it. then set internal var to run bottom part
;otherwise we skip the bottom

;	if akActor == DoctorCarringtonBase
;		if CarringtonDead==False
;			CarringtonDead=1
;			update=1
;		endif
;	endif
;	if akActor == CompanionDeaconBase
;		if DeaconDead == False
;			DeaconDead=1
;			update=1
;		endif
;	endif
;	if akActor == GloryBase
;		if GloryDead==False
;			GloryDead=1
;			update=1
;		endif
;	endif
;	if akActor == TinkerTomBase
;		if TomDead == False
;			TomDead=1
;			update=1
;		endif
;	endif




;	if update==1
;		ActorsKilled +=1

;		if  ActorsKilled >= 4
;			if GetStageDone(25)==1
;				SetStage(30)
;			endif
;		update=0

;		endif
;	endif

;EndFunction

ActorBase Property DoctorCarringtonBase Auto Const
ActorBase Property TinkerTomBase Auto Const
ActorBase Property DesdemonaBase Auto Const
ActorBase Property CompanionDeaconBase Auto Const
ActorBase Property GloryBase Auto Const


Bool Property DesDead Auto Conditional
Bool Property DeaconDead Auto Conditional
Bool Property CarringtonDead Auto Conditional
Bool Property TomDead Auto Conditional
Bool Property GloryDead Auto Conditional