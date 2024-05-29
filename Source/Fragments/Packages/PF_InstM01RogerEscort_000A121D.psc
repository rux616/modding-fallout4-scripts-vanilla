;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_InstM01RogerEscort_000A121D Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(Actor akActor)
;BEGIN CODE
;Block activation on Roger while he does tour
RogerWarwickRef.BlockActivation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Change
Function Fragment_Change(Actor akActor)
;BEGIN CODE
;Unblock activation on Roger when tour ends
RogerWarwickRef.BlockActivation(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
GetOwningQuest().SetStage(550)

;Unblock activation on Roger when tour ends
RogerWarwickRef.BlockActivation(False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property RogerWarwickRef Auto Const
