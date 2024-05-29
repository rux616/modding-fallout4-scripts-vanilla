;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSDansePostGame_0001E5E7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Send Danse Back into Listening Post Bravo
Alias_BoSDansePostGame.GetActorRef().EvaluatePackage()
BoSKickOutDanse.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Danse Setup
Alias_BoSDansePostGame.GetActorRef().RemoveFromFaction(BrotherhoodofSteelFaction)
Alias_BoSDansePostGame.GetActorRef().AddToFaction(BoSDanseBoSEnemyFaction)
Alias_BoSDansePostGame.GetActorRef().EvaluatePackage()
Alias_BoSDansePostGame.GetActorRef().setValue(pAssistance, 2)
(Alias_BoSDansePostGame.GetActorReference() as DansePostQuestBoSHostilityScript).MakeBoSHostile()
BoS302DanseSettlementEnabler.Enable()
CompanionActorScript DanseCompanion = Alias_BoSDansePostGame.GetActorReference() as CompanionActorScript
if DanseCompanion.HomeLocation == PrydwenLocation
   DanseCompanion.HomeLocation = ListeningPostBravoLocation
else
   ;do nothing, player already told Danse to live somewhere else.
endif

;make danse not care about murdering bos guys:
(Alias_BoSDansePostGame.GetActorRef() as CompanionActorScript).NotConsideredMurder_Array.Add(BrotherhoodOfSteelFaction)

;make danse not come to the aid of BoS when player commits crimes against them:
(Alias_BoSDansePostGame.GetActorRef() as CompanionCrimeFactionHostilityScript).IgnoreSharedCrimeForAnyoneInTheseFactions.Add(BrotherhoodOfSteelFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BoSDansePostGame Auto Const

Faction Property BrotherhoodofSteelFaction Auto Const

ReferenceAlias Property BoSKickOutDanse Auto Const

ObjectReference Property BoS302DanseSettlementEnabler Auto Const

Faction Property BoSDanseBoSEnemyFaction Auto Const

Location Property ListeningPostBravoLocation Auto Const

ActorValue Property pAssistance Auto Const Mandatory

Location Property PrydwenLocation Auto Const
