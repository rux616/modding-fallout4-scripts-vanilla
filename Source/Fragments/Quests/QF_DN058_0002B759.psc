;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN058_0002B759 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
debug.Trace("DN058 Stage 0 set")
;Alias_AmbushRaider01.GetActorReference().SetValue(Aggression, 0)
;Alias_AmbushRaider02.GetActorReference().SetValue(Aggression, 0)
;Alias_AmbushRaider03.GetActorReference().SetValue(Aggression, 0)
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

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
debug.Trace("DN058 Stage 10 set")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;Set by trigger front door trigger, interior, if 10 is already set.
debug.Trace("DN058 Stage 15 set")
if (Alias_ChildRaider.GetActorReference()).IsDead()
    SetStage(30)
else
    (Alias_ChildRaider.GetReference()).MoveTo(Alias_ChildRaider.GetReference().GetLinkedRef(pLinkCustom02))
    (Alias_AmbushRaider01.GetReference()).MoveTo(Alias_AmbushRaider01.GetReference().GetLinkedRef(pLinkCustom01))
    (Alias_AmbushRaider02.GetReference()).MoveTo(Alias_AmbushRaider02.GetReference().GetLinkedRef(pLinkCustom01))
    (Alias_AmbushRaider03.GetReference()).MoveTo(Alias_AmbushRaider03.GetReference().GetLinkedRef(pLinkCustom01))
endif
;pDN058AmbushScene01.Stop()

;pDN058AmbushScene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0016_Item_00
Function Fragment_Stage_0016_Item_00()
;BEGIN CODE
utility.Wait(3)
Alias_DreadMusicActivator.GetReference().Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
Alias_DoorToBack.GetReference().SetOpen(FALSE)
Alias_FemaleRaiderNameChange.Clear()
SetStage(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;TEMP - Scenes have ended so bandits are angry again
debug.Trace("DN058 Stage 20 set")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
debug.Trace("DN058 Stage 30 set")
pDN058AmbushScene01.Stop()
pDN058AmbushScene02.Stop()
if Alias_ChildRaider.GetActorReference().IsDead() == 0
   SetStage(55)
    if Game.GetPlayer().GetParentCell() == Alias_ChildRaider.GetReference().GetParentCell()
        Alias_ChildRaider.GetReference().MoveTo(Alias_ChildRaider.GetReference().GetLinkedRef(LinkCustom04))
    endif
endif
;(Alias_ChildRaider.GetReference()).DisableNoWait()
(Alias_AmbushRaider01.GetReference()).MoveTo(Alias_AmbushRaider01.GetReference().GetLinkedRef(pLinkCustom01))
(Alias_AmbushRaider02.GetReference()).MoveTo(Alias_AmbushRaider02.GetReference().GetLinkedRef(pLinkCustom01))
(Alias_AmbushRaider03.GetReference()).MoveTo(Alias_AmbushRaider03.GetReference().GetLinkedRef(pLinkCustom01))
DN058AmbushScene02Alt.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
debug.Trace("DN058 Stage 40 set")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
debug.Trace("DN058 Stage 50 set")
DN058AmbushScene02Alt.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
Alias_ChildRaider.GetActorReference().RemoveFromFaction(DN058RaiderFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Alias_AmbushRaider01.GetActorReference().RemoveFromFaction(DN058RaiderFaction)
Alias_AmbushRaider02.GetActorReference().RemoveFromFaction(DN058RaiderFaction)
Alias_AmbushRaider03.GetActorReference().RemoveFromFaction(DN058RaiderFaction)
Alias_ChildRaider.GetActorReference().RemoveFromFaction(DN058RaiderFaction)
Game.GetPlayer().RemoveFromFaction(DN058RaiderFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
debug.Trace("DN058 Stage 100 set")
;Alias_ResetEnabler.GetReference().EnableNoWait()
Stop()
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

Scene Property DN058AmbushScene01 Auto Const

Scene Property DN058AmbushScene02 Auto Const

ReferenceAlias Property Alias_DoorToBack Auto Const

Scene Property DN058AmbushScene02Alt Auto Const

ActorValue Property Aggression Auto Const

Faction Property DN058RaiderFaction Auto Const

ReferenceAlias Property Alias_FemaleRaiderNameChange Auto Const

Keyword Property LinkCustom04 Auto Const

ReferenceAlias Property Alias_DreadMusicActivator Auto Const

ReferenceAlias Property Alias_ResetEnabler Auto Const
