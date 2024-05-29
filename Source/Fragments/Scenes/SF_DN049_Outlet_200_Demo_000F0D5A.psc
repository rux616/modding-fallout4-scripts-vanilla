;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN049_Outlet_200_Demo_000F0D5A Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN CODE
DN049_Outlet_HandyPodActivator.Activate(Alias_Outlet_Sprocket.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN049_Outlet_HandyPodActivator Auto Const

ReferenceAlias Property Alias_Outlet_Sprocket Auto Const
