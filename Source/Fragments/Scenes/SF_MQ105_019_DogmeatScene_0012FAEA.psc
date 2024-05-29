;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ105_019_DogmeatScene_0012FAEA Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
if NickValentine.GetActorRef().PlayIdleWithTarget(PairedDogmeatHumanGreetPetKneel, Dogmeat.GetActorRef())
  debug.trace(self + "Nick pets Dogmeat anim SUCCESSFUL")
Else
  debug.trace(self + "Nick pets Dogmeat anim FAILED")
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property PairedDogmeatHumanGreetPetKneel Auto Const

ReferenceAlias Property NickValentine Auto Const

ReferenceAlias Property Dogmeat Auto Const
