;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS13ThugsPhoto_0008B679 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; put them in the aggro faction for Cooke and Latimer
int i = 0
while i < Alias_Thugs.GetCount()
	(Alias_Thugs.GetAt(i) as Actor).AddToFaction(MS13ThugPhotoFaction)
	i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
RefCollectionAlias Property Alias_Thugs Auto Const

Faction Property MS13ThugPhotoFaction Auto Const
