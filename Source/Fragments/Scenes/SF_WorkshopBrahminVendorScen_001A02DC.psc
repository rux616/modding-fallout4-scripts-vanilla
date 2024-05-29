;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_WorkshopBrahminVendorScen_001A02DC Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN AUTOCAST TYPE workshopparentscript
workshopparentscript kmyQuest = GetOwningQuest() as workshopparentscript
;END AUTOCAST
;BEGIN CODE
(Alias_BrahminVendor.GetActorRef() as REBrahminVendorScript).SellBrahmin()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BrahminVendor Auto Const
