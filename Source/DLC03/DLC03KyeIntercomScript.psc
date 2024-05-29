Scriptname DLC03:DLC03KyeIntercomScript extends ReferenceAlias

Scene Property DLC03KyeDialogue_001 Auto Mandatory
Scene Property DLC03KyeDialogue_002 Auto Mandatory
ReferenceAlias Property NickValentine Auto Mandatory

Event OnActivate(ObjectReference akActionRef)
    Quest MyQuest = GetOwningQuest()

    If akActionRef == Game.GetPlayer()
    	If (MyQuest.GetStage() < 20) && (DLC03KyeDialogue_001.IsPlaying() == False) && (DLC03KyeDialogue_002.IsPlaying() == False)
    		If NickValentine.GetRef().GetDistance(akActionRef) <= 750
    			DLC03KyeDialogue_002.Start()
    		Else
    			DLC03KyeDialogue_001.Start()
    		EndIf
    	EndIf
    EndIf
EndEvent