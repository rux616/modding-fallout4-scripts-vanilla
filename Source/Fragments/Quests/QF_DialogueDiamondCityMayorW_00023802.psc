;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueDiamondCityMayorW_00023802 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
; run the scene unless Diamond City Intro has been killed
If pDialogueDiamondCityEntrance.GetStageDone(1000) == 0
  pMayorWallScene01.Start()
Else
  ;shutdown the quest if we're past needing this scene
  SetStage(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_GenericNPC01.GetActorRef().PlayIdleAction(ActionCustomCheering)
;Alias_GenericNPC02.GetActorRef().PlayIdleAction(ActionCustomCheering)
;Alias_GenericNPC03.GetActorRef().PlayIdleAction(ActionCustomCheering)
Alias_GenericNPC04.GetActorRef().PlayIdleAction(ActionCustomCheering)
Alias_GenericNPC05.GetActorRef().PlayIdleAction(ActionCustomCheering)

AudioMarkerMayorSpeech.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
AudioMarkerMayorSpeech.Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pMayorWallScene01 Auto Const

Quest Property pDialogueDiamondCityEntrance Auto Const

ReferenceAlias Property Alias_GenericNPC01 Auto Const

ReferenceAlias Property Alias_GenericNPC02 Auto Const

ReferenceAlias Property Alias_GenericNPC03 Auto Const

ReferenceAlias Property Alias_GenericNPC04 Auto Const

ReferenceAlias Property Alias_GenericNPC05 Auto Const

Action Property ActionCustomCheering Auto Const

ReferenceAlias Property Alias_GenericNPC06 Auto Const

ReferenceAlias Property Alias_GenericNPC07 Auto Const
ObjectReference Property AudioMarkerMayorSpeech Auto Const Mandatory
