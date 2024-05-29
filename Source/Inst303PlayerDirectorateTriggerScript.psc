Scriptname Inst303PlayerDirectorateTriggerScript extends ObjectReference Conditional

Quest Property Inst303 Auto


Event OnTriggerEnter(ObjectReference ActionRef)

If ActionRef == Game.GetPlayer()
;	Inst303QuestScript QuestScript  = Inst303 as Inst303QuestScript
;	if Inst303QuestScript.PlayerInDirectorate==0
;		set Inst303QuestScript.PlayerInDirectorate to 1
;	endif
endif

EndEvent