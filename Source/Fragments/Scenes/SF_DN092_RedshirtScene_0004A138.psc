;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN092_RedshirtScene_0004A138 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
Alias_Redshirt.getReference().enable()
Alias_Raider_RoofKiller.GetReference().MoveTo(Alias_Raider_RoofKiller.GetReference())
Alias_redshirt.GetReference().MoveTo(Alias_redshirt.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN AUTOCAST TYPE DN092QuestScript
DN092QuestScript kmyQuest = GetOwningQuest() as DN092QuestScript
;END AUTOCAST
;BEGIN CODE
debug.trace("DN092 - spawning sneaky rooftop raider")
Alias_Raider_RoofKiller.getActorReference().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
debug.trace("DN092 - removing protected status from Minuteman Redshirt")
alias_redshirt.getActorReference().getActorBase().setProtected(false)
;alias_redshirt.getActorReference().setActorValue("health", 1)
alias_redshirt.GetReference().SetAngle(0,0,310)

Alias_Raider_RoofKiller.GetActorReference().PlayIdleWithTarget(PairedKillMacheteAttacker01, alias_redshirt.getActorReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
ReferenceAlias property Alias_Raider_RoofKiller auto const

ReferenceAlias Property Alias_Redshirt Auto Const

Idle Property PairedKillMacheteAttacker01 Auto Const
