;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__010221C4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
debug.Trace("DN058 Stage 0 set")
;Alias_AmbushRaider01.GetActorReference().SetAV("Aggression", 0)
;Alias_AmbushRaider02.GetActorReference().SetAV("Aggression", 0)
;Alias_AmbushRaider03.GetActorReference().SetAV("Aggression", 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
; Set when child raider has been sent the OnCellAttach() event
debug.Trace("DN058 Stage 5 set")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Set when Raider01 has been sent the OnCellAttach() event

;Stops first scene, moves child raider, starts second scene.
pDN058AmbushScene01.Stop()
(Alias_ChildRaider.GetReference()).MoveTo(Alias_ChildRaider.GetReference().GetLinkedRef(pLinkCustom02))
(Alias_AmbushRaider01.GetReference()).MoveTo(Alias_AmbushRaider01.GetReference().GetLinkedRef(pLinkCustom01))
(Alias_AmbushRaider02.GetReference()).MoveTo(Alias_AmbushRaider02.GetReference().GetLinkedRef(pLinkCustom01))
(Alias_AmbushRaider03.GetReference()).MoveTo(Alias_AmbushRaider03.GetReference().GetLinkedRef(pLinkCustom01))
pDN058AmbushScene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;TEMP - Scenes have ended so bandits are angry again
;Alias_AmbushRaider01.GetActorReference().SetAV("Aggression", 2)
;Alias_AmbushRaider02.GetActorReference().SetAV("Aggression", 2)
;Alias_AmbushRaider03.GetActorReference().SetAV("Aggression", 2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_ChildRaider Auto Const

Scene Property pDN058AmbushScene01 Auto Const

Scene Property pDN058AmbushScene02 Auto Const

Keyword Property pLinkCustom02 Auto Const

ReferenceAlias Property Alias_AmbushRaider01 Auto Const

ReferenceAlias Property Alias_AmbushRaider02 Auto Const

ReferenceAlias Property Alias_AmbushRaider03 Auto Const

Keyword Property pLinkCustom01 Auto Const
