;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_RR201PatriotToZ114Package_000D40AE Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
float nPlayerDist = Game.GetPlayer().GetDistance(pLiamBinetRef)
float nZ1Dist = pZ1_14Ref.GetDistance(pLiamBinetRef)

; If the player AND Z1-14 are nearby start a scene
if ( nPlayerDist < 600 && nZ1Dist < 600)
  pRR201_0350_MeetZ1.Start()
else
  ; Flag that Liam has arrived
  GetOwningQuest().SetStage(325)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pRR201_0350_MeetZ1 Auto Const

ObjectReference Property pLiamBinetRef Auto Const

ObjectReference Property pZ1_14Ref Auto Const
