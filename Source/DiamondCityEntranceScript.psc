ScriptName DiamondCityEntranceScript extends Quest Conditional

Int Property PiperTalk01_Press Auto Conditional
;How did the player respond to the "support the news" question?
;1 = Positive, 2 = Negative, 3 = Neutral, 4 = Question

Int Property PiperTalk_Shaun Auto Conditional
;What did the player say when asked why he's in Diamond City?
;0 = Nothing; 1 = looking for Shaun, 3 = Infant boy. Kidnapped, 4 = Who to ask for missing person


ObjectReference Property DmndGateREF Auto
ObjectReference Property DmndStartLongSceneTriggerREF Auto
ObjectReference Property DmndEntranceSetStage3TriggerREF Auto
ObjectReference Property DmndEntranceSetStage40TriggerREF Auto
ObjectReference Property DmndEntranceSetStage90TriggerREF Auto
ObjectReference Property DmndSalonIntroSceneTriggerREF Auto
ObjectReference Property DmndStartMayorWallSceneTriggerREF Auto
ObjectReference Property IntroSceneUpperStandsTriggerREF Auto
ObjectReference Property IntroSceneValentinesStart Auto
ObjectReference Property DmndStartSceneTriggerREF Auto


;Function for clearing out all the entrance triggers and opens up the main gate
Function ClearUpEntrance()

	;open the gate
	DmndGateREF.Lock(False)
	DmndGateREF.SetOpen()

	;clear up Diamond City opening triggers
	DmndStartLongSceneTriggerREF.Disable()
	DmndStartSceneTriggerREF.Disable()
	DmndEntranceSetStage3TriggerREF.Disable()
	DmndEntranceSetStage40TriggerREF.Disable()
	DmndEntranceSetStage90TriggerREF.Disable()
	DmndSalonIntroSceneTriggerREF.Disable()
	DmndStartMayorWallSceneTriggerREF.Disable()
	IntroSceneUpperStandsTriggerREF.Disable()
	IntroSceneValentinesStart.Disable()

EndFunction