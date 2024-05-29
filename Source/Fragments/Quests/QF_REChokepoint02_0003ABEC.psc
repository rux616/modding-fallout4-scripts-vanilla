;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_REChokepoint02_0003ABEC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;Set when the player enters the trigger volume, representing
;the guarded/checkpoint area.
if (!GetStageDone(21))
     SetStage(30)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Player agrees to comply with Mr. Gutsy.
Alias_MrGutsy.TryToEvaluatePackage()

;Restart the Announcement scene.
REChokepoint02_MrGutsyAnnouncement.Stop()
REChokepoint02_MrGutsyAnnouncement.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
;Flag: Player convinces Mr. Gutsy to let them pass (dialogue challenge)
Alias_MrGutsy.TryToEvaluatePackage()

;Restart the Announcement scene.
REChokepoint02_MrGutsyAnnouncement.Stop()
REChokepoint02_MrGutsyAnnouncement.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Player enters the checkpoint location.
REChokepoint02_MrGutsyForcegreet.Stop()
REChokepoint02_MrGutsyAnnouncement.Stop()
REChokepoint02_MrGutsyPrePacify.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Player attacks or refuses to comply with Mr. Gutsy.
REChokepoint02_MrGutsyPacify.Start()
Alias_MrGutsy.GetActorRef().StartCombat(Game.GetPlayer())
Alias_MrGutsy.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_MrGutsy Auto Const

Scene Property REChokepoint02_MrGutsyPacify Auto Const

Scene Property REChokepoint02_MrGutsyPrePacify Auto Const

Scene Property REChokepoint02_MrGutsyForcegreet Auto Const

Scene Property REChokepoint02_MrGutsyAnnouncement Auto Const
