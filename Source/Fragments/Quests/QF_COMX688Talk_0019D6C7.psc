;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_COMX688Talk_0019D6C7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE comx688talkscript
Quest __temp = self as Quest
comx688talkscript kmyQuest = __temp as comx688talkscript
;END AUTOCAST
;BEGIN CODE
; Register for teleport events for X6
TeleportActorScript X6 = Alias_X6.GetActorRef() as TeleportActorScript
kmyQuest.RegisterForCustomEvent(x6, "TeleportDone")

;Register for change location events
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
debug.trace(self + "Stage10 start")
COMX688.SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
; X6 teleports away
; If he's in the Institue and his home location is on the surface, a global called 
; CompanionX6TeleportDestination will be set to 2 and then he teleports to a surface marker
; If he's on the surface and his home location is in the Institute, the same variable gets set to 1
; and he'll teleport into the SRB
; The is handled in the quest scritp where X6 will monitor for teleport events being done, and then he 
; gets moved afte being disabled by the teleport
; X6 gets re-enabled by a change location even on the player alias script

TeleportActorScript courser = Alias_X6.GetActorRef() as TeleportActorScript
courser.TeleportOut()
CompanionX6Disabled.SetValue(1)

; NOTE: The CompanionX6Disabled global is used in the quest script for this quest.
; If that global is set to 1 when the player changes location to the Institute when the TeleportDestination 
; global variable is set to 1, then X6 will be enabled and the value will be set back to zero.
; If the lpayer changes location to a location that is not a child of InstituteLocation, and the 
; TeleportDestination global is set to 2, the same thing will happen
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Enable X6 and set the TeleportDestination variable to zero
Alias_X6.GetActorRef().Enable()
CompanionX6TeleportDestination.SetValue(0)
CompanionX6Disabled.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property COMX688 Auto Const

ObjectReference Property Inst301PorterWait Auto Const

ReferenceAlias Property Alias_X6 Auto Const

GlobalVariable Property CompanionX6Disabled Auto Const

Location Property InstituteLocation Auto Const

Location Property InstituteSRBLocation Auto Const Mandatory

GlobalVariable Property CompanionX6TeleportedToInstitute Auto Const Mandatory

Scene Property COMX688Talk_TeleportHomeScene Auto Const Mandatory

GlobalVariable Property CompanionX6TeleportDestination Auto Const Mandatory
