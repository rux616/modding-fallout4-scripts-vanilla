Scriptname DLC03:ADV017_IntroStartTrigger extends ObjectReference Const

ADV017QuestScript Property DLC03_ADV017 Auto Const Mandatory


Event OnTriggerEnter(ObjectReference akTriggerRef)
	DLC03_ADV017.TryToStartIntroScene()
EndEvent