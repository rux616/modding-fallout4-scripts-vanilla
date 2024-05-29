;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFDiamondCity07FIN_0009F09F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE FFDiamondCity07FINScript
Quest __temp = self as Quest
FFDiamondCity07FINScript kmyQuest = __temp as FFDiamondCity07FINScript
;END AUTOCAST
;BEGIN CODE
;wait for player to enter Diamond City to pop objectives
kmyquest.RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")

;paper is available, remove articles we don't need
Actor NatREF = Alias_Nat.GetActorRef()
If FFDiamondCity07.var_VaultLife == 1
  NatREF.RemoveItem(Alias_Pubick_Interview_01B.GetRef())
  NatREF.RemoveItem(Alias_Pubick_Interview_01C.GetRef())
ElseIf FFDiamondCity07.var_VaultLife == 2
  NatREF.RemoveItem(Alias_Pubick_Interview_01A.GetRef())
  NatREF.RemoveItem(Alias_Pubick_Interview_01C.GetRef())
ElseIf FFDiamondCity07.var_VaultLife == 3
  NatREF.RemoveItem(Alias_Pubick_Interview_01A.GetRef())
  NatREF.RemoveItem(Alias_Pubick_Interview_01B.GetRef())
EndIf

If FFDiamondCity07.var_Commonwealth == 1
  NatREF.RemoveItem(Alias_Pubick_Interview_02B.GetRef())
  NatREF.RemoveItem(Alias_Pubick_Interview_02C.GetRef())
  NatREF.RemoveItem(Alias_Pubick_Interview_02D.GetRef())
ElseIf FFDiamondCity07.var_Commonwealth == 2
  NatREF.RemoveItem(Alias_Pubick_Interview_02A.GetRef())
  NatREF.RemoveItem(Alias_Pubick_Interview_02C.GetRef())
  NatREF.RemoveItem(Alias_Pubick_Interview_02D.GetRef())
ElseIf FFDiamondCity07.var_Commonwealth == 3
  NatREF.RemoveItem(Alias_Pubick_Interview_02A.GetRef())
  NatREF.RemoveItem(Alias_Pubick_Interview_02B.GetRef())
  NatREF.RemoveItem(Alias_Pubick_Interview_02D.GetRef())
ElseIf FFDiamondCity07.var_Commonwealth == 4
  NatREF.RemoveItem(Alias_Pubick_Interview_02A.GetRef())
  NatREF.RemoveItem(Alias_Pubick_Interview_02B.GetRef())
  NatREF.RemoveItem(Alias_Pubick_Interview_02C.GetRef())
EndIf

If FFDiamondCity07.var_LastWords == 1
  NatREF.RemoveItem(Alias_Pubick_Interview_03B.GetRef())
  NatREF.RemoveItem(Alias_Pubick_Interview_03C.GetRef())
ElseIf FFDiamondCity07.var_LastWords == 2
  NatREF.RemoveItem(Alias_Pubick_Interview_03A.GetRef())
  NatREF.RemoveItem(Alias_Pubick_Interview_03C.GetRef())
ElseIf FFDiamondCity07.var_LastWords == 3
  NatREF.RemoveItem(Alias_Pubick_Interview_03A.GetRef())
  NatREF.RemoveItem(Alias_Pubick_Interview_03B.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Utility.Wait(2.0)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
If FFDiamondCity07.var_VaultLife == 1
  PlayerREF.AddItem(Alias_Pubick_Interview_01A.GetRef())
ElseIf FFDiamondCity07.var_VaultLife == 2
  PlayerREF.AddItem(Alias_Pubick_Interview_01B.GetRef())
ElseIf FFDiamondCity07.var_VaultLife == 3
  PlayerREF.AddItem(Alias_Pubick_Interview_01C.GetRef())
EndIf

If FFDiamondCity07.var_Commonwealth == 1
  PlayerREF.AddItem(Alias_Pubick_Interview_02A.GetRef())
ElseIf FFDiamondCity07.var_Commonwealth == 2
  PlayerREF.AddItem(Alias_Pubick_Interview_02B.GetRef())
ElseIf FFDiamondCity07.var_Commonwealth == 3
  PlayerREF.AddItem(Alias_Pubick_Interview_02C.GetRef())
ElseIf FFDiamondCity07.var_Commonwealth == 4
  PlayerREF.AddItem(Alias_Pubick_Interview_02D.GetRef())
EndIf

If FFDiamondCity07.var_LastWords == 1
  PlayerREF.AddItem(Alias_Pubick_Interview_03A.GetRef())
ElseIf FFDiamondCity07.var_LastWords == 2
  PlayerREF.AddItem(Alias_Pubick_Interview_03B.GetRef())
ElseIf FFDiamondCity07.var_LastWords == 3
  PlayerREF.AddItem(Alias_Pubick_Interview_03C.GetRef())
EndIf

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FFDiamondCity07Script Property FFDiamondCity07 Auto Const

ReferenceAlias Property Alias_Pubick_Interview_01A Auto Const

ReferenceAlias Property Alias_Pubick_Interview_01B Auto Const

ReferenceAlias Property Alias_Pubick_Interview_01C Auto Const

ReferenceAlias Property Alias_Pubick_Interview_02A Auto Const

ReferenceAlias Property Alias_Pubick_Interview_02B Auto Const

ReferenceAlias Property Alias_Pubick_Interview_02C Auto Const

ReferenceAlias Property Alias_Pubick_Interview_02D Auto Const

ReferenceAlias Property Alias_Pubick_Interview_03A Auto Const

ReferenceAlias Property Alias_Pubick_Interview_03B Auto Const

ReferenceAlias Property Alias_Pubick_Interview_03C Auto Const

ReferenceAlias Property Alias_Nat Auto Const
