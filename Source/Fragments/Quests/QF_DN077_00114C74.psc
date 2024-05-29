;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN077_00114C74 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Alias_DrPenske.getReference().Moveto(DrPenskeMarker)
Alias_Katy.getReference().Moveto(AustinMarker)

pDN077Hydroponics.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_AlexisCombes.getReference().Moveto(AlexisMarker)
Alias_HoltCombes.getReference().Moveto(HoltMarker)

pDN077Depot.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
Alias_DrForsythe.getReference().Moveto(ForsytheMarker)
Alias_Overseer.getReference().Moveto(GuardMarker)

pDN077OverseerOffice.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
pDN077Hydroponics.Stop()
pDN077Depot.Stop()
pDN077OverseerOffice.Stop()


Alias_Katy.getReference().MovetoMyEditorLocation()
Alias_AlexisCombes.getReference().MovetoMyEditorLocation()
Alias_HoltCombes.getReference().MovetoMyEditorLocation()
Alias_DrForsythe.getReference().MovetoMyEditorLocation()
Alias_Overseer.getReference().MovetoMyEditorLocation()
Alias_DrPenske.getReference().MovetoMyEditorLocation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
pDN077KeycardObjectiveScene.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property AustinMarker Auto Const

ObjectReference Property DrPenskeMarker Auto Const

ObjectReference Property HoltMarker Auto Const

ObjectReference Property AlexisMarker Auto Const

ObjectReference Property ForsytheMarker Auto Const

ObjectReference Property GuardMarker Auto Const

ReferenceAlias Property Alias_DrPenske Auto Const

ReferenceAlias Property Alias_Austin Auto Const

ReferenceAlias Property Alias_AlexisCombes Auto Const

ReferenceAlias Property Alias_HoltCombes Auto Const

ReferenceAlias Property Alias_DrForsythe Auto Const

ReferenceAlias Property Alias_Guard Auto Const

Scene Property pDN077Hydroponics Auto Const

Scene Property pDN077Depot Auto Const

Scene Property pDN077OverseerOffice Auto Const


ReferenceAlias Property Alias_Katy Auto Const

ReferenceAlias Property Alias_Overseer Auto Const

Scene Property pDN077KeycardObjectiveScene Auto Const
