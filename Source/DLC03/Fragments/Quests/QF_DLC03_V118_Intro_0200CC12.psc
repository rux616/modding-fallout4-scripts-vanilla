;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03_V118_Intro_0200CC12 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Stage set on VaultDoorControl Alias via script.
;Enable the trigger that acts as the Intercom. 
;Sets a timer to wait for the player to finish playing the animation.
;Then starts up the scene.

Alias_Intercom.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;give the animation a second to finish
Utility.Wait(2.0)

;unblock door console
Alias_Intercom.GetRef().BlockActivation(False, False)

V118_IntercomInitial.Start()
debug.trace(self + " Scene Started")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN CODE
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC03:V118_IntroScript
Quest __temp = self as Quest
DLC03:V118_IntroScript kmyQuest = __temp as DLC03:V118_IntroScript
;END AUTOCAST
;BEGIN CODE
;Open the Vault door.
kmyQuest.OpenGearDoor()
MUSReveal.Add()

;Disable the Intercom so it can't be used again.
;Alias_Intercom.GetRef().Disable()

;SetObjectiveDisplayed(31, true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Intercom Auto Const Mandatory

MusicType Property MUSReveal Auto Const Mandatory

Scene Property V118_IntercomInitial Auto Const Mandatory
