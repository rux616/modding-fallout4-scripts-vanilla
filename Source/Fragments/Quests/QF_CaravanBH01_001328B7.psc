;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CaravanBH01_001328B7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Set the status of the Caravan to loitering
if ( Alias_CaravanLeader.GetActorRef() == Alias_DocWeathers.GetActorRef() )
   pCaravanDWCurrentStatus.SetValue(1)   
elseif ( Alias_CaravanLeader.GetActorRef() == Alias_Carla.GetActorRef() )
   pCaravanCarlaCurrentStatus.SetValue(1)   
elseif ( Alias_CaravanLeader.GetActorRef() == Alias_Cricket.GetActorRef() )
   pCaravanCricketCurrentStatus.SetValue(1)
else
   pCaravanLucasCurrentStatus.SetValue(1)
endif

; Evaluate everyone's package
Alias_CaravanLeader.GetActorRef().EvaluatePackage()
Alias_CaravanGuard01.GetActorRef().EvaluatePackage()
Alias_CaravanGuard02.GetActorRef().EvaluatePackage()
Alias_CaravanBrahmin.GetActorRef().EvaluatePackage()

Utility.Wait(0.5)

; Everyone is teleported to the right place
Alias_CaravanLeader.GetActorRef().MoveTo(pCaravanLeaderShopKeepFurniture)
Alias_CaravanGuard01.GetActorRef().MoveTo(pCaravanGuard01Marker)
Alias_CaravanGuard02.GetActorRef().MoveTo(pCaravanGuard02Marker)
Alias_CaravanBrahmin.GetActorRef().MoveTo(pBrahminMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Set the status of the Caravan to travelling
if ( Alias_CaravanLeader.GetActorRef() == Alias_DocWeathers.GetActorRef() )
   pCaravanDWCurrentStatus.SetValue(0)   
elseif ( Alias_CaravanLeader.GetActorRef() == Alias_Carla.GetActorRef() )
   pCaravanCarlaCurrentStatus.SetValue(0)   
elseif ( Alias_CaravanLeader.GetActorRef() == Alias_Cricket.GetActorRef() )
   pCaravanCricketCurrentStatus.SetValue(0)
else
   pCaravanLucasCurrentStatus.SetValue(0)
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CaravanLeader Auto Const

ObjectReference Property pCaravanLeaderShopKeepFurniture Auto Const

ReferenceAlias Property Alias_CaravanGuard01 Auto Const

ReferenceAlias Property Alias_CaravanGuard02 Auto Const

ReferenceAlias Property Alias_CaravanBrahmin Auto Const

ObjectReference Property pCaravanGuard01Marker Auto Const

ObjectReference Property pCaravanGuard02Marker Auto Const

ObjectReference Property pBrahminMarker Auto Const

ReferenceAlias Property Alias_DocWeathers Auto Const

GlobalVariable Property pCaravanDWCurrentStatus Auto Const

ReferenceAlias Property Alias_Carla Auto Const Mandatory

ReferenceAlias Property Alias_Cricket Auto Const Mandatory

ReferenceAlias Property Alias_LucasMiller Auto Const Mandatory

GlobalVariable Property pCaravanCarlaCurrentStatus Auto Const Mandatory

GlobalVariable Property pCaravanCricketCurrentStatus Auto Const Mandatory

GlobalVariable Property pCaravanLucasCurrentStatus Auto Const Mandatory
