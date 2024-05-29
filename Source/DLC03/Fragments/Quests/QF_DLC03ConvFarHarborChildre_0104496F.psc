;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03ConvFarHarborChildre_0104496F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Move Allen and Captain Avery to their spots
if ( !pDLC03FarHarborS02.GetStageDone(200) )    ; This quest is cut off after Turn Back the Fog
  Alias_AllenLee.GetActorRef().MoveTo(pDLC03ChildrenExecutionMarker_Allen)
  Alias_CaptainAvery.GetActorRef().MoveTo(pDLC03ChildrenExecutionMarker_Avery)

  ; Enable the Children of Atom Saboteur
  Alias_ChildrenSaboteur.GetActorRef().MoveTo(pDLC03ChildrenExecutionMarker_Saboteur)
  Alias_ChildrenSaboteur.GetActorRef().Enable()
else
  SetStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Set up saboteur
Actor aTarg = Alias_ChildrenSaboteur.GetActorRef()
aTarg.GetActorBase().SetProtected(FALSE)
aTarg.GetActorBase().SetEssential(FALSE)
aTarg.SetValue(pHealth, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Make Allen react to saboteur's death
Alias_AllenLee.GetActorRef().EvaluatePackage()

; Get the scenes working
pDLC03ConvFarHarborChildrenExecution_01.Stop()
pDLC03ConvFarHarborChildrenExecution_02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
if ( !GetStageDone(200) )   ; Is the saboteur alive?
  Alias_ChildrenSaboteur.GetActorRef().Disable()   ; Then make sure to disable her
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_AllenLee Auto Const Mandatory

ReferenceAlias Property Alias_CaptainAvery Auto Const Mandatory

ObjectReference Property pDLC03ChildrenExecutionMarker_Avery Auto Const Mandatory

ObjectReference Property pDLC03ChildrenExecutionMarker_Allen Auto Const Mandatory

ReferenceAlias Property Alias_ChildrenSaboteur Auto Const Mandatory

ActorValue Property pHealth Auto Const Mandatory

Faction Property pChildrenOfAtomFaction Auto Const Mandatory

ObjectReference Property pDLC03ChildrenExecutionMarker_Saboteur Auto Const Mandatory

Scene Property pDLC03ConvFarHarborChildrenExecution_02 Auto Const Mandatory

Scene Property pDLC03ConvFarHarborChildrenExecution_01 Auto Const Mandatory

Quest Property pDLC03FarHarborS02 Auto Const Mandatory
