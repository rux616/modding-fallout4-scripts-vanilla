;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01MQPostQuestRadiant_01003E8D_1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Clears Isabel alias if player has killed her so corpse despawns
Alias_Mechanist.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Clears Isabel alias if player has killed her so corpse despawns
Alias_Mechanist.Clear()

;Enable Ada's global so she can give radiant quests.
DLC01MQPostQuestRadiantsEnabledMechanist.SetValue(0)
DLC01MQPostQuestRadiantsEnabledAda.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Mechanist Auto Const Mandatory

GlobalVariable Property DLC01MQPostQuestRadiantsEnabledAda Auto Const Mandatory

GlobalVariable Property DLC01MQPostQuestRadiantsEnabledMechanist Auto Const Mandatory
