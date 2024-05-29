;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:TopicInfos:TIF_DLC04MS03_0102EB66 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DLC04_GMMCandle01.PlayAnimation("Stage2")
DLC04_GMMCandle02.PlayAnimation("Stage2")
DLC04_GMMCandle03.PlayAnimation("Stage2")
DLC04_GMMCandle04.PlayAnimation("Stage2")
DLC04_GMMCandle05.PlayAnimation("Stage2")

utility.wait(1.0)

(DLC04_GMMGasCloud01 as TrapExplGas).GasExplode(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC04_GMMGasEnabler Auto Const Mandatory

ObjectReference Property DLC04_GMMCandle01 Auto Const Mandatory

ObjectReference Property DLC04_GMMCandle02 Auto Const Mandatory

ObjectReference Property DLC04_GMMCandle03 Auto Const Mandatory

ObjectReference Property DLC04_GMMCandle04 Auto Const Mandatory

ObjectReference Property DLC04_GMMCandle05 Auto Const Mandatory

ObjectReference Property DLC04_GMMGasCloud01 Auto Const Mandatory
