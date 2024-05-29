;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN117_00082615 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Set player ownership on the three Workbenches in the Manor.
(DN127_SpectacleIslandManorWorkbenchBF as WorkshopScript).SetOwnedByPlayer(True)
(DN127_SpectacleIslandManorWorkbench1F as WorkshopScript).SetOwnedByPlayer(True)
(DN127_SpectacleIslandManorWorkbench2F as WorkshopScript).SetOwnedByPlayer(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;Clear player ownership on the three Workbenches in the Manor.
(DN127_SpectacleIslandManorWorkbenchBF as WorkshopScript).SetOwnedByPlayer(False)
(DN127_SpectacleIslandManorWorkbench1F as WorkshopScript).SetOwnedByPlayer(False)
(DN127_SpectacleIslandManorWorkbench2F as WorkshopScript).SetOwnedByPlayer(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set player ownership on the Workbench in the exterior.
(DN127_SpectacleIslandExteriorWorkbench as WorkshopScript).SetOwnedByPlayer(True)

;Open up the garage.
DN117_EnableGarageAccess_Enable.Enable()
DN117_EnableGarageAccess_Disable.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
;Clear player ownership on the Workbench in the exterior.
(DN127_SpectacleIslandExteriorWorkbench as WorkshopScript).SetOwnedByPlayer(False)

;Close the garage.
DN117_EnableGarageAccess_Enable.Disable()
DN117_EnableGarageAccess_Disable.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Enable the build.
DN117_EnableBuild01.Enable()
DN117_DisableBuild01.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
;Disable the build.
DN117_EnableBuild01.Disable()
DN117_DisableBuild01.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN127_SpectacleIslandManorWorkbench2F Auto Const

ObjectReference Property DN127_SpectacleIslandManorWorkbench1F Auto Const

ObjectReference Property DN127_SpectacleIslandManorWorkbenchBF Auto Const

ObjectReference Property DN127_SpectacleIslandExteriorWorkbench Auto Const

ObjectReference Property DN117_EnableGarageAccess_Disable Auto Const

ObjectReference Property DN117_EnableGarageAccess_Enable Auto Const

ObjectReference Property DN117_EnableBuild01 Auto Const

ObjectReference Property DN117_DisableBuild01 Auto Const
