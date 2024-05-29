Scriptname V81LessonTrigger extends ObjectReference Const

Quest Property V81_Lesson_01 Auto Const
Quest Property V81_04 Auto Const
Quest Property MS19 Auto Const
Quest Property MQ102 Auto Const
Quest Property Vault81Tour Auto Const
Quest Property DialogueVault81 Auto Const
Scene Property V81_Lesson_01_Scene Auto Const
GlobalVariable Property GameHour Auto Const
GlobalVariable Property MS19PlayerChoice Auto Const
ObjectReference Property ProjectorRef Auto Const
ObjectReference Property PlayerRef Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
	Debug.Trace(self + "Player entered trigger volume")
	If akActionRef == PlayerRef && GameHour.GetValue() >= 10 && Gamehour.GetValue() <= 14 && V81_Lesson_01.IsRunning() == 0 && Vault81Tour.IsRunning() == 0 && DialogueVault81.GetStageDone(12) == 1
		Debug.Trace(self + "Passed initial requirements")
		If MQ102.GetStageDone(123) == 1 && MS19.GetStageDone(150) == 0 && V81_04.GetStageDone(1000) == 1
			Debug.Trace(Self + "Player passed conditions")
			V81_Lesson_01.SetStage(100)
			Debug.Trace(self + "set stage for quest")
		EndIf		
		If MQ102.GetStageDone(123) == 1 && MS19PlayerChoice.GetValue() == 1 && V81_04.GetStageDone(1000) == 1
			Debug.Trace(Self + "Player passed conditions")
			V81_Lesson_01.SetStage(100)
			Debug.Trace(self + "set stage for quest")
		EndIf
		If MQ102.GetStageDone(123) == 0 && MS19PlayerChoice.GetValue() != 2
			Debug.Trace(Self + "Player passed conditions")
			V81_Lesson_01.SetStage(100)
			Debug.Trace(self + "set stage for quest")
		EndIf
	endif
EndEvent