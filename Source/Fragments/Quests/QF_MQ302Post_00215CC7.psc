;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ302Post_00215CC7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
if MQ302Faction.GetValue()==1
	Maxson.GetReference().MoveTo(PrydwenMarker.GetReference())
	MQ302BoS.Stop()
elseif MQ302Faction.GetValue()==2
	if Preston.GetActorReference().IsInFaction(CurrentCompanionFaction)==0
		Preston.GetReference().MoveTo(CastleMarker.GetReference())
	endif
; 	KMK - taking this out, MQ302Min handles stopping itself after Sturges gives you the reward gun
;	MQ302Min.Stop()
	MQ302Min.SetStage(2000)
elseif MQ302Faction.GetValue()==3
	Desdemona.GetReference().Moveto(RRHQMarker.GetReference())
	Z1.GetReference().Disable()
	MQ302RR.Stop()
endif
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property MQ302Faction Auto Const

ReferenceAlias Property Maxson Auto Const

ReferenceAlias Property Preston Auto Const

ReferenceAlias Property Desdemona Auto Const

ReferenceAlias Property CastleMarker Auto Const

ReferenceAlias Property PrydwenMarker Auto Const

ReferenceAlias Property RRHQMarker Auto Const

Faction Property CurrentCompanionFaction Auto Const

ReferenceAlias Property Z1 Auto Const

Quest Property MQ302BoS Auto Const Mandatory

Quest Property MQ302Min Auto Const Mandatory

Quest Property MQ302RR Auto Const Mandatory
