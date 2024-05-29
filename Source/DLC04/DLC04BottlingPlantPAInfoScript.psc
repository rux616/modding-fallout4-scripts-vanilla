Scriptname DLC04:DLC04BottlingPlantPAInfoScript extends TopicInfo Const

int Property SceneNum = 1 Auto Const
bool Property LastTopicInfo = false Auto const

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	debug.Trace(Self + ": Running InfoEndScript")
	DLC04:DLC04_BottlingPlantPAScript parentScript = GetOwningQuest() as DLC04:DLC04_BottlingPlantPAScript
	;Tell the quest script to increment my sceneVar
	parentScript.IncrementSceneVar(SceneNum, LastTopicInfo)
EndEvent