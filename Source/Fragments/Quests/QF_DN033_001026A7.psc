;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN033_001026A7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Quest Start
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
if(getStageDone(100))
   ;player has already picked up the holotape from PM4
   setStage(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
DN033_LightScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
DN033_CircuitBreakerScript myBreakerMaster = Breaker01Master as DN033_CircuitBreakerScript
if(myBreakerMaster.OnPosition == FALSE)
    Breaker01.Activate(Alias_LightRaider01a.getActorRef())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
DN033_LightScene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
DN033_CircuitBreakerScript myBreakerMaster = Breaker02Master as DN033_CircuitBreakerScript
if(myBreakerMaster.OnPosition == TRUE)
    Breaker02.Activate(Alias_LightRaider02a.getActorRef())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
Alias_LightRaider02a.getActorRef().setValue(Suspicious, 2)
Alias_LightRaider02a.getActorRef().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if(getStageDone(25))
   ;player has already picked up the key
   setStage(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Alias_PM1.Clear()
Alias_PM2.Clear()
Alias_PM3.Clear()
Alias_PM4.Clear()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DN033_FireAt Auto Const

Scene Property DN033_BrokenThrough Auto Const

ReferenceAlias Property Alias_BarricadeMarker Auto Const

Scene Property DN033_LightScene01 Auto Const

ObjectReference Property Breaker01 Auto Const

ObjectReference Property Breaker01Master Auto Const

ReferenceAlias Property Alias_LightRaider01a Auto Const

ObjectReference Property Breaker02 Auto Const

ObjectReference Property Breaker02Master Auto Const

ReferenceAlias Property Alias_LightRaider02a Auto Const

Scene Property DN033_LightScene02 Auto Const

ActorValue Property Suspicious Auto Const

ReferenceAlias Property Alias_PM1 Auto Const

ReferenceAlias Property Alias_PM2 Auto Const

ReferenceAlias Property Alias_PM3 Auto Const

ReferenceAlias Property Alias_PM4 Auto Const
