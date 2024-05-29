;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01BotModQuest_0100416C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if (co_DLC01Bot_Arm_Assaultron_Global.GetValue() != 1)
    co_DLC01Bot_Arm_Assaultron_Global.SetValue(1)
    DLC01Bot_Arm_Assaultron_Chance.SetValue(100)
    DLC01BotModMessage.Show()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
if (co_DLC01Bot_Arm_Protectron_Global.GetValue() != 1)
    co_DLC01Bot_Arm_Protectron_Global.SetValue(1)
    co_DLC01Bot_Arm_Protectron_ChanceNone.SetValue(100)
    DLC01BotModMessage.Show()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
if (co_DLC01Bot_Arm_RoboBrain_Global.GetValue() != 1)
    co_DLC01Bot_Arm_RoboBrain_Global.SetValue(1)
    co_DLC01Bot_Arm_RoboBrain_ChanceNone.SetValue(100)
    DLC01BotModMessage.Show()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
if (co_DLC01Bot_Arm_Sentry_Global.GetValue() != 1)
    co_DLC01Bot_Arm_Sentry_Global.SetValue(1)
    co_DLC01Bot_Arm_Sentry_ChanceNone.SetValue(100)
    DLC01BotModMessage.Show()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property co_DLC01Bot_Arm_Assaultron_Global Auto Const Mandatory

Message Property DLC01BotModMessage Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Arm_Protectron_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Arm_RoboBrain_Global Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Arm_Sentry_Global Auto Const Mandatory

GlobalVariable Property DLC01Bot_Arm_Assaultron_Chance Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Arm_Protectron_ChanceNone Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Arm_RoboBrain_ChanceNone Auto Const Mandatory

GlobalVariable Property co_DLC01Bot_Arm_Sentry_ChanceNone Auto Const Mandatory
