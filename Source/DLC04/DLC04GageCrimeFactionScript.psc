Scriptname DLC04:DLC04GageCrimeFactionScript extends Actor Const

Group ShutdownForEnemyGangData
Quest Property DLC04MQ05 Auto Const Mandatory
int Property EnemyStage = 8 Auto Const 
GlobalVariable Property DLC04EnemyGang Auto Const Mandatory
;1 = Disciples
;2 = Operators
;3 = Pack
EndGroup

Group SharedCrimeFactionData
formlist Property DLC04_CompanionCrime_Gage Auto Const Mandatory
faction Property DLC04GangPackFaction Auto Const Mandatory
faction Property DLC04GangDisciplesFaction Auto Const Mandatory
faction Property DLC04GangOperatorsFaction Auto Const Mandatory
EndGroup

Event OnInit()
	debug.trace(self + "OnInit()")

	debug.trace(self + "DLC04_CompanionCrime_Gage.AddForm(DLC04GangDisciplesFaction)")
	DLC04_CompanionCrime_Gage.AddForm(DLC04GangDisciplesFaction)
	
	debug.trace(self + "DLC04_CompanionCrime_Gage.AddForm(DLC04GangOperatorsFaction)")
	DLC04_CompanionCrime_Gage.AddForm(DLC04GangOperatorsFaction)
	
	debug.trace(self + "DLC04_CompanionCrime_Gage.AddForm(DLC04GangPackFaction)")
	DLC04_CompanionCrime_Gage.AddForm(DLC04GangPackFaction)

	RegisterForRemoteEvent(DLC04MQ05, "OnStageSet")
EndEvent


Event Quest.OnStageSet(quest akSender, int auiStageID, int auiItemID)
	if akSender == DLC04MQ05 && auiStageID == EnemyStage
		debug.trace(self + "Quest.OnStageSet. akSender: " + akSender + ", auiStageID: " + auiStageID)

		int EnemyGang = DLC04EnemyGang.GetValue() as int
		;1 = Disciples
		;2 = Operators
		;3 = Pack

		if EnemyGang == 1
			debug.trace(self + "DLC04_CompanionCrime_Gage.RemoveAddedForm(DLC04GangDisciplesFaction)")
			DLC04_CompanionCrime_Gage.RemoveAddedForm(DLC04GangDisciplesFaction)
		elseif EnemyGang == 2
			debug.trace(self + "DLC04_CompanionCrime_Gage.RemoveAddedForm(DLC04GangOperatorsFaction)")
			DLC04_CompanionCrime_Gage.RemoveAddedForm(DLC04GangOperatorsFaction)
		elseif EnemyGang ==3
			debug.trace(self + "DLC04_CompanionCrime_Gage.RemoveAddedForm(DLC04GangPackFaction)")
			DLC04_CompanionCrime_Gage.RemoveAddedForm(DLC04GangPackFaction)
		else
			debug.trace(self + "WARNING! Unexpected EnemyGang: " + EnemyGang, 2)
		endif
	endif
EndEvent