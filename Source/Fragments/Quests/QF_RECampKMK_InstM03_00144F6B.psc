;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RECampKMK_InstM03_00144F6B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
; move NPCs and enable
actor higgs = Alias_LawrenceHiggs.GetActorRef()
actor loken = Alias_MaxLoken.GetActorRef()
higgs.MoveTo(Alias_SceneMarker1.GetRef())
higgs.SetOutfit(Wastelander01)
higgs.Enable()
loken.MoveTo(Alias_SceneMarker1.GetRef())
loken.SetOutfit(Wastelander02)
loken.Enable()

;Uncomment these as desired.
;Alias_Container.GetReference().Enable()
Alias_ClutterMarker.GetReference().Enable()
Alias_BedObject1.GetReference().Enable()
;Alias_BedObject2.GetReference().Enable()
Alias_BedObject3.GetReference().Enable()
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
; disable NPCs
actor higgs = Alias_LawrenceHiggs.GetActorRef()
actor loken = Alias_MaxLoken.GetActorRef()
higgs.Disable()
loken.Disable()

;Disable everything.
Alias_Container.GetReference().Disable()
Alias_ClutterMarker.GetReference().Disable()
Alias_BedObject1.GetReference().Disable()
Alias_BedObject2.GetReference().Disable()
Alias_BedObject3.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const

ReferenceAlias Property Alias_Container Auto Const

ReferenceAlias Property Alias_ClutterMarker Auto Const

ReferenceAlias Property Alias_BedObject1 Auto Const

ReferenceAlias Property Alias_BedObject2 Auto Const

ReferenceAlias Property Alias_BedObject3 Auto Const

ReferenceAlias Property Alias_SceneMarker1 Auto Const

ReferenceAlias Property Alias_LawrenceHiggs Auto Const

ReferenceAlias Property Alias_MaxLoken Auto Const

Outfit Property Wastelander01 Auto Const

Outfit Property Wastelander02 Auto Const
