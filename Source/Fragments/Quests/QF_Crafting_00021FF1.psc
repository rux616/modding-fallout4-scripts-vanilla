;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Crafting_00021FF1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CraftingScript
Quest __temp = self as Quest
CraftingScript kmyQuest = __temp as CraftingScript
;END AUTOCAST
;BEGIN CODE
;DEBUG STAGE ONLY
debug.trace("Removing Component Level Perks")
kmyquest.ResetComponentLevels()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE CraftingScript
Quest __temp = self as Quest
CraftingScript kmyQuest = __temp as CraftingScript
;END AUTOCAST
;BEGIN CODE
;DEBUG STAGE ONLY
debug.trace("Unlocking Advanced Property for Type Chemical ")
kmyquest.UnlockComponentLevel(kmyquest.Chemical, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CraftingScript
Quest __temp = self as Quest
CraftingScript kmyQuest = __temp as CraftingScript
;END AUTOCAST
;BEGIN CODE
;DEBUG STAGE ONLY
debug.trace("Unlocking Advanced Property for Type Chemical")
kmyquest.UnlockComponentLevel(kmyquest.Chemical, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE CraftingScript
Quest __temp = self as Quest
CraftingScript kmyQuest = __temp as CraftingScript
;END AUTOCAST
;BEGIN CODE
;DEBUG STAGE ONLY
debug.trace("Unlocking Advanced Property for Type Metallic")
kmyquest.UnlockComponentLevel(kmyquest.Metallic, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CraftingScript
Quest __temp = self as Quest
CraftingScript kmyQuest = __temp as CraftingScript
;END AUTOCAST
;BEGIN CODE
;DEBUG STAGE ONLY
debug.trace("Unlocking Advanced Property for Type Organic")
kmyquest.UnlockComponentLevel(kmyquest.Organic, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE CraftingScript
Quest __temp = self as Quest
CraftingScript kmyQuest = __temp as CraftingScript
;END AUTOCAST
;BEGIN CODE
;DEBUG STAGE ONLY
debug.trace("Unlocking Advanced Property for Type Organic")
kmyquest.UnlockComponentLevel(kmyquest.Organic, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE CraftingScript
Quest __temp = self as Quest
CraftingScript kmyQuest = __temp as CraftingScript
;END AUTOCAST
;BEGIN CODE
;DEBUG STAGE ONLY
debug.trace("Unlocking Advanced Property for Type Technical")
kmyquest.UnlockComponentLevel(kmyquest.Technical, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CraftingScript
Quest __temp = self as Quest
CraftingScript kmyQuest = __temp as CraftingScript
;END AUTOCAST
;BEGIN CODE
;DEBUG STAGE ONLY
debug.trace("Unlocking Advanced Property for Type Techincal")
kmyquest.UnlockComponentLevel(kmyquest.Technical, 2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
