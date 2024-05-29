;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Scenes:SF_DLC01MQ05_850_MechanistMa_01001D26 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
;Alias_Mechanist.GetActorRef().RegisterForAnimationEvent(Self, "EquipHelmet")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_05_Begin
Function Fragment_Phase_05_Begin()
;BEGIN CODE
;Play animation to remove helmet.
debug.trace(self + "Play animation")
Alias_Mechanist.GetActorRef().PlayIdle(Mechanist_helmet_removal)
Game.StopDialogueCamera()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN CODE
Alias_Mechanist.GetActorRef().SetAnimArchetypeNervous()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Mechanist Auto Const
Idle Property Mechanist_helmet_removal Auto Const
