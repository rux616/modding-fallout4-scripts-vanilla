;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSM01RadioVarham_000BACE9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Player is in range of Varham's pulser. Update BoSM01.
BoSM01.SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Player is in range of Astlin's pulser. Update BoSM01.
BoSM01.SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Player is in range of Faris' pulser. Update BoSM01.
BoSM01.SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;This quest no longer shuts down because the transmitters need to run indefinitely.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BoSM01RadioVarhamStation Auto Const

Quest Property BoSM01 Auto Const

ReferenceAlias Property Alias_TransmitterVarham Auto Const

ReferenceAlias Property Alias_TransmitterAstlin Auto Const

ReferenceAlias Property Alias_TransmitterFaris Auto Const

Scene Property BoSM01RadioFarisStation Auto Const

Scene Property BoSM01RadioAstlinStation Auto Const
