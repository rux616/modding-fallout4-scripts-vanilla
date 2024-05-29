Scriptname DLC03:DLC03NickDiMAScenesScript extends Quest

Scene Property DLC03NickDiMAScenes_Neutral01 Auto Const Mandatory
Scene Property DLC03NickDiMAScenes_Neutral02 Auto Const Mandatory
Scene Property DLC03NickDiMAScenes_Neutral03 Auto Const Mandatory
Scene Property DLC03NickDiMAScenes_Neutral04 Auto Const Mandatory

Scene Property DLC03NickDiMAScenes_Family01 Auto Const Mandatory
Scene Property DLC03NickDiMAScenes_Family02 Auto Const Mandatory
Scene Property DLC03NickDiMAScenes_Family03 Auto Const Mandatory
Scene Property DLC03NickDiMAScenes_Family04 Auto Const Mandatory
Scene Property DLC03NickDiMAScenes_Family05 Auto Const Mandatory

GlobalVariable Property DLC03NickDiMAIsFamily Auto Const Mandatory
Quest Property DLC03DialogueDiMA Auto Const Mandatory
Quest Property DLC03MQ03 Auto Const Mandatory
Quest Property DLC03MQ05 Auto Const Mandatory

Int NeutralSceneCounter
Int FamilySceneCounter

;function to call in order to fire one of the scenes between DiMA and Nick
;there's a small, set number of these scenes, so just hardcoding it
Function PlayNickDiMAScene()
	;check to see if playing a scene is valid
	If (DLC03DialogueDiMA.GetStageDone(110) == 1) && (DLC03MQ03.GetStageDone(1000) == 1) && (DLC03MQ05.GetStageDone(120) == 0)

		;play the family scenes if Nick has accepted DiMA
		If DLC03NickDiMAIsFamily.GetValueInt() == 1
			If FamilySceneCounter == 0
				FamilySceneCounter = 1
				DLC03NickDiMAScenes_Family01.Start()
			ElseIf FamilySceneCounter == 1
				FamilySceneCounter = 2
				DLC03NickDiMAScenes_Family02.Start()
			ElseIf FamilySceneCounter == 2
				FamilySceneCounter = 3
				DLC03NickDiMAScenes_Family03.Start()
			ElseIf FamilySceneCounter == 3
				FamilySceneCounter = 4
				DLC03NickDiMAScenes_Family04.Start()
			ElseIf FamilySceneCounter == 4
				FamilySceneCounter = 5
				DLC03NickDiMAScenes_Family05.Start()
			EndIf
		;play the neutral scenes if Nick hasn't accepted DiMA yet
		Else
			If NeutralSceneCounter == 0
				NeutralSceneCounter = 1
				DLC03NickDiMAScenes_Neutral01.Start()
			ElseIf NeutralSceneCounter == 1
				NeutralSceneCounter = 2
				DLC03NickDiMAScenes_Neutral02.Start()
			ElseIf NeutralSceneCounter == 2
				NeutralSceneCounter = 3
				DLC03NickDiMAScenes_Neutral03.Start()
			ElseIf NeutralSceneCounter == 3
				NeutralSceneCounter = 4
				DLC03NickDiMAScenes_Neutral04.Start()
			EndIf
		EndIf
	EndIf
EndFunction