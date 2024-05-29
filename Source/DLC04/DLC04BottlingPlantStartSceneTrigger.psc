Scriptname DLC04:DLC04BottlingPlantStartSceneTrigger extends ObjectReference Const


DLC04_BottlingPlantPAScript Property DLC04_BottlingPlantPA Auto Const Mandatory
int Property SceneNumber = 1 Auto Const

Event OnTriggerEnter(ObjectReference akActionRef)
    if DLC04_BottlingPlantPA.isRunning()
    	DLC04_BottlingPlantPA.QueueSceneStart(SceneNumber)
    endif
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
    if DLC04_BottlingPlantPA.isRunning()
    	DLC04_BottlingPlantPA.QueueSceneStop(SceneNumber)
    endif
EndEvent