;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ207ChildDeactivateScene_0005C31E Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
MQ207ShaunDoor01.SetOpen()
MQ207ShaunDoor01.Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN CODE
(DialogueInstitute as DialogueInstituteQuestScript).ShaunDeactivated=1
ShaunChild.GetActorRef().EvaluatePackage()
ShaunChild.GetRef().BlockActivation()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property MQ207ShaunDoor01 Auto Const

Quest Property DialogueInstitute Auto Const

ReferenceAlias Property ShaunChild Auto Const
