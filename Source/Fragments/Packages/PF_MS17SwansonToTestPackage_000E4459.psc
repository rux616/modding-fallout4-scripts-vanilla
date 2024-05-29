;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_MS17SwansonToTestPackage_000E4459 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
; Make Swanson get out his clipboard
akActor.PlayIdle(pFurnitureWriting)

; Run the waiting for being seated scene
if ( !GetOwningQuest().GetStageDone(150) )
  pMS17_060_SwansonWaiting.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pMS17_060_SwansonWaiting Auto Const

Idle Property pFurnitureWriting Auto Const
