;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN103_001B1F99 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
ObjectReference MainKlaxon001Ref = Alias_MainKlaxon001.GetRef()
ObjectReference MainKlaxon002Ref = Alias_MainKlaxon002.GetRef()

MainKlaxon001Ref.Activate(MainKlaxon001Ref)
MainKlaxon002Ref.Activate(MainKlaxon002Ref)

SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
int i = 0
Actor myActor
while ( i < Alias_RobotTurretRefCol.GetCount())
     myActor = Alias_RobotTurretRefCol.GetAt(i) as Actor
     myActor.setValue(ProtectronPodStatus, 1)
     myActor.SetUnconscious(False)
     myActor.EvaluatePackage()
     i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_MainKlaxon001 Auto Const

ReferenceAlias Property Alias_MainKlaxon002 Auto Const

RefCollectionAlias Property Alias_RobotTurretRefCol Auto Const

ActorValue Property ProtectronPodStatus Auto Const
