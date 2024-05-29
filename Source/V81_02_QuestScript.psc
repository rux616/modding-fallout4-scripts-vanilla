Scriptname V81_02_QuestScript extends Quest

Quest Property GenericBrawl Auto Const

; watch for these from brawl quest
Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID) 
	if akSender == GenericBrawl && auiStageID == (GenericBrawl as GenericBrawlScript).QuestDoneStage
		if GetStage() == 100
             ; NOTE: you probably want additional conditions (e.g. your quest is in the proper state between starting and ending the brawl)
             ; DO SOMETHING - e.g. set a stage
        endif
	endif
endEvent