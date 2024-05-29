;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN035_EasyCityRadioOverri_001FB236 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Turn off the radios and radio static markers at Easy City Downs to prevent
;interference with the Prydwen Crash.
int i = 0
ObjectReference current
While (i < Alias_EasyCityDownsRadios.GetCount())
     current = Alias_EasyCityDownsRadios.GetAt(i)
     current.SetRadioOn(False)
     ;Debug.Trace("Disabling radio " + current)
     if ((current as EyebotRadioScript) != None)
          (current as EyebotRadioScript).bRadioOff = True
          current.OnLoad()
     EndIf
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
;Turn the radios back on.
int i = 0
ObjectReference current
While (i < Alias_EasyCityDownsRadios.GetCount())
     current = Alias_EasyCityDownsRadios.GetAt(i)
     current.SetRadioOn(True)
     ;Debug.Trace("Enabling radio " + current)
     if ((current as EyebotRadioScript) != None)
     	(current as EyebotRadioScript).bRadioOff = False
     	current.OnLoad()
     EndIf
     i = i + 1
EndWhile
i = 0
While (i < Alias_EasyCityDownsRadioStatic.GetCount())
     Alias_EasyCityDownsRadioStatic.GetAt(i).EnableNoWait()
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_EasyCityDownsRadios Auto Const

RefCollectionAlias Property Alias_EasyCityDownsRadioStatic Auto Const

Quest Property DN035 Auto Const

ObjectReference Property DN035_EasyCityDownsRestartTriggerRef Auto Const
