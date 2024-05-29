Scriptname Inst306RRActorScript extends ReferenceAlias Conditional

Quest Property Inst306 Auto Const

ActorBase Property DoctorCarrington Auto Const

Event OnDeath(Actor Killer)

	;/Inst306QuestScript QuestScript = Inst306 as Inst306QuestScript

	if Inst306.GetStage() >= 20

		if Self.GetActorRef().GetActorBase()==  DoctorCarrington
			if QuestScript.CarringtonDead==False
				QuestScript.ActorKilled(Self.GetActorRef().GetActorBase())
			endif
		endif
	endif/;

EndEvent
ActorBase Property Desdemona Auto Const Mandatory

ActorBase Property TinkerTom Auto Const Mandatory

ActorBase Property Glory Auto Const Mandatory
