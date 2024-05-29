;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Scenes:SF_DLC01Lair_MBattle_1200_Me_01001DB1 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_05_Begin
Function Fragment_Phase_05_Begin()
;BEGIN CODE
DLC01EyebotInteractVFX.Play(Alias_Spark.GetActorRef(), 2, DLC01Lair_MBattle_SparkRestorePowerTargetPoint)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_08_Begin
Function Fragment_Phase_08_Begin()
;BEGIN CODE
DLC01EyebotInteractVFX.Play(Alias_Spark.GetActorRef(), 3, DLC01Lair_MBattle_SparkRestorePowerTargetPoint)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

VisualEffect Property DLC01EyebotInteractVFX Auto Const Mandatory

ReferenceAlias Property Alias_Spark Auto Const

ObjectReference Property DLC01Lair_MBattle_SparkRestorePowerTargetPoint Auto Const Mandatory

Weapon Property WeapEyebot Auto Const Mandatory

Quest Property DLC01MQ05 Auto Const Mandatory
