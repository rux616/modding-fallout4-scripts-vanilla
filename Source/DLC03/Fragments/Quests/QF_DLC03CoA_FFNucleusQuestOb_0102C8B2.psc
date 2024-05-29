;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03CoA_FFNucleusQuestOb_0102C8B2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Have player read note once they pick it up
;Utility.Wait(0.1)
;Alias_FFNucleus02_AubertsNote.GetRef().Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
if !GetStageDone(70) && !GetStageDone(75)
  Alias_FFNucleus02_Footlocker.GetRef().RemoveItem(DLC03CoA_FFNucleus02_AubertsNote)

  ;Unlock the footlocker if it's still locked
  ObjectReference FL = Alias_FFNucleus02_Footlocker.GetRef()
  if FL.IsLocked()
    FL.Unlock()
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
;Clear the pump out of it's alias
if !DLC03Coa_FFNucleus03.GetStageDone(30)
  Alias_FFNucleus03_Pump.Clear()
endif

;Clear the FFNuc02 notes
Alias_FFNucleus02_EdgarsNote.Clear()
Alias_FFNucleus02_AubertsNote.Clear()

;Clear the Mother icon from alias
Alias_AtomM01_MotherIcon.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0760_Item_00
Function Fragment_Stage_0760_Item_00()
;BEGIN CODE
;Clear the pump out of it's alias
Alias_FFNucleus03_Pump.Clear()

;Clear the FFNuc02 notes
Alias_FFNucleus02_EdgarsNote.Clear()
Alias_FFNucleus02_AubertsNote.Clear()

;Clear the Mother icon from alias
Alias_AtomM01_MotherIcon.Clear()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_FFNucleus02_AubertsNote Auto Const Mandatory

Quest Property DLC03CoA_FFNucleus03 Auto Const Mandatory

ReferenceAlias Property Alias_FFNucleus03_Pump Auto Const Mandatory

ReferenceAlias Property Alias_FFNucleus02_EdgarsNote Auto Const Mandatory

ReferenceAlias Property Alias_AtomM01_MotherIcon Auto Const Mandatory

ReferenceAlias Property Alias_FFNucleus02_Footlocker Auto Const Mandatory

Book Property DLC03CoA_FFNucleus02_AubertsNote Auto Const Mandatory
