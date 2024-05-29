;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01Tutorial_01011393 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Player has entered the Robot Workbench for the first time

if !self.GetStageDone(110)
   self.SetStage(110)
  if Game.UsingGamepad()
    DLC01TutorialRobotWorkbench01.ShowAsHelpMessage(asEvent100, 8, 0, 1, RobotModMenu, 98)
  else
    DLC01TutorialRobotWorkbench01_MK.ShowAsHelpMessage(asEvent100MK, 8, 0, 1, RobotModMenu, 98)
  endif

  if Game.UsingGamepad()
    DLC01TutorialRobotWorkbench02.ShowAsHelpMessage(asEvent100A, 8, 0, 1,  RobotModMenu, 98)
  else
    DLC01TutorialRobotWorkbench02_MK.ShowAsHelpMessage(asEvent100AMK, 8, 0, 1,  RobotModMenu, 98)
  endif

  if Game.UsingGamepad()
    DLC01TutorialRobotWorkbench03.ShowAsHelpMessage(asEvent100B, 8, 0, 1,  RobotModMenu, 98)
  else
    DLC01TutorialRobotWorkbench03_MK.ShowAsHelpMessage(asEvent100BMK, 8, 0, 1,  RobotModMenu, 98)
  endif

  if Game.UsingGamepad()
    DLC01TutorialRobotWorkbench04.ShowAsHelpMessage(asEvent100C, 8, 0, 1,  RobotModMenu, 98)
  else
    DLC01TutorialRobotWorkbench04_MK.ShowAsHelpMessage(asEvent100CMK, 8, 0, 1,  RobotModMenu, 98)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property DLC01TutorialRobotWorkbench01 Auto Const Mandatory
Message Property DLC01TutorialRobotWorkbench02 Auto Const Mandatory
Message Property DLC01TutorialRobotWorkbench03 Auto Const Mandatory
Message Property DLC01TutorialRobotWorkbench04 Auto Const Mandatory
Message Property DLC01TutorialRobotWorkbench01_MK Auto Const Mandatory
Message Property DLC01TutorialRobotWorkbench02_MK Auto Const Mandatory
Message Property DLC01TutorialRobotWorkbench03_MK Auto Const Mandatory
Message Property DLC01TutorialRobotWorkbench04_MK Auto Const Mandatory

String Property asEvent100 Auto Const
String Property asEvent100MK Auto Const
String Property asEvent100A Auto Const
String Property asEvent100AMK Auto Const
String Property asEvent100B Auto Const
String Property asEvent100BMK Auto Const
String Property asEvent100C Auto Const
String Property asEvent100CMK Auto Const
String Property ExamineMenu Auto Const
String Property RobotModMenu Auto Const
String Property InspectMode Auto Const

