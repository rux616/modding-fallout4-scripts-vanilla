;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname CreationClub:Fragments:Terminals:TERM_VRWorkshopShared_VRTerm_0024A3C5 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
VRWorkshopParent.ClearImageSpace()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
VRWorkshopParent.SetImageSpace(VRWorkshopShared_ImageSpace_Sepia)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
VRWorkshopParent.SetImageSpace(VRWorkshopShared_ImageSpace_BlackAndWhite)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
VRWorkshopParent.SetImageSpace(VRWorkshopShared_ImageSpace_Dreamstate)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CreationClub:VRWorkshops:VRWorkshopParentScript Property VRWorkshopParent Auto Const Mandatory
ImageSpaceModifier Property VRWorkshopShared_ImageSpace_BlackAndWhite Auto Const Mandatory
ImageSpaceModifier Property VRWorkshopShared_ImageSpace_Sepia Auto Const Mandatory
ImageSpaceModifier Property VRWorkshopShared_ImageSpace_Dreamstate Auto Const Mandatory
