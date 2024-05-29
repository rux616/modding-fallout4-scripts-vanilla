Scriptname DLC03:DLC03AcadiaInstituteQuestScript extends Quest

Int Property AcadiaActorsNeutralized Auto

Int Property AcadiaActorTotal Auto Const

Int Property Acadia_Aster_Neutralized Auto

Int Property Acadia_Chase_Neutralized Auto

Int Property Acadia_Cog_Neutralized Auto

Int Property Acadia_Dejen_Neutralized Auto

Int Property Acadia_Dima_Neutralized Auto

Int Property Acadia_Faraday_Neutralized Auto

Int Property Acadia_Jule_Neutralized Auto

Int Property Acadia_Miranda_Neutralized Auto

Int Property Acadia_Kasumi_Neutralized Auto

Int Property Acadia_Naveen_Neutralized Auto

MQ00Script Property MQ00 Const Auto

;if player is kicked out of Institute, shut down this quest

 Event MQ00Script.MQFactionKickOut(MQ00Script akSender, Var[] akArgs)
   ;store off which faction we just got kicked out of
   Int myFactionNumber = (akArgs[0] as Int)
   if myFactionNumber == 4
	SetStage(1000)
  endif
 EndEvent


;timer function for enabling acadia actors

Function StartAcadiaInstTimer()

	StartTimerGameTime(24, 1337)

EndFunction


Event OnTimerGameTime(int TimerID)

	if TimerID == 1337

		SetStage(50)

	endif

Endevent





Function UpdateAcadiaStatus(Actor CallingRef)

;Any time Acadia actor goes into bleedout, run through all our suspects
; verify their status, making sure they've been accounted for
; actor is passed through from alias script on entering bleedout


if Acadia_Aster_Neutralized == 0
	if Aster.GetActorRef().IsDead() == 1
		Acadia_Aster_Neutralized=1
		AcadiaActorsNeutralized +=1
	elseif CallingRef == Aster.GetActorReference()
		Acadia_Aster_Neutralized=1
		AcadiaActorsNeutralized +=1
	endif
endif
if Acadia_Chase_Neutralized == 0
	if Chase.GetActorRef().IsDead() == 1
		Acadia_Chase_Neutralized=1
		AcadiaActorsNeutralized +=1
	elseif CallingRef == Chase.GetActorReference()
		Acadia_Chase_Neutralized=1
		AcadiaActorsNeutralized +=1
	endif
endif
if Acadia_Cog_Neutralized == 0
	if Cog.GetActorRef().IsDead() == 1
		Acadia_Cog_Neutralized=1
		AcadiaActorsNeutralized +=1
	elseif CallingRef == Cog.GetActorReference()
		Acadia_Cog_Neutralized=1
		AcadiaActorsNeutralized +=1
	endif
endif
if Acadia_Dejen_Neutralized == 0
	if Dejen.GetActorRef().IsDead() == 1
		Acadia_Dejen_Neutralized=1
		AcadiaActorsNeutralized +=1
	elseif CallingRef == Dejen.GetActorReference()
		Acadia_Dejen_Neutralized=1
		AcadiaActorsNeutralized +=1
	endif
endif
if Acadia_DiMA_Neutralized == 0
	if DiMA.GetActorRef().IsDead() == 1
		Acadia_DiMA_Neutralized=1
		AcadiaActorsNeutralized +=1
	elseif CallingRef == DiMA.GetActorReference()
		Acadia_DiMA_Neutralized=1
		AcadiaActorsNeutralized +=1
	endif
endif
if Acadia_Faraday_Neutralized == 0
	if Faraday.GetActorRef().IsDead() == 1
		Acadia_Faraday_Neutralized=1
		AcadiaActorsNeutralized +=1
	elseif CallingRef == Faraday.GetActorReference()
		Acadia_Faraday_Neutralized=1
		AcadiaActorsNeutralized +=1
	endif
endif
if Acadia_Jule_Neutralized == 0
	if Jule.GetActorRef().IsDead() == 1
		Acadia_Jule_Neutralized=1
		AcadiaActorsNeutralized +=1
	elseif CallingRef == Jule.GetActorReference()
		Acadia_Jule_Neutralized=1
		AcadiaActorsNeutralized +=1
	endif
endif
if Acadia_Kasumi_Neutralized == 0
	if Kasumi.GetActorRef().IsDead() == 1
		Acadia_Kasumi_Neutralized=1
		AcadiaActorsNeutralized +=1
	elseif CallingRef == Kasumi.GetActorReference()
		Acadia_Kasumi_Neutralized=1
		AcadiaActorsNeutralized +=1
;special handling for Kasumi having been sent back home
	elseif DLC03MQPostQuest.GetStageDone(170)
		Acadia_Kasumi_Neutralized=1
		AcadiaActorsNeutralized+=1
	endif
endif
if Acadia_Miranda_Neutralized == 0
	if Miranda.GetActorRef().IsDead() == 1
		Acadia_Miranda_Neutralized=1
		AcadiaActorsNeutralized +=1
	elseif CallingRef == Miranda.GetActorReference()
		Acadia_Miranda_Neutralized=1
		AcadiaActorsNeutralized +=1
	endif
endif
if Acadia_Naveen_Neutralized == 0
	if Naveen.GetActorRef().IsDead() == 1
		Acadia_Naveen_Neutralized=1
		AcadiaActorsNeutralized +=1
	elseif CallingRef == Naveen.GetActorReference()
		Acadia_Naveen_Neutralized=1
		AcadiaActorsNeutralized +=1
	endif
endif

; if total number of actors covered equals total, update the quest

if AcadiaActorsNeutralized == AcadiaActorTotal
	SetStage(400)
endif


EndFunction





ReferenceAlias Property Aster Auto Const

ReferenceAlias Property Chase Auto Const

ReferenceAlias Property Cog Auto Const

ReferenceAlias Property Dejen Auto Const

ReferenceAlias Property DiMA Auto Const

ReferenceAlias Property Jule Auto Const

ReferenceAlias Property Faraday Auto Const

ReferenceAlias Property Kasumi Auto Const

ReferenceAlias Property Miranda Auto Const

ReferenceAlias Property Naveen Auto Const

Quest Property DLC03MQPostQuest Auto Const Mandatory
