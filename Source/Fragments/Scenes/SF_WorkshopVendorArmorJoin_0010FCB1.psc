;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_WorkshopVendorArmorJoin_0010FCB1 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE workshopparentscript
workshopparentscript kmyQuest = GetOwningQuest() as workshopparentscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddPermanentActorToWorkshopPlayerChoice(WorkshopVendorArmor.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property WorkshopVendorArmor Auto Const
