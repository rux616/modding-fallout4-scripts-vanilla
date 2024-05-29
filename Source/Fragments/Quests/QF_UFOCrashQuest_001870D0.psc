;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UFOCrashQuest_001870D0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;int UFOFlyBySoundInstance = QSTUFOCrashFlyby.play(Game.GetPlayer())  
;Sound.SetInstanceVolume(UFOFlyBySoundInstance, 1)
utility.Wait(4)
(Alias_UFOFlightHelper.GetReference().GetLinkedRef()).Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
utility.Wait(4)
UFOCrashQuestImpactReaction.Start()
;UFOCrashQuestFlybyReaction.Start()
;(Alias_UFOFlightHelper.GetReference().GetLinkedRef() as UFOActivatorScript).Crash()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_CrashStateEnabler.GetReference().DisableNoWait()
if TheTower.GetState() == "UpPosition"
    if TheTower.Receiver03.IsRadioOn()
  RelayTowerScript TowerScript = TheTower as RelayTowerScript
       TheTower.Transmitter03.EnableNoWait()
       TowerScript.UFOSetup()
    endif
endif
;UFOCrashQuestImpactReaction.Start()
;utility.Wait(10)
;Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CrashedUFO Auto Const

ReferenceAlias Property Alias_UFOtoTranslate Auto Const

ReferenceAlias Property Alias_UFOFlightHelper Auto Const

ReferenceAlias Property Alias_CrashStateEnabler Auto Const

sound Property QSTUFOCrashFlyby Auto Const

Scene Property UFOCrashQuestFlybyReaction Auto Const

Scene Property UFOCrashQuestImpactReaction Auto Const

RelayTowerScript Property TheTower Auto Const

Keyword Property LinkCustom01 Auto Const
