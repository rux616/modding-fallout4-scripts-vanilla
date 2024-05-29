;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Scenes:SF_DLC01_MechanistDoors_0100D64C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
;Stop VFX from playing.
DLC01EyebotInteractVFX.Stop(RobotCompanion.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
;Play the unlock VFX for companion robots.
Actor Source = RobotCompanion.GetActorReference()
ObjectReference Target = MechDoorControl.GetReference()
DLC01CreateABotInteractVFX.Play(Source, akFacingObject = Target)
DLC01QSTMSATDoorActivate.Play(Source)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN CODE
;Call back to the door control to have it open the door.
bool sourceIsPrimaryController = False
if ((MechDoorControl_Primary != None) && (MechDoorControl_Target != None))
     DLC01:DLC01_MechanistDoorControlScript primary = MechDoorControl_Primary.GetReference() as DLC01:DLC01_MechanistDoorControlScript
     ObjectReference target = MechDoorControl_Target.GetReference()
     if ((primary != None) && (target != None))
          primary.UseDoorControl((primary == target))
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN CODE
;Stop VFX from playing.
DLC01CreateABotInteractVFX.Stop(RobotCompanion.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

VisualEffect Property DLC01EyebotInteractVFX Auto Const

ReferenceAlias Property RobotCompanion Auto Const

ReferenceAlias Property MechDoorControl Auto Const

ReferenceAlias Property MechDoorControl_Primary Auto Const

ReferenceAlias Property MechDoorControl_Target Auto Const

VisualEffect Property DLC01CreateABotInteractVFX Auto Const Mandatory

Sound Property DLC01QSTMSATDoorActivate Auto Const Mandatory
