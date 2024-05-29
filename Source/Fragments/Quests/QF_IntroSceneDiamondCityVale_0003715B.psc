;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_IntroSceneDiamondCityVale_0003715B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
If MQ104.GetStage() < 50
  ;always make sure Nick has been moved
  Alias_Nick.GetActorRef().Moveto(MQ104NickCaptiveMarker)
Else
  Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property MQ104NickCaptiveMarker Auto Const

ReferenceAlias Property Alias_Nick Auto Const

Quest Property MQ104 Auto Const

Scene Property ValentinesIntroSceneStart Auto Const
