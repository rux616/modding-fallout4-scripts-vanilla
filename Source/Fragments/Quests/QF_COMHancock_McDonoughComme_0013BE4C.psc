;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_COMHancock_McDonoughComme_0013BE4C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
if COMHancock.GetStageDone(420)
  ;COMHancockMcDComment.SetValue(1)
  Utility.Wait(3.0)
  COMHancock_McDonoughComment_Scene.Start()
else 
  self.SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property COMHancock Auto Const

Scene Property COMHancock_McDonoughComment_Scene Auto Const

GlobalVariable Property COMHancockMcDComment Auto Const
