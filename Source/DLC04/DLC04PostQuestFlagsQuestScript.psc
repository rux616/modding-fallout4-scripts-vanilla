Scriptname DLC04:DLC04PostQuestFlagsQuestScript extends Quest

GlobalVariable Property	DLC04EnemyGang Auto Const Mandatory

;Globals denote which gang holds which zone 1 = Disciples, 2 = Operators, 3 = Pack
GlobalVariable Property DLC04MQ03ClaimedBP Auto Const Mandatory
GlobalVariable Property DLC04MQ03ClaimedGZ Auto Const Mandatory
GlobalVariable Property DLC04MQ03ClaimedDRG Auto Const Mandatory
GlobalVariable Property DLC04MQ03ClaimedKK Auto Const Mandatory
GlobalVariable Property DLC04MQ03ClaimedSA Auto Const Mandatory

GlobalVariable Property DLC04PQBPResetDone Auto Const Mandatory
GlobalVariable Property DLC04PQGZResetDone Auto Const Mandatory
GlobalVariable Property DLC04PQDRGResetDone Auto Const Mandatory
GlobalVariable Property DLC04PQKKResetDone Auto Const Mandatory
GlobalVariable Property DLC04PQSAResetDone Auto Const Mandatory

ObjectReference Property DLC04GZOperatorFlagEnabler Auto Const Mandatory
ObjectReference Property DLC04GZDisciplesFlagEnabler Auto Const Mandatory
ObjectReference Property DLC04GZPackFlagEnabler Auto Const Mandatory
ObjectReference Property DLC04BPOperatorFlagEnabler Auto Const Mandatory
ObjectReference Property DLC04BPDisciplesFlagEnabler Auto Const Mandatory
ObjectReference Property DLC04BPPackFlagEnabler Auto Const Mandatory
ObjectReference Property DLC04DRGOperatorFlagEnabler Auto Const Mandatory
ObjectReference Property DLC04DRGDisciplesFlagEnabler Auto Const Mandatory
ObjectReference Property DLC04DRGPackFlagEnabler Auto Const Mandatory
ObjectReference Property DLC04SAOperatorFlagEnabler Auto Const Mandatory
ObjectReference Property DLC04SADisciplesFlagEnabler Auto Const Mandatory
ObjectReference Property DLC04SAPackFlagEnabler Auto Const Mandatory
ObjectReference Property DLC04KKOperatorFlagEnabler Auto Const Mandatory
ObjectReference Property DLC04KKDisciplesFlagEnabler Auto Const Mandatory
ObjectReference Property DLC04KKPackFlagEnabler Auto Const Mandatory



Function ZoneReset()

	If DLC04EnemyGang.GetValue() == 1
		
		If DLC04MQ03ClaimedBP.GetValue() == 1
			DLC04MQ03ClaimedBP.SetValue(0)
			DLC04BPDisciplesFlagEnabler.Disable()
			DLC04PQBPResetDone.SetValue(1)
		EndIf

		If DLC04MQ03ClaimedGZ.GetValue() == 1
			DLC04MQ03ClaimedGZ.SetValue(0)
			DLC04GZDisciplesFlagEnabler.Disable()
			DLC04PQGZResetDone.SetValue(1)
		EndIf

		If DLC04MQ03ClaimedDRG.GetValue() == 1
			DLC04MQ03ClaimedDRG.SetValue(0)
			DLC04DRGDisciplesFlagEnabler.Disable()
			DLC04PQDRGResetDone.SetValue(1)
		EndIf

		If DLC04MQ03ClaimedKK.GetValue() == 1
			DLC04MQ03ClaimedKK.SetValue(0)
			DLC04KKDisciplesFlagEnabler.Disable()
			DLC04PQKKResetDone.SetValue(1)
		EndIf

		If DLC04MQ03ClaimedSA.GetValue() == 1
			DLC04MQ03ClaimedSA.SetValue(0)
			DLC04SADisciplesFlagEnabler.Disable()
			DLC04PQSAResetDone.SetValue(1)
		EndIf

	ElseIf DLC04EnemyGang.GetValue() == 2
		
		If DLC04MQ03ClaimedBP.GetValue() == 2
			DLC04MQ03ClaimedBP.SetValue(0)
			DLC04BPOperatorFlagEnabler.Disable()
			DLC04PQBPResetDone.SetValue(1)
		EndIf

		If DLC04MQ03ClaimedGZ.GetValue() == 2
			DLC04MQ03ClaimedGZ.SetValue(0)
			DLC04GZOperatorFlagEnabler.Disable()
			DLC04PQGZResetDone.SetValue(1)
		EndIf

		If DLC04MQ03ClaimedDRG.GetValue() == 2
			DLC04MQ03ClaimedDRG.SetValue(0)
			DLC04DRGOperatorFlagEnabler.Disable()
			DLC04PQDRGResetDone.SetValue(1)
		EndIf

		If DLC04MQ03ClaimedKK.GetValue() == 2
			DLC04MQ03ClaimedKK.SetValue(0)
			DLC04KKOperatorFlagEnabler.Disable()
			DLC04PQKKResetDone.SetValue(1)
		EndIf

		If DLC04MQ03ClaimedSA.GetValue() == 2
			DLC04MQ03ClaimedSA.SetValue(0)
			DLC04SAOperatorFlagEnabler.Disable()
			DLC04PQSAResetDone.SetValue(1)
		EndIf

	ElseIf DLC04EnemyGang.GetValue() == 3
		
		If DLC04MQ03ClaimedBP.GetValue() == 3
			DLC04MQ03ClaimedBP.SetValue(0)
			DLC04BPPackFlagEnabler.Disable()
			DLC04PQBPResetDone.SetValue(1)
		EndIf

		If DLC04MQ03ClaimedGZ.GetValue() == 3
			DLC04MQ03ClaimedGZ.SetValue(0)
			DLC04GZPackFlagEnabler.Disable()
			DLC04PQGZResetDone.SetValue(1)
		EndIf

		If DLC04MQ03ClaimedDRG.GetValue() == 3
			DLC04MQ03ClaimedDRG.SetValue(0)
			DLC04DRGPackFlagEnabler.Disable()
			DLC04PQDRGResetDone.SetValue(1)
		EndIf

		If DLC04MQ03ClaimedKK.GetValue() == 3
			DLC04MQ03ClaimedKK.SetValue(0)
			DLC04KKPackFlagEnabler.Disable()
			DLC04PQKKResetDone.SetValue(1)
		EndIf

		If DLC04MQ03ClaimedSA.GetValue() == 3
			DLC04MQ03ClaimedSA.SetValue(0)
			DLC04SAPackFlagEnabler.Disable()
			DLC04PQSAResetDone.SetValue(1)
		EndIf

	EndIf

EndFunction