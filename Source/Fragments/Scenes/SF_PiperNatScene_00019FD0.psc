;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_PiperNatScene_00019FD0 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_05_End
Function Fragment_Phase_05_End()
;BEGIN CODE
;if PiperAlias.GetActorRef().PlayIdleWithTarget(pa_hugA, Nat.GetActorRef())
;   Debug.Trace(self + " Piper hugs Nat")
;else
;   Debug.Trace(self + "Function failed: Piper doesn't hug Nat")
;endIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property pa_HugA  Auto Const  

ReferenceAlias Property PiperAlias  Auto Const  

ReferenceAlias Property Nat  Auto Const  
