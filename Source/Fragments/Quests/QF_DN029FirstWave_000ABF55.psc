;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN029FirstWave_000ABF55 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
debug.Trace(self + "Stage 0 Set")
;debug.Notification("Spawning Started")
Alias_ScavengerAttacker01.GetActorReference().EnableNoWait()
Alias_ScavengerAttacker02.GetActorReference().EnableNoWait()
Alias_ScavengerAttacker03.GetActorReference().EnableNoWait()
Alias_ScavengerAttacker04.GetActorReference().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
debug.Trace(self + "Stage 500 Set")
;debug.Notification("Spawning Stopped")
Alias_ScavengerAttacker01.GetActorReference().StopCombat()
Alias_ScavengerAttacker02.GetActorReference().StopCombat()
Alias_ScavengerAttacker03.GetActorReference().StopCombat()
Alias_ScavengerAttacker04.GetActorReference().StopCombat()
Alias_ScavengerAttacker01.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker02.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker03.GetActorReference().EvaluatePackage()
Alias_ScavengerAttacker04.GetActorReference().EvaluatePackage()
utility.Wait(3)
MS11.SetStage(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
debug.Trace(self + "Stage 1000 Set")
Alias_ScavengerAttacker01.GetActorReference().Disable()
Alias_ScavengerAttacker02.GetActorReference().Disable()
Alias_ScavengerAttacker03.GetActorReference().Disable()
Alias_ScavengerAttacker04.GetActorReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_ScavengerAttacker01 Auto Const

ReferenceAlias Property Alias_ScavengerAttacker02 Auto Const

ReferenceAlias Property Alias_ScavengerAttacker03 Auto Const

ReferenceAlias Property Alias_ScavengerAttacker04 Auto Const

Quest Property MS11 Auto Const
