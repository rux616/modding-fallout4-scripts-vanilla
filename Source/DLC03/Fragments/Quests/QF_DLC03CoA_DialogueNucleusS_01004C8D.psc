;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03CoA_DialogueNucleusS_01004C8D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
DLC03CoA_DialogueNucleusSermon_Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0096_Item_00
Function Fragment_Stage_0096_Item_00()
;BEGIN CODE
Alias_GenericCoA04.GetActorRef().EvaluatePackage()
Alias_BrotherKane.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0097_Item_00
Function Fragment_Stage_0097_Item_00()
;BEGIN CODE
Alias_GenericCoA01.GetActorRef().EvaluatePackage()
Alias_GenericCoa03.GetActorRef().EvaluatePackage()
Alias_ZealotWare.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0098_Item_00
Function Fragment_Stage_0098_Item_00()
;BEGIN CODE
Alias_SisterMai.GetActorRef().EvaluatePackage()
Alias_GenericCoA02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN CODE
Alias_Archemist.GetActorRef().EvaluatePackage()
Alias_ZealotTheil.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC03CoA_DialogueNucleusSermon_Scene Auto Const

ReferenceAlias Property Alias_GenericCoA04 Auto Const Mandatory

ReferenceAlias Property Alias_BrotherKane Auto Const Mandatory

ReferenceAlias Property Alias_GenericCoA01 Auto Const Mandatory

ReferenceAlias Property Alias_GenericCoA03 Auto Const Mandatory

ReferenceAlias Property Alias_ZealotWare Auto Const Mandatory

ReferenceAlias Property Alias_SisterMai Auto Const Mandatory

ReferenceAlias Property Alias_GenericCoA02 Auto Const Mandatory

ReferenceAlias Property Alias_Archemist Auto Const Mandatory

ReferenceAlias Property Alias_ZealotTheil Auto Const Mandatory
