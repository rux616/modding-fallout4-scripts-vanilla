;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03CoA_DialogueNucleusV_010207EA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_DiaNucVictorySermonScript
Quest __temp = self as Quest
DLC03:DLC03CoA_DiaNucVictorySermonScript kmyQuest = __temp as DLC03:DLC03CoA_DiaNucVictorySermonScript
;END AUTOCAST
;BEGIN CODE
kmyquest.StartFailsafeTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0096_Item_00
Function Fragment_Stage_0096_Item_00()
;BEGIN CODE
Alias_GrandZealot.GetActorRef().EvaluatePackage()
Alias_GenericCoa02.GetActorRef().EvaluatePackage()
Alias_ZealotWare.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0097_Item_00
Function Fragment_Stage_0097_Item_00()
;BEGIN CODE
Alias_GenericPrayerMale01.GetActorRef().EvaluatePackage()
Alias_GenericCoA03.GetActorRef().EvaluatePackage()
Alias_ZealotTheil.GetActorRef().EvaluatePackage()
Alias_SisterMai.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0098_Item_00
Function Fragment_Stage_0098_Item_00()
;BEGIN CODE
Alias_BrotherKane.GetActorRef().EvaluatePackage()
Alias_GenericEntranceFemale.GetActorRef().EvaluatePackage()
Alias_SisterGwyneth.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN CODE
Alias_GenericCoA04.GetActorRef().EvaluatePackage()
Alias_GenericCoA01.GetActorRef().EvaluatePackage()
Alias_Archemist.GetActorRef().EvaluatePackage()
Alias_BrotherDevin.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03CoA_DiaNucVictorySermonScript
Quest __temp = self as Quest
DLC03:DLC03CoA_DiaNucVictorySermonScript kmyQuest = __temp as DLC03:DLC03CoA_DiaNucVictorySermonScript
;END AUTOCAST
;BEGIN CODE
;If still running, shut down fail safe timer
kmyquest.CancelFailsafeTimer()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_GrandZealot Auto Const Mandatory

ReferenceAlias Property Alias_GenericCoA02 Auto Const Mandatory

ReferenceAlias Property Alias_GenericPrayerMale01 Auto Const Mandatory

ReferenceAlias Property Alias_GenericCoA03 Auto Const Mandatory

ReferenceAlias Property Alias_ZealotTheil Auto Const Mandatory

ReferenceAlias Property Alias_SisterMai Auto Const Mandatory

ReferenceAlias Property Alias_BrotherKane Auto Const Mandatory

ReferenceAlias Property Alias_ZealotWare Auto Const Mandatory

ReferenceAlias Property Alias_GenericEntranceFemale Auto Const Mandatory

ReferenceAlias Property Alias_SisterGwyneth Auto Const Mandatory

ReferenceAlias Property Alias_GenericCoA01 Auto Const Mandatory

ReferenceAlias Property Alias_GenericCoA04 Auto Const Mandatory

ReferenceAlias Property Alias_Archemist Auto Const Mandatory

ReferenceAlias Property Alias_BrotherDevin Auto Const Mandatory
