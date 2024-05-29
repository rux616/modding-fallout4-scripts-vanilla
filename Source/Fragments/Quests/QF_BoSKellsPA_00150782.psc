;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSKellsPA_00150782 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE BosKellsPAScript
Quest __temp = self as Quest
BosKellsPAScript kmyQuest = __temp as BosKellsPAScript
;END AUTOCAST
;BEGIN CODE
;Start timer to fire off scene
kmyquest.StartKellsPATimer()

;Get scene going
if !Game.GetPlayer().IsInScene() && KellsPABlocked.GetValue() == 0
  kmyquest.FireScene()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Close off victory speech
KellsPAVictoryOnce.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE BosKellsPAScript
Quest __temp = self as Quest
BosKellsPAScript kmyQuest = __temp as BosKellsPAScript
;END AUTOCAST
;BEGIN CODE
;Cancel timer
kmyquest.CancelKellsPATimer()

;Reset PA blocking var
KellsPABlocked.SetValue(0)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BoSKellsPA_Scene_001 Auto Const

GlobalVariable Property KellsPABlocked Auto Const

GlobalVariable Property KellsPAVictoryOnce Auto Const
