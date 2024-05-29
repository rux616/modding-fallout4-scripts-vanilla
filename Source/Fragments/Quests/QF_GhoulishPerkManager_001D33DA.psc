;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_GhoulishPerkManager_001D33DA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
debug.trace(self + " STARTING")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
debug.trace(self + " ALLY START COMBAT")
; set reset timer
Ghoulish03PerkCurrentResetTime.SetValue(GameDaysPassed.GetValue() + Ghoulish03PerkResetDays.GetValue())
Actor ghoulAlly = Alias_GhoulAlly.GetActorRef()

; add "don't attack player" actor value first
ghoulAlly.SetValue(IgnorePlayerWhileFrenzied, 1)
PerkGhoulishMsg.Show()
; frenzy ally
ghoulAlly.SetValue(Aggression, 3)
; stop combat so they aggro on someone else
ghoulAlly.StopCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
debug.trace(self + " ALLY DIED")
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
debug.trace(self + " ALLY UNLOADED")
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
debug.trace(self + " STOPPING")
; TO DO - any cleanup needed
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Corpse01 Auto Const

RefCollectionAlias Property Alias_Vultures Auto Const

RefCollectionAlias Property Alias_Corpses Auto Const

GlobalVariable Property Ghoulish03PerkCurrentResetTime Auto Const

GlobalVariable Property Ghoulish03PerkResetHours Auto Const

GlobalVariable Property GameDaysPassed Auto Const

GlobalVariable Property Ghoulish03PerkResetDays Auto Const

ReferenceAlias Property Alias_GhoulAlly Auto Const

ActorValue Property Aggression Auto Const

Message Property PerkGhoulishMsg Auto Const

ActorValue Property IgnorePlayerWhileFrenzied Auto Const Mandatory
