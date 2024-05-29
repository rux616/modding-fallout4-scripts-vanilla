;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueInstituteShaunKid_00152BFD Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
ShaunAlias.GetReference().MoveTo(ShaunChildDeactivatedMarker)
ShaunAlias.GetReference().BlockActivation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
ShaunAlias.GetReference().BlockActivation(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
(ShaunAlias as DialogueInstituteShaunKidQuestScript).FirstConvDate = GameDay.GetValueInt()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
ShaunAlias.GetReference().BlockActivation(False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property ShaunAlias Auto Const

GlobalVariable Property GameDay Auto Const

ObjectReference Property ShaunChildDeactivatedMarker Auto Const
