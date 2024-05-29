;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Inst308_000BAD00 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

Shaun.GetActorReference().SetProtected(False)
Shaun.GetActorReference().SetCrimeFaction(none)
Shaun.GetActorReference().SetRestrained()

MQ302Faction.SetValue(4)

;Make Newton Oberly essential if InstM03 is running
if InstM03.IsRunning()
     NewtonOberly.SetEssential(True)
endif

;Add synth teleport grenades to the institute misc vendor
LL_ChanceNone_SynthCourserTeleport_Vendor.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
setObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;shaun.GetActorReference().ChangeAnimFaceArchetype(AnimFaceArchetypeFatherDeath)
(MQ00 as MQ00Script).EndGameBinks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Inst308FinalMarker)


Shaun.GetActorReference().Kill()
Shaun.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;Add achievements

Game.AddAchievement(12)
Game.AddAchievement(50)

;update stage for kid synth conversations
DialogueInstituteShaunKid.SetStage(40)

Inst305Post.Stop()
Inst308Post.Start()
PA_Global_Material_Institute.SetValue(1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_SRBRep Auto Const

ReferenceAlias Property Alias_Justin Auto Const

ReferenceAlias Property Alias_Alana Auto Const

Quest Property DialogueInstituteShaunKid Auto Const

Quest Property Inst308Post Auto Const

ImageSpaceModifier Property FadetoBlackImod Auto Const

Quest Property MQ00 Auto Const

ObjectReference Property Inst308FinalMarker Auto Const

ReferenceAlias Property shaun Auto Const

ImageSpaceModifier Property FadefromBlackImod Auto Const

GlobalVariable Property PA_Global_Material_Institute Auto Const Mandatory

ActorBase Property NewtonOberly Auto Const Mandatory

Quest Property InstM03 Auto Const Mandatory

GlobalVariable Property LL_ChanceNone_SynthCourserTeleport_Vendor Auto Const Mandatory

Keyword Property AnimFaceArchetypeFatherDeath Auto Const Mandatory

Quest Property Inst305Post Auto Const Mandatory

GlobalVariable Property MQ302Faction Auto Const Mandatory
