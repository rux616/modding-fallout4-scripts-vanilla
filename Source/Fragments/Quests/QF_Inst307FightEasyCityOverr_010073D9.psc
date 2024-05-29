;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Inst307FightEasyCityOverr_010073D9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Turn off the radios and radio static markers at Easy City Downs to prevent
;interference with the Prydwen Crash.
int i = 0
While (i < Alias_EasyCityDownsRadios.GetCount())
     Alias_EasyCityDownsRadios.GetAt(i).SetRadioOn(False)
     i = i + 1
EndWhile
i = 0
While (i < Alias_EasyCityDownsRadioStatic.GetCount())
     Alias_EasyCityDownsRadioStatic.GetAt(i).DisableNoWait()
     i = i + 1
EndWhile

;Enable the Easy City Downs restart trigger.
DN035_EasyCityDownsRestartTriggerRef.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Restart the radios at Easy City Downs:
; - When the Easy City Downs restart trigger is entered or unloads (the player fast-travels away.)
; - If and only if Easy City Downs' quest is still running.
if (DN035.IsRunning())
     int i = 0
     While (i < Alias_EasyCityDownsRadios.GetCount())
          Alias_EasyCityDownsRadios.GetAt(i).SetRadioOn(True)
          i = i + 1
     EndWhile
     i = 0
     While (i < Alias_EasyCityDownsRadioStatic.GetCount())
          Alias_EasyCityDownsRadioStatic.GetAt(i).EnableNoWait()
          i = i + 1
     EndWhile
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_EasyCityDownsRadios Auto Const

RefCollectionAlias Property Alias_EasyCityDownsRadioStatic Auto Const

Quest Property DN035 Auto Const

ObjectReference Property DN035_EasyCityDownsRestartTriggerRef Auto Const
