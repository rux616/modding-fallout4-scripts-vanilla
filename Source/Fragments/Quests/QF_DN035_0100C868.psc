;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN035_0100C868 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_RobotLeader.TryToEvaluatePackage()
Alias_Robot01.TryToEvaluatePackage()
Alias_Robot02.TryToEvaluatePackage()
Alias_Robot03.TryToEvaluatePackage()
Alias_Robot04.TryToEvaluatePackage()
Alias_Robot05.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Actor a = Alias_Robot01.GetActorRef()
if (a != None)
     a.SetValue(Aggression, 2)
     a.EvaluatePackage()
EndIf
a = Alias_Robot02.GetActorRef()
if (a != None)
     a.SetValue(Aggression, 2)
     a.EvaluatePackage()
EndIf
a = Alias_Robot03.GetActorRef()
if (a != None)
     a.SetValue(Aggression, 2)
     a.EvaluatePackage()
EndIf
a = Alias_Robot04.GetActorRef()
if (a != None)
     a.SetValue(Aggression, 2)
     a.EvaluatePackage()
EndIf
a = Alias_Robot05.GetActorRef()
if (a != None)
     a.SetValue(Aggression, 2)
     a.EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_RobotLeader Auto Const

ReferenceAlias Property Alias_Robot01 Auto Const

ReferenceAlias Property Alias_Robot02 Auto Const

ReferenceAlias Property Alias_Robot03 Auto Const

ReferenceAlias Property Alias_Robot04 Auto Const

ReferenceAlias Property Alias_Robot05 Auto Const

ActorValue Property Aggression Auto Const
