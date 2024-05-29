Scriptname DLC03:DLC03NickNearDiMATriggerScript extends ObjectReference

Quest Property DLC03NickDiMAScenes Auto Const Mandatory
Int SceneExhuastedUntilReload

Event OnTriggerEnter(ObjectReference akActionRef)
	;the trigger has an interaction condition so that only Nick Valentine fires this
	;if the quest handler is running, fire the function that handles the scenes
	If DLC03NickDiMAScenes.IsRunning()
		;only fire this once each time the cell is loaded
		If SceneExhuastedUntilReload == 0
			SceneExhuastedUntilReload = 1
			(DLC03NickDiMAScenes as DLC03NickDiMAScenesScript).PlayNickDiMAScene()
		EndIf
	EndIf
EndEvent

;when the trigger unloads, we can play another scene the next time Nick enters
Event OnUnload()
	SceneExhuastedUntilReload=0
EndEvent