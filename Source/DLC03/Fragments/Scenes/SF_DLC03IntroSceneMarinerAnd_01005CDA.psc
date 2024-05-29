;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DLC03IntroSceneMarinerAnd_01005CDA Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
; Globals tracking what happened to the Nuclues
int nTest1 = pDLC03MQ06_ConfessorReplaced.GetValue() as Int
int nTest2 = pDLC03MQ06_NucleusDestroyed.GetValue() as Int

; Have the Children of Atom been dealth with?
if ( nTest1 > 0 || nTest2 > 0 )
  GetOwningQuest().SetStage(100)  ; If so, kill this scene
  Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pDLC03MQ06_NucleusDestroyed Auto Const Mandatory

GlobalVariable Property pDLC03MQ06_ConfessorReplaced Auto Const Mandatory
