;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS07NickHateHandler_001989C6 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE MS07NickHateHandlerScript
Quest __temp = self as Quest
MS07NickHateHandlerScript kmyQuest = __temp as MS07NickHateHandlerScript
;END AUTOCAST
;BEGIN CODE
kmyquest.bEllieHatesPlayer = 1

if pMS07c.GetStageDone(10) && pMS07c.IsRunning()
  Utility.Wait(1.0)
  pCloseOutMS07cScene.Start()
  Utility.Wait(1.0)
  self.setstage(20)
else
  self.setstage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
pMS07.SetStage(500)
pMS07c.SetStage(500)

if MS07a.IsRunning()
  MS07a.SetStage(510)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pMS07 Auto Const

Quest Property pMS07c Auto Const

Scene Property pCloseOutMS07cScene Auto Const

Quest Property MS07a Auto Const
