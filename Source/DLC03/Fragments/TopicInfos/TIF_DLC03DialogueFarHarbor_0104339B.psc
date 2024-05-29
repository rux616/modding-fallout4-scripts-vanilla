;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_DLC03DialogueFarHarbor_0104339B Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Now play a message box to treat him

Int nInt = Game.GetPlayer().GetValue(pIntelligence) as Int
Bool bMedic02 = Game.GetPlayer().HasPerk(pMedic02)

int ButtonPressed = pDLC03TreatAndreMessage.Show()

If ButtonPressed == 1

	if ( nInt >= 8 || bMedic02 )
		GetOwningQuest().SetStage(110)  
		pDLC03TreatAndreMessageMedicFix.Show()
	else
		pDLC03TreatAndreMessageMedicFailed.Show()
	EndIf

elseif ButtonPressed == 2

	Game.GetPlayer().RemoveItem(pMS09LorenzoSerum)
	pDLC03TreatAndreMessageIntFix.Show()
	GetOwningQuest().SetStage(110)  

EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property pDLC03TreatAndreMessage Auto Const Mandatory
Message Property pDLC03TreatAndreMessageIntFix Auto Const Mandatory
Message Property pDLC03TreatAndreMessageMedicFix Auto Const Mandatory
Message Property pDLC03TreatAndreMessageMedicFailed Auto Const Mandatory

ActorValue Property pIntelligence Auto Const Mandatory

Perk Property pMedic02 Auto Const Mandatory

Potion Property pMS09LorenzoSerum Auto Const Mandatory
