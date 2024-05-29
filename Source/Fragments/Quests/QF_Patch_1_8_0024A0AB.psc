;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_1_8_0024A0AB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE Patch_1_8_Script
Quest __temp = self as Quest
Patch_1_8_Script kmyQuest = __temp as Patch_1_8_Script
;END AUTOCAST
;BEGIN CODE
; 82928:
if Min01.GetStageDone(1500)
	WorkshopNPCScript jun = Alias_Jun.GetActorRef() as WorkshopNPCScript
	WorkshopNPCScript marcy = Alias_Marcy.GetActorRef() as WorkshopNPCScript
	kmyQuest.JunMarcyUnessential_1_8(jun, marcy)
endif

; anything else goes here:


; stop quest:
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Jun Auto Const Mandatory
ReferenceAlias Property Alias_Marcy Auto Const Mandatory

Quest Property Min01 Auto Const Mandatory
